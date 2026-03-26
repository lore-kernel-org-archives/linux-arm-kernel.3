Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1744106F31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWCeDAN3fsPFyKbIjdtx+KEu3FAeR06bCIxVUi1TOHY=; b=qtI0ZT8HtDhyosuqgv2mw5a91H
	RU5iNuRjQm0TOA9bcNqm9fqcwxEBq37O4t3fgS/FDKUi/yVETcRmUagQu/qGoWEPec5bN1lxujruV
	toPxHZFZQB98x2m/Phk4sToe4r0oyMZfBCCGVmnfvPev1WMhh3UVhenyraXbOfg427nmSx5gz7OM0
	MznI+paz7o87mPhBp8ApdPg57zwk2mrCcB4UUPkuqZQYqkFYEFrPy2A3CB8178YyIUPK2PTUTMui2
	IXFjosMNlg+E+1ZhAVOjTFfIqSFKrx2jlPvgjqFSDknjFqOBGW4JyLrDpR0kXrACJUoM7VeTuTA0A
	/Go28YlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXj-00000005DAo-2Zpc;
	Thu, 26 Mar 2026 10:02:23 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXV-00000005Cu8-2fBB;
	Thu, 26 Mar 2026 10:02:13 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519320;
	bh=IIczfRRn8m2Koe8q+bufp05ljlfqGGQ51x/BzYCoz40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZE/90QDAcYT6XYrHUof+zbGZ2FWkygRoA/C16zacprIBp1KTgECfUeCoKR1Y/NwI0
	 Sw4/TAe06dsX9+mQS+ZyGeQX/m5C3SJIF1rGZDOLWFlu0scFfndrsQ/3inWx3WY1bD
	 vvE0GLZWGCJg8X6gWydzzHE/B/ZHuFs5Tk88RIkw=
Date: Thu, 26 Mar 2026 10:59:18 +0100
Subject: [PATCH v5 7/9] arm64: dts: amlogic: t7: khadas-vim4: Add SDIO
 power sequence and WiFi clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-emmc-t7-vim4-v5-7-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519313; l=1501;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=IIczfRRn8m2Koe8q+bufp05ljlfqGGQ51x/BzYCoz40=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO29BFkTR4PHNgOSc2RtXXhzWb6qmHwFO13UQteeX26kjeF6ORoJ7KdoFuLy9l4BjIKo7bfBnTx
 a13z19FsS/QQ=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030209_827112_B4AB92B0 
X-CRM114-Status: UNSURE (   7.11  )
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

Add the SDIO power sequence node using mmc-pwrseq-simple and a
32.768kHz PWM-based clock required by the Wi-Fi module.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 2450084d37642..770f06b0b16c7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -67,6 +67,15 @@ sd_3v3: regulator-sdcard-3v3 {
 		regulator-always-on;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <500>;
+		power-off-delay-us = <200000>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
 	vcc5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC5V";
@@ -135,6 +144,19 @@ vddio_c: regulator-gpio-c {
 		states = <1800000 1
 			  3300000 0>;
 	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+			pwms = <&pwm_ab 0 30518 0>;
+	};
+};
+
+&pwm_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_a_pins>;
+	pinctrl-names = "default";
 };
 
 &uart_a {

-- 
2.49.0


