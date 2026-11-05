Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1E2606D818
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LmVYCbjr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gIbH4Az2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZxmfLdEEjAQHUZvDYuOA8C56xBk1N2ZhSsTcHqmAo3E=; b=LmVYCbjrwNtZnH
	5X7uFB8Xq265M1xTE7k5N2jWqhEIF3Ls+W9lWXRE+hKQ5SIAg08wZpX1h/mhRXQaOqY8ITXE2n7H2
	3UqQwzsCGL8++XU5iiKcPevg8NOQ6abJRTb5NwHNROwVixOBxpn5kcvgnBStntReX8xsv+2l8qjCV
	f5Zjjwoto/4Gn6bcooKF8YgkHu0hVFYOzu+6J+RSDQeJpAmhVbEbkykc9D+290rkMyUl92E/O8uE8
	VjV5gF9guRpNPWJJxuxsuuNr6WuTXMNInImVI2JRo7thKoVa3WPnPmdQZXFFs9iCcsVX99emChPVB
	5EaJvXJHx+P35454ZecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx9V-000000093qQ-1r61;
	Thu, 05 Nov 2026 13:05:14 +0000
Received: from out-105.mta1.migadu.com ([95.215.58.105] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx9T-000000093oA-1Kpi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:05:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=akSBIvakXwiwzQr5eWo9mafDERPdZxPgysFS+iMF6Zs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883908; v=1; x=1794488708;
 b=gIbH4Az2bp9/oPYiqjxXrvO3ku3nL2LZInckVDgbpJBqcWUSw59T1KC3Ufxx7D2YFjfJ4pZL
 2gxAVORjjTs2GIAxT4bZI2E2awHGLzmIgvRRa/sWuVM/pxZNKC7pP/qAQHmCee2KnS9kTXuo6Px
 LiC/yVPj2ytOh42ip1vEq3JA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ea9cf62d0a721eb1;
	Thu, 05 Nov 2026 13:05:08 +0000
X-Mizu-Trace-ID: ea9cf62d0a721eb1
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
Date: Thu,  5 Nov 2026 13:04:53 +0000
Message-ID: <20261105130456.1617185-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105130456.1617185-1-fuad.tabba@linux.dev>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_050511_546294_AE40BC33 
X-CRM114-Status: GOOD (  11.31  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With pKVM, EL2 saves a guest's FP and SVE state on exit into the hyp
vCPU, whose kvm is the hyp VM's and whose sve_state is already a hyp
address. kern_hyp_va() returns both unchanged.

Remove the two calls, in fpsimd_sve_sync() and __hyp_sve_save_guest().
The one in __hyp_sve_restore_guest() stays, as nVHE without pKVM reaches
it with the host's pointer.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 179d7c8277b88..ea762788e325e 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -482,7 +482,7 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 	 * on the VL, so use a consistent (i.e., the maximum) guest VL.
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
-	sve_save_state(kern_hyp_va(vcpu->arch.sve_state), true);
+	sve_save_state(vcpu->arch.sve_state, true);
 	fpsimd_save_common(&vcpu->arch.ctxt.fp_regs);
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 }
@@ -531,7 +531,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	else
 		fpsimd_save_state(&vcpu->arch.ctxt.fp_regs);
 
-	has_fpmr = kvm_has_fpmr(kern_hyp_va(vcpu->kvm));
+	has_fpmr = kvm_has_fpmr(vcpu->kvm);
 	if (has_fpmr)
 		__vcpu_assign_sys_reg(vcpu, FPMR, read_sysreg_s(SYS_FPMR));
 
-- 
2.47.3


