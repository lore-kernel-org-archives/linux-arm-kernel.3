Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC9CE63F1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHwBz970zs5qb1/XejnDEiS26cAJW6/Nd4ijZMlleyA=; b=GxDAzwDQZwvqMq2xBy1aru/fKh
	M30y7K3QY+qR7CpInKBwTJul3r1KeL+WTCoXnM9yaKvqP9kIalWuYq0k2go2Y+2vXfJui65XDEfHg
	R2AdGVn6+/1OR4VHMq2SL36tZ2G8kAZbDKapT2ASV1eQS1V2+hBI9rn/G3lN4XtzkX8n5LXOvHJqA
	3ojPcsStrDKxEQg62UFhFno8cEVKtoxw/Of+myqIcoRYmZefOUgGJHnbyP+Z13x4e2eLF/ZPLD+Oj
	6ZJncyE1U+XHel9V4vD83np0UWjCt0KAAEX6gXi3zDL0p3ILtBJoEIJH+LFGRtffljJWokKxa59te
	osmfPsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0Y-00000005pVu-1lkL;
	Mon, 16 Feb 2026 01:02:38 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0U-00000005pUK-49GO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 01:02:36 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2ba94dbf739so2712622eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 17:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771203754; x=1771808554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHwBz970zs5qb1/XejnDEiS26cAJW6/Nd4ijZMlleyA=;
        b=XF87S3zm40HHVQRKnvcABNh86dWpJJWC+jUOW1k3wYBo7zNCpcqqs8CJOSL2+KOSWn
         MzQMuuFeN8PAMdcOhRTtogzRzmDEGdNlT310UvsuhALWrAlhAL1KRb3CqjEoKI20XoPu
         GpnC5YGHrKkMmw6U5HM6j3rkJSWqpUMU2FK7BEdMa3PW8Aca0Jn11933/Y4HfOUiOvIi
         pgxbuYxm1pZl0YEeuHDzVCy4Z0Qd/1aAI2vg0otbcv+FUYg7qyvSuKvMaoWnmGROGJmM
         BLwsk4kOG/5LPIXyaKUXoQwpvCK7iRrWvYpUneRaYYS8lXqldI0iO/HBfP8Bt5Bj7Nud
         5yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771203754; x=1771808554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHwBz970zs5qb1/XejnDEiS26cAJW6/Nd4ijZMlleyA=;
        b=k9wbCWqJAA3AL5s3T/WKyBc58vLxA6ji6HND8aE3zEdgK4njsc9lcDdlAZ8BCP6OAn
         U7nbKpHeQwS/kvn/b35L9lXuYoexq4+S17Md+SOjKML4SfjjFi06iQaG1qNi/Yerh15E
         eeItXteXKVcxUZBVbghyS8Gf2bo2G3t/bWH/otiMKKycLux8BIMmaAdo2SgPMWokpRQH
         fcfHM80GUkxK0m5R6y5GqW+6VQMuYhPqkdW5fOYaq6ZGOBQ4n+lR5UNzzXd7eOarRNKO
         fgtxqOv+GVqJ7sLtsLPgPUXCnmAIMziSChFgN79DfjysYQEPp5XikMRzl/u82H8hSA+0
         ntqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRGlykCVEDl2aRWUblf0ijPyBFV08Yj3RVuv6ZnSTFr9gez5A/9uB+OS0P+Iuw0h2K9crQDtlXN/A4UqnVbSNc@lists.infradead.org
X-Gm-Message-State: AOJu0YyW5HBp3XlJiVOXrEvzoN2dvbI8MvLOm3i2OncSCYTZORnRXpxg
	4dy4Do7ZFuMBrUEtup89q+/lVh/+jfvUOLob4gFGjbUc0EryjW6a7Ywm
