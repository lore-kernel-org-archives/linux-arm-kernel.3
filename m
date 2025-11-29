Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C29D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=luez4PC2vkXTisPWwXk47UIvFxIIJARfQQtuuZeiE6Q=; b=mHsq/8vvTsI0yewbtC4Ovn5y+v
	Lj3CGjr44agzIR2fnGjAgSuP7gKIOcNLW34tzJeZvdUhHeb9FtYL4YMQd4ytSy/T5QjaohXsfdsUK
	I8EUWJoIXoRamGMTS80ApXz0QStWRR3txQEFipfAQgIxpB+3VH8m4UpCv8BK/NZaXT8l8xNXgdH2U
	nDvNdL/j7Jsho5cmfHsSYk15YEEo/fzRVdW96p03Uvj9QPFSrMU0zdhGe18sfg7vJL+BulerbPGtE
	u/ZkZQT9fo0nQ3KSAvjd3uw3JUrKj8hUjVLqd/QQaYigttapvYRP1ebwAYqZMLub/kgAA3kvWwnHy
	SEYAx0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPM05-00000001azN-0DGO;
	Sat, 29 Nov 2025 14:32:37 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPM01-00000001ayl-3MY3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 14:32:35 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dJXgd0ch4z9ssn;
	Sat, 29 Nov 2025 15:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764426749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=luez4PC2vkXTisPWwXk47UIvFxIIJARfQQtuuZeiE6Q=;
	b=Uy8mDJ3BG9hyRId+/9DwOXuyERYYPlT3tw/KjBmPH/gUOzZU2ZTpfsNnZrvOgj+IX+pL2k
	hhtAI5YfN+XiTwSioLU3Z8b+9i0Ep653ZbT2OgNlu3cHPQfXQzfUVh58UXcrRniFOT000i
	8Np/HUQY7Zs+rzss+qWZsZW/G5hcBRxj6yt3yRwXyzlIMjY0ZIz29iUk1rKEP5IM9s5tFh
	tcRrkHwm6RuvkrdoInMJMOajlDvCn1sSjjIgOi7HcrdzNl6djKeg6xVJnWSWHZYVLhLx2d
	QdLeLuMtyBt8VmmleUrwD1cxiKY/oSAjhDE8evbEYO6hR6ZCesDHHlNgDyeYzg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764426747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=luez4PC2vkXTisPWwXk47UIvFxIIJARfQQtuuZeiE6Q=;
	b=ofrkiqtCxGY/jF0ZWFBf4bclAgMPdOvX0lFmq/e85SxEH/p5QvAMZNaZtH2X26v7b9nox2
	XMM0NXueuMPjufoKE8O/zVHiqhf56Tn3IqCIM9IJo6IFyUpog7AmFJ5j9dSvggwNjRrYau
	hXs0sO1ERS8Du3x0bqIAvuGXMz0K8ou7Kh9yVln05MHdp+/HRdUIw5S0g7pvz3iyY6P90l
	SrilObVZmDEGpBRiy5W9Yh++5XHKFUtFkUaROJ5xRHgcdBb8rLvYhEzTNAjloFq27qt2XG
	Vdy5jF9C5lUUkgYTrjO/yof9J1EdeBf3KiylxyRUayU33Y8c5MaaLzgCzjc1Qw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rain Yang <jiyu.yang@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Date: Sat, 29 Nov 2025 15:31:30 +0100
Message-ID: <20251129143220.14834-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 45bffb34d5b138d41cb
X-MBO-RS-META: k97c9155q5k5kus8ktn897m1mnitr64r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_063233_990950_8F9BFF5B 
X-CRM114-Status: GOOD (  13.25  )
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

The i.MX95 imx-sm introduced new GPU_CGC clock since imx-sm commit
ca5e078833fa ("SM-128: Add clock management via CCM LPCG direct control")
which are downstream clock of GPU clock. These new GPU_CGC clock
gate the existing GPU clock. Currently, without clk_ignore_unused
on kernel command line, those new GPU_CGC clock are unused and the
kernel will disable them. This has no impact on i.MX95 A0/A1, but
does prevent GPU register access from working at all on i.MX95 B0.
The GPU_CGC clock are present on both i.MX95 A0/A1/B0, therefore
update the DT such, that the GPU core clock are the GPU_CGC clock.
When the panthor driver enables the GPU core clock, it enables both
the GPU_CGC as well as its parent GPU clock.

Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx95-clock.h | 1 +
 arch/arm64/boot/dts/freescale/imx95.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-clock.h b/arch/arm64/boot/dts/freescale/imx95-clock.h
index e1f91203e7947..22311612e4403 100644
--- a/arch/arm64/boot/dts/freescale/imx95-clock.h
+++ b/arch/arm64/boot/dts/freescale/imx95-clock.h
@@ -183,5 +183,6 @@
 #define IMX95_CLK_SEL_A55P                 (IMX95_CCM_NUM_CLK_SRC + 123 + 7)
 #define IMX95_CLK_SEL_DRAM                 (IMX95_CCM_NUM_CLK_SRC + 123 + 8)
 #define IMX95_CLK_SEL_TEMPSENSE            (IMX95_CCM_NUM_CLK_SRC + 123 + 9)
+#define IMX95_CLK_GPU_CGC                  (IMX95_CCM_NUM_CLK_SRC + 123 + 10)
 
 #endif	/* __CLOCK_IMX95_H */
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 6091c2713fa48..47f20e501315f 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -2874,7 +2874,7 @@ netc_emdio: mdio@0,0 {
 		gpu: gpu@4d900000 {
 			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
 			reg = <0 0x4d900000 0 0x480000>;
-			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
+			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
 			clock-names = "core", "coregroup";
 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.51.0


