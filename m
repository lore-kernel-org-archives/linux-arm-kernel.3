Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50027C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jn2Xlp+2akFaaeJ83XxhNPE3FBCl8lq/XPhKJygyha8=; b=tiEm5e6sRZz3wtWoAUgHbUFXqq
	43QDSZEsDakxqUV8EMChjzqNMjtzvv5wX3lZlf3LQWpjbD65tAIXNpu1XVAYBBuJB3rwYOPtIL8bx
	bRVFj+UlaIAUz+A18mXXWBfD0aZ82+MosvRcFLxYySAcTW5tJr9JXIV10xAnTUUyvD30b3R4YlVDj
	6zgyfn954B76ivXxb5duo2Tg6OUlsOQWWGWFzqWt/BrLGypvkgP+QVoSmc3NxjrepJGaTjRKbZ6vS
	IYxTx5/JDbO7Eb4e7c97jF7T2BHbfS/UXLE+wwGgvbN0KGcq39K2M+Q5dxl42X12Nkad/o/Ta+v9l
	3OjfE6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7sx-00000005Ld0-3PQI;
	Tue, 08 Jul 2025 12:57:23 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7oT-00000005L1M-2WcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:52:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D203EC74C3;
	Tue,  8 Jul 2025 14:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751979163; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Jn2Xlp+2akFaaeJ83XxhNPE3FBCl8lq/XPhKJygyha8=;
	b=tXfE8Rx8lljzbmemNB0GyBrPStbNTi6vd+V8QymbyjqJdZaIIrbJxFXHmc4KRbVsVdN+Kr
	uo7F4HM2JJbkHZioS8r269JyWt02r59NUT6P+BqUh4tBAxqZBaKso6h0ySEq/zWozmAvWn
	sfxB+pD+dbsiFf8obYLW85ZUVTQDXFsengQt6+7RQwVGffwFozTUYX4qgBzYJxupwbt3dS
	a/AeeRQMcfkTpaaQBbtBrn/F+VLb8U1acd6YLVa1WDjrCYrjHvFoM5DUAFMe7vowFs9wxQ
	gdDjIBQvuWdy+EBMq3czNZkKbaS3RkZ0YsAPx/FX53ZzU915TgAg3igO1mwAxw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions
Date: Tue,  8 Jul 2025 14:52:16 +0200
Message-ID: <20250708125219.63813-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_055245_782711_303B88A1 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Describe the partitions for the bootloader and the environment
on the SPI NOR.

Signed-off-by: Stoll, Eberhard <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index dcf88f6103466..ab149c40a9cc1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
@@ -28,6 +28,27 @@ flash@0 {
 		compatible = "mxicy,mx25v8035f", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0xf0000>;
+			};
+
+			partition@f0000 {
+				label = "env";
+				reg = <0xf0000 0x8000>;
+			};
+
+			partition@f8000 {
+				label = "env_redundant";
+				reg = <0xf8000 0x8000>;
+			};
+		};
 	};
 };
 
-- 
2.50.0


