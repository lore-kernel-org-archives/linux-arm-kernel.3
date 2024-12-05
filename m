Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0123E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smbLgrckE25I2ak+4aah04Lb2EF2OUKb5fz0/VhJ75I=; b=LaI5p5I2W2i1VzgZc93/2/DnI3
	z8dWf6uSV95EZ+eIBTzjsw9J1fTIbEuD8n4Mx+WZVYaezTKFNWoArbWjeAjWj5c1QQZNeC1oXoXeO
	S3sBL/gQlXi4S+xR4mDJRjFLaLnnUNiSQEg6OWWPncx2+/PGr6tOhDibPK8DUQpwnYT9eUfMcr1z0
	JSmbngBkaM93yEv8ipz5G/31exuCEqYJdOrjGbp9HJEy5Xt/tUAf/woyDWQpzhiZhInsuIcD4ze4l
	1qoChr9PTXs6jqcuABIa1gchmtq44/hwPr3AGMvT4Ilg7rAOh0WPrwZqOu/WglS4Hhhz1WjHJ/l1H
	1uzvE23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDXr-0000000GUAN-2aMK;
	Thu, 05 Dec 2024 15:13:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDSD-0000000GSeh-1O6i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733411265; x=1764947265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=smbLgrckE25I2ak+4aah04Lb2EF2OUKb5fz0/VhJ75I=;
  b=nimcnFdat+5HzJ4PuuLTgbzaRTm7f3VRjrhYH3Erdj+nBqm/jF9fCCdy
   xVOIyPVc7XA1wXEnMfNP3jdREmo6S6maX/y4VksOrEHTZxLFkEwRgVOP4
   0R83wZ5uZSKZujO2KsTXpEUcYH+z5M+o8t65kb9hysD7jzwQf0TFWDkF3
   9rvkdAzwVFuFUu2WjWbW2SSHmWd2ZWRFOsPIanOl8i5ymwl6HC+0Qs38Q
   vPSpk7WjJ0g1LoftCcoT8hsnOhdIJgLjElGDrT3sF5kd8Lo+Mskmmhfcn
   HtlYWY/Qzg59RpokmDST5g+NJcdrt/RHBBLGvOLMOMK132OXlnW/9P7XD
   w==;
X-CSE-ConnectionGUID: Lq1MR0QGQ86NvTiQJl2PRw==
X-CSE-MsgGUID: DbLBHJfeT9am2vHox1kHow==
X-IronPort-AV: E=Sophos;i="6.12,210,1728943200"; 
   d="scan'208";a="40434854"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Dec 2024 16:07:43 +0100
X-CheckPoint: {6751C1BF-25-D31EDE1A-D52D6119}
X-MAIL-CPID: 24AF9B8854DF14342AD0D1FA9D6FBB27_5
X-Control-Analysis: str=0001.0A682F18.6751C1BF.00B9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBF08163400;
	Thu,  5 Dec 2024 16:07:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733411259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smbLgrckE25I2ak+4aah04Lb2EF2OUKb5fz0/VhJ75I=;
	b=DJRRMfH0BmXxQ69J9qzYp6PivF8XSEGNBASYXXiYuJd/rZqoSRiRQc1vQVCVSCckroofek
	2Y8KOGe+A5QoRIg027e2s+hwKjzUnPPUAS2W2OVOGhzDUoITPb6b+E+YMhWDPRSnQp/JzL
	wEnsUQGdXNPEYScdC/+ckaEQneDO/ksHM18vHH+pEDGhxonL/64pnerxGivO5R39U7G5jp
	xma5cK8UsJFf9aV79vD5hqmp95CZYM/c/gi8vRrq/XUZncy/ABR5sFa6ASBiRxb4bzCChz
	OhtDoF/iHQqHvRqdUwXXWNO44K3DI/irQWT7Hrf7JE9d4vKVRyQTJSUkV0J7OQ==
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
Subject: [PATCH v2 2/2] arm64: dt: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO
Date: Thu,  5 Dec 2024 16:07:29 +0100
Message-Id: <20241205150730.3132807-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
References: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070745_665366_F1696333 
X-CRM114-Status: GOOD (  10.47  )
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

 .../arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 0b4b3bb866d06..2e953a05c590e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -597,8 +597,8 @@ pinctrl_eqos: eqosgrp {
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
@@ -629,8 +629,8 @@ pinctrl_fec: fecgrp {
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


