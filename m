Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBBECD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Xp2/QNW0NuKzYpgIGtzuJ4ueh+CybxTskAVbpWQ7KY=; b=DeETLW3nP390QVGc5oGqHfIoHF
	qOSZW4OtU/5TRACgRniuHD90ncKm65Yh5UvXriFTbmpJDXa8iDrK7DYFrD9+7UIxPsmATvQdrjftb
	NoUBV2WCLKsya/oO7d9+tNuQ4V2a65jk/ruFmV20nQMCCFwTG99CbpP/YH0fidivKojvaYpi8Bra8
	lWG1KrHmnfdpagVdggQAGifpxPtE3w2tnUrNJBYrFbE6eiiqcxHiasyghrR9QiZ7PP2iYudVnDEuy
	LS+fg0E+/8WaYWoQMkbtMvZFEXdkM8yTHYGqy7KUH3Z/p7uPqjr90HFE/hch3YLKmZO2YkbaQKJHG
	OmjwSqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqlW-00000006osR-0boZ;
	Fri, 29 May 2026 06:32:18 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqlS-00000006orl-22MU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:32:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gRYRJ3B5szKHMLh
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 14:31:40 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id DC93640576
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 14:31:57 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP4 (Coremail) with SMTP id gCh0CgAHz1rHMhlqg24kEA--.34476S4;
	Fri, 29 May 2026 14:31:54 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	wangyushan12@huawei.com,
	maz@kernel.org,
	skhan@linuxfoundation.org,
	miko.lenczewski@arm.com,
	lucaswei@google.com,
	broonie@kernel.org,
	thuth@redhat.com,
	ryan.roberts@arm.com,
	tongtiangen@huawei.com,
	oupton@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	mark.rutland@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	kevin.brodsky@arm.com,
	lpieralisi@kernel.org,
	yangyicong@hisilicon.com,
	james.clark@linaro.org,
	yeoreum.yun@arm.com
Cc: linux-doc@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: kernel: Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
Date: Fri, 29 May 2026 14:31:32 +0800
Message-ID: <20260529063132.766491-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAHz1rHMhlqg24kEA--.34476S4
X-Coremail-Antispam: 1UD129KBjvJXoW3WF47tr4ruw43Jry7Aw4kXrb_yoW3Ww1Upr
	13Jr4xJr1UWF15XryUJw4UJr15Aan3Jw1Yqr1UK340qr1ayrWUAr4UX34xJFW0qrykWr48
	GF1q9r15JF1jyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU04xRDUUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_233214_963849_FC8CD228 
X-CRM114-Status: GOOD (  15.79  )
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

From: Zeng Heng <zengheng4@huawei.com>

HiSilicon HIP09 implements TLB entry matching behavior that deviates
from the ARM architecture specification when the CnP (Common not Private)
bit is set in TTBRx_ELx.

When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
cores, leading to TLB conflicts and stale mappings. This breaks
coherency and can result in incorrect translations.

Add the hardware erratum workaround (Hisilicon erratum 162100125) to
disable CNP on affected HIP09 cores.

Merge the existing NVIDIA Carmel and the HiSilicon HIP09 CNP errata
workarounds into a single generic capability ARM64_WORKAROUND_DISABLE_CNP.

Both NVIDIA Carmel and HiSilicon HIP09 have hardware errata where
CNP (Common Not Private) behavior differs from the ARM specification,
causing incorrect TLB entry sharing between cores. The existing
NVIDIA_CARMEL_CNP_ERRATUM and the newly added HISILICON_ERRATUM_162100125
are now both handled by the unified ARM64_WORKAROUND_DISABLE_CNP.

Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/

Changes in v2:
  - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
---

 Documentation/arch/arm64/silicon-errata.rst |  4 +++-
 arch/arm64/Kconfig                          | 17 ++++++++++++-----
 arch/arm64/include/asm/cpucaps.h            |  4 ++--
 arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 211119ce7adc..b4565e1a726d 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -254,7 +254,7 @@ stable kernels.
 | Marvell        | ARM-MMU-500     | #582743         | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
-| NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
+| NVIDIA         | Carmel Core     | N/A             | ARM64_WORKAROUND_DISABLE_CNP|
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
@@ -284,6 +284,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100125      | ARM64_WORKAROUND_DISABLE_CNP|
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..dc0bd32ea2d1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1315,13 +1315,20 @@ config QCOM_FALKOR_ERRATUM_E1041

 	  If unsure, say Y.

-config NVIDIA_CARMEL_CNP_ERRATUM
-	bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
+config ARM64_WORKAROUND_DISABLE_CNP
+	bool "Disable CNP on affected CPUs"
 	default y
 	help
-	  If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
-	  invalidate shared TLB entries installed by a different core, as it would
-	  on standard ARM cores.
+	  This option disables the CNP (Common Not Private) feature on CPUs
+	  that have hardware errata affecting CNP behavior.
+
+	  On NVIDIA Carmel cores, CNP behaves differently than on standard ARM
+	  cores: non-shareable TLBIs on a core may not invalidate shared TLB
+	  entries installed by a different core.
+
+	  On Hisilicon HIP09 cores, TLB entries may be incorrectly shared
+	  between cores when TTBRx.CNP=1, leading to TLB conflicts and
+	  stale mappings.

 	  If unsure, say Y.

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index d0d3cdd5763c..25c61cda901c 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -58,8 +58,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_2658417);
 	case ARM64_WORKAROUND_CAVIUM_23154:
 		return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
-	case ARM64_WORKAROUND_NVIDIA_CARMEL_CNP:
-		return IS_ENABLED(CONFIG_NVIDIA_CARMEL_CNP_ERRATUM);
+	case ARM64_WORKAROUND_DISABLE_CNP:
+		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
 	case ARM64_WORKAROUND_REPEAT_TLBI:
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5377e4c2eba2..675cd059165c 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -394,6 +394,14 @@ static const struct arm64_cpu_capabilities qcom_erratum_1003_list[] = {
 };
 #endif

+#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
+static const struct midr_range cnp_erratum_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
+	{},
+};
+#endif
+
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 static const struct midr_range workaround_clean_cache[] = {
 #if	defined(CONFIG_ARM64_ERRATUM_826319) || \
@@ -801,12 +809,11 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 				  1, 0),
 	},
 #endif
-#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
+#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
 	{
-		/* NVIDIA Carmel */
-		.desc = "NVIDIA Carmel CNP erratum",
-		.capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
-		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+		.desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
+		.capability = ARM64_WORKAROUND_DISABLE_CNP,
+		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
 	},
 #endif
 #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..20c5f24f74a9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1785,7 +1785,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 	if (is_kdump_kernel())
 		return false;

-	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
+	if (cpus_have_cap(ARM64_WORKAROUND_DISABLE_CNP))
 		return false;

 	return has_cpuid_feature(entry, scope);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..9b85a84f6fd4 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -120,7 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
 WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
-WORKAROUND_NVIDIA_CARMEL_CNP
+WORKAROUND_DISABLE_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
 WORKAROUND_QCOM_ORYON_CNTVOFF
--
2.43.0


