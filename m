Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F22C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3BV7atvuABYEEZWYNR8lZWvJ+WfpKTMmG/5nr5RLwI=; b=JeydfAUeU7cj85JX/Z5vEu39uR
	vyO6WpM+xNNQNiuYh6poR/rq0UpEXnSMyV9tuIYrgOmZIS+RRpnH0A2fk9SecMHtXsBa88k+6wYBN
	jsOypNFY8L2UKLA9bTq85OO5mVg7iQyMab0uRWUDCvkXN26O7AFIimO8+T40B3cv/W6KK4Vwn45zj
	I20tCFxF/tAWIS9h6NAtd5gui7fheWOnwcYI5NeiHzkUnSKfg2Z7r471dfpx3saX6Wi9c2jCJ+fCV
	SemIEFCFQhtAMH2kHpDkMqw141Oa07r48MjDMRc022/Ly9avzJK51RGmoYQRUvZBJdfl+t35oDN8v
	dtqniqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u551Q-0000000A8hu-4BUv;
	Wed, 16 Apr 2025 15:49:56 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53kM-00000009tPV-1o6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:28:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AD33BFC16;
	Wed, 16 Apr 2025 16:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813692; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=y3BV7atvuABYEEZWYNR8lZWvJ+WfpKTMmG/5nr5RLwI=;
	b=nVBXtlnKXK6xffDLyhBxenOKFk6R8+v7xzt1syqAOVzQisPCCrAGZpOczv8GlhEWJXz2G6
	Rf5lRlEBuZf3F6f2yQQoJBV/qUZ7YtmDzdOPifbQ6cctOkczxf8vpmQs8uNUUVx0UvOYH2
	8+LRw3Hy+oq1ELpiq/AXmpv1ha5vNM0cMDINSTBvRaU1dkYTUoZ+qXAdHOLTe8yyBTtZAs
	+mMcLGVZwbVvucLN02Btg5zOh3+ihjx6Z93f8fMPUXYsUIAe8rk2IKIn5vdHq0AtQu7L4c
	0eTUYMMVLEpz2NWyIPt/LuxsAz17rTZjNwmW/z8rYyibLBPIbCmpUmS0vz+KXw==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [RFC PATCH 5/5] arm64: dts: imx93-kontron: Add DMA memory region for ELE firmware
Date: Wed, 16 Apr 2025 16:26:24 +0200
Message-ID: <20250416142715.1042363-6-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_072814_618909_288F2C1C 
X-CRM114-Status: UNSURE (   7.51  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The Edgelock Enclave firmware requires a small 1 MiB memory pool.
Reserving this pool makes the ELE firmware driver probe and allows
us to use the S400 API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 119a16207059..44d98cf812bf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -24,6 +24,18 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -116,6 +128,10 @@ &gpio4 {
 			  "GPIO_B_0", "CARRIER_PWR_EN";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &lpi2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c1>;
-- 
2.49.0


