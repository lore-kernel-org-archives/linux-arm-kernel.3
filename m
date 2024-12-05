Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B34BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=owlbvx/kRHzonFJ8nb841FHj32M/qOU85thSp1YvB0Y=; b=wXlS7WzVOv5jF7yMFSJlEbbJFt
	Mqw28+qHxwilud2CJsPy7MBdKUCczdrxX/x0grGQWMJMgBxLho14CqpPdlpNrW6BrQUQgJ51cXQBn
	89N+i3q48/PbEJCFMUiBR1zU1e9Q5NOQCuGFU2M/jqw4lPQRBsB5IaTebCxEk9Li/KyqjylxubOdz
	vlo50Lh5VBY6lvwo1joubYmTGfBykB5eLQDFJ97tHaOV/pqwiImADKtJLpBsp1SH7SSzn3UBbmSgo
	PCrN+vSTZeBl+5ipNAw2A8BSePpv+ImTpJ7xNfWxf4EY1FBKvUFZSkowXv8F4Y7kK8plPu/RnqWum
	FGv/9QWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDWr-0000000GTwy-3HD6;
	Thu, 05 Dec 2024 15:12:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDSB-0000000GSeh-0eKU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733411263; x=1764947263;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=owlbvx/kRHzonFJ8nb841FHj32M/qOU85thSp1YvB0Y=;
  b=qA8ACHL6AVZuj113e3bHugLXM1zLP5ywIG5j68aiVFadtCSQKqokG5Ax
   w4tupweoxCwL6CEARmOsF6m8XCpGBxBtJwMVMeiLsd/nD7Tm5Xx3fbGLh
   vRxeBrnoMZw6jhIPc4H2xzvLBe6Sotvzmaz3pCIRFkOQqYvM+2es9zmhb
   LZ0Fhiz5wSpI0+JQODUc6AX87WIqA84sPsB6LxSdyBDp7z/3ahEIPN0EK
   EpDVrlRn+vuonl+YHmEBuBzHVYkDBr/Y+BcRRk5Qgwox4YAIZi529gPRE
   Jm2hkwAmkfoWBeTeuaaprlb68u+1Gcdj9ygFGgitGCVpIXpOOn9JJ6G/2
   A==;
X-CSE-ConnectionGUID: mHFpWIMnS024qwk9ZfiRkA==
X-CSE-MsgGUID: Lz2SSl9LR267uOFsz5wzCg==
X-IronPort-AV: E=Sophos;i="6.12,210,1728943200"; 
   d="scan'208";a="40434849"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Dec 2024 16:07:38 +0100
X-CheckPoint: {6751C1BA-1-90CD5875-E0265C0B}
X-MAIL-CPID: DB51403153CCC72A33CFE8CA058B14B7_3
X-Control-Analysis: str=0001.0A682F26.6751C1BA.006F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2481160B1E;
	Thu,  5 Dec 2024 16:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733411253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=owlbvx/kRHzonFJ8nb841FHj32M/qOU85thSp1YvB0Y=;
	b=XhQLwN4sHvUZEtt/WhvaA0p7WZP7JzhIUjPBjgx+6tojBH6drdnfW52cxErD322YWkBtMA
	2Vrsz2wEUkomorScQng+8HwMx3C1oL2Dtz+2wKIw9yk+LAZ9myudh6cTcNGIbNZPrGYlVM
	MO8CP3r9Uawz95K+9StQ1cXeoe83uiIxiK4tHgUkAjI66Xx/vCzkDWQH7CPUFO5kg6u5Bj
	l1kdxOSOuVc8LfvwMb3Y3o+5+oISvgG9SvR4lrQkFMlRY89n7eBkAcHErdcNTb4KBmJN5p
	t4PYASIHcCFpAb3nP2sPtelD1mhQoYOp0+IkQzYc1dxezkHnluZWwyT7pidi0g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/2] arm64: dt: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO
Date: Thu,  5 Dec 2024 16:07:28 +0100
Message-Id: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070743_692384_7588853B 
X-CRM114-Status: GOOD (  10.10  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The board has a pull-up resistor for MDIO pin per PHY design guide.
When MDIO is idle, it needs to be high and open drain is better
to be used here for power saving.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Update commit message

 .../arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 599df32976e24..8e939d716aac8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -627,8 +627,8 @@ pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x51e
-			/* SION | HYS | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000111e
+			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000191e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000
@@ -659,8 +659,8 @@ pinctrl_fec: fecgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e
-			/* SION | HYS | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000111e
+			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1000
 			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1000
-- 
2.34.1


