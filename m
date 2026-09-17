Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AF2C982D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+jqX8odSHJRj8I1xt9QcduAKDUkxYsGWOso0e/XrsY=; b=PXViLVGZWAIhWiIMWELZ7XcBKl
	+0ND3MvU3mOicWj99LsijPXTPX5DtfU7oKTdPlOkjlO7DRYDzHbJY6WEUVVSCTc8suRMbiMAm/nIE
	alU1VVlD1i8y3WPjfv7T7gBR+R2DAZGQQf0fgBnlOSKpxZScEb7UvO0NRpxXpoxe3+ucdDf60jM6F
	HoaMM+k9bl9sL9yanN/GkqRT2V4wE6UVCgbM7lmvSfU6I/yN8ueFTMFc55u/bgTQnGiwSAYxmpRP3
	d5UZqTJr7pd7Gx+6rWKpNurQo4R7Zx+X6JRpH9FtudzaIPIQlH1TGM74R+Wd0+Egd7I9S2Qyy7bmj
	6736GJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GT-0000000AzKT-0pBZ;
	Thu, 17 Sep 2026 09:18:45 +0000
Received: from out-128.mta0.migadu.com ([2001:41d0:1004:224b::80] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GM-0000000AzHs-177t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:18:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BDabPLEAy+F0bC1m2aFAySlST0o2PCUlunhb/0Rg9F0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789636716; v=1; x=1790241516;
 b=oleqo3rdDIL06DQxUICjC1cc39hspR0N98Kge6Qy1idNp8VNeZRcqy2S/W98xWSl1v5Y1G1x
 aoDjevkaKfBfQLV2utglGKxxD33wEnJiN/sbUgWLik7iG7o7AIm5S9FTdMjm/gED1McMZi531gy
 Lmpa0C8WhBbG2dQHb16oohb8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6582ff640713eed0;
	Thu, 17 Sep 2026 09:18:36 +0000
X-Mizu-Trace-ID: 6582ff640713eed0
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	qperret@google.com,
	vdonnefort@google.com,
	martijnbogaard@google.com,
	seiden@linux.ibm.com,
	tabba@google.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] KVM: arm64: Move the IPA limit rule into kvm_get_ipa_max()
Date: Thu, 17 Sep 2026 10:18:23 +0100
Message-Id: <20260917091826.2639205-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260917091826.2639205-1-fuad.tabba@linux.dev>
References: <20260917091826.2639205-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021838_463092_9E9254C7 
X-CRM114-Status: GOOD (  13.24  )
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

Move the rule kvm_set_ipa_limit() applies to PARange into a helper
beside kvm_get_parange(), which bounds the same field by a different
rule, so the hypervisor can size a guest's IPA space by it.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pgtable.h | 15 +++++++++++++++
 arch/arm64/kvm/reset.c               | 12 +-----------
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb6..8096b0bf381c2 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -48,6 +48,21 @@ static inline u64 kvm_get_parange(u64 mmfr0)
 	return parange;
 }
 
+/*
+ * The largest IPA size a VM can be given. Unlike VTCR_EL2.PS
+ * (kvm_get_parange()), it isn't clamped to the kernel's PA configuration.
+ */
+static inline u32 kvm_get_ipa_max(u64 mmfr0)
+{
+	unsigned int parange = cpuid_feature_extract_unsigned_field(mmfr0,
+				ID_AA64MMFR0_EL1_PARANGE_SHIFT);
+
+	if (!kvm_lpa2_is_enabled() && PAGE_SIZE != SZ_64K)
+		parange = min(parange, (unsigned int)ID_AA64MMFR0_EL1_PARANGE_48);
+
+	return id_aa64mmfr0_parange_to_phys_shift(parange);
+}
+
 typedef u64 kvm_pte_t;
 
 #define KVM_PTE_VALID			BIT(0)
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e8..757adbce2faac 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -231,19 +231,9 @@ u32 get_kvm_ipa_limit(void)
 
 int __init kvm_set_ipa_limit(void)
 {
-	unsigned int parange;
 	u64 mmfr0;
 
 	mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
-	parange = cpuid_feature_extract_unsigned_field(mmfr0,
-				ID_AA64MMFR0_EL1_PARANGE_SHIFT);
-	/*
-	 * IPA size beyond 48 bits for 4K and 16K page size is only supported
-	 * when LPA2 is available. So if we have LPA2, enable it, else cap to 48
-	 * bits, in case it's reported as larger on the system.
-	 */
-	if (!kvm_lpa2_is_enabled() && PAGE_SIZE != SZ_64K)
-		parange = min(parange, (unsigned int)ID_AA64MMFR0_EL1_PARANGE_48);
 
 	/*
 	 * Check with ARMv8.5-GTG that our PAGE_SIZE is supported at
@@ -264,7 +254,7 @@ int __init kvm_set_ipa_limit(void)
 		return -EINVAL;
 	}
 
-	kvm_ipa_limit = id_aa64mmfr0_parange_to_phys_shift(parange);
+	kvm_ipa_limit = kvm_get_ipa_max(mmfr0);
 	kvm_info("IPA Size Limit: %d bits%s\n", kvm_ipa_limit,
 		 ((kvm_ipa_limit < KVM_PHYS_SHIFT) ?
 		  " (Reduced IPA size, limited VM/VMM compatibility)" : ""));
-- 
2.39.5


