Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D19C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lcmz2b2wSBLp1++UV6kYxaG0Vo4vr1rEmMZnQRdpssM=; b=bxgsonMf55+N57EMQd9BJvuop1
	FzSJLgbeDXOuruGnLfWZRv7wwwdTBAGuBe3sFpGedAWwOIRhTxOyVRKwUhmFzRjE4sMrRlVwaKQ0n
	TMoCWX1pdn+krFiNF066SfUG7oKr80pMqZJDWjcFR7q02/uytb4aj6t0Zaz3FnzUa9BFwqq71d8L1
	RddLqTdT85dmM7dEoH3fustsYr0e/kIYkhImkPPQepuosg2l7hrywsUYwdyAFYcY9XbdTI5KYMEcA
	BPhfqBfLBdYNvwKCwnNSWdneWdQ8Oe07TOTA0uFtorxlkJHGuIsODRq6VoH/nb0W/2nN8xk3NqTeA
	C1WYXkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICmc-000000029Be-0voN;
	Thu, 22 May 2025 20:44:54 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICkZ-00000002970-13ar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 20:42:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747946562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lcmz2b2wSBLp1++UV6kYxaG0Vo4vr1rEmMZnQRdpssM=;
	b=NfI0zkTpxFo4zF2V9xvSZwmIlzpsN46mruuvPZv1/29WcudYO2GPcTA1g07gX4gXts5xqn
	WO5dKG2NG4tULaDe6iMWMB3eqmMnwmEDFGQG0iseHOhl3ybzSDKjVNSzCBapdADsIw0ex+
	tvHO5wXETqH7HCJV4Vced+Gk7iH9lSs=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mingwei Zhang <mizhang@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: Add MIDR-based check for FEAT_ECBHB
Date: Thu, 22 May 2025 13:41:48 -0700
Message-Id: <20250522204148.4007406-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_134247_896031_6F3DFD58 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Prior to commit e8cde32f111f ("arm64/cpufeatures/kvm: Add ARMv8.9
FEAT_ECBHB bits in ID_AA64MMFR1 register") KVM was erroneously masking
FEAT_ECBHB from VMs, giving the perception that safe implementations are
actually vulnerable to Spectre-BHB. And, after commit e403e8538359
("arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
BHB") guests are enabling the loop mitigation.

This broken virtual hardware is going to be around for some time, so do
the ugly thing and check for revisions of Neoverse-V2 [1], Cortex-X3 [2],
Cortex-A720 [3], and Neoverse-N3 [4] that are documented to have FEAT_ECBHB.

Cc: stable@vger.kernel.org
Link: https://developer.arm.com/documentation/102375/0002
Link: https://developer.arm.com/documentation/101593/0102
Link: https://developer.arm.com/documentation/102530/0002
Link: https://developer.arm.com/documentation/107997/0001
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---

I thoroughly hate this but the alternative of nuking these busted VMs
isn't exactly popular...

 arch/arm64/include/asm/cputype.h |  1 +
 arch/arm64/kernel/proton-pack.c  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index d1cc0571798b..5c6152e61cad 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -282,6 +282,7 @@ struct midr_range {
 #define MIDR_REV_RANGE(m, v, r_min, r_max) MIDR_RANGE(m, v, r_min, v, r_max)
 #define MIDR_REV(m, v, r) MIDR_RANGE(m, v, r, v, r)
 #define MIDR_ALL_VERSIONS(m) MIDR_RANGE(m, 0, 0, 0xf, 0xf)
+#define MIDR_MIN_VERSION(m, v, r) MIDR_RANGE(m, v, r, 0xf, 0xf)
 
 static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
 					   u32 rv_max)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b198dde79e59..3d00d4c22d58 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -962,8 +962,24 @@ static bool has_spectre_bhb_fw_mitigation(void)
 
 static bool supports_ecbhb(int scope)
 {
+	static const struct midr_range spectre_ecbhb_list[] = {
+		MIDR_MIN_VERSION(MIDR_NEOVERSE_V2, 0, 2),
+		MIDR_MIN_VERSION(MIDR_CORTEX_X3, 1, 1),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
+		MIDR_MIN_VERSION(MIDR_CORTEX_A720, 0, 1),
+		{},
+	};
 	u64 mmfr1;
 
+	/*
+	 * Prior to commit e8cde32f111f ("arm64/cpufeatures/kvm: Add ARMv8.9
+	 * FEAT_ECBHB bits in ID_AA64MMFR1 register"), KVM masked FEAT_ECBHB
+	 * on implementations that actually have the feature. That sucks; infer
+	 * presence of FEAT_ECBHB based on MIDR.
+	 */
+	if (is_midr_in_range_list(spectre_ecbhb_list))
+		return true;
+
 	if (scope == SCOPE_LOCAL_CPU)
 		mmfr1 = read_sysreg_s(SYS_ID_AA64MMFR1_EL1);
 	else

base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.39.5