X-Gm-Gg: AZuq6aJ3RfVzuG21A/kBAlM57N3l2FoDr5zXW6yHl6WyCjwGWO/l3sZL1QdiJWYm16d
	xcHqu30dW22T1WnJZa/Iab5XMaTnw6aT5/46HnpGAohh8+HosNVeHMvu/r7CL4Qa4PXuip34OuN
	EpOsqh/jm44Ne6pQkZOcpqGiXGdvnF6+++/L/a4bf1Y4ERjtnyhre95hGVK+8PzSVJ8S80FxTQF
	5wYn+3xJ7jCHdNEWg7g8S//9J8NMeoA8f/5YfZo9N4gKC7jVe/bzhjUFLEFO+95XPqvY8H5UnAf
	+wbDgbFzuGwaxthxUCSLSgfPgD/69ufPALv1nFvOheJju0cbOKQVAticd7X2HYDEPCrHs6+PNRq
	UQjVhiYUuH18ucL0SinNNPOVm5r/cLe3faf2kv5pUgKGIeEXrReNP3pgHDbQwJOXuhn3WTNHXOs
	n0Euur2YYMeL1tSyPNmWEtioGGmFhrYUuX2AIQczGogkIoiptRQGvGTY45sCk3vbg6Ew==
X-Received: by 2002:a05:7300:fb83:b0:2ba:77a2:2589 with SMTP id 5a478bee46e88-2babc45568bmr4162198eec.25.1771203753752;
        Sun, 15 Feb 2026 17:02:33 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4ffb:cd7:e7e8:c526:2074])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cadb25sm9158160c88.10.2026.02.15.17.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 17:02:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v5 2/4] ARM: dts: rockchip: Add support for RV1103B
