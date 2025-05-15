Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFB4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vW4R+iIfQHX6LcemZgKde5LfX3QzRiBgsDPmmBk7yGM=; b=RhBZP5VG1v91lB+29MBmn8JFHI
	w7XOLTo+02s1i/kqDl11ZzuUAm6uWLlCz2Rc4RhV7lbptmLnJfzpfAsOdKbH/z6REmptxIXShxB0a
	pSQtlvpLrdNgNM85asViE8lOB03jDEK1dx+Qqsir2tyQj7rQanGFkdKEmhL5hcaYzLP+ZpZVpl2YZ
	bZtnZzqVsua3DZdw/ZLhIxlLxh/ysXJR4mEiTIrUasFpdhyAUFc6OFHFHhNMFar4Exyg97vCjSFN8
	kPERY1lbvw3/OhVrvORHfbCgm9Tmm1Mmjixn1JYKvesyu53qeg9mVw6bEsASHopbmNNtf4j3IBNCy
	o+0wybiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFW78-00000000Kb6-2X2r;
	Thu, 15 May 2025 10:46:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVuI-00000000IsJ-1c1W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 10:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747305222; x=1778841222;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jOy+gdB5snTg+AWaYBwU4zrEGtaSgqQCzCFFbsWkaZ4=;
  b=Uo7oZ1DDbisXpRvmOk/+li6djIfJtxaevIZCVGy91hP28IGPRWN/ZpoN
   Hd5vXCO2mJEkowoM2WGVmyOkdddYHzwmst7lTOezdPjO1klU9ryDhvo3E
   gI60YCVCH0bK9oCllLplojhgU+ueHom0bRPljeu6aNC1gD+svjr0xfE+5
   /CdjEdSzyJAv2gUpubGGsPUb2p0/uYpo54QPrA4BR7JaTM9XLfshPxPW1
   2X3LY+9ojSPCBwxl36M00sNaDsj+0pW8O7JmAiPfL5GYuoN9nxgeHfSvA
   J9HkZ+7hLAVTXqmvXGEU55A+GmjxmZhcPBuNrmAnrtC4l45PQF2KP660c
   g==;
X-CSE-ConnectionGUID: YDYKtXNcQOipD744zTQ15A==
X-CSE-MsgGUID: ZMEcAudjRRmAFgfZqoRjuQ==
X-IronPort-AV: E=Sophos;i="6.15,290,1739862000"; 
   d="scan'208";a="209126771"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2025 03:33:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 15 May 2025 03:33:08 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 15 May 2025 03:33:04 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH] ARM: dts: microchip: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Thu, 15 May 2025 16:02:51 +0530
Message-ID: <20250515103251.210468-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_033342_598975_A46BCB59 
X-CRM114-Status: UNSURE (   9.27  )
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

The naming scheme for delay properties includes "delay" in the name,
so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns to keep
that consistent.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts        | 2 +-
 arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi   | 2 +-
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
index cdc56b53299d..c1ff3248bd8f 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
@@ -609,7 +609,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
index 8ac85dac5a96..13c28e92b17e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
@@ -44,7 +44,7 @@ flash@0 {
 					compatible = "jedec,spi-nor";
 					reg = <0>;
 					spi-max-frequency = <104000000>;
-					spi-cs-setup-ns = <7>;
+					spi-cs-setup-delay-ns = <7>;
 					spi-tx-bus-width = <4>;
 					spi-rx-bus-width = <4>;
 					m25p,fast-read;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b3..9543214adc9f 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		m25p,fast-read;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
index 9fa6f1395aa6..fbae6a9af6c3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
@@ -714,7 +714,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1


