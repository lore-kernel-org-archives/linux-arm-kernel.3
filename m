Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=25ufVAT+;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bH9hg+ds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eYU7nRUviv0PRMWv8pLk4R1PsyRqoA4jjfpx6F91JbE=; b=25ufVAT+Ye9bHU
	/F1voNwb3700JGHBq9NFH4fpfNa59Ne1vM7GOe0b/G8E/WtKsbqqPf7Buf6Hdjr9upPTM/RuxXZ3I
	rZxM4TvGmvYYx7a8oTaumUjgeX1WP5gaxFwPPQOHzK8puL2GEvBangl5vGlD0847XIs8dIhznIAqK
	Q7w9pYmDlu5xDjFZ8Ih6c824Z8pER1uc5fF8mRDCO6dRFzDTAqV3iium7SUcDJso+FDESdAu5SE9l
	eiNM7bBm5aT2vvMiUM+YCex+qdNuTHNr7sGcxYhXiOKi+t71L+Khfr7QxXC84+YkHLL3rMmLeEOsQ
	8cdMuzhp1lQviw0VMF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcHx-0000000406Y-2Ro3;
	Tue, 27 Oct 2026 08:12:09 +0000
Received: from out-55.mta1.migadu.com ([95.215.58.55] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcHm-0000000401i-0Z6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:11:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5fNaLh6y2LRSzbC19B0rdBidBP/uTWp/P3MFJPydJ4g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793088716; v=1; x=1793693516;
 b=bH9hg+dsFfFLMaoyqNOIZXbMcYS9djHUYeYqmmJ/WFwBCRFCCRLz4m8r8LgHqSHjNUHaLV8a
 bsBwKoTFMNiPK1U1cvRtSxpz5w7bNnl/q9xr3MYdZameHhnxOiutmE45XQZtkhy5xvMPkc1zhS0
 ozDLZLrbBGNWuGu9P2PhjXjA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id de9eea40cfde8985;
	Tue, 27 Oct 2026 08:11:56 +0000
X-Mizu-Trace-ID: de9eea40cfde8985
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of non-protected guests
Date: Tue, 27 Oct 2026 08:11:46 +0000
Message-ID: <20261027081147.498183-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027081147.498183-1-fuad.tabba@linux.dev>
References: <20261027081147.498183-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_011158_348998_9204E060 
X-CRM114-Status: GOOD (  10.89  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Oliver Upton <oliver.upton@linux.dev>

Before every run, the host records in vcpu->arch.pmu.events which perf
counters to disable and enable around guest entry, and
__pmu_switch_to_guest() applies them at EL2. Since commit be66e67f1750
("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()"),
protected mode runs the hyp vCPU instead, and flush_hyp_vcpu() never
copies the events into it. So the counters backing a non-protected
guest's PMU are never enabled, and every counter the guest reads stays
at 0, the cycle counter included. The host's counters that exclude
guests keep counting the guest as well.

Copy the events into the hyp vCPU of a non-protected guest on every run.
The events only exist with CONFIG_HW_PERF_EVENTS, so the copy is built
under it. Like mdcr_el2, they're host-controlled and never reach a
protected guest.

Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Link: https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
[Fuad: non-protected copy only, tested on the hyp vCPU, under
 CONFIG_HW_PERF_EVENTS, new message]
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d715aa942577e..28a292deecb64 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -690,6 +690,16 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 		host_vcpu->arch.external_debug_state = hyp_vcpu->vcpu.arch.external_debug_state;
 }
 
+#ifdef CONFIG_HW_PERF_EVENTS
+static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
+}
+#else
+static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu) {}
+#endif
+
 static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
@@ -698,6 +708,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	fpsimd_sve_flush();
 	flush_debug_state(hyp_vcpu);
+	flush_pmu_state(hyp_vcpu);
 
 	/*
 	 * If we deal with a non-protected guest and the state is potentially
-- 
2.47.3