Date: Sun, 15 Feb 2026 22:02:17 -0300
Message-Id: <20260216010219.2131484-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260216010219.2131484-1-festevam@gmail.com>
References: <20260216010219.2131484-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_170235_084921_1D086BD1 
X-CRM114-Status: GOOD (  15.16  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add the initial RV1103B devicetree.

Based on the 5.10 Rockchip vendor kernel.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
The <dt-bindings/clock/rockchip,rv1103b-cru.h> header comes from another
series:

https://lore.kernel.org/linux-devicetree/20260210022620.172570-1-festevam@gmail.com/

Maybe Heiko could apply the clock series as well?

Changes since v4:
- None.

 .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 816 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 257 ++++++
 2 files changed, 1073 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi

diff --git a/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
new file mode 100644
index 000000000000..539d4d9510c1
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
@@ -0,0 +1,816 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
+ */
+
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <arm64/rockchip/rockchip-pinconf.dtsi>
+
+&pinctrl {
+	cam-clk0 {
+		/omit-if-no-ref/
+		cam_clk0: cam-clk0 {
+			rockchip,pins =
+				/* cam_clk0_out */
+				<1 RK_PB5 1 &pcfg_pull_none>;
+		};
+	};
+
+	cam-clk1 {
+		/omit-if-no-ref/
+		cam_clk1: cam-clk1 {
+			rockchip,pins =
+				/* cam_clk1_out */
+				<1 RK_PB6 1 &pcfg_pull_none>;
+		};
+	};
+
+	cam-spi {
+		/omit-if-no-ref/
+		cam_spi_bus4: cam-spi-bus4 {
+			rockchip,pins =
+				/* cam_spi_d0 */
+				<0 RK_PB5 4 &pcfg_pull_up_drv_level_2>,
+				/* cam_spi_d1 */
+				<0 RK_PB2 4 &pcfg_pull_up_drv_level_2>,
+				/* cam_spi_d2 */
+				<0 RK_PB1 4 &pcfg_pull_up_drv_level_2>,
+				/* cam_spi_d3 */
+				<0 RK_PB0 4 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		cam_spi_clk: cam-spi-clk {
+			rockchip,pins =
+				/* cam_spi_clk */
+				<0 RK_PB4 4 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		cam_spi_cs0n: cam-spi-cs0n {
+			rockchip,pins =
+				/* cam_spi_cs0n */
+				<0 RK_PB3 4 &pcfg_pull_none>;
+		};
+	};
+
+	clk {
+		/omit-if-no-ref/
+		clk_32k: clk-32k {
+			rockchip,pins =
+				/* clk_32k */
+				<0 RK_PA0 2 &pcfg_pull_none>;
+		};
+	};
+
+	clk-24m {
+		/omit-if-no-ref/
+		clk_24m_out: clk-24m-out {
+			rockchip,pins =
+				/* clk_24m_out */
+				<0 RK_PA0 3 &pcfg_pull_none>;
+		};
+	};
+
+	cpu {
+		/omit-if-no-ref/
+		cpu: cpu {
+			rockchip,pins =
+				/* cpu_avs */
+				<0 RK_PA1 2 &pcfg_pull_none>;
+		};
+	};
+
+	emmc {
+		/omit-if-no-ref/
+		emmc_bus4: emmc-bus4 {
+			rockchip,pins =
+				/* emmc_d0 */
+				<1 RK_PA1 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d1 */
+				<1 RK_PA2 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d2 */
+				<1 RK_PA3 1 &pcfg_pull_up_drv_level_2>,
+				/* emmc_d3 */
+				<1 RK_PA0 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		emmc_clk: emmc-clk {
+			rockchip,pins =
+				/* emmc_clk */
+				<1 RK_PA4 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		emmc_cmd: emmc-cmd {
+			rockchip,pins =
+				/* emmc_cmd */
+				<1 RK_PA5 1 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	fspi {
+		/omit-if-no-ref/
+		fspi_bus4: fspi-bus4 {
+			rockchip,pins =
+				/* fspi_d0 */
+				<1 RK_PA1 2 &pcfg_pull_none>,
+				/* fspi_d1 */
+				<1 RK_PA2 2 &pcfg_pull_none>,
+				/* fspi_d2 */
+				<1 RK_PA3 2 &pcfg_pull_none>,
+				/* fspi_d3 */
+				<1 RK_PA0 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		fspi_cs0: fspi-cs0 {
+			rockchip,pins =
+				/* fspi_cs0n */
+				<1 RK_PA5 2 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		fspi_clk: fspi-clk {
+			rockchip,pins =
+				/* fspi_clk */
+				<1 RK_PA4 2 &pcfg_pull_none>;
+		};
+	};
+
+	i2c0 {
+		/omit-if-no-ref/
+		i2c0m0_xfer: i2c0m0-xfer {
+			rockchip,pins =
+				/* i2c0_scl_m0 */
+				<0 RK_PA5 3 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m0 */
+				<0 RK_PA6 3 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c0m1_xfer: i2c0m1-xfer {
+			rockchip,pins =
+				/* i2c0_scl_m1 */
+				<1 RK_PB4 5 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m1 */
+				<1 RK_PB3 5 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c0m2_xfer: i2c0m2-xfer {
+			rockchip,pins =
+				/* i2c0_scl_m2 */
+				<1 RK_PB5 2 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m2 */
+				<1 RK_PB6 2 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c1 {
+		/omit-if-no-ref/
+		i2c1m0_xfer: i2c1m0-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m0 */
+				<0 RK_PB0 1 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m0 */
+				<0 RK_PB1 1 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c1m1_xfer: i2c1m1-xfer {
+			rockchip,pins =
+				/* i2c1_scl_m1 */
+				<2 RK_PA4 4 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m1 */
+				<2 RK_PA5 4 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c2 {
+		/omit-if-no-ref/
+		i2c2m0_xfer: i2c2m0-xfer {
+			rockchip,pins =
+				/* i2c2_scl_m0 */
+				<0 RK_PB2 1 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m0 */
+				<0 RK_PB3 1 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c2m1_xfer: i2c2m1-xfer {
+			rockchip,pins =
+				/* i2c2_scl_m1 */
+				<2 RK_PA6 4 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m1 */
+				<2 RK_PA7 4 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c3 {
+		/omit-if-no-ref/
+		i2c3m0_xfer: i2c3m0-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m0 */
+				<0 RK_PB4 1 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m0 */
+				<0 RK_PB5 1 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c3m1_xfer: i2c3m1-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m1 */
+				<2 RK_PB3 4 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m1 */
+				<2 RK_PB2 4 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c4 {
+		/omit-if-no-ref/
+		i2c4m0_xfer: i2c4m0-xfer {
+			rockchip,pins =
+				/* i2c4_scl_m0 */
+				<2 RK_PB0 4 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m0 */
+				<2 RK_PB1 4 &pcfg_pull_none_smt>;
+		};
+
+		/omit-if-no-ref/
+		i2c4m1_xfer: i2c4m1-xfer {
+			rockchip,pins =
+				/* i2c4_scl_m1 */
+				<1 RK_PB7 2 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m1 */
+				<1 RK_PC0 2 &pcfg_pull_none_smt>;
+		};
+	};
+
+	jtag {
+		/omit-if-no-ref/
+		jtagm0: jtagm0 {
+			rockchip,pins =
+				/* jtag_tck_m0 */
+				<0 RK_PA5 5 &pcfg_pull_none>,
+				/* jtag_tms_m0 */
+				<0 RK_PA6 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		jtagm1: jtagm1 {
+			rockchip,pins =
+				/* jtag_tck_m1 */
+				<0 RK_PB4 3 &pcfg_pull_none>,
+				/* jtag_tms_m1 */
+				<0 RK_PB5 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		jtagm2: jtagm2 {
+			rockchip,pins =
+				/* jtag_tck_m2 */
+				<1 RK_PB4 3 &pcfg_pull_none>,
+				/* jtag_tms_m2 */
+				<1 RK_PB3 3 &pcfg_pull_none>;
+		};
+	};
+
+	psram-spi {
+		/omit-if-no-ref/
+		psram_spi_bus4: psram-spi-bus4 {
+			rockchip,pins =
+				/* psram_spi_d0 */
+				<0 RK_PA2 4 &pcfg_pull_none>,
+				/* psram_spi_d1 */
+				<0 RK_PA1 4 &pcfg_pull_none>,
+				/* psram_spi_d2 */
+				<0 RK_PA5 4 &pcfg_pull_none>,
+				/* psram_spi_d3 */
+				<0 RK_PA6 4 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		psram_spi_clk: psram-spi-clk {
+			rockchip,pins =
+				/* psram_spi_clk */
+				<0 RK_PA0 4 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		psram_spi_cs0n: psram-spi-cs0n {
+			rockchip,pins =
+				/* psram_spi_cs0n */
+				<0 RK_PA4 4 &pcfg_pull_none>;
+		};
+	};
+
+	pwm0 {
+		/omit-if-no-ref/
+		pwm0m0_ch0: pwm0m0-ch0 {
+			rockchip,pins =
+				/* pwm0m0_ch0 */
+				<0 RK_PA1 1 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m0_ch1: pwm0m0-ch1 {
+			rockchip,pins =
+				/* pwm0m0_ch1 */
+				<0 RK_PA5 2 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m0_ch2: pwm0m0-ch2 {
+			rockchip,pins =
+				/* pwm0m0_ch2 */
+				<0 RK_PA6 2 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m0_ch3: pwm0m0-ch3 {
+			rockchip,pins =
+				/* pwm0m0_ch3 */
+				<0 RK_PA2 1 &pcfg_pull_none_drv_level_0>;
+		};
+
+		/omit-if-no-ref/
+		pwm0m1_ch0: pwm0m1-ch0 {
+			rockchip,pins =
+				/* pwm0m1_ch0 */
+				<2 RK_PA0 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m1_ch1: pwm0m1-ch1 {
+			rockchip,pins =
+				/* pwm0m1_ch1 */
+				<2 RK_PA1 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m1_ch2: pwm0m1-ch2 {
+			rockchip,pins =
+				/* pwm0m1_ch2 */
+				<2 RK_PA2 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m1_ch3: pwm0m1-ch3 {
+			rockchip,pins =
+				/* pwm0m1_ch3 */
+				<2 RK_PB0 3 &pcfg_pull_none_drv_level_0>;
+		};
+
+		/omit-if-no-ref/
+		pwm0m2_ch1: pwm0m2-ch1 {
+			rockchip,pins =
+				/* pwm0m2_ch1 */
+				<1 RK_PB7 1 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm0m2_ch2: pwm0m2-ch2 {
+			rockchip,pins =
+				/* pwm0m2_ch2 */
+				<1 RK_PC0 1 &pcfg_pull_none_drv_level_0>;
+		};
+	};
+
+	pwm1 {
+		/omit-if-no-ref/
+		pwm1m0_ch0: pwm1m0-ch0 {
+			rockchip,pins =
+				/* pwm1m0_ch0 */
+				<0 RK_PB0 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm1m0_ch1: pwm1m0-ch1 {
+			rockchip,pins =
+				/* pwm1m0_ch1 */
+				<0 RK_PB1 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm1m0_ch2: pwm1m0-ch2 {
+			rockchip,pins =
+				/* pwm1m0_ch2 */
+				<0 RK_PB2 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm1m0_ch3: pwm1m0-ch3 {
+			rockchip,pins =
+				/* pwm1m0_ch3 */
+				<0 RK_PB3 3 &pcfg_pull_none_drv_level_0>;
+		};
+
+		/omit-if-no-ref/
+		pwm1m1_ch0: pwm1m1-ch0 {
+			rockchip,pins =
+				/* pwm1m1_ch0 */
+				<2 RK_PA3 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm1m1_ch1: pwm1m1-ch1 {
+			rockchip,pins =
+				/* pwm1m1_ch1 */
+				<2 RK_PA4 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm1m1_ch2: pwm1m1-ch2 {
+			rockchip,pins =
+				/* pwm1m1_ch2 */
+				<2 RK_PA5 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm1m1_ch3: pwm1m1-ch3 {
+			rockchip,pins =
+				/* pwm1m1_ch3 */
+				<2 RK_PB1 3 &pcfg_pull_none_drv_level_0>;
+		};
+	};
+
+	pwm2 {
+		/omit-if-no-ref/
+		pwm2m0_ch0: pwm2m0-ch0 {
+			rockchip,pins =
+				/* pwm2m0_ch0 */
+				<1 RK_PB0 4 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm2m0_ch1: pwm2m0-ch1 {
+			rockchip,pins =
+				/* pwm2m0_ch1 */
+				<1 RK_PA7 4 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm2m0_ch2: pwm2m0-ch2 {
+			rockchip,pins =
+				/* pwm2m0_ch2 */
+				<1 RK_PB4 4 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm2m0_ch3: pwm2m0-ch3 {
+			rockchip,pins =
+				/* pwm2m0_ch3 */
+				<1 RK_PB3 4 &pcfg_pull_none_drv_level_0>;
+		};
+
+		/omit-if-no-ref/
+		pwm2m1_ch0: pwm2m1-ch0 {
+			rockchip,pins =
+				/* pwm2m1_ch0 */
+				<2 RK_PA6 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm2m1_ch1: pwm2m1-ch1 {
+			rockchip,pins =
+				/* pwm2m1_ch1 */
+				<2 RK_PA7 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm2m1_ch2: pwm2m1-ch2 {
+			rockchip,pins =
+				/* pwm2m1_ch2 */
+				<2 RK_PB2 3 &pcfg_pull_none_drv_level_0>;
+		};
+		/omit-if-no-ref/
+		pwm2m1_ch3: pwm2m1-ch3 {
+			rockchip,pins =
+				/* pwm2m1_ch3 */
+				<2 RK_PB3 3 &pcfg_pull_none_drv_level_0>;
+		};
+	};
+
+	pwr {
+		/omit-if-no-ref/
+		pwr: pwr {
+			rockchip,pins =
+				/* pwr_ctrl0 */
+				<0 RK_PA3 1 &pcfg_pull_none>,
+				/* pwr_ctrl1 */
+				<0 RK_PA4 1 &pcfg_pull_none>;
+		};
+	};
+
+	rtc_32k {
+		/omit-if-no-ref/
+		rtc_32k: rtc-32k {
+			rockchip,pins =
+				/* rtc_32k_out */
+				<0 RK_PA0 1 &pcfg_pull_none>;
+		};
+	};
+
+	sai {
+		/omit-if-no-ref/
+		sai: sai {
+			rockchip,pins =
+				/* sai_lrck */
+				<2 RK_PB1 5 &pcfg_pull_none>,
+				/* sai_mclk */
+				<2 RK_PB0 5 &pcfg_pull_none>,
+				/* sai_sclk */
+				<2 RK_PA7 5 &pcfg_pull_none>,
+				/* sai_sdi */
+				<2 RK_PA6 5 &pcfg_pull_none>,
+				/* sai_sdo */
+				<2 RK_PB2 5 &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc0 {
+		/omit-if-no-ref/
+		sdmmc0_bus4: sdmmc0-bus4 {
+			rockchip,pins =
+				/* sdmmc0_d0 */
+				<1 RK_PB0 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc0_d1 */
+				<1 RK_PA7 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc0_d2 */
+				<1 RK_PB4 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc0_d3 */
+				<1 RK_PB3 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc0_clk: sdmmc0-clk {
+			rockchip,pins =
+				/* sdmmc0_clk */
+				<1 RK_PB1 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc0_cmd: sdmmc0-cmd {
+			rockchip,pins =
+				/* sdmmc0_cmd */
+				<1 RK_PB2 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc0_det: sdmmc0-det {
+			rockchip,pins =
+				/* sdmmc0_det */
+				<1 RK_PA6 1 &pcfg_pull_up>;
+		};
+	};
+
+	sdmmc1 {
+		/omit-if-no-ref/
+		sdmmc1_bus4: sdmmc1-bus4 {
+			rockchip,pins =
+				/* sdmmc1_d0 */
+				<2 RK_PA1 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc1_d1 */
+				<2 RK_PA0 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc1_d2 */
+				<2 RK_PA5 1 &pcfg_pull_up_drv_level_2>,
+				/* sdmmc1_d3 */
+				<2 RK_PA4 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc1_clk: sdmmc1-clk {
+			rockchip,pins =
+				/* sdmmc1_clk */
+				<2 RK_PA2 1 &pcfg_pull_up_drv_level_2>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc1_cmd: sdmmc1-cmd {
+			rockchip,pins =
+				/* sdmmc1_cmd */
+				<2 RK_PA3 1 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	spi0 {
+		/omit-if-no-ref/
+		spi0m0_clk: spi0m0-clk {
+			rockchip,pins =
+				/* spi0_clk_m0 */
+				<2 RK_PB0 2 &pcfg_pull_none>,
+				/* spi0_miso_m0 */
+				<2 RK_PB3 2 &pcfg_pull_none>,
+				/* spi0_mosi_m0 */
+				<2 RK_PB1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spi0m0_cs0: spi0m0-cs0 {
+			rockchip,pins =
+				/* spi0_cs0n_m0 */
+				<2 RK_PB2 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spi0m0_cs1: spi0m0-cs1 {
+			rockchip,pins =
+				/* spi0_cs1n_m0 */
+				<2 RK_PA7 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spi0m1_clk: spi0m1-clk {
+			rockchip,pins =
+				/* spi0_clk_m1 */
+				<2 RK_PA2 5 &pcfg_pull_none>,
+				/* spi0_miso_m1 */
+				<2 RK_PA4 5 &pcfg_pull_none>,
+				/* spi0_mosi_m1 */
+				<2 RK_PA1 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spi0m1_cs0: spi0m1-cs0 {
+			rockchip,pins =
+				/* spi0_cs0n_m1 */
+				<2 RK_PA3 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spi0m1_cs1: spi0m1-cs1 {
+			rockchip,pins =
+				/* spi0_cs1n_m1 */
+				<2 RK_PA0 5 &pcfg_pull_none>;
+		};
+	};
+
+	uart0 {
+		/omit-if-no-ref/
+		uart0m0_xfer: uart0m0-xfer {
+			rockchip,pins =
+				/* uart0_rx_m0 */
+				<0 RK_PA6 1 &pcfg_pull_up>,
+				/* uart0_tx_m0 */
+				<0 RK_PA5 1 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart0m1_xfer: uart0m1-xfer {
+			rockchip,pins =
+				/* uart0_rx_m1 */
+				<0 RK_PB5 2 &pcfg_pull_up>,
+				/* uart0_tx_m1 */
+				<0 RK_PB4 2 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart0m2_xfer: uart0m2-xfer {
+			rockchip,pins =
+				/* uart0_rx_m2 */
+				<1 RK_PB3 2 &pcfg_pull_up>,
+				/* uart0_tx_m2 */
+				<1 RK_PB4 2 &pcfg_pull_up>;
+		};
+	};
+
+	uart1 {
+		/omit-if-no-ref/
+		uart1m0_xfer: uart1m0-xfer {
+			rockchip,pins =
+				/* uart1_rx_m0 */
+				<0 RK_PB2 2 &pcfg_pull_up>,
+				/* uart1_tx_m0 */
+				<0 RK_PB3 2 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart1m0_ctsn: uart1m0-ctsn {
+			rockchip,pins =
+				/* uart1m0_ctsn */
+				<0 RK_PB5 5 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart1m0_rtsn: uart1m0-rtsn {
+			rockchip,pins =
+				/* uart1m0_rtsn */
+				<0 RK_PB4 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart1m1_xfer: uart1m1-xfer {
+			rockchip,pins =
+				/* uart1_rx_m1 */
+				<1 RK_PA7 2 &pcfg_pull_up>,
+				/* uart1_tx_m1 */
+				<1 RK_PB0 2 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart1m1_ctsn: uart1m1-ctsn {
+			rockchip,pins =
+				/* uart1m1_ctsn */
+				<1 RK_PB2 2 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart1m1_rtsn: uart1m1-rtsn {
+			rockchip,pins =
+				/* uart1m1_rtsn */
+				<1 RK_PB1 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart1m2_xfer: uart1m2-xfer {
+			rockchip,pins =
+				/* uart1_rx_m2 */
+				<2 RK_PA7 1 &pcfg_pull_up>,
+				/* uart1_tx_m2 */
+				<2 RK_PA6 1 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart1m2_ctsn: uart1m2-ctsn {
+			rockchip,pins =
+				/* uart1m2_ctsn */
+				<2 RK_PA5 2 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart1m2_rtsn: uart1m2-rtsn {
+			rockchip,pins =
+				/* uart1m2_rtsn */
+				<2 RK_PA4 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart1m3_xfer: uart1m3-xfer {
+			rockchip,pins =
+				/* uart1_rx_m3 */
+				<2 RK_PA3 2 &pcfg_pull_up>,
+				/* uart1_tx_m3 */
+				<2 RK_PA2 2 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart1m3_ctsn: uart1m3-ctsn {
+			rockchip,pins =
+				/* uart1m3_ctsn */
+				<2 RK_PA1 2 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart1m3_rtsn: uart1m3-rtsn {
+			rockchip,pins =
+				/* uart1m3_rtsn */
+				<2 RK_PA0 2 &pcfg_pull_none>;
+		};
+	};
+
+	uart2 {
+		/omit-if-no-ref/
+		uart2m0_xfer: uart2m0-xfer {
+			rockchip,pins =
+				/* uart2_rx_m0 */
+				<0 RK_PB1 2 &pcfg_pull_up>,
+				/* uart2_tx_m0 */
+				<0 RK_PB0 2 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart2m0_ctsn: uart2m0-ctsn {
+			rockchip,pins =
+				/* uart2m0_ctsn */
+				<0 RK_PB3 5 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart2m0_rtsn: uart2m0-rtsn {
+			rockchip,pins =
+				/* uart2m0_rtsn */
+				<0 RK_PB2 5 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart2m1_xfer: uart2m1-xfer {
+			rockchip,pins =
+				/* uart2_rx_m1 */
+				<2 RK_PB1 1 &pcfg_pull_up>,
+				/* uart2_tx_m1 */
+				<2 RK_PB0 1 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart2m1_ctsn: uart2m1-ctsn {
+			rockchip,pins =
+				/* uart2m1_ctsn */
+				<2 RK_PB3 1 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart2m1_rtsn: uart2m1-rtsn {
+			rockchip,pins =
+				/* uart2m1_rtsn */
+				<2 RK_PB2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart2m2_xfer: uart2m2-xfer {
+			rockchip,pins =
+				/* uart2_rx_m2 */
+				<1 RK_PB6 3 &pcfg_pull_up>,
+				/* uart2_tx_m2 */
+				<1 RK_PB5 3 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart2m2_ctsn: uart2m2-ctsn {
+			rockchip,pins =
+				/* uart2m2_ctsn */
+				<1 RK_PC0 3 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		uart2m2_rtsn: uart2m2-rtsn {
+			rockchip,pins =
+				/* uart2m2_rtsn */
+				<1 RK_PB7 3 &pcfg_pull_none>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rv1103b.dtsi b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
new file mode 100644
index 000000000000..5955b249d4ce
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
+ */
+
+#include <dt-bindings/clock/rockchip,rv1103b-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,boot-mode.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	compatible = "rockchip,rv1103b";
+
+	interrupt-parent = <&gic>;
+
+	arm-pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+	};
+
+	xin32k: oscillator-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+		#clock-cells = <0>;
+	};
+
+	xin24m: oscillator-24m {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xin24m";
+		#clock-cells = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			clocks = <&cru ARMCLK>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+		clock-frequency = <24000000>;
+	};
+
+	pinctrl: pinctrl {
+		compatible = "rockchip,rv1103b-pinctrl";
+		rockchip,grf = <&ioc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpio0: gpio@20520000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x20520000 0x200>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_PMU_GPIO0>, <&cru DBCLK_PMU_GPIO0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@20d80000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x20d80000 0x200>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@20840000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x20840000 0x200>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		cru: clock-controller@20000000 {
+			compatible = "rockchip,rv1103b-cru";
+			reg = <0x20000000 0x81000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		pmu_grf: syscon@20160000 {
+			compatible = "rockchip,rv1103b-pmu-grf", "syscon", "simple-mfd";
+			reg = <0x20160000 0x1000>;
+
+			reboot_mode: reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x200>;
+				mode-normal = <BOOT_NORMAL>;
+				mode-recovery = <BOOT_RECOVERY>;
+				mode-bootloader = <BOOT_FASTBOOT>;
+				mode-loader = <BOOT_BL_DOWNLOAD>;
+			};
+		};
+
+		ioc: syscon@20170000 {
+			compatible = "rockchip,rv1103b-ioc", "syscon";
+			reg = <0x20170000 0x60000>;
+		};
+
+		gic: interrupt-controller@20411000 {
+			compatible = "arm,gic-400";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+
+			reg = <0x20411000 0x1000>,
+			      <0x20412000 0x2000>,
+			      <0x20414000 0x2000>,
+			      <0x20416000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		uart0: serial@20540000 {
+			compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
+			reg = <0x20540000 0x100>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
+			clock-names = "baudclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0m0_xfer>;
+			status = "disabled";
+		};
+
+		sdmmc1: mmc@20650000 {
+			compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0x20650000 0x4000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_SDMMC1>, <&cru CCLK_SDMMC1>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			max-frequency = <150000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
+			status = "disabled";
+		};
+
+		uart1: serial@20870000 {
+			compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
+			reg = <0x20870000 0x100>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
+			clock-names = "baudclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1m0_xfer>;
+			status = "disabled";
+		};
+
+		uart2: serial@20880000 {
+			compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
+			reg = <0x20880000 0x100>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
+			clock-names = "baudclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2m0_xfer>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@208d0000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x208d0000 0x100>;
+			clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
+			clock-names = "tclk", "pclk";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		sdmmc0: mmc@20d20000 {
+			compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0x20d20000 0x4000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_SDMMC0>, <&cru CCLK_SDMMC0>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			max-frequency = <150000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdmmc0_det &sdmmc0_clk &sdmmc0_cmd &sdmmc0_bus4>;
+			status = "disabled";
+		};
+
+		emmc: mmc@20d30000 {
+			compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0x20d30000 0x4000>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_EMMC>, <&cru CCLK_EMMC>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			max-frequency = <150000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus4>;
+			status = "disabled";
+		};
+
+		fspi0: spi@20d40000 {
+			compatible = "rockchip,sfc";
+			reg = <0x20d40000 0x4000>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru SCLK_SFC_2X>, <&cru HCLK_SFC>;
+			clock-names = "clk_sfc", "hclk_sfc";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&fspi_bus4 &fspi_cs0 &fspi_clk>;
+			status = "disabled";
+		};
+
+		system_sram: sram@210f6000 {
+			compatible = "mmio-sram";
+			reg = <0x210f6000 0x8000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x210f6000 0x8000>;
+		};
+	};
+};
+
+#include "rv1103b-pinctrl.dtsi"
-- 
2.34.1


