Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14338FEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqFenvKToaGFHD7apBHmTyZW1VSv42rnw2JY1Okmk60=; b=f29h2L0DvJywXwvZXgFPVC+Ksq
	ZTQfxqeg0TmA/SkQXU/1cOACK0oY5HAuZb2F6CYatDGXJ/+4NpDm3308s2Mpyj7O5r6xYwzo2zw2P
	qUbWK+EC89W2E9gfAjZmC7ZHENO4OLdTlO6ePgSzeqogOTq0hFbc+pzuuoQp9c/mqRb3Poow7gqvv
	Wkz5d0FbEN9c+JgR9iNk4gdEr8GT6/ucNOkj97//FnKA+hMWkDhA9WhNv6N2mi6SI8LTS+UwgBaTa
	DY03muYLgzJO2gQYKu/6Ol+/QgrtgeGx6h/WNp+E6KyK/8VkEi3t29yym7G2wYIy8dsBRFVIWxZaJ
	DCv5y7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzb7-00000008ZsV-1ZsH;
	Fri, 27 Feb 2026 15:17:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzb1-00000008Zph-40fN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:17:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906DF1516;
	Fri, 27 Feb 2026 07:17:32 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0A003F73B;
	Fri, 27 Feb 2026 07:17:35 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	yeoreum.yun@arm.com
Subject: [PATCH v15 1/8] arm64: cpufeature: add FEAT_LSUI
Date: Fri, 27 Feb 2026 15:16:58 +0000
Message-Id: <20260227151705.1275328-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227151705.1275328-1-yeoreum.yun@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071740_031288_49FD816B 
X-CRM114-Status: GOOD (  10.07  )
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

Since Armv9.6, FEAT_LSUI introduces load/store instructions that allow
privileged code to access user memory without clearing the PSTATE.PAN bit.

Add CPU feature detection for FEAT_LSUI and enable its use
when FEAT_PAN is present so that removes the need for SW_PAN handling
when using LSUI instructions.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/cpucaps.h |  2 ++
 arch/arm64/kernel/cpufeature.c   | 10 ++++++++++
 arch/arm64/tools/cpucaps         |  1 +
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 177c691914f8..6e3da333442e 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -71,6 +71,8 @@ cpucap_is_possible(const unsigned int cap)
 		return true;
 	case ARM64_HAS_PMUV3:
 		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
+	case ARM64_HAS_LSUI:
+		return IS_ENABLED(CONFIG_ARM64_LSUI);
 	}
 
 	return true;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a..5074ff32176f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -281,6 +281,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FPRCVT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_LSUI_SHIFT, 4, ID_AA64ISAR3_EL1_LSUI_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_LSFE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FAMINMAX_SHIFT, 4, 0),
 	ARM64_FTR_END,
@@ -3169,6 +3170,15 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpu_enable = cpu_enable_ls64_v,
 		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LS64, LS64_V)
 	},
+#ifdef CONFIG_ARM64_LSUI
+	{
+		.desc = "Unprivileged Load Store Instructions (LSUI)",
+		.capability = ARM64_HAS_LSUI,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64ISAR3_EL1, LSUI, IMP)
+	},
+#endif
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 7261553b644b..b7286d977788 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -48,6 +48,7 @@ HAS_LPA2
 HAS_LSE_ATOMICS
 HAS_LS64
 HAS_LS64_V
+HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_BBML2_NOABORT
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


