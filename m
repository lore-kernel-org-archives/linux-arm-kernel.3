Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A9CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFiJLP3610Hf7zJOKVzwXIGBYYN9GrpELbIYLZIdtkE=; b=dG0RTIabHEWEfgQtyN1hVLqmr4
	aglP4F73Zs/VDzhPh5EPc99R//1ilQOFgFBvg1xveP9bmzJygZ2OCVRrGAyYu6zaewy3fNQj1h9pD
	iTGO2GfB0+JeKZXKgibz4CHC7McIuAU6BKjYAbDXoTICdxKNpbThxe2NSXiXjlejb9q7YL1rMvfKX
	ULNe3c9dgoTk/i2At8bx5aJPJfFxuoXQeA5S6b+pxDtelWD/vtRruOF/2X/RVtQr+zZvRM+4/jmm8
	bedMqfGJNJ64Tl8HqQy2pHyso1qUy/O/Z+1Il5GF2Tz1hBEEqEG2yydMq1CS0ORdrretoGVY88ff/
	qTsva4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQBS-00000003B2M-0Juh;
	Mon, 09 Jun 2025 00:16:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPus-00000003ACC-1s5p
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 08 Jun 2025 23:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MFiJLP3610Hf7zJOKVzwXIGBYYN9GrpELbIYLZIdtkE=; b=VygHj7VForvBVTZC+MmGoVQ2g1
	IdYP+OKhOuvxxzBzF2luufLQ0Rgob5qAYFWGLjQzICgQmEN3XQuB97twuKT+bLxH60BjunVgMBoYW
	zhTq2LtwxXyOTyDPFSC7jq6OJzXHCErsuMTkJchincyoCG1h1itL/2pNLfA0vazTpL/YD94qdj+dX
	S17P3di57lHXFAm+SsLPOwSbcl8v28zHFCTQfReN6AiysMI/DgWFMgGdwFwmRYQP70QZ3IYtuZntC
	aJK52POkpLariJnyxx+d97sEElb2jjy9Q71F0wlMVq4J4a9jKDQP/Qvw6AeBx/pfYr+S+nFs6uPgB
	3GtV3l9g==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPuq-00000001YlU-0o18
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C62461B24;
	Mon,  9 Jun 2025 01:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427137;
	bh=E95ExV+bpvvCIVTb6egsIEPSANnfBl29NVknNLvK4gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CG0YQsTXefyUzwPXyotM0vRPUKwDs0gs5gBcn+58wOs3QoyjO7+lUlNWzL06D08ZZ
	 4gZYzGpoVR4V/Xl3upkqB8T0mYT74tc6xlcrRBcIpfj7bJjrt1b2PCJwqo5Ppknexl
	 IUD6F6Rz4UcoHt/q6jZbHTdEzkZSn9FxMyok61C4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/8] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
Date: Mon,  9 Jun 2025 02:58:39 +0300
Message-ID: <20250608235840.23871-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_005904_393739_ACA1969A 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
in the device tree, to enable support for more than one channel in
drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 95b3f250d363..c409a1d1e851 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1767,6 +1767,7 @@ mipi_csi_0: csi@32e40000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
@@ -1802,6 +1803,7 @@ mipi_csi_1: csi@32e50000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
-- 
Regards,

Laurent Pinchart


