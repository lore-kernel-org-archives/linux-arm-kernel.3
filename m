Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F9FFEA835
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iot75drvtZv9mpLKGarZbzebCr335Wb3vC8GBljYVvY=; b=FaSgInOswhzjz+rhAhLgmRpsSs
	FSX2b/k9LPSDOY5nkA8ukRbxeEL8DtpLvZgNLLoRIH9an0Mmud+jvH9GydB0pKp6Y78PJoQeduZuE
	sA03fuLfcmx3MQU3X2SykU4qL15WFTql7hAlhuQLn0fcHQcE8lhEO/vHNjtuzcdMbqWwcKgRPNz7l
	liqkBl+ChcnRusy2Q7HfeQALMi12AhhnNHHAyrOD5KUcROTshkaUniDKNvH76Jfb42Axj89H79mMD
	MEdNwiATytPRjanEAOIrgDrvVr1yz5ktM/zt0feLjbHH2W8H88bzACr/HaOj4oCA8fiVLFJ9G/ZYH
	LigJPu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KO6-000000031lv-2GwX;
	Wed, 25 Mar 2026 09:18:54 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KO2-000000031iX-2nll;
	Wed, 25 Mar 2026 09:18:52 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774430327;
	bh=wu/b79MKo6jI6RaveGAeQqWZhXTfTOC6UghGktEKf1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P7p3nOywkhLItWRISSEl6auxw/Ol/OVmfR6SbkBiA/J4+lBN8ksXRzv4WOobA6pEN
	 fsAlL/pCoSx2nHy3D3TYX1J9jkUf7vg2ib0UW5NKFh4YpNP9dWDUJPQYY+J4g5k+Yx
	 cpENCddvDsHVcKZabN4aVo+0KwwF5ZlUYMZ4z2wk=
Date: Wed, 25 Mar 2026 10:15:19 +0100
Subject: [PATCH v4 1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO
 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-emmc-t7-vim4-v4-1-44c7b4a5e459@aliel.fr>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1774430323; l=2892;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=wu/b79MKo6jI6RaveGAeQqWZhXTfTOC6UghGktEKf1k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPkmgpDa0m8GxQ8OFJhdlzh5ok2WolXHpWSIYqA8wBwsfT9UK6yTSsh78Hvxt2tGV5MdfGoUhvv
 lX7X/5/yFhA8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_021851_152574_2F684808 
X-CRM114-Status: UNSURE (   7.26  )
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

These pinctrl nodes are required by the eMMC, SD card and SDIO drivers
to configure pin muxing at runtime.

- eMMC: control, 4-bit/8-bit data, data strobe and clock gate pins
- SD card: data, clock, command and clock gate pins
- SDIO: data, clock, command and clock gate pins

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 98 +++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6510068bcff92..016b5429c8d1b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,104 @@ gpio: bank@4000 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&periphs_pinctrl 0 0 157>;
 				};
+
+				emmc_ctrl_pins: emmc-ctrl {
+					mux-0 {
+						groups = "emmc_cmd";
+						function = "emmc";
+						bias-pull-up;
+					};
+
+					mux-1 {
+						groups = "emmc_clk";
+						function = "emmc";
+						bias-disable;
+					};
+				};
+
+				emmc_data_4b_pins: emmc-data-4b {
+					mux-0 {
+						groups = "emmc_nand_d0",
+							 "emmc_nand_d1",
+							 "emmc_nand_d2",
+							 "emmc_nand_d3";
+						function = "emmc";
+						bias-pull-up;
+					};
+				};
+
+				emmc_data_8b_pins: emmc-data-8b {
+					mux-0 {
+						groups = "emmc_nand_d0",
+							 "emmc_nand_d1",
+							 "emmc_nand_d2",
+							 "emmc_nand_d3",
+							 "emmc_nand_d4",
+							 "emmc_nand_d5",
+							 "emmc_nand_d6",
+							 "emmc_nand_d7";
+						function = "emmc";
+						bias-pull-up;
+					};
+				};
+
+				emmc_ds_pins: emmc-ds {
+					mux {
+						groups = "emmc_nand_ds";
+						function = "emmc";
+						bias-pull-down;
+					};
+				};
+
+				emmc_clk_gate_pins: emmc-clk-gate {
+					mux {
+						groups = "GPIOB_8";
+						function = "gpio_periphs";
+						bias-pull-down;
+					};
+				};
+
+				sdcard_pins: sdcard {
+					mux {
+						groups = "sdcard_d0",
+							 "sdcard_d1",
+							 "sdcard_d2",
+							 "sdcard_d3",
+							 "sdcard_clk",
+							 "sdcard_cmd";
+						function = "sdcard";
+						bias-pull-up;
+					};
+				};
+
+				sdcard_clk_gate_pins: sdcard-clk-gate {
+					mux {
+						groups = "GPIOC_4";
+						function = "gpio_periphs";
+						bias-pull-down;
+					};
+				};
+
+				sdio_pins: sdio {
+					mux-0 {
+						groups = "sdio_d0",
+							 "sdio_d1",
+							 "sdio_d2",
+							 "sdio_d3",
+							 "sdio_clk",
+							 "sdio_cmd";
+						function = "sdio";
+						bias-pull-up;
+					};
+				};
+
+				sdio_clk_gate_pins: sdio-clk-gate {
+					mux {
+						groups = "GPIOX_4";
+						function = "gpio_periphs";
+						bias-pull-up;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {

-- 
2.49.0


