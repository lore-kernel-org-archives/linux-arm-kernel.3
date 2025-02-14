Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE48C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwEDLuTJf7KDWEagU2HFhTTqUy3xdBenSJwwZUCsD24=; b=TzRdsqE66HJm1+tAMAhGB2rrRx
	/pUc5MYrnPHqQt/Utdj9/RFfOMPQGB6hcY6C1iY0KqfXgOHJvvbGADU0kbQUUYeOduDiLjvZAvMNV
	FPOVWuhxqxRVvN0rPPsJGgsu2guO8P2xutNYGGMkbzbYhWHdYQhpaH5salOyDoldUGAaIrq0PAPXb
	dvtPOGZnTGDjUXdcoG9f/bEFp9YkSTfmCn0cVuRE/iep4wdvixZ8QAlQr0i41Wcu5XB9YaYWHcYfz
	/vACcX2psVaBV5fgGhFrET12bHlQqlnNxGp4wCb4rGrXX46Es9ATuO1uHH3nirGEPI27NtBMSzyV/
	v1xeVZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivuG-0000000F2jh-2rgT;
	Fri, 14 Feb 2025 13:39:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivso-0000000F2YT-2Le2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 13:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5FE9A42ACE;
	Fri, 14 Feb 2025 13:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E11C4CED1;
	Fri, 14 Feb 2025 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739540248;
	bh=U4x9WKqLXQ5Tvglt8O1CbvzqfZ5+NYMLWfEWNektUw4=;
	h=From:To:Cc:Subject:Date:From;
	b=Ht4VykWzrJodsCc4bsbSXg1NuO7BmD5Fu0H3zQeXRfwnF8k2cy7ALXwv7SOPr9grA
	 o1IBr3oVRpLRTPPHEfxkTgbyLV4Tj20zQcmdSQ1ml/q6At12fAycJWcIwwv5hoMnsx
	 QFLvNqXB+mUkFa6Zv8jo4wGn7byIzvmrHJgWYIS1F9ECyWgA52A7e6DnFgYZLunlLZ
	 V5NQFlDoWflp9pDULqwiJCk4cZX8Ox8AgoWSREvQ8t98yAHe1wD3YLTSRJTPylEGzN
	 7HOXN6rVTHEImnshiZA1bIXRg4TtkkVJ0kx613TDgk7tokHEfvY1ISZS9TjQ9/Pvmg
	 7Cn3iu+6L/qTQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH] KVM: arm64: Fix tcr_el2 initialisation in hVHE mode
Date: Fri, 14 Feb 2025 13:37:24 +0000
Message-Id: <20250214133724.13179-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_053730_720388_B3CFEC70 
X-CRM114-Status: GOOD (  16.90  )
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

When not running in VHE mode, cpu_prepare_hyp_mode() computes the value
of TCR_EL2 using the host's TCR_EL1 settings as a starting point. For
nVHE, this amounts to masking out everything apart from the TG0, SH0,
ORGN0, IRGN0 and T0SZ fields before setting the RES1 bits, shifting the
IPS field down to the PS field and setting DS if LPA2 is enabled.

Unfortunately, for hVHE, things go slightly wonky: EPD1 is correctly set
to disable walks via TTBR1_EL2 but then the T1SZ and IPS fields are
corrupted when we mistakenly attempt to initialise the PS and DS fields
in their E2H=0 positions. Furthermore, many fields are retained from
TCR_EL1 which should not be propagated to TCR_EL2. Notably, this means
we can end up with A1 set despite not initialising TTBR1_EL2 at all.
This has been shown to cause unexpected translation faults at EL2 with
pKVM due to TLB invalidation not taking effect when running with a
non-zero ASID.

Fix the TCR_EL2 initialisation code to set PS and DS only when E2H=0,
masking out HD, HA and A1 when E2H=1.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Fixes: ad744e8cb346 ("arm64: Allow arm64_sw.hvhe on command line")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h |  2 +-
 arch/arm64/kvm/arm.c             | 15 +++++++--------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 8d94a6c0ed5c..c2417a424b98 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -119,7 +119,7 @@
 #define TCR_EL2_IRGN0_MASK	TCR_IRGN0_MASK
 #define TCR_EL2_T0SZ_MASK	0x3f
 #define TCR_EL2_MASK	(TCR_EL2_TG0_MASK | TCR_EL2_SH0_MASK | \
-			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK | TCR_EL2_T0SZ_MASK)
+			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
 
 /* VTCR_EL2 Registers bits */
 #define VTCR_EL2_DS		TCR_EL2_DS
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 646e806c6ca6..d498edf88f05 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1980,7 +1980,7 @@ static int kvm_init_vector_slots(void)
 static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 {
 	struct kvm_nvhe_init_params *params = per_cpu_ptr_nvhe_sym(kvm_init_params, cpu);
-	unsigned long tcr, ips;
+	unsigned long tcr;
 
 	/*
 	 * Calculate the raw per-cpu offset without a translation from the
@@ -1994,19 +1994,18 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 	params->mair_el2 = read_sysreg(mair_el1);
 
 	tcr = read_sysreg(tcr_el1);
-	ips = FIELD_GET(TCR_IPS_MASK, tcr);
 	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
+		tcr &= ~(TCR_HD | TCR_HA | TCR_A1 | TCR_T0SZ_MASK);
 		tcr |= TCR_EPD1_MASK;
 	} else {
+		unsigned long ips = FIELD_GET(TCR_IPS_MASK, tcr);
+
 		tcr &= TCR_EL2_MASK;
-		tcr |= TCR_EL2_RES1;
+		tcr |= TCR_EL2_RES1 | FIELD_PREP(TCR_EL2_PS_MASK, ips);
+		if (lpa2_is_enabled())
+			tcr |= TCR_EL2_DS;
 	}
-	tcr &= ~TCR_T0SZ_MASK;
 	tcr |= TCR_T0SZ(hyp_va_bits);
-	tcr &= ~TCR_EL2_PS_MASK;
-	tcr |= FIELD_PREP(TCR_EL2_PS_MASK, ips);
-	if (lpa2_is_enabled())
-		tcr |= TCR_EL2_DS;
 	params->tcr_el2 = tcr;
 
 	params->pgd_pa = kvm_mmu_get_httbr();
-- 
2.48.1.601.g30ceb7b040-goog


