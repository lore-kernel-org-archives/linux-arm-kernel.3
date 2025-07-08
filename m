Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CBCC83F12
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HunfPC7TUaBGnQyNIJ7LjqpsqsyTSijzgEYKwmwZIHQ=; b=QhjzY49XWLmwS33ORzcI9Omnuv
	mBhLrA3UAINpmsCq8TQn7fHl2DrxrslFmuEDsg2wkEgnDUzt/UTbLk2b2XpTz1oT83LFvE5dH+r+z
	e23m01s41NFbN3/DKiar9XvqCAZ/jc4RO/h2PSTos6p60uuNuMgSwIviYI6FwEc7jxq47YRazY1Ui
	v2b7rwa6DNeusUtsB85jEr7NksbG30yZAMS78HQNxM/K9kMImQFU2zRX6/fJckNZPtNrK0J7vEFz5
	G3xbAlZmKHwl7+ZJImfjXPsKNOiLh7OG7O/J782Sm2dqbw0cNXG4ufcMB17ozrplt1tI0QHifUjHU
	L0G6YirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7xZ-00000005MId-0EIP;
	Tue, 08 Jul 2025 13:02:09 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7sD-00000005LQJ-1v8z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:56:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30CC2C74C1;
	Tue,  8 Jul 2025 14:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751979394; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HunfPC7TUaBGnQyNIJ7LjqpsqsyTSijzgEYKwmwZIHQ=;
	b=gzme/i39xeeEDCV87FcoyIuCQf+1WHy0Sf6OdeNTJvVv9My29N7bF1yJAb5gA67BV3Myxt
	Jx9xgTP1sJKeNN/f7V8tFDatkda8NYL5mrrrr554f47zWp4f6SNf4GA4P4mz4Yh+9nPoGM
	v4V6uAzq37EJ76U9xDgIHdVhu4deKte/eLAh+aEKLNrwOfC1XwDPQ+oiuuquGIiAGRh79S
	jNJKnUcKT5mwMf76jyQ3B8OJIG5w0xsPxTzXoGw8IUy2nEkz0APpcZFhj5yS3S3uagfgNZ
	X8UG3PMpmwgNbcovmX9pbUyaPe970TXnfN9Dj6BkwuUmtCq6ldEVMm8KLRCj5w==
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
Subject: [PATCH v2 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions
Date: Tue,  8 Jul 2025 14:56:04 +0200
Message-ID: <20250708125607.66113-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_055637_653018_82A74E75 
X-CRM114-Status: UNSURE (   8.46  )
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

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* Fix name order in SoB
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


