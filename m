Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDE1CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 01:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6OO6/d7ZmVGuRpE31Fwln/yEm2ui8oQIg+Scq0e31A4=; b=MALQYfqwjcyHoq35dn8ieKTg62
	zExfsAmh586z7OOTRWLJHJ+aU99TuD9lNHVn6/fhwrY2zSn/Grf2FNojFnFrBwotsVL61pOBe8rCd
	rq0uX1HmxfSFUN6E424yCFrtEaaU8aLYdH943SGrXw94iXo527b+xLpnfm7JN6TGsd6AaW6m7Iav4
	KQDp+gnipIPjPt8v7jeM7+uc5g4brETxViq064Y64SnljjIcVdFxrLojUqXhY4cj503vFI5/CoNa6
	2JmvpPpburB8pk7UJzNPF0nxsu1q3OjX38vrbQ6Hs0wymjo74wSRUzu57FkYUbY7nJjxDN5mBJfzm
	mcVSDhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRh3G-00000000ofs-1fLl;
	Tue, 26 May 2026 01:57:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRh3D-00000000oee-0Ygk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 01:57:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gPbV86vrwzKHMRq
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:57:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4D26140561
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:57:33 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP4 (Coremail) with SMTP id gCh0CgCXX1sD_hRqw9GdDg--.18849S4;
	Tue, 26 May 2026 09:57:33 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: corbet@lwn.net,
	kuninori.morimoto.gx@renesas.com,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	lucaswei@google.com,
	yeoreum.yun@arm.com,
	skhan@linuxfoundation.org,
	james.clark@linaro.org,
	broonie@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ryan.roberts@arm.com,
	will@kernel.org,
	tongtiangen@huawei.com,
	kevin.brodsky@arm.com,
	yangyicong@hisilicon.com,
	miko.lenczewski@arm.com
Cc: linux-doc@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: kernel: Disable CNP on HiSilicon HIP09
Date: Tue, 26 May 2026 09:57:20 +0800
Message-ID: <20260526015720.206854-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCXX1sD_hRqw9GdDg--.18849S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJw47Jr13CF1UGr1UAr1xuFg_yoWrZr1fpw
	4fAr1xJF1DWF13J34UJw17Xr45Can3Gwn8XF1Ut340qr13Z34UZF18Xw1xJFWjqrykWw48
	uF1q9FyUtF17ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0s2-5UUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_185747_552696_CA796753 
X-CRM114-Status: GOOD (  12.55  )
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

From: Tong Tiangen <tongtiangen@huawei.com>

HiSilicon HIP09 implements TLB entry matching behavior that deviates
from the ARM architecture specification when the CNP (Common not Private)
bit is set in TTBRx_ELx.

When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
cores, leading to TLB conflicts and stale mappings. This affects
coherency and can result in incorrect translations.

Add the hardware erratum workaround (Hisilicon erratum 162100125) to
disable CNP on affected HIP09 cores.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 15 +++++++++++++++
 arch/arm64/kernel/cpu_errata.c              |  7 +++++++
 arch/arm64/kernel/cpufeature.c              |  3 ++-
 arch/arm64/tools/cpucaps                    |  1 +
 5 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 211119ce7adc..cd50059edb85 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -284,6 +284,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100125      | HISILICON_ERRATUM_162100125 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..ed6207c75b54 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1273,6 +1273,21 @@ config HISILICON_ERRATUM_162100801
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100125
+	bool "Hisilicon erratum 162100125"
+	default y
+	help
+	  On HiSilicon HIP09, TLB entry matching behavior when CNP
+	  (TTBRx.CNP=1) is enabled differs from the ARM architecture
+	  specification.
+
+	  TLB entries may be incorrectly shared between CPUs, potentially
+	  causing TLB conflicts and stale mappings.
+
+	  Disable CNP support for affected HiSilicon HIP09 cores.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5377e4c2eba2..26d9677a20fc 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -968,6 +968,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_HISILICON_ERRATUM_162100125
+	{
+		.desc = "Hisilicon erratum 162100125",
+		.capability = ARM64_WORKAROUND_HISILICON_ERRATUM_162100125,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
+	},
+#endif
 	{
 	}
 };
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..c4b0db77a58a 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1785,7 +1785,8 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 	if (is_kdump_kernel())
 		return false;
 
-	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
+	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP) ||
+	    cpus_have_cap(ARM64_WORKAROUND_HISILICON_ERRATUM_162100125))
 		return false;
 
 	return has_cpuid_feature(entry, scope);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..b797d4893adc 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_HISILICON_ERRATUM_162100125
-- 
2.43.0


