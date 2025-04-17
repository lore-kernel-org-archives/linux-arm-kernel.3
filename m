Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24107C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dDLIIzSQRg4ePKa66VPyPuGiB/e4Ve/L+L3EXhyXeE=; b=3jV0LqvNtH2yaN5t0dogmaQLpY
	Gnp9MYPqIVVKpnAQyEXmKI4zjuqhwyHnnMin7wJ/ciy2QDCNZIKCSKgbHbmdVUE1Nl0h480BbuxOy
	GuLj5/ApSVIKQHVA9QRmmJ1BBkYCZJ9Ztw1DHpJHIPR9wPu9JIgrM/ZMp2QQFuabVC86ZtFhBvsG+
	pTUPAOBQE5wZJH4Yu4xSSVuo3FWnQx+31IrIHtiGLKyCe6hwChnJixnTK9Djz/qj5Rl35yFMaXDwb
	E5eIFhHsDTGQos9a52q7QMdai3Y5cYs81VETonHGXvAHy3eVACWyfyiCg/hgt3EMfRJK/LzzM4fV2
	Frozqc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KUT-0000000CG2Q-0Y5v;
	Thu, 17 Apr 2025 08:20:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KPN-0000000CFHM-1JQK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744877741; x=1776413741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7dDLIIzSQRg4ePKa66VPyPuGiB/e4Ve/L+L3EXhyXeE=;
  b=ZPhhI1s1R6eVogWSXvr8B3b41Vji08YhxiiRWMJ2LOvYCqnjoFdABj3D
   wiDPMCmPm+8cbqHiRaXUFRAyPyQ2RaKQxBpJ7bh4LvLf60lIcO8vKkNH3
   0GDjQekcx1bCGtZBDwMzHJt1gt9HpHZpocDm7r398zAhcs7VRbEB4pNrX
   M3o3i9i4yE0Q/ad5Nwe7LbAOIywO7hhPqyT0svhYLLvBRHUhnEVVxLXQb
   FwyXfSUbcU7iXFyRsSQlYP7GBdQKgUEyDYYoqhtMzOpoJ/4Fkx1DUHAWA
   9WejsndD3wft57/OrTsJIzaW6w0nmsqOxlDfz4NGCgHp9ZaGrvdBNAz6R
   g==;
X-CSE-ConnectionGUID: gEiNRLgPREq9Xp+u3Qw2DQ==
X-CSE-MsgGUID: vOjlecO2S8i+w8GGAXPlsA==
X-IronPort-AV: E=Sophos;i="6.15,218,1739833200"; 
   d="scan'208";a="43587416"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Apr 2025 10:15:40 +0200
X-CheckPoint: {6800B8AC-1B-903EAEAC-E04C76C8}
X-MAIL-CPID: 937D254CC7FA1B77EF185447953CACAE_5
X-Control-Analysis: str=0001.0A006377.6800B8A7.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1D1916C3E1;
	Thu, 17 Apr 2025 10:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744877736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dDLIIzSQRg4ePKa66VPyPuGiB/e4Ve/L+L3EXhyXeE=;
	b=R3Cz/hscaI5rAOXYhFXN1pXFk2voseBsekk06MSWIpUuadu9fXQU0lwxUnXbucG+ezmZsM
	6cCzbXugsRuuRPaRuIJ9C5n0yoPQrVtdObb7/7BfOkMAJR2I7ul/BLeNVLo8IJy0HGClEh
	DgNYqujvgblPQ/F3jfw+aMhozyAIHg+uxgOaHB7IpOXMWRvikNj5eTC+MFzYkasKpU2dqw
	MaKWs2+QxtRZZI6Jqm+6mBYUu4vZ4DvMQXIU3CbR9vkap+mWn/5Kqr3ba2rxZleS9ScQPO
	RfdCAmLh9JxkVF49KaZcLRu8hMT9LL8ik0kGQ/YKkGL82z8fTWbW7w29KgHQHw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] Revert "arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO"
Date: Thu, 17 Apr 2025 10:15:20 +0200
Message-ID: <20250417081522.1145586-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
References: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_011541_649690_2DA2F178 
X-CRM114-Status: UNSURE (   8.19  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Using the MDIO pins with Open Drain causes spec violations of the
signals. Revert the changes.

This reverts commit 315d7f301e234b99c1b9619f0b14cf288dc7c33f.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index fc68c79fc0d8b..c98319a8fa81e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -641,8 +641,8 @@ pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x51e
-			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000191e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000111e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000
@@ -673,8 +673,8 @@ pinctrl_fec: fecgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e
-			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000111e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1000
 			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1000
-- 
2.43.0


