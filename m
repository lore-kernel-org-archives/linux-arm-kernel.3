Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9923FEE6B46
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmH9HE8aRrFDo8WqIQGTJHc6NT8j7v+2KlTAuAaPNkE=; b=zz9bdfSy5tBsyJHjJn6YcGD4g7
	zX9lSPt8ytk4x+HduJ00EZPG0z0mrMFFyFUvAJv90Ju5PNPyR0Bf5eZ4blJ46m0565vCyeztGAup5
	GsXjYgomfqvrOkjl9+5wdT66oaijqzDCruaPR1TCn39rVwx/gPcWFj4s3yDlfnCB7o9v43LY85daf
	joBKdglBTWYQiZlk0MDcozyi7hBjroqZ7mSyWO+6A7oxTmbLv61ppNmls71tN/0P+nN7TIhTjFqIL
	NsTami4xl26mwZPdINySDvSs7iLPDm1py7NcSUJaORVuyTJiC9ewxH2RiCAtGekGVgp5tPVQbHYKh
	nfWk2EiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQL8-0000000BfN1-3tJR;
	Fri, 06 Feb 2026 18:13:58 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKz-0000000Bf9t-2s0a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:56 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b71557299dso952961eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401628; x=1771006428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmH9HE8aRrFDo8WqIQGTJHc6NT8j7v+2KlTAuAaPNkE=;
        b=Y5fq19217hLy4NNzL9vVd45wMFS2aeH+gyi7Af/U2Eq5Kgn0d0VhVI+j/gYpwDhXYJ
         70Qe6STs7U4XM7Vyblo6Tiw/Alse19X0c9+zVIM0hLCLPy2apPhuQVSPxbLvAY0vMquE
         BpvlVSC/S2xy6kpHAnQA0sq4+Fm6874s2QFnoDwNiY8y+HXmjTguZUzwcUunf/Pv+AIA
         SpqkaU+rqCefHeR0jKaGdz2IXDRaLZF+Pvm0HsiqHxe7lQeGfZxVHnRDiOvnbqpWBiG8
         Q0i0dAyeBd7POVaz3L7c1eeIo2w0C1WWmYZ4vdDSxZwP+kZCzRXy0Wc/hUr/xj19PnQ9
         e8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401628; x=1771006428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmH9HE8aRrFDo8WqIQGTJHc6NT8j7v+2KlTAuAaPNkE=;
        b=fIOvycL02tYjXtz5jmIsIPL9P7/hjmwEWrd15Qlj6sqrY5GVePQXy2Es+KV9sPo15D
         dGu+Rqg8KbML3cEtU2ENcNrrTGW8EnXq/D1D810dxg4xZ7uyYYilSSXzFR+ibdNhpUJo
         RtWmpvdMtN1nazdtMaNaDI6a5qsLVR5Ak9rVie0jI4Ch/X3jDH7jr4uhtPKmP4YQuZbW
         qY8Vkq1XGEPccMFkdXhf7rEkg8ENDpozYkrSykqAvL9QhmUVeQSYRnf1NIcubPQNFErE
         jwOnvtYVxAcMKQWKwwxfyBDqwt4rZU/ePnemHEiODdCwRZW+zv1ShUVDcZst1jv/P+9i
         sDYg==
X-Forwarded-Encrypted: i=1; AJvYcCX9GlmRsoczB+vgseR/e3OmJ8hJEJy6EvnqXp3apXWegt94BxQReUoxp47XZdgmlpAyB6s6BZMim76HWxuW3mLS@lists.infradead.org
X-Gm-Message-State: AOJu0YzUEf0QREmB9K+ZjkHfCA5Rvz+TRsDBTjdVsp7j4xXPxi8tcCa+
	Qe59xBwXPK6i3MLGXIXAVLG4H+smQbWbh/Hk92M5/KSemBQ/VIdsOtrU
X-Gm-Gg: AZuq6aID55DYNVUzJyXvhu9diMLZ01WM+HNK/wy7F6RF6DHZ1ICuJKlv+e30Jeace8G
	Xz/A7LJlTh5XZSyacfOVmUTCTZ1/gCydRGaLGqFtrj/mkUSY4/rDTnmjKKVJqUQuLeZCaTO8LX/
	V6ugHu8jQOe46F7SjUn73+mJDEbMJLKMEADYzigJbnx9q80n45BpbNebnBDiMvlnSYAx6c6qkiF
	GpTKTg7yDIjSGIEVqPAx67F6+RJrQrWSrMCj2/jymogOJxLYD7NCUoX34M1UoLUOGV5x6KfqeFz
	FGTHJ/dOti3mDIO35hHB36yH6E0FYeMxrgsKAMXgour1ZkcE55ESpV8TPF3DyhmpIKICZbOzWp6
	joEPo8xVCh5Z6nHGEicd12w40I7uz8zduzU3LZHIZ0PbPokX6wJBOdZEQE62qOJXl39Z3GjlbN6
	LnZIlojfaRvzZ8japT7Jwkq4bG
