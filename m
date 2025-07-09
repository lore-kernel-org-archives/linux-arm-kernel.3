Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E10C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/x0LQU6h5m+accG5yRCnevzY7hAOL4oLP0QEZKYMc4=; b=Zjh+NibvO4S7h37rP2traSHMhZ
	6JnPRjbk7zLmRPIlY8xAV6Ez/jrKSAWoMx09I85/IWVd/OQiZ5R1caWuHpXa7uZKeAVVUf2Uqm5b9
	E0ZACyYkzYvZqBOj4gREw7pJcIYWyFSM8PyADXrWCzZ3Q+pBaYiQ5Vw7DO5ynp8V1MUGg4QqkuNfs
	bFAVohAfi7tCRjFoJ4AuEa+6o5ie/wEh8x9AKrtfi76NQsC7FAGhaVy1/7OgchtYnpJEj8+3P8qUQ
	v3I4qIVDaGMPgn3Cb3EfCHouZfgoa/K6T1QYulZdeqZ9pIZlujhWmTezYM07QmK2GFa4OGtpl0iie
	f9eOY07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQDc-00000007yYN-3fx2;
	Wed, 09 Jul 2025 08:31:56 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP2f-00000007mob-0sk5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:16:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30DABC74C5;
	Wed,  9 Jul 2025 09:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752045390; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5/x0LQU6h5m+accG5yRCnevzY7hAOL4oLP0QEZKYMc4=;
	b=FSOuUeBGXiKRmEDs3WIpeRPvwFjwwQJhK5SDrMKnAiEVTQta6jmM0uGuXtnGzWk7nR4C1B
	rBBZLOPkI9IX2l93q3F0YAfOe4sSyfH9ppMMPKCRONh8BdhO4/tEqjmg6GUmOTOtPSUaIx
	Ui4x8hcW7c+t9E0gmKCzctIjkmS/KvzGiXbkevLhLSBZgy9tXEqPU61xbYgGJ2DEo0m7HT
	qFRv2gULnyo8eHr2+zr+A/WGmZ59xOKoddgg+UpTI+Dh44NDU6afZRvy2GiGMpHmN3Fel4
	ezMPeHmF0D6FphL90pTFED4r57B2yKS4S8dTK8igsxppyISpj8uDAqRKOYTT1Q==
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
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions
Date: Wed,  9 Jul 2025 09:15:54 +0200
Message-ID: <20250709071557.20602-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_001633_390106_8505B86E 
X-CRM114-Status: GOOD (  10.86  )
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
on the SPI NOR. While at it also fix the order of the properties
in the flash node itself.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v3:
* Fix reg/label order
* Fix reg order in flash node
Changes for v2:
* Fix name order in SoB
---
 .../dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index dcf88f6103466..779723b04575a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
@@ -26,8 +26,29 @@ &ecspi2 {
 
 	flash@0 {
 		compatible = "mxicy,mx25v8035f", "jedec,spi-nor";
-		spi-max-frequency = <50000000>;
 		reg = <0>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0xf0000>;
+				label = "u-boot";
+			};
+
+			partition@f0000 {
+				reg = <0xf0000 0x8000>;
+				label = "env";
+			};
+
+			partition@f8000 {
+				reg = <0xf8000 0x8000>;
+				label = "env_redundant";
+			};
+		};
 	};
 };
 
-- 
2.50.0


