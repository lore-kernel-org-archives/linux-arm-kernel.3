Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D86AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OUfdnwQK75xEOyLEAX2T30UB5/q9/2vSMT4xlE66UAY=; b=joq6QYAkBlwqp19av/uB/3SNQv
	Q4LGXeGvkzjpQJWLPenZikk7IzeakN3yof7imJODGmrHb7xFO4Q9XelwFC84xNp1YHYCOdjs8Bk93
	gAKwQsivu/YwCiN01bLPlebwx8g0xQAsQnDdKdd7uDq7Q8gT+io1BObr6VhH2xcQeS1KWYXBwem0b
	2qdjZFI/ZTxi75yhuHvq4xz9m4gZXg9jnh85qksKa1j7ceATt282pQWT3bNu+JLxjRHBpdgddkKUS
	aQLnT0eOQ97EG99jDHkpHv1nXwqaYnoIzGB7ecq8KR9HiVDGLODH7VfbRgyztA/wczqJLv5vvwlK+
	C4nMw9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KSe-0000000CFmT-1aca;
	Thu, 17 Apr 2025 08:19:04 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KPJ-0000000CFHM-3M5R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744877737; x=1776413737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OUfdnwQK75xEOyLEAX2T30UB5/q9/2vSMT4xlE66UAY=;
  b=TbD/FXK79MP663NjxT1KQYSXkZuXkIEGq8iV1ueBSaEYjXaasLxll2tA
   m5VoV8jfarNnHs0qVv2UOKrl+zw8USd7mgxLuaCf1ctA9ALG5nDRndPj/
   thmFqARZ8Ar5bWIVN4d5XPwSJ4dlSmiycDqUJZJKe7jcgZAH/wWKe9s/b
   hPjSnPLK6Ti02N+hIH8qpcrSE8Cgz4e8sy5F5kZzb/iO7f0EHLwPZh4jg
   qAqap+yPOKCWEBWtv30QGWsDZWu0OHZ9/Oq8Ukzc3CcRrJ3uEzAc1xvgg
   xCatsBWbtYRI5XUDZNOxXkAN/Ik2wff/aTgZ6BPvJ4jo2dFmMKj0Mgdl+
   g==;
X-CSE-ConnectionGUID: XLCD0ENZRx6bO9HNeywYxg==
X-CSE-MsgGUID: zxdC4JQvQT+UyZB3RB/1oA==
X-IronPort-AV: E=Sophos;i="6.15,218,1739833200"; 
   d="scan'208";a="43587413"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Apr 2025 10:15:35 +0200
X-CheckPoint: {6800B8A7-10-903EAEAC-E04C76C8}
X-MAIL-CPID: EE051AB59F033E25D47D34B959E4ACC2_5
X-Control-Analysis: str=0001.0A006377.6800B8A2.00B1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5177616CEA0;
	Thu, 17 Apr 2025 10:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744877731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OUfdnwQK75xEOyLEAX2T30UB5/q9/2vSMT4xlE66UAY=;
	b=HeF5QlDwg56iwpNFx3JZmcmovkaABpbjxwOmRGPbJrM6ifMbepCmrDe/PffvC/tx2kPINi
	6sR4pbhBVtnUldBrJ8uai6rcU+745Mo0rn4DO4jul4dxiprZqxTdF8DYcdWs2jXgG7Nc1h
	LfXXgN9JO4YsPdEquktyiOkg0fLK1Neo3/tfEnH+2IYY/NsJWXtYgYLN4ii7Iffdv3VJQx
	WLxFekE38EG4d8UAXwp/tqxlgdGxXnEmQCT8LvTqpLNrCnGvmJrD4u2pqLOCwvnPECaWuD
	rMVwFVTX4MSDhmju2prPgSnjcIs0/Il4ciGcI8WSUXuwvriJqXefdbdMceXrFA==
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
Subject: [PATCH 1/2] Revert "arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"
Date: Thu, 17 Apr 2025 10:15:19 +0200
Message-ID: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_011538_320696_9337B167 
X-CRM114-Status: UNSURE (   7.72  )
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

This reverts commit 9015397c2f2d9d327c0cf88d74e39c4858cb4912.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 1ff2754255fa7..994be4e649343 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -649,8 +649,8 @@ pinctrl_eqos: eqosgrp {
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
@@ -681,8 +681,8 @@ pinctrl_fec: fecgrp {
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


