Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8405E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=asutKOAc;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BQllcJgK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TyVyCwMLOPMh9qEM6xS4GkadPPOB007k35JPfKls6WQ=; b=asutKOAchBHsKRMPf5qTafzBex
	tyhprEESUlNFCwyACq6mJFQtToFgQCN5496MiNHYm9XjctwGgArP5ARW0b0SgCEAHkP04q9EUJIVV
	79YJC1AVkclYjQc8X91ENG7X0uyGCes91NEujnhaQG0kMMSiWJVUko9yeaEoXO271qw+m/HCWIeMd
	y6n51BzCB9hI/TNnYbFow4m+/OpMrAj7yTG3qDoIR13HCYGx5gDVJq8OAi3IEq7/21x+4KYoXXuMU
	s2Ufia7jWJ3i97FHjSAgCePVkB2TZJtTqVJmPy0ecn6qDPM+LX36Ncib2hMicHSoy1AuzKv4j0Uzd
	BLsw1/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBRs-0000000FzeO-11PU;
	Fri, 23 Oct 2026 09:20:28 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBRp-0000000Fzdk-0WRQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:20:27 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso3815485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 02:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792747223; x=1793352023; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyVyCwMLOPMh9qEM6xS4GkadPPOB007k35JPfKls6WQ=;
        b=BQllcJgKLPsWEd0Z2BqJqz1G37hLe09OhH0Y21tbJMLHSCiXMP/wjb/kX8plajfry3
         E3q8oT4dHNK68PwRrIt4rL5b+yucxTZYvKcREnIB3xiWO6zBAytREEIGgNYee3g5Ijg2
         /61KvuYJN5gx2ponMtHFyWOyD8AWZAC4PIjsgdD90D7NehVu3X8Q31sS6NB83AgpllTz
         AIcbT/d1bNrzTkKSnT4Y5CNWLjHED/sBwKlUp6KNlfjQWbDTXYoSxrGQ0exCFONuaFju
         uBIL57Q/S1fWZX2cEnrdQtqYe7upTxn+2gxcX2PnwRzoF0E4BxjVEllP9qBmdecCbpA/
         J98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747223; x=1793352023;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyVyCwMLOPMh9qEM6xS4GkadPPOB007k35JPfKls6WQ=;
        b=rlGYss4twbRTCMfd2BHGCmh5W0gK6ycpYbfy800lPg+t7IWPY8YgpnQHqHnJdUwTnN
         GmD5aRFpSUvFRD2/69w6cFfLbQkRUzftTH62UBGHeNy60mtXK3wghd28Jh5V1ZaMSjDU
         R5gZzBEQoa+055xHX7ZJXj54htxPaS9ZtvVO7MfL9rXRP2zR5pcT4tGTePtsTxh378t4
         KdUaluIyjiVN61gIJiEsxNce0G8g1p+qvCPqEu1wVl3w3hmB1ezpvHXnYphDWZafY6qB
         C8uazk7wiDiGPa7fGTBF3tAiP2rin1z+2oJlr83I7yKgJYef5Olf7HXzD8lDdZYjFKKu
         azlA==
X-Forwarded-Encrypted: i=1; AKwUvBwFd3Jg03DxdDE2Hevj1nWPjv9DGmnoVSjvZUj8owTXUBqdpUq3wsh/tA6xe9BphiFNIdgE9COLaUb3EwuW8Ovu@lists.infradead.org
X-Gm-Message-State: AFq9FYIj24aGSPqhDL+Qhyh+FhF+WYYwilHx6L2CqKG7i0TXwzK9OT+t
	Xt8lbBZxMLdfPb+xFpeAoywk6vDdNmkumZLT1GAruqGeqNxJWmxtoR7cRvXtPomeeu+Z9hbcVOU
	Ig0ibVDag/QAG5FA9vtpXyg==
X-Received: from wmbel10.prod.google.com ([2002:a05:600c:3e0a:b0:4a2:d93:4c05])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00c:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4a211ce1b34mr25517785e9.12.1792747222747;
 Fri, 23 Oct 2026 02:20:22 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:20:07 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023092007.3918848-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Use the host kvm_host_data for nr_event_counters
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_022025_198467_AB349AE4 
X-CRM114-Status: GOOD (  12.00  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nr_event_counters is only used by the host to populate mdcr_el2.
However, host_data_ptr() for pKVM switches between the hypervisor copy
of kvm_host_data before it is deprivileged to the host copy after.

So kvm_init_host_debug_data() initialises nr_event_counters in the
hypervisor's kvm_host_data, while kvm_arm_setup_mdcr_el2() reads the
host copy which is 0. With a HPMN of 0, this stops programmable event
counters from counting a non-protected guest.

Always use the host copy for nr_event_counters.

Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/debug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index f4d7b12045e8..a00771339c62 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -44,7 +44,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * to disable guest access to the profiling and trace buffers
 	 */
 	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+					 __this_cpu_read(kvm_host_data.nr_event_counters));
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
@@ -80,8 +80,8 @@ void kvm_init_host_debug_data(void)
 								   ID_AA64DFR0_EL1_PMUVer_SHIFT);
 
 	if (pmuv3_implemented(pmuver))
-		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
-							      read_sysreg(pmcr_el0));
+		__this_cpu_write(kvm_host_data.nr_event_counters,
+				 FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)));
 
 	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
 	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.56.0.257.gf7497c7d27-goog


