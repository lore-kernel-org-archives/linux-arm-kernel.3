Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2089FCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBD5tDwi1mEbd9vZcLrEc6TULIMEtPFMOaUFiSR7U5k=; b=buI8Ni/kC+ma3gbjz4HXcRtANC
	hPKiYHUfFjIE8smxgm4EixSZKQ9l2pvYy1hgm9xVDh9uhbif+DqesQmhqfgwqjrMhhc4Q35lzNFGV
	QPlmqgre3a5qSDwRl6JZLmGuQUMwlqSITXUx3Ork/baSyJzd416VAKkMqjCDI19mmMnN8qcUTHoaq
	+awfRm5PSD6kmUkk2NPPnJe7J+QCqSrr0dYoqnGx8FTl5GPUH4zPik0t1rblk/JlKhNk7L0WnJO2j
	ofK86mstc6Fewf0arHSIWhMMIMVUbSzMcdo+sNc/WF3Xg8QFSIbQfwDm3k+4vbph9ZLtpXSk7VaJW
	z6JTr2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrW2-00000005kjc-1FlK;
	Wed, 30 Sep 2026 10:26:22 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrVy-00000005ke7-2eOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GBD5tDwi1mEbd9vZcLrEc6TULIMEtPFMOaUFiSR7U5k=; b=Ob04HhE0NSKubgWXAtZ6SpRi98
	pxC67BD3FI1eow5BoD/6CogFu56m8JacHt7fZPOsqJzweO+eeJAxgIEbt11e1nLyjIEd9kQhr6tjr
	T/BEnuHO96HGETgUbp+3Bv3icYBv+VmKy2FM7XEMM05vEA98375NosxW7pzSqLKx5aoMvSmBOCcX4
	NFwPr+0MbW3envG3XndA/zcg7/ywZT10sKGakMl6cWKLo/wH2d3eA30BRSzRWBdbCAW4jM4ah9ZvL
	bZNnTAmzGIKsuTbhcSvzLxB5KOylwtaSbaYbh2rnaOVH7rO6iODmkjCN8pFcOK3h9Ne1SnewXzk+a
	ZEf3mdHQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-3b9H;
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
Subject: [PATCH 3/4] ARM: dts: imx6: phycore-som: Convert to generic PHY reset binding
Date: Wed, 30 Sep 2026 12:25:31 +0200
Message-Id: <20260930102532.2262700-4-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20260930_032619_151870_47E7BF5B 
X-CRM114-Status: UNSURE (   8.13  )
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

The phy-reset-gpios property on the FEC node is deprecated by the
Documentation/devicetree/bindings/net/fsl,fec.yaml in favour of the
generic reset binding on the PHY node itself, described by the
Documentation/devicetree/bindings/net/ethernet-phy.yaml.

Move the reset GPIO from &fec to the ethphy child node as reset-gpios.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 9070388eecb0..88eabc7af6b7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -56,7 +56,6 @@ &fec {
 	phy-handle = <&ethphy>;
 	phy-mode = "rgmii";
 	phy-supply = <&vdd_eth_io>;
-	phy-reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 
 	mdio {
@@ -65,6 +64,7 @@ mdio {
 
 		ethphy: ethernet-phy@3 {
 			reg = <3>;
+			reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 			txc-skew-ps = <1680>;
 			rxc-skew-ps = <1860>;
 		};
-- 
2.34.1


