Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89769C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 06:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPr66/zoW/Ul/rXlgG2lDYhfvi+t7ldJNuTap5nuaxU=; b=2kPmrVtEce+9g2jpDf6AkSlR5X
	e6ndIVUxu14p1ZtSjUdnDBiSTGC2gbE7Bbjvvxa7wfM0ZySTY6kos/vYD1oEBz77PskEP9GMrewoo
	gkZHyWdzxOPjmL75DgEadxvyDTmmrXigcZLPsTK/kfHQpZcSZNx42nv9y6MsRy7wdstjGEjWhKP4o
	a22xR5PDl+TCOioCXBkLaVEVictKrFWD/f93i7MbHDvptBcOM2QOcfcunkdD0gvFFrzYVdUwaoAaF
	+j7BOZdHeGjcBbD8mvouSCn8GlqrX69OaXE9U4ngYX1PwVFkWofR7AjybgbwlFP3EQagGEpwGS+0Q
	mGw0v2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud1EA-0000000DxRf-1j4C;
	Sat, 19 Jul 2025 06:39:22 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud19T-0000000DxE5-3OYm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 06:34:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 526971026E9A1;
	Sat, 19 Jul 2025 08:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1752906870; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YPr66/zoW/Ul/rXlgG2lDYhfvi+t7ldJNuTap5nuaxU=;
	b=hp6+YCbjFFY2U5Gwhax9VTCclYxIMm0AKxAahjJorZwCA7MTaTgi0KmfOFLpukgPfr4iM4
	ABAEcvMXuiiYX44WKPFY3Gq267xJKc1n+8Zqg0+BlYS7pBDsDBqMPDvEwbfY6dIJhiacS5
	8e590CPgoRwpnyzkTDCXMt79ux5JV0F2GxzI1uGuLeI0cktXiFekcc82PIrzynzrwWoM0u
	CLR29A8d8+inoIGGu5HyLhPCCA2rzFWvd68lZo4FbNY2UxHjEdTMvzytZe6O7MvAfby1J4
	9emCzF6cnbdWFqHiLK4UNcspLQkKFqWBiqvzmmNK/v656z7rfwNaU8I6swLWjA==
From: Heiko Schocher <hs@denx.de>
To: linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Schocher <hs@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/3] arm64: dts: imx8mp: add ABB spi sensors
Date: Sat, 19 Jul 2025 08:33:54 +0200
Message-Id: <20250719063355.73111-4-hs@denx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250719063355.73111-1-hs@denx.de>
References: <20250719063355.73111-1-hs@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_233431_995470_D8C8CC59 
X-CRM114-Status: UNSURE (   9.23  )
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

add for the spi busses the ABB sensor trivial compatible
entry, so they can be accessed from userspace.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 .../freescale/imx8mp-aristainetos3-helios.dts | 28 +++++++++++++++++++
 .../imx8mp-aristainetos3-proton2s.dts         | 22 +++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
index a4e649a8239b..b6ba6229acd7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
@@ -52,6 +52,34 @@
 	};
 };
 
+&ecspi1 {
+	spidev0_0: spi@0 {
+		reg = <0>;
+		compatible = "abb,spi-sensor";
+		spi-max-frequency = <54000000>;
+	};
+
+	spidev0_1: spi@1 {
+		compatible = "abb,spi-sensor";
+		reg = <1>;
+		spi-max-frequency = <54000000>;
+	};
+};
+
+&ecspi2 {
+	spidev1_0: spi@0 {
+		reg = <0>;
+		compatible = "abb,spi-sensor";
+		spi-max-frequency = <54000000>;
+	};
+
+	spidev1_1: spi@1 {
+		reg = <1>;
+		compatible = "abb,spi-sensor";
+		spi-max-frequency = <54000000>;
+	};
+};
+
 &ethphy1 {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
index 2a736dbe96b4..e804688b2e74 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
@@ -28,6 +28,28 @@
 	};
 };
 
+&ecspi1 {
+	spidev0_0: spi@0 {
+		compatible = "abb,spi-sensor";
+		reg = <0>;
+		spi-max-frequency = <54000000>;
+	};
+
+	spidev0_1: spi@1 {
+		compatible = "abb,spi-sensor";
+		reg = <1>;
+		spi-max-frequency = <54000000>;
+	};
+};
+
+&ecspi2 {
+	spidev1_0: spi@0 {
+		compatible = "abb,spi-sensor";
+		reg = <0>;
+		spi-max-frequency = <54000000>;
+	};
+};
+
 &ethphy1 {
 	status = "disabled";
 };
-- 
2.20.1


