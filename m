Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7003AEC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyLSBUdLQsHmMn5pYSDDy8Yht8+ha7IMwuXsWxmTnVI=; b=FxVZk8bfCPsjXPTW+R+cSqPm1X
	gUoYb6ITKDqObC3KqMCOWN4sxkK6LG2r5OuA6T6odjT1xDVsBwNKJ1MwcSo3PCaBIQyrO6JlQH8mZ
	Fi8IHhl50yD9MzSaimF4+4Btj7mFsrdOC65yzyPS/QNh5IfMxr7/hLBizlk6+/kiRRvLTPvWcLPEO
	sQeBzy5WNgORC3sxLosbsnKgnO6ZnUcNuoOEhEK1KFATj7bjMmlhE+W0Sm4QEvvu2u51OfZ5FGfPM
	uqBbh21k2vxAB3Xsv/nFA7jhc/FIW/OI6XUPWH9TY1imZHK6CP4u6yt8OIoA7FaCUPN9CWzf/a/O1
	YEMvcncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3J-0000000GQYF-0w3v;
	Mon, 23 Mar 2026 09:58:29 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3F-0000000GQVh-0kZQ;
	Mon, 23 Mar 2026 09:58:26 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774259898;
	bh=4xPQlUAwrCs4HHPO7VRNhW2hQSK0zCMvzD90tkk4ojk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BWzXM/zyGVFZPhwDA/eJZf1AN4a4AXPLq4O9B1JAXEP/3wkO4+fOkhVsycMEcPy9h
	 Cm70lqdrzh88FZ6latMiri1IxBRBKzLJcOlevr6q/VjbXEYZV5qMCuhv4LRXsu1H07
	 DNv7WTM4KNplGV3F4N/ExbTZj2JEWrULQH2obNDU=
Date: Mon, 23 Mar 2026 10:55:26 +0100
Subject: [PATCH v3 1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO
 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-emmc-t7-vim4-v3-1-5159d90a984c@aliel.fr>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1774259894; l=2892;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=4xPQlUAwrCs4HHPO7VRNhW2hQSK0zCMvzD90tkk4ojk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCDZevpmOhr4WVcb80EqQBuMVzASEcHojkoed4+BSjbqdyzAhWeKhBXz24/lsgTqytmFLOp33nL
 IJy9QOiiaUQk=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025825_660483_2D3CB8BC 
X-CRM114-Status: UNSURE (   7.04  )
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
index 6510068bcff92..ac8de8e9b8010 100644
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
+				emmc_clk_gate_pins: emmc_clk_gate {
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
+				sdcard_clk_gate_pins: sdcard_clk_gate {
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
+				sdio_clk_gate_pins: sdio_clk_gate {
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


