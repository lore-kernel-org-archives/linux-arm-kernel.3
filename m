Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAD7CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5VrfCfSqOanYfHeYMPNAul2N7amk7nstlt6SXsc7D0=; b=gzDyt2NUW6Bvaa1+OQ6+MTsd9I
	QDoa1bTahYnRAjKqkkKbcF8ETpC3KNuw8CtFcOEYp+8HieKAHw4cqY0d3AKYiyQlsWtbBtkJtoLGy
	NyakREM/uF+2sQDlSh9rRQkSCsBPQSMUb3Uh0vZivNlUQPSiopSxrLaWHpn0ZYbgtpYNeZNHa5Zpz
	a0hxy5n850x6KupuRV8BbxK/UAyzeaBLiPtv9Oj954f/QQH3s9IFWHYrFgxL9eXHoJZOaveduvzs3
	IZ0N8/BunIPYb3Q+plV1+KZMFKND0qz7jHSvpwsiBQLymHQ2reKXgs+mM4rfBZtJ1J41j7v2eVERp
	bNFHNGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0hC-0000000Aivv-25GB;
	Mon, 01 Jun 2026 11:20:38 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0h7-0000000Aisc-3QOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:20:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gTWhj38GFzKHN0w
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 19:20:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 09C064058C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 19:20:28 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgB3ej_iah1qEvbwAA--.46998S5;
	Mon, 01 Jun 2026 19:20:27 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	wangyushan12@huawei.com,
	yangyicong@hisilicon.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	miko.lenczewski@arm.com,
	james.clark@linaro.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	lpieralisi@kernel.org,
	thuth@redhat.com,
	kevin.brodsky@arm.com,
	tongtiangen@huawei.com,
	oupton@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Mon,  1 Jun 2026 19:19:59 +0800
Message-ID: <20260601112000.1145391-2-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601112000.1145391-1-zengheng@huaweicloud.com>
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgB3ej_iah1qEvbwAA--.46998S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4DGF47Gr13Wr4DZr4xJFb_yoWrGw4Upr
	yjk3yrJr47uF1UG348X3ZxurWYkan3Gw1Ygryjg34qqr4avrWUCFs5Z3y7ZFs2qF9ruw48
	KFnFkrn5ZF1jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU04q
	2tUUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_042034_267936_C48253F1 
X-CRM114-Status: GOOD (  13.79  )
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

The NVIDIA Carmel CNP erratum is not the only case requiring CNP to be
disabled. Abstract this into a common WORKAROUND_DISABLE_CNP capability
to facilitate adding errata for future chips and reduce duplicate
checks in has_useable_cnp().

This serves as a prerequisite for the subsequent Hisilicon erratum
162100125.

Suggested-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/arm64/Kconfig               | 4 ++++
 arch/arm64/include/asm/cpucaps.h | 4 ++--
 arch/arm64/kernel/cpu_errata.c   | 4 ++--
 arch/arm64/kernel/cpufeature.c   | 2 +-
 arch/arm64/tools/cpucaps         | 2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..f297517a83b9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1315,9 +1315,13 @@ config QCOM_FALKOR_ERRATUM_E1041

 	  If unsure, say Y.

+config ARM64_WORKAROUND_DISABLE_CNP
+	bool
+
 config NVIDIA_CARMEL_CNP_ERRATUM
 	bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
 	default y
+	select ARM64_WORKAROUND_DISABLE_CNP
 	help
 	  If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
 	  invalidate shared TLB entries installed by a different core, as it would
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
index 5377e4c2eba2..b0db946568b7 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -801,11 +801,11 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 				  1, 0),
 	},
 #endif
-#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
+#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
 	{
 		/* NVIDIA Carmel */
 		.desc = "NVIDIA Carmel CNP erratum",
-		.capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
+		.capability = ARM64_WORKAROUND_DISABLE_CNP,
 		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
 	},
 #endif
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


