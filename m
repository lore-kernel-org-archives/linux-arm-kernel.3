Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA13C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcfXboWvRClaopQK1Ywk6QojNldDv/qICGsRE6ZbcuI=; b=1iExRdx53p/b8AAaag7AcJSuSN
	ydrGOqNCLAX/8SgWOts9dICGf/5acCu6IJJ89zlNstRFBWZva0kNa6tnG3smnk7y73P+mWtsiBDfl
	dDUintvxg+j1Fy/oOKpX9OYi57jpYmnYsLwWKCcrvksRwaNHHpwlFJpfujpfqyNcmXfHGS8SxZUwX
	vpDvTkDlLX0Dp0sfGFCGRU9nkN6IAsz0lrfhNBBzIV/104khAGxcaUsV2yb8900bTJdHUeO0nk6C/
	FvBfjTihzkdniBJsgCgiZhWiRhk9BLQPR7NgkK+yR5dE/N88ajaj2qZok2m8fIhA3CEAYIwfXTYLd
	qEQ+EsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pst-0000000AB81-0k5r;
	Thu, 10 Apr 2025 11:15:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2noL-00000009rIL-3s2S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 09:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KcfXboWvRClaopQK1Ywk6QojNldDv/qICGsRE6ZbcuI=; b=IUgkooGE0bAOnaUXeSEBoLXFft
	lbW24PysQp7IqXMu3lnTr/zAx2LiYvoGkBxqrbw1P9c0mjBUp70d9L5oZfc621ImfEVwEHaWegh9C
	o7Xj0FsDNYMV5z5oSoWCyUL/vFsEi2lmlTBZdmWyA4ajhlAxkBTzWK7N5YV3Te91incMVghgUaQp4
	E+7kb3sOPy0fXBcxxPGK53P/ETJ3bDTBdY9CsXWoWh9Wj6Az7MtsKn0YkAdorodQl6tlgiVj47DDd
	T5YENXJvCqiiRIrbsX3NRc3XF27+haHaNpYMLBoEzPFrK5RNyfmb7c2rSn6VUHho+mn+Vmwcjbu0l
	AMy9BDtw==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2noI-00000008mez-1Ix0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KcfXboWvRClaopQK1Ywk6QojNldDv/qICGsRE6ZbcuI=; b=PW5/4B8FmgYCrfJDfOC32JoDkG
	bwrjRQRtDsuOQBCUe2WSVVcXtKWrPf76CSoRhd0SGPfe2Twl5Ncm0m9juNCqR3Ib4jhujJEL8ZN19
	tSG0n3/P8myntkd+aNC4Ikz4soxUpbJ426GCNAXa3HBphD7l2TQmWPkiAmK0m1VKTRN9ieHpCjpqc
	qBBI8HeVqztFuEYjtgHlrgSOJfPnQO3C1XeCMIGCCtObygMaot3I4JkocBx6115TtqS+V2B2ZOWv3
	F+YPONWJ2K91JQru2eq4ZVROU39M3tdQhFSISoOORYFPi3DvB+6EmDSnIK2QI8LVVgXl6nTCwT8tR
	oQ8erJng==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noF-000Djj-0j;
	Thu, 10 Apr 2025 11:02:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 03/13] arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
Date: Thu, 10 Apr 2025 11:02:41 +0200
Message-Id: <20250410090251.1103979-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100258_760032_0F6564FA 
X-CRM114-Status: UNSURE (   7.37  )
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

There is already an external pull-down resistor on the LED output line.
It makes no sense to have both pull-down and pull-up resistors enabled
at the same time. Thus disable the internal pull-down.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 442ee067a047..82f680d891c2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -196,7 +196,7 @@ MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
 
 	pinctrl_leds: ledsgrp {
 		fsl,pins = <
-			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x11e
 		>;
 	};
 
-- 
2.34.1