X-Received: by 2002:a05:7300:7b94:b0:2b0:5028:bafd with SMTP id 5a478bee46e88-2b856453d5cmr1456268eec.8.1770401628272;
        Fri, 06 Feb 2026 10:13:48 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:47 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 09/11] ARM: dts: rockchip: Add support for RV1103B
Date: Fri,  6 Feb 2026 15:13:07 -0300
Message-Id: <20260206181309.2696095-10-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101349_774688_291D168B 
X-CRM114-Status: GOOD (  15.46  )
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

Based on the 5.10 Rockchip vendor kernel driver.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 831 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 266 ++++++
 2 files changed, 1097 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi

diff --git a/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
new file mode 100644
index 000000000000..bc4d8fcdfaf7
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
@@ -0,0 +1,831 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
+ */
+
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <arm64/rockchip/rockchip-pinconf.dtsi>
+
+/*
+ * This file is auto generated by pin2dts tool, please keep these code
+ * by adding changes at end of this file.
+ */
+&pinctrl {
+	cam_clk0 {
+		cam_clk0_pins: cam-clk0-pins {
+			rockchip,pins =
+				/* cam_clk0_out */
+				<1 RK_PB5 1 &pcfg_pull_none>;
+		};
+	};
+
+	cam_clk1 {
+		cam_clk1_pins: cam-clk1-pins {
+			rockchip,pins =
+				/* cam_clk1_out */
+				<1 RK_PB6 1 &pcfg_pull_none>;
+		};
+	};
+
+	cam_spi {
+		cam_spi_bus4_pins: cam-spi-bus4-pins {
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
+		cam_spi_clk_pins: cam-spi-clk-pins {
+			rockchip,pins =
+				/* cam_spi_clk */
+				<0 RK_PB4 4 &pcfg_pull_none>;
+		};
+		cam_spi_cs0n_pins: cam-spi-cs0n-pins {
+			rockchip,pins =
+				/* cam_spi_cs0n */
+				<0 RK_PB3 4 &pcfg_pull_none>;
+		};
+	};
+
+	clk {
+		clk_32k_pins: clk-32k-pins {
+			rockchip,pins =
+				/* clk_32k */
+				<0 RK_PA0 2 &pcfg_pull_none>;
+		};
+	};
+
+	clk_24m {
+		clk_24m_out_pins: clk-24m-out-pins {
+			rockchip,pins =
+				/* clk_24m_out */
+				<0 RK_PA0 3 &pcfg_pull_none>;
+		};
+	};
+
+	cpu {
+		cpu_pins: cpu-pins {
+			rockchip,pins =
+				/* cpu_avs */
+				<0 RK_PA1 2 &pcfg_pull_none>;
+		};
+	};
+
+	emmc {
+		emmc_bus4_pins: emmc-bus4-pins {
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
+		emmc_clk_pins: emmc-clk-pins {
+			rockchip,pins =
+				/* emmc_clk */
+				<1 RK_PA4 1 &pcfg_pull_up_drv_level_2>;
+		};
+		emmc_cmd_pins: emmc-cmd-pins {
+			rockchip,pins =
+				/* emmc_cmd */
+				<1 RK_PA5 1 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	emmc_testclk {
+		emmc_testclk_clk_pins: emmc-testclk-clk-pins {
+			rockchip,pins =
+				/* emmc_testclk_out */
+				<1 RK_PA7 3 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	emmc_testdata {
+		emmc_testdata_out_pins: emmc-testdata-out-pins {
+			rockchip,pins =
+				/* emmc_testdata_out */
+				<1 RK_PB0 3 &pcfg_pull_none>;
+		};
+	};
+
+	eth_led {
+		eth_led_dpx_pins: eth-led-dpx-pins {
+			rockchip,pins =
+				/* eth_led_dpx */
+				<2 RK_PA4 6 &pcfg_pull_none>;
+		};
+		eth_led_link_pins: eth-led-link-pins {
+			rockchip,pins =
+				/* eth_led_link */
+				<2 RK_PA6 6 &pcfg_pull_none>;
+		};
+		eth_led_spd_pins: eth-led-spd-pins {
+			rockchip,pins =
+				/* eth_led_spd */
+				<2 RK_PA7 6 &pcfg_pull_none>;
+		};
+	};
+
+	flash_trig {
+		flash_trig_pins: flash-trig-pins {
+			rockchip,pins =
+				/* flash_trig_out */
+				<2 RK_PB0 6 &pcfg_pull_none>;
+		};
+	};
+
+	fspi {
+		fspi_bus4_pins: fspi-bus4-pins {
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
+		fspi_cs0_pins: fspi-cs0-pins {
+			rockchip,pins =
+				/* fspi_cs0n */
+				<1 RK_PA5 2 &pcfg_pull_up>;
+		};
+		fspi_clk_pins: fspi-clk-pins {
+			rockchip,pins =
+				/* fspi_clk */
+				<1 RK_PA4 2 &pcfg_pull_none>;
+		};
+	};
+
+	fspi_testclk {
+		fspi_testclk_out_pins: fspi-testclk-out-pins {
+			rockchip,pins =
+				/* fspi_testclk_out */
+				<1 RK_PA7 5 &pcfg_pull_none>;
+		};
+	};
+
+	fspi_testdata {
+		fspi_testdata_out_pins: fspi-testdata-out-pins {
+			rockchip,pins =
+				/* fspi_testdata_out */
+				<1 RK_PB0 5 &pcfg_pull_none>;
+		};
+	};
+
+	i2c0 {
+		i2c0m0_xfer_pins: i2c0m0-xfer-pins {
+			rockchip,pins =
+				/* i2c0_scl_m0 */
+				<0 RK_PA5 3 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m0 */
+				<0 RK_PA6 3 &pcfg_pull_none_smt>;
+		};
+		i2c0m1_xfer_pins: i2c0m1-xfer-pins {
+			rockchip,pins =
+				/* i2c0_scl_m1 */
+				<1 RK_PB4 5 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m1 */
+				<1 RK_PB3 5 &pcfg_pull_none_smt>;
+		};
+		i2c0m2_xfer_pins: i2c0m2-xfer-pins {
+			rockchip,pins =
+				/* i2c0_scl_m2 */
+				<1 RK_PB5 2 &pcfg_pull_none_smt>,
+				/* i2c0_sda_m2 */
+				<1 RK_PB6 2 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c1 {
+		i2c1m0_xfer_pins: i2c1m0-xfer-pins {
+			rockchip,pins =
+				/* i2c1_scl_m0 */
+				<0 RK_PB0 1 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m0 */
+				<0 RK_PB1 1 &pcfg_pull_none_smt>;
+		};
+		i2c1m1_xfer_pins: i2c1m1-xfer-pins {
+			rockchip,pins =
+				/* i2c1_scl_m1 */
+				<2 RK_PA4 4 &pcfg_pull_none_smt>,
+				/* i2c1_sda_m1 */
+				<2 RK_PA5 4 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c2 {
+		i2c2m0_xfer_pins: i2c2m0-xfer-pins {
+			rockchip,pins =
+				/* i2c2_scl_m0 */
+				<0 RK_PB2 1 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m0 */
+				<0 RK_PB3 1 &pcfg_pull_none_smt>;
+		};
+		i2c2m1_xfer_pins: i2c2m1-xfer-pins {
+			rockchip,pins =
+				/* i2c2_scl_m1 */
+				<2 RK_PA6 4 &pcfg_pull_none_smt>,
+				/* i2c2_sda_m1 */
+				<2 RK_PA7 4 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c3 {
+		i2c3m0_xfer_pins: i2c3m0-xfer-pins {
+			rockchip,pins =
+				/* i2c3_scl_m0 */
+				<0 RK_PB4 1 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m0 */
+				<0 RK_PB5 1 &pcfg_pull_none_smt>;
+		};
+		i2c3m1_xfer_pins: i2c3m1-xfer-pins {
+			rockchip,pins =
+				/* i2c3_scl_m1 */
+				<2 RK_PB3 4 &pcfg_pull_none_smt>,
+				/* i2c3_sda_m1 */
+				<2 RK_PB2 4 &pcfg_pull_none_smt>;
+		};
+	};
+
+	i2c4 {
+		i2c4m0_xfer_pins: i2c4m0-xfer-pins {
+			rockchip,pins =
+				/* i2c4_scl_m0 */
+				<2 RK_PB0 4 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m0 */
+				<2 RK_PB1 4 &pcfg_pull_none_smt>;
+		};
+		i2c4m1_xfer_pins: i2c4m1-xfer-pins {
+			rockchip,pins =
+				/* i2c4_scl_m1 */
+				<1 RK_PB7 2 &pcfg_pull_none_smt>,
+				/* i2c4_sda_m1 */
+				<1 RK_PC0 2 &pcfg_pull_none_smt>;
+		};
+	};
+
+	jtag {
+		jtagm0_pins: jtagm0-pins {
+			rockchip,pins =
+				/* jtag_tck_m0 */
+				<0 RK_PA5 5 &pcfg_pull_none>,
+				/* jtag_tms_m0 */
+				<0 RK_PA6 5 &pcfg_pull_none>;
+		};
+		jtagm1_pins: jtagm1-pins {
+			rockchip,pins =
+				/* jtag_tck_m1 */
+				<0 RK_PB4 3 &pcfg_pull_none>,
+				/* jtag_tms_m1 */
+				<0 RK_PB5 3 &pcfg_pull_none>;
+		};
+		jtagm2_pins: jtagm2-pins {
+			rockchip,pins =
+				/* jtag_tck_m2 */
+				<1 RK_PB4 3 &pcfg_pull_none>,
+				/* jtag_tms_m2 */
+				<1 RK_PB3 3 &pcfg_pull_none>;
+		};
+	};
+
+	pmu_debug_test {
+		pmu_debug_test_pins: pmu-debug-test-pins {
+			rockchip,pins =
+				/* pmu_debug_test_out */
+				<0 RK_PB1 5 &pcfg_pull_none>;
+		};
+	};
+
+	prelight_trig {
+		prelight_trig_pins: prelight-trig-pins {
+			rockchip,pins =
+				/* prelight_trig_out */
+				<2 RK_PB1 6 &pcfg_pull_none>;
+		};
+	};
+
+	psram_spi {
+		psram_spi_bus4_pins: psram-spi-bus4-pins {
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
+		psram_spi_clk_pins: psram-spi-clk-pins {
+			rockchip,pins =
+				/* psram_spi_clk */
+				<0 RK_PA0 4 &pcfg_pull_none>;
+		};
+		psram_spi_cs0n_pins: psram-spi-cs0n-pins {
+			rockchip,pins =
+				/* psram_spi_cs0n */
+				<0 RK_PA4 4 &pcfg_pull_none>;
+		};
+	};
+
+	pwm0 {
+		pwm0m0_ch0_pins: pwm0m0-ch0-pins {
+			rockchip,pins =
+				/* pwm0m0_ch0 */
+				<0 RK_PA1 1 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m0_ch1_pins: pwm0m0-ch1-pins {
+			rockchip,pins =
+				/* pwm0m0_ch1 */
+				<0 RK_PA5 2 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m0_ch2_pins: pwm0m0-ch2-pins {
+			rockchip,pins =
+				/* pwm0m0_ch2 */
+				<0 RK_PA6 2 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m0_ch3_pins: pwm0m0-ch3-pins {
+			rockchip,pins =
+				/* pwm0m0_ch3 */
+				<0 RK_PA2 1 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m1_ch0_pins: pwm0m1-ch0-pins {
+			rockchip,pins =
+				/* pwm0m1_ch0 */
+				<2 RK_PA0 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m1_ch1_pins: pwm0m1-ch1-pins {
+			rockchip,pins =
+				/* pwm0m1_ch1 */
+				<2 RK_PA1 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m1_ch2_pins: pwm0m1-ch2-pins {
+			rockchip,pins =
+				/* pwm0m1_ch2 */
+				<2 RK_PA2 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m1_ch3_pins: pwm0m1-ch3-pins {
+			rockchip,pins =
+				/* pwm0m1_ch3 */
+				<2 RK_PB0 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m2_ch1_pins: pwm0m2-ch1-pins {
+			rockchip,pins =
+				/* pwm0m2_ch1 */
+				<1 RK_PB7 1 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm0m2_ch2_pins: pwm0m2-ch2-pins {
+			rockchip,pins =
+				/* pwm0m2_ch2 */
+				<1 RK_PC0 1 &pcfg_pull_none_drv_level_0>;
+		};
+	};
+
+	pwm1 {
+		pwm1m0_ch0_pins: pwm1m0-ch0-pins {
+			rockchip,pins =
+				/* pwm1m0_ch0 */
+				<0 RK_PB0 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m0_ch1_pins: pwm1m0-ch1-pins {
+			rockchip,pins =
+				/* pwm1m0_ch1 */
+				<0 RK_PB1 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m0_ch2_pins: pwm1m0-ch2-pins {
+			rockchip,pins =
+				/* pwm1m0_ch2 */
+				<0 RK_PB2 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m0_ch3_pins: pwm1m0-ch3-pins {
+			rockchip,pins =
+				/* pwm1m0_ch3 */
+				<0 RK_PB3 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m1_ch0_pins: pwm1m1-ch0-pins {
+			rockchip,pins =
+				/* pwm1m1_ch0 */
+				<2 RK_PA3 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m1_ch1_pins: pwm1m1-ch1-pins {
+			rockchip,pins =
+				/* pwm1m1_ch1 */
+				<2 RK_PA4 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m1_ch2_pins: pwm1m1-ch2-pins {
+			rockchip,pins =
+				/* pwm1m1_ch2 */
+				<2 RK_PA5 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm1m1_ch3_pins: pwm1m1-ch3-pins {
+			rockchip,pins =
+				/* pwm1m1_ch3 */
+				<2 RK_PB1 3 &pcfg_pull_none_drv_level_0>;
+		};
+	};
+
+	pwm2 {
+		pwm2m0_ch0_pins: pwm2m0-ch0-pins {
+			rockchip,pins =
+				/* pwm2m0_ch0 */
+				<1 RK_PB0 4 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m0_ch1_pins: pwm2m0-ch1-pins {
+			rockchip,pins =
+				/* pwm2m0_ch1 */
+				<1 RK_PA7 4 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m0_ch2_pins: pwm2m0-ch2-pins {
+			rockchip,pins =
+				/* pwm2m0_ch2 */
+				<1 RK_PB4 4 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m0_ch3_pins: pwm2m0-ch3-pins {
+			rockchip,pins =
+				/* pwm2m0_ch3 */
+				<1 RK_PB3 4 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m1_ch0_pins: pwm2m1-ch0-pins {
+			rockchip,pins =
+				/* pwm2m1_ch0 */
+				<2 RK_PA6 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m1_ch1_pins: pwm2m1-ch1-pins {
+			rockchip,pins =
+				/* pwm2m1_ch1 */
+				<2 RK_PA7 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m1_ch2_pins: pwm2m1-ch2-pins {
+			rockchip,pins =
+				/* pwm2m1_ch2 */
+				<2 RK_PB2 3 &pcfg_pull_none_drv_level_0>;
+		};
+		pwm2m1_ch3_pins: pwm2m1-ch3-pins {
+			rockchip,pins =
+				/* pwm2m1_ch3 */
+				<2 RK_PB3 3 &pcfg_pull_none_drv_level_0>;
+		};
+	};
+
+	pwr {
+		pwr_pins: pwr-pins {
+			rockchip,pins =
+				/* pwr_ctrl0 */
+				<0 RK_PA3 1 &pcfg_pull_none>,
+				/* pwr_ctrl1 */
+				<0 RK_PA4 1 &pcfg_pull_none>;
+		};
+	};
+
+	rtc_32k {
+		rtc_32k_pins: rtc-32k-pins {
+			rockchip,pins =
+				/* rtc_32k_out */
+				<0 RK_PA0 1 &pcfg_pull_none>;
+		};
+	};
+
+	sai {
+		sai_pins: sai-pins {
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
+		sdmmc0_bus4_pins: sdmmc0-bus4-pins {
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
+		sdmmc0_clk_pins: sdmmc0-clk-pins {
+			rockchip,pins =
+				/* sdmmc0_clk */
+				<1 RK_PB1 1 &pcfg_pull_up_drv_level_2>;
+		};
+		sdmmc0_cmd_pins: sdmmc0-cmd-pins {
+			rockchip,pins =
+				/* sdmmc0_cmd */
+				<1 RK_PB2 1 &pcfg_pull_up_drv_level_2>;
+		};
+		sdmmc0_det_pins: sdmmc0-det-pins {
+			rockchip,pins =
+				/* sdmmc0_det */
+				<1 RK_PA6 1 &pcfg_pull_up>;
+		};
+	};
+
+	sdmmc1 {
+		sdmmc1_bus4_pins: sdmmc1-bus4-pins {
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
+		sdmmc1_clk_pins: sdmmc1-clk-pins {
+			rockchip,pins =
+				/* sdmmc1_clk */
+				<2 RK_PA2 1 &pcfg_pull_up_drv_level_2>;
+		};
+		sdmmc1_cmd_pins: sdmmc1-cmd-pins {
+			rockchip,pins =
+				/* sdmmc1_cmd */
+				<2 RK_PA3 1 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	sdmmc0_testclk {
+		sdmmc0_testclk_clk_pins: sdmmc0-testclk-clk-pins {
+			rockchip,pins =
+				/* sdmmc0_testclk_out */
+				<1 RK_PA0 3 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	sdmmc0_testdata {
+		sdmmc0_testdata_out_pins: sdmmc0-testdata-out-pins {
+			rockchip,pins =
+				/* sdmmc0_testdata_out */
+				<1 RK_PA3 3 &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc1_testclk {
+		sdmmc1_testclk_clk_pins: sdmmc1-testclk-clk-pins {
+			rockchip,pins =
+				/* sdmmc1_testclk_out */
+				<2 RK_PA6 7 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+
+	sdmmc1_testdata {
+		sdmmc1_testdata_out_pins: sdmmc1-testdata-out-pins {
+			rockchip,pins =
+				/* sdmmc1_testdata_out */
+				<2 RK_PA7 7 &pcfg_pull_none>;
+		};
+	};
+
+	spi0 {
+		spi0m0_clk_pins: spi0m0-clk-pins {
+			rockchip,pins =
+				/* spi0_clk_m0 */
+				<2 RK_PB0 2 &pcfg_pull_none>,
+				/* spi0_miso_m0 */
+				<2 RK_PB3 2 &pcfg_pull_none>,
+				/* spi0_mosi_m0 */
+				<2 RK_PB1 2 &pcfg_pull_none>;
+		};
+		spi0m0_cs0_pins: spi0m0-cs0-pins {
+			rockchip,pins =
+				/* spi0_cs0n_m0 */
+				<2 RK_PB2 2 &pcfg_pull_none>;
+		};
+		spi0m0_cs1_pins: spi0m0-cs1-pins {
+			rockchip,pins =
+				/* spi0_cs1n_m0 */
+				<2 RK_PA7 2 &pcfg_pull_none>;
+		};
+		spi0m1_clk_pins: spi0m1-clk-pins {
+			rockchip,pins =
+				/* spi0_clk_m1 */
+				<2 RK_PA2 5 &pcfg_pull_none>,
+				/* spi0_miso_m1 */
+				<2 RK_PA4 5 &pcfg_pull_none>,
+				/* spi0_mosi_m1 */
+				<2 RK_PA1 5 &pcfg_pull_none>;
+		};
+		spi0m1_cs0_pins: spi0m1-cs0-pins {
+			rockchip,pins =
+				/* spi0_cs0n_m1 */
+				<2 RK_PA3 5 &pcfg_pull_none>;
+		};
+		spi0m1_cs1_pins: spi0m1-cs1-pins {
+			rockchip,pins =
+				/* spi0_cs1n_m1 */
+				<2 RK_PA0 5 &pcfg_pull_none>;
+		};
+	};
+
+	uart0 {
+		uart0m0_xfer_pins: uart0m0-xfer-pins {
+			rockchip,pins =
+				/* uart0_rx_m0 */
+				<0 RK_PA6 1 &pcfg_pull_up>,
+				/* uart0_tx_m0 */
+				<0 RK_PA5 1 &pcfg_pull_up>;
+		};
+		uart0m1_xfer_pins: uart0m1-xfer-pins {
+			rockchip,pins =
+				/* uart0_rx_m1 */
+				<0 RK_PB5 2 &pcfg_pull_up>,
+				/* uart0_tx_m1 */
+				<0 RK_PB4 2 &pcfg_pull_up>;
+		};
+		uart0m2_xfer_pins: uart0m2-xfer-pins {
+			rockchip,pins =
+				/* uart0_rx_m2 */
+				<1 RK_PB3 2 &pcfg_pull_up>,
+				/* uart0_tx_m2 */
+				<1 RK_PB4 2 &pcfg_pull_up>;
+		};
+	};
+
+	uart1 {
+		uart1m0_xfer_pins: uart1m0-xfer-pins {
+			rockchip,pins =
+				/* uart1_rx_m0 */
+				<0 RK_PB2 2 &pcfg_pull_up>,
+				/* uart1_tx_m0 */
+				<0 RK_PB3 2 &pcfg_pull_up>;
+		};
+		uart1m0_ctsn_pins: uart1m0-ctsn-pins {
+			rockchip,pins =
+				/* uart1m0_ctsn */
+				<0 RK_PB5 5 &pcfg_pull_none>;
+		};
+		uart1m0_rtsn_pins: uart1m0-rtsn-pins {
+			rockchip,pins =
+				/* uart1m0_rtsn */
+				<0 RK_PB4 5 &pcfg_pull_none>;
+		};
+		uart1m1_xfer_pins: uart1m1-xfer-pins {
+			rockchip,pins =
+				/* uart1_rx_m1 */
+				<1 RK_PA7 2 &pcfg_pull_up>,
+				/* uart1_tx_m1 */
+				<1 RK_PB0 2 &pcfg_pull_up>;
+		};
+		uart1m1_ctsn_pins: uart1m1-ctsn-pins {
+			rockchip,pins =
+				/* uart1m1_ctsn */
+				<1 RK_PB2 2 &pcfg_pull_none>;
+		};
+		uart1m1_rtsn_pins: uart1m1-rtsn-pins {
+			rockchip,pins =
+				/* uart1m1_rtsn */
+				<1 RK_PB1 2 &pcfg_pull_none>;
+		};
+		uart1m2_xfer_pins: uart1m2-xfer-pins {
+			rockchip,pins =
+				/* uart1_rx_m2 */
+				<2 RK_PA7 1 &pcfg_pull_up>,
+				/* uart1_tx_m2 */
+				<2 RK_PA6 1 &pcfg_pull_up>;
+		};
+		uart1m2_ctsn_pins: uart1m2-ctsn-pins {
+			rockchip,pins =
+				/* uart1m2_ctsn */
+				<2 RK_PA5 2 &pcfg_pull_none>;
+		};
+		uart1m2_rtsn_pins: uart1m2-rtsn-pins {
+			rockchip,pins =
+				/* uart1m2_rtsn */
+				<2 RK_PA4 2 &pcfg_pull_none>;
+		};
+		uart1m3_xfer_pins: uart1m3-xfer-pins {
+			rockchip,pins =
+				/* uart1_rx_m3 */
+				<2 RK_PA3 2 &pcfg_pull_up>,
+				/* uart1_tx_m3 */
+				<2 RK_PA2 2 &pcfg_pull_up>;
+		};
+		uart1m3_ctsn_pins: uart1m3-ctsn-pins {
+			rockchip,pins =
+				/* uart1m3_ctsn */
+				<2 RK_PA1 2 &pcfg_pull_none>;
+		};
+		uart1m3_rtsn_pins: uart1m3-rtsn-pins {
+			rockchip,pins =
+				/* uart1m3_rtsn */
+				<2 RK_PA0 2 &pcfg_pull_none>;
+		};
+	};
+
+	uart2 {
+		uart2m0_xfer_pins: uart2m0-xfer-pins {
+			rockchip,pins =
+				/* uart2_rx_m0 */
+				<0 RK_PB1 2 &pcfg_pull_up>,
+				/* uart2_tx_m0 */
+				<0 RK_PB0 2 &pcfg_pull_up>;
+		};
+		uart2m0_ctsn_pins: uart2m0-ctsn-pins {
+			rockchip,pins =
+				/* uart2m0_ctsn */
+				<0 RK_PB3 5 &pcfg_pull_none>;
+		};
+		uart2m0_rtsn_pins: uart2m0-rtsn-pins {
+			rockchip,pins =
+				/* uart2m0_rtsn */
+				<0 RK_PB2 5 &pcfg_pull_none>;
+		};
+		uart2m1_xfer_pins: uart2m1-xfer-pins {
+			rockchip,pins =
+				/* uart2_rx_m1 */
+				<2 RK_PB1 1 &pcfg_pull_up>,
+				/* uart2_tx_m1 */
+				<2 RK_PB0 1 &pcfg_pull_up>;
+		};
+		uart2m1_ctsn_pins: uart2m1-ctsn-pins {
+			rockchip,pins =
+				/* uart2m1_ctsn */
+				<2 RK_PB3 1 &pcfg_pull_none>;
+		};
+		uart2m1_rtsn_pins: uart2m1-rtsn-pins {
+			rockchip,pins =
+				/* uart2m1_rtsn */
+				<2 RK_PB2 1 &pcfg_pull_none>;
+		};
+		uart2m2_xfer_pins: uart2m2-xfer-pins {
+			rockchip,pins =
+				/* uart2_rx_m2 */
+				<1 RK_PB6 3 &pcfg_pull_up>,
+				/* uart2_tx_m2 */
+				<1 RK_PB5 3 &pcfg_pull_up>;
+		};
+		uart2m2_ctsn_pins: uart2m2-ctsn-pins {
+			rockchip,pins =
+				/* uart2m2_ctsn */
+				<1 RK_PC0 3 &pcfg_pull_none>;
+		};
+		uart2m2_rtsn_pins: uart2m2-rtsn-pins {
+			rockchip,pins =
+				/* uart2m2_rtsn */
+				<1 RK_PB7 3 &pcfg_pull_none>;
+		};
+	};
+};
+
+&pinctrl {
+	sdmmc0 {
+		sdmmc0_clk_idle_pins: sdmmc0-clk-idle-pins {
+			rockchip,pins =
+				/* sdmmc0_clk */
+				<1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		sdmmc0_cmd_idle_pins: sdmmc0-cmd-idle-pins {
+			rockchip,pins =
+				/* sdmmc0_cmd */
+				<1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		sdmmc0_bus1_pins: sdmmc0-bus1-pins {
+			rockchip,pins =
+				/* sdmmc0_d0 */
+				<1 RK_PB0 1 &pcfg_pull_up_drv_level_2>;
+		};
+		sdmmc0_bus1_idle_pins: sdmmc0-bus1-idle-pins {
+			rockchip,pins =
+				/* sdmmc0_d0 */
+				<1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		sdmmc0_bus4_idle_pins: sdmmc0-bus4-idle-pins {
+			rockchip,pins =
+				/* sdmmc0_d0 */
+				<1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>,
+				/* sdmmc0_d1 */
+				<1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>,
+				/* sdmmc0_d2 */
+				<1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>,
+				/* sdmmc0_d3 */
+				<1 RK_PB3 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	sdmmc1 {
+		sdmmc1_bus1_pins: sdmmc1-bus1-pins {
+			rockchip,pins =
+				/* sdmmc1_d0 */
+				<2 RK_PA1 1 &pcfg_pull_up_drv_level_2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rv1103b.dtsi b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
new file mode 100644
index 000000000000..380637b63ef5
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
@@ -0,0 +1,266 @@
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
+	cru: clock-controller@20000000 {
+		compatible = "rockchip,rv1103b-cru";
+		reg = <0x20000000 0x81000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+
+		assigned-clocks = <&cru PLL_GPLL>, <&cru CLK_GPLL_DIV12>;
+		assigned-clock-rates = <1188000000>, <100000000>;
+	};
+
+	/*
+	 * Merge all GRF, each independent GRF offset is shown as bellow:
+	 * VEPU_GRF:		0x20100000
+	 * NPU_GRF:		0x20110000
+	 * VI_GRF:		0x20120000
+	 * CPU_GRF:		0x20130000
+	 * DDR_GRF:		0x20140000
+	 * SYS_GRF:		0x20150000
+	 * PMU_GRF:		0x20160000
+	 */
+	grf: syscon@20100000 {
+		compatible = "rockchip,rv1103b-grf", "syscon", "simple-mfd";
+		reg = <0x20100000 0x61000>;
+
+		reboot_mode: reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x60200>;
+		};
+	};
+
+	ioc: syscon@20170000 {
+		compatible = "rockchip,rv1103b-ioc", "syscon";
+		reg = <0x20170000 0x60000>;
+	};
+
+	gic: interrupt-controller@20411000 {
+		compatible = "arm,gic-400";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+
+		reg = <0x20411000 0x1000>,
+		      <0x20412000 0x2000>,
+		      <0x20414000 0x2000>,
+		      <0x20416000 0x2000>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	uart0: serial@20540000 {
+		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
+		reg = <0x20540000 0x100>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		clock-frequency = <24000000>;
+		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
+		clock-names = "baudclk", "apb_pclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart0m0_xfer_pins>;
+		status = "disabled";
+	};
+
+	sdmmc1: mmc@20650000 {
+		compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x20650000 0x4000>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SDMMC1>, <&cru CCLK_SDMMC1>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x100>;
+		max-frequency = <150000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc1_clk_pins &sdmmc1_cmd_pins &sdmmc1_bus4_pins>;
+		status = "disabled";
+	};
+
+	uart1: serial@20870000 {
+		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
+		reg = <0x20870000 0x100>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		clock-frequency = <24000000>;
+		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
+		clock-names = "baudclk", "apb_pclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart1m0_xfer_pins>;
+		status = "disabled";
+	};
+
+	uart2: serial@20880000 {
+		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
+		reg = <0x20880000 0x100>;
+		interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		clock-frequency = <24000000>;
+		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
+		clock-names = "baudclk", "apb_pclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart2m0_xfer_pins>;
+		status = "disabled";
+	};
+
+	wdt: watchdog@208d0000 {
+		compatible = "snps,dw-wdt";
+		reg = <0x208d0000 0x100>;
+		clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
+		clock-names = "tclk", "pclk";
+		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
+	sdmmc0: mmc@20d20000 {
+		compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x20d20000 0x4000>;
+		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SDMMC0>, <&cru CCLK_SDMMC0>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x100>;
+		max-frequency = <150000000>;
+		pinctrl-names = "normal", "idle";
+		pinctrl-0 = <&sdmmc0_det_pins
+			     &sdmmc0_clk_pins
+			     &sdmmc0_cmd_pins
+			     &sdmmc0_bus4_pins>;
+		pinctrl-1 = <&sdmmc0_det_pins
+			     &sdmmc0_clk_idle_pins
+			     &sdmmc0_cmd_idle_pins
+			     &sdmmc0_bus4_idle_pins>;
+		status = "disabled";
+	};
+
+	emmc: mmc@20d30000 {
+		compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x20d30000 0x4000>;
+		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_EMMC>, <&cru CCLK_EMMC>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x100>;
+		max-frequency = <150000000>;
+		status = "disabled";
+	};
+
+	fspi0: spi@20d40000 {
+		compatible = "rockchip,sfc";
+		reg = <0x20d40000 0x4000>;
+		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SFC_2X>, <&cru HCLK_SFC>;
+		clock-names = "clk_sfc", "hclk_sfc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	system_sram: sram@210f6000 {
+		compatible = "mmio-sram";
+		reg = <0x210f6000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x210f6000 0x8000>;
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
+			gpio-ranges = <&pinctrl 0 0 32>;
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
+			gpio-ranges = <&pinctrl 0 32 32>;
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
+			gpio-ranges = <&pinctrl 0 64 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+#include "rv1103b-pinctrl.dtsi"
-- 
2.34.1


