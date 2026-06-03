Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6DECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVsXDRN6Y4gc9fbCtFvD/+J6TD0XlJS2eAgfXCLptns=; b=ed1PKAFLn4G/czyxRHeT5DyV5N
	Byz0vAsUdr55vAUgs48o9s4YxSSQQQZrxOHXNfkuom3HEnhfmoVc+cewn3tySSQ4BXVl8N9iyKHTf
	vG8F2KRRzWhVnNIGvV8VDRW5ivz5DYTc2AfndDOo3q2FF7vdv2Xph/56m3Dpj2A0llN8j/8QlR2tT
	TSeWtkmyz5qNdareyQqDlMKGmFrlvHeQHO2R8WQIQlpRpH/ZsGgBSu4zTL0AcE+kmaT8lNVtN396T
	v/0PTBvW1IFcrNPrQxPw4DtZEcJZhXtKKCNDvLow3Wx5oYteLnbFNH9+HnA+fxswibNd3wHh/6dBs
	QWGvUMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeyD-0000000ENHp-1UQL;
	Wed, 03 Jun 2026 06:20:53 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUey9-0000000ENGJ-2kQT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 06:20:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gVcxp4dm6zKHMLk
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Jun 2026 14:20:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 1ADCD40576
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Jun 2026 14:20:40 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgBHlzytxx9qYt3IAQ--.56787S6;
	Wed, 03 Jun 2026 14:20:39 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: will@kernel.org,
	vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	broonie@kernel.org,
	ryan.roberts@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	kevin.brodsky@arm.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	skhan@linuxfoundation.org,
	yangyicong@hisilicon.com,
	thuth@redhat.com,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	lpieralisi@kernel.org,
	miko.lenczewski@arm.com,
	mark.rutland@arm.com,
	james.clark@linaro.org
Cc: wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	zengheng4@huawei.com
Subject: [PATCH v4 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Date: Wed,  3 Jun 2026 14:20:25 +0800
Message-ID: <20260603062025.1504083-3-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603062025.1504083-1-zengheng@huaweicloud.com>
References: <20260603062025.1504083-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBHlzytxx9qYt3IAQ--.56787S6
X-Coremail-Antispam: 1UD129KBjvJXoWxJw47Jr45ZrWUWw45Kw4DArb_yoWrGF13pr
	43Jr1xJFyUWF13JryUJw1UXr15Can3Jw1DXF1Utry8Xr1jy34UZr18Kw1xGFWUXry8Xr4U
	WF1j9FyUtr47ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jI
	sjbUUUUU=
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_232050_061831_D434EBD1 
X-CRM114-Status: GOOD (  11.52  )
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
from the ARM architecture specification when the CNP (Common not Private)
bit is set in TTBRx_ELx.

When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
cores, leading to TLB conflicts and stale mappings. This affects
coherency and can result in incorrect translations.

Add the hardware erratum workaround (Hisilicon erratum 162100125) to
disable CNP on affected HIP09 cores.

Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Acked-by: Wei Xu <xuwei5@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 16 ++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              |  6 ++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

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
index f297517a83b9..75638e37883d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1273,6 +1273,22 @@ config HISILICON_ERRATUM_162100801
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100125
+	bool "Hisilicon erratum 162100125"
+	default y
+	select ARM64_WORKAROUND_DISABLE_CNP
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
index 08eb9d6545d1..310e6f120992 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -612,6 +612,9 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
 static const struct midr_range cnp_erratum_cpus[] = {
 #ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
 	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+#endif
+#ifdef CONFIG_HISILICON_ERRATUM_162100125
+	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
 #endif
 	{},
 };
@@ -812,8 +815,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 #endif
 #ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
 	{
-		/* NVIDIA Carmel */
-		.desc = "NVIDIA Carmel CNP erratum",
+		.desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
 		.capability = ARM64_WORKAROUND_DISABLE_CNP,
 		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
 	},
-- 
2.43.0


