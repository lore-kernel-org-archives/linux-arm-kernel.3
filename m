Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DADC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGKNgeYxoD2dek/orp968zSo9tzYcJ5pcHCxblN0VBg=; b=Eg5uA+FC+C2P/Y7Himp/ZUQBWi
	uxYAUOk9fwmx1gxTYg6QBqhE61zgRG+TakysDOLAJRUGxDxUEYltkwR9JXq23vDgOC7xe97X4yXfP
	lOXw9Cy0M3dvaxwZlz2UVSVWXUeaaIponHFy4USjVV6ezlshxd5htwYrdgKltNrAPX/zBjf9ufcc/
	BRCGjpjKae20ZLxXAML7Gor+eHS5UmbnGCWKqQ+7sTGc1RcNAoNpAzrI4LgsLJwbyvy86/5GwmWxr
	OtY3O/Q/4pIM52tfp+PVAmyYDonUwVjhvVQdS/D6wLHPhTPe1OA4ea8OD4EtuG0dU8ZXwdE7Be2Uu
	/EB1TK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trqtW-00000004Z42-3iwl;
	Tue, 11 Mar 2025 04:07:06 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trqqF-00000004YVN-4Bjp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 04:03:45 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZBg4S5m9fz1f0Pm;
	Tue, 11 Mar 2025 11:59:20 +0800 (CST)
Received: from kwepemj500003.china.huawei.com (unknown [7.202.194.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 50EDE1A016C;
	Tue, 11 Mar 2025 12:03:41 +0800 (CST)
Received: from DESKTOP-KKJBAGG.huawei.com (10.174.178.32) by
 kwepemj500003.china.huawei.com (7.202.194.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Mar 2025 12:03:40 +0800
From: Zhenyu Ye <yezhenyu2@huawei.com>
To: <maz@kernel.org>, <yuzenghui@huawei.com>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <joey.gouly@arm.com>
CC: <linux-kernel@vger.kernel.org>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <wangzhou1@hisilicon.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<kvmarm@lists.linux.dev>
Subject: [PATCH v1 5/5] arm64/config: add config to control whether enable HDBSS feature
Date: Tue, 11 Mar 2025 12:03:21 +0800
Message-ID: <20250311040321.1460-6-yezhenyu2@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20250311040321.1460-1-yezhenyu2@huawei.com>
References: <20250311040321.1460-1-yezhenyu2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemj500003.china.huawei.com (7.202.194.33)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_210344_360522_B8A99B57 
X-CRM114-Status: GOOD (  11.62  )
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

From: eillon <yezhenyu2@huawei.com>

The HDBSS feature introduces new assembly registers
(HDBSSBR_EL2 and HDBSSPROD_EL2), which depends on the armv9.5-a
compilation support. So add ARM64_HDBSS config to control whether
enable the HDBSS feature.

Signed-off-by: eillon <yezhenyu2@huawei.com>
---
 arch/arm64/Kconfig                  | 19 +++++++++++++++++++
 arch/arm64/Makefile                 |  4 +++-
 arch/arm64/include/asm/cpufeature.h |  3 +++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..3458261eb14b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2237,6 +2237,25 @@ config ARM64_GCS
 
 endmenu # "v9.4 architectural features"
 
+menu "ARMv9.5 architectural features"
+
+config ARM64_HDBSS
+	bool "Enable support for Hardware Dirty state tracking Structure (HDBSS)"
+	default y
+	depends on AS_HAS_ARMV9_5
+	help
+	  Hardware Dirty state tracking Structure(HDBSS) enhances tracking
+	  translation table descriptors’ dirty state to reduce the cost of
+	  surveying for dirtied granules.
+
+	  The feature introduces new assembly registers (HDBSSBR_EL2 and
+	  HDBSSPROD_EL2), which depends on AS_HAS_ARMV9_5.
+
+config AS_HAS_ARMV9_5
+	def_bool $(cc-option,-Wa$(comma)-march=armv9.5-a)
+
+endmenu # "ARMv9.5 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2b25d671365f..f22507fb09b9 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -103,7 +103,9 @@ endif
 # freely generate instructions which are not supported by earlier architecture
 # versions, which would prevent a single kernel image from working on earlier
 # hardware.
-ifeq ($(CONFIG_AS_HAS_ARMV8_5), y)
+ifeq ($(CONFIG_AS_HAS_ARMV9_5), y)
+  asm-arch := armv9.5-a
+else ifeq ($(CONFIG_AS_HAS_ARMV8_5), y)
   asm-arch := armv8.5-a
 else ifeq ($(CONFIG_AS_HAS_ARMV8_4), y)
   asm-arch := armv8.4-a
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index c76d51506562..32e432827934 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -748,6 +748,9 @@ static inline bool system_supports_hdbss(void)
 	u64 mmfr1;
 	u32 val;
 
+	if (!IS_ENABLED(CONFIG_ARM64_HDBSS))
+		return false;
+
 	mmfr1 =	read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
 	val = cpuid_feature_extract_unsigned_field(mmfr1,
 						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
-- 
2.39.3


