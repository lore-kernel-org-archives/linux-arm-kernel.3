Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44907C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baIhgE/N38Lr9mmVCwKX0SXbBt/r7eLwevkwAfS0a18=; b=TTVfUv5ab0m/YXhwvFZuIanbEW
	aqxf/ZvcJyiXZypdPFbNMEcXZEU/r/fGXh6ZSAammNsQesj8B17LqJoR8jyHVb7axFTcjwmZWDlTw
	NCwp0f3Hz0l1LwLTW4jH+K915Xa28UI58Z4YVhe4InAermZJXiHhVGGWkqxXd1+M/Rx3ZyModm/hO
	PMpUKqwIxwwfS6JDTke/QgNzJwsw3nC2c6uEtD49au3Kf6SaUh4i4ZFdeJur9rF5H0M2x30r0cTz6
	hoNapxVdyMrUWdDS83htTke3esq6y+j/JW9UQgzSp897EFFw1UrUiX6ACeJ4YTKtvpkw4g89MqeSw
	wKQWKD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIFv-00000005gpO-3nTR;
	Mon, 16 Jun 2025 22:24:43 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtQ-00000005eAq-2aYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baIhgE/N38Lr9mmVCwKX0SXbBt/r7eLwevkwAfS0a18=;
	b=EqtSoBDAhVsc11UmSbE01aj/EmNvOXXZu5gS7VXEGDDNz4D+TobMSEaQ6RA10sZeDGgKYZ
	MHjLl4dQaiKRo6DjwxEIUpfEIuoZp5+PIkToBDNsZM+GrF/q8HmAhmBiU6LPOiZnjggmKc
	ycVP8hhm8oqBGMXYMLJzYeYOInrwe+4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 9/9] ARM64: xilinx: zynqmp: Add spi-buses property
Date: Mon, 16 Jun 2025 18:00:54 -0400
Message-Id: <20250616220054.3968946-10-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150128_794212_0585EE8F 
X-CRM114-Status: UNSURE (   8.28  )
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

Add the spi-buses property to the ZynqMP devicetrees. This is pretty
simple, since all boards use the lower bus.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts     | 1 +
 10 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
index bfa7ea6b9224..3d3cb656f38c 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
@@ -132,6 +132,7 @@ &qspi { /* MIO 0-5 - U143 */
 	spi_flash: flash@0 { /* MT25QU512A */
 		compatible = "jedec,spi-nor"; /* 64MB */
 		reg = <0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <40000000>; /* 40MHz */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
index 3dec57cf18be..f550ccea58cd 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
@@ -45,6 +45,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>; /* FIXME also DUAL configuration possible */
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
index 6aff22d43361..4ad5efdd40cd 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
@@ -359,6 +359,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
index 6ec1d9813973..26c33685b320 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
@@ -177,6 +177,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>; /* also DUAL configuration possible */
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index 7e26489a1539..aa4ed3a082fa 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -958,6 +958,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>; /* FIXME also DUAL configuration possible */
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index eb2090673ec1..acbe0758a31b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -444,6 +444,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 4694d0a841f1..9b0324acbeec 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -456,6 +456,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 7beedd730f94..fd983f4c416d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -964,6 +964,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>; /* FIXME also DUAL configuration possible */
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index b67ff7ecf3c3..af225413a274 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -794,6 +794,7 @@ flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>; /* FIXME also DUAL configuration possible */
 		spi-max-frequency = <108000000>; /* Based on DC1 spec */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
index a38c2baeba6c..65790e341c15 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
@@ -47,6 +47,7 @@ &qspi {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor";
 		reg = <0x0>;
+		spi-buses = <0>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>;
-- 
2.35.1.1320.gc452695387.dirty


