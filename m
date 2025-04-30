Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C68CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mbemR3oRuGkOlc8+6KEUCkxK1UqOaYyGU6dV0XOH8fg=; b=k4gTYRNe+C547JW+wo7YFN1GV5
	cDsutYWGspM+eP/nQAVwLHMgdGAVsE6cECuiRc3kVCB5HuSoBVCE7McbKGD7VAg0DpjC5dMWtFN0K
	NfZSnVX/t8lx9XQSHkx1qOZWXX2wJaRJ82MIvPTaj9RBa23AyaZktKx07bBOcv8zty3CqyrvtUiaQ
	LYtJt2777qMNxXu8g9lMjYJkiLiCAY8YOr+djmXcXwqOoD7GjkgYuYHarBf7uhU8y849ZB53pWguQ
	/CgueJDBM/1E1GonCd+A8yuVqHUMPK6QgkOgr7l4NBaBl1ClMbGDtRYKQUlyHHS+X3z7OtOfvzBCk
	lggHO9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA41H-0000000CQFp-1rrZ;
	Wed, 30 Apr 2025 09:46:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2em-0000000C7i4-0tlw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746001144; x=1777537144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mbemR3oRuGkOlc8+6KEUCkxK1UqOaYyGU6dV0XOH8fg=;
  b=aIIKwMKt4WinFKsIlfedXMUThqd9vCRKsHJHnaDVvDaOarQlPen/BGcX
   pxWZJtaD19TFWygEQShx8VKIvoCughsJCfgcTl0XjsG61r4QIMlpA9LbK
   Xv4Vb3XCocyh6nHj4iYSq9btUkdR6YgTsWBRJOUubMIJO55wPzjHXV9d7
   FyOZYPjcd/6o+7vGFsO8hWzER7j9ScMAjX1fEUsB0lQD4MjhX8/ID1cwO
   jNEDMTvoNbzFtdkXqMjS2UISR+Q00wlO8fH30gQiMtYoT8JTi/V5goZsa
   oqGD++erVRg0zfzJRc1L5Vpq3xpBjZlbT3e9u/MIfyUEL7ayI5hkRj0qv
   g==;
X-CSE-ConnectionGUID: 6qH8UY+5Sy2M7Jco+pwx5g==
X-CSE-MsgGUID: a+PXonWyRzK3RnDABjbb0A==
X-IronPort-AV: E=Sophos;i="6.15,251,1739833200"; 
   d="scan'208";a="43802161"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Apr 2025 10:19:01 +0200
X-CheckPoint: {6811DCF5-1B-45F3AE15-E90F7DFA}
X-MAIL-CPID: 31B617226BF72FB254ACD175EC0ED1A2_5
X-Control-Analysis: str=0001.0A006397.6811DCF5.008E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABBED16B2E9;
	Wed, 30 Apr 2025 10:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746001137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mbemR3oRuGkOlc8+6KEUCkxK1UqOaYyGU6dV0XOH8fg=;
	b=O8XjPnyOZz8llZYysGi4ehzwo8TryFjKtx9AElVXO+m2gx/EDndaMOcEgt5ZCIKFEiim4D
	9lsPUmhfUL4Yx+lW7yvt0bmsh0KehJpCkuA+1mEJ2+nSfeDlgkARuRKjyiKux3e8RQIULT
	4XFdxgHOxlljC+uKWBm7lM9gPPmlRb3TliVctEJe+Qa4+N/w9KbM9JcNgSXw4c13ndAN0U
	8gOMUlLo1mJ9GQa8dXUIPDDoZ9zPOr+TgkF7tg/+sDiCgUP1NkbImNNxVb937dr8uTYmln
	Ke8Ynht3QJhsVDg6LyFAetj7bQJXLmuWNk3j5VzPmr2nN9v4Ig/gGx3Ta6c92g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx93-tqma9352-mba91xxca: disable Open Drain for MDIO
Date: Wed, 30 Apr 2025 10:18:48 +0200
Message-ID: <20250430081849.1827688-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011904_733726_C2D66F64 
X-CRM114-Status: GOOD (  10.36  )
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
This is similar to commit 14e66e4b13221 ("Revert "arm64: dts:
imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"")

Fixes: e5bc07026f94 ("arm64: add initial device tree for TQMa93xx/MBa91xxCA")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 7b78faa4bfd09..9dbf41cf394bf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -571,7 +571,7 @@ pinctrl_eqos: eqosgrp {
 		fsl,pins = /* PD | FSEL_2 | DSE X4 */
 			   <MX93_PAD_ENET1_MDC__ENET_QOS_MDC				0x51e>,
 			   /* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000191e>,
+			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000111e>,
 			   /* HYS | FSEL_0 | DSE no drive */
 			   <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000>,
 			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000>,
@@ -599,7 +599,7 @@ pinctrl_fec: fecgrp {
 		fsl,pins = /* PD | FSEL_2 | DSE X4 */
 			   <MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e>,
 			   /* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e>,
+			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000111e>,
 			   /* HYS | FSEL_0 | DSE no drive */
 			   <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0			0x1000>,
 			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1			0x1000>,
-- 
2.43.0


