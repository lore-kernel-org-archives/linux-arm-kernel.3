Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E1CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/vJTXDa5JGao0fg+y7rTxeWlsSvg14wPGOzusE7qgQ=; b=WoS++3DSup4XOW8WDXqrW7p4be
	7E8EYAXTTft4MtjHdV5MRt0pYiEGGkSMQiVdxWarNmgUhc6EtYz+qYTkBH6qEmSj0ETOb6+ux14Y5
	WR5RJc8LvGth6+39xIcnJ9objqm6+EEmna0vBDazGnMKjX54nf82ZaSmYi004sQydJuVF2CVHtY3n
	DdAwLGONoxVrHd144FEepyef1z0TU7rs+ewc8ztq/RmFk3zIYOqHzokwOKD5OKbKOSNreYg7tEawe
	0Tc+QPnH8hudiYTTHRGf3id+I29lPaT0xon8cfO4VV1/eknFn0jXfT0uC7N/FxLAosFikRQPOPLIG
	GqHGsLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVl-00000005sG4-2Ydh;
	Wed, 30 Sep 2026 11:30:09 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVi-00000005sEt-1dl7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y/vJTXDa5JGao0fg+y7rTxeWlsSvg14wPGOzusE7qgQ=; b=VpbFpqPetZwtqDwMta7zsePbBB
	GMhMPYS6d0aMRz0XlQH3iGAwN68BIsM9J0Lp/9XCVnJEVE6jykDyswuxY3IlmMA1O4vsagjFKuAPr
	4WtVehGuO7fT+B9+9wX8231g4a3GOtoO3V9rdZKjx2wsl9srEHGReeIZiJ9olm1rBHnFDWIHsbtuU
	kp402tzd7xFzZv+zMtEJh4peZxgrKr2LET//+XL+wsYgypqVrThLYxY5T+7lpYnFFgsl3WYoYDTXx
	lPf9jUHGt9ZBUp+E7f43mcRMn1oUBuX9fmXLF4Tui+zaEjZ02b7t3x4Iv+s68mFyqwv5/ht5DiDHO
	9VzgNctg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-41oi;
	Wed, 30 Sep 2026 12:25:34 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 4/4] ARM: dts: imx6: phycore-som: Add reset-assert-us for PHY reset
Date: Wed, 30 Sep 2026 12:25:32 +0200
Message-Id: <20260930102532.2262700-5-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930102532.2262700-1-primoz.fiser@norik.com>
References: <20260930102532.2262700-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043006_959473_FA8E0C4A 
X-CRM114-Status: UNSURE (   5.85  )
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

Without an explicit reset-assert-us, Ethernet PHY probing occasionally
fails. Set it to a 10 ms for a more robust PHY reset pulse.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 88eabc7af6b7..16e00375f474 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -65,6 +65,7 @@ mdio {
 		ethphy: ethernet-phy@3 {
 			reg = <3>;
 			reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
 			txc-skew-ps = <1680>;
 			rxc-skew-ps = <1860>;
 		};
-- 
2.34.1


