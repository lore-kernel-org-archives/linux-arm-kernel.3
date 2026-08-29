Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39943C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFDWFiuHAiIqLz4eQ4QEpgbBiAo3LhkOv1R/Digehgk=; b=U3seVX/SfBkZyih090ueFQgIib
	UsaeK+her0BDJPGo5IhOMWlr5QnfZusrqGqSkuR9Aehx0rG4WzYowPqLmTRFdZnTfsHBTQ06WiTV6
	C5waopeVqgoCZDllXhHK++2uEWQnsSJ4fKrQj0i7wZDtDwIT1atuOW0PrJrI8a6WRlih0WSdt5az0
	mEIiNml+cH0OQDDp+60qP6aX28ZVdw757ab+CuvxktGFXSyPI4Ym4/z+z1w8Q3SRdTaE/SbhOz1FW
	pptKX8sDeD69uXxD6yriKlzopxCr27DG0CVXlcso1J47+MKs5LHiAqYpE+8VbMf/wR7fnCYwFu0FP
	WMt9RQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfX-00000006tjM-49Qc;
	Sat, 29 Aug 2026 09:48:11 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfQ-00000006teq-2UUo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:05 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e4998d28so1251841f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 02:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFDWFiuHAiIqLz4eQ4QEpgbBiAo3LhkOv1R/Digehgk=;
        b=K9uhdGY0Z5ntQiw6VW7LA0zooPYxnphGynW3rYgG/QccPBU02PBMtOGAlfLSaefRCP
         z0mIxdMH2n/It8JW6LuHvfGeXyu1MIZJMigEWPT+w2cjv9VdO1Qd+eWrk0foIUkVti0W
         kqPnXYy2BzIZ8pQ2h7XRoAD81oN/Ao6a3spVSfDcCYKCLVd/m9kzh9MkL0h4NHDwuVlk
         0X5a9H6pMoF5ZpiLiFIv0gy8hdWluO6FutPb6WKPBEpp2rNmDnORJ8aHHUYfoMFMMl8R
         YlTDGOPnpnctfXOM3IM3al0Q+hI7FsXWW8VhjU96eihzuFRnVZuDD1ABeBAgSKKGg4WZ
         2gjA==
X-Forwarded-Encrypted: i=1; AKwUvBw42kpSBF4be1CmRNEzKMpNXgJ01lfih3qrqExDSZg7YXSLECf+5h0lE8ECTUi210LksuPUpWQHohXVczwto1kp@lists.infradead.org
X-Gm-Message-State: AFuF++mULQtqQ8zi3+BWQVgQXToIvaGOec5TBXybeHi7ulP2AjTyrJxe
	IDXxeuiRAQlf1DrgKbk9Dd0HHJ/LQI9eDsU7ffcIiK4uHldNzn8kbFhd
X-Gm-Gg: AYBFou0e92BO+UmxLvoC0ehrtJRnRKSNnf7VuJ8OCt4Unz50ltOxKO0o42BFI73+00G
	ycz9R5P8c3+gsqg0ay5/4zYE0SZO5lctARp0pjTCwPJsl5uqDOIeWq1kA9hqjAIBrErSo7BN+1o
	nfmrUNAEfJHLP6FPI3jvd3qRjF9TpY6aQrdxGjOkZZhd7MBKfh4f/nWIASsf4q+fUaGRbflR8LO
	C3K8nZHbrolC7Df9c9Eh6kaBbeydFlxvZTxUMXHsqLMt6zLjU1mdSWTSeS7kglabXRQ+/xu21ac
	sUOOjftJzcFfEmAkCewD8mJfAKatJVsksGwJ+DAsB6YG1u+VwuotBNXoqKs+avVtA+t5i802duK
	EwKEVMfH8Up3UKrBTDxMqIxU0+iAFE2DX19047wBx3OJN4vaRs2b2zZs9y4LQnyHgRMwer9jWRM
	jutq83MOLjjLhVg0IQ0ZiKo3oyCeQn83T6wSUhUfAfFv5N+/xtIU3Gk5dng0Cb6zIwifYpyaasV
	77uWKtUz5fR6kuGG6yuwRdYP+A=
X-Received: by 2002:a5d:5e8d:0:b0:484:3317:a00 with SMTP id ffacd0b85a97d-48433170b94mr2419990f8f.23.1787996882612;
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
Date: Sat, 29 Aug 2026 10:47:57 +0100
Message-ID: <20260829094758.23248-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024804_654393_E91BFF6E 
X-CRM114-Status: GOOD (  13.10  )
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

The board powers its two CPU clusters, the GPU, the NPU, the memory and
the always-on domain from regulators steered by PWM outputs. None of
them were described, so Linux treated those outputs as unused and
switched them off part way through boot. The supplies then drifted away
from the levels the bootloader had set, which showed up as random hangs
and memory corruption.

Describe each supply so it has an owner and is left alone.

The voltage ranges are read off the feedback networks on the board
schematic. VDDNPU is deliberately not the range in Amlogic's own
device tree: this board fits a different feedback resistor, which
puts it about 40mV higher at both ends.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c94afaaf8826..77abfd555ec5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -104,6 +104,66 @@ vcc5v0_usb: regulator-vcc-usb {
 		enable-active-high;
 	};
 
+	vdd_ddr: regulator-vddddr {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDDDR";
+		regulator-min-microvolt = <690000>;
+		regulator-max-microvolt = <890000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_gh 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_ee: regulator-vddee {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDEE";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <922000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ab 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_gpu: regulator-vddgpu {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDGPU";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <922000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ef 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_npu: regulator-vddnpu {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDNPU";
+		regulator-min-microvolt = <733000>;
+		regulator-max-microvolt = <933000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ef 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
@@ -122,6 +182,36 @@ vddao_3v3: regulator-vddao-3v3 {
 		regulator-always-on;
 	};
 
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_cd 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ab 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddio_1v8: regulator-vddio-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_1V8";
@@ -172,9 +262,27 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_a_pins>, <&pwm_ao_b_pins>;
+	pinctrl-names = "default";
+};
+
 &pwm_ao_cd {
 	status = "okay";
-	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-0 = <&pwm_ao_c_d_pins>, <&pwm_ao_d_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ao_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_e_pins>, <&pwm_ao_f_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ao_gh {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_g_e_pins>;
 	pinctrl-names = "default";
 };
 
-- 
2.55.0


