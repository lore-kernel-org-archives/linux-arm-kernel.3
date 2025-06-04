Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=; b=gouVlJbZT8A2SVG3/Z1vfQlwEV
	CWHI5Z4H26EXfwPxWVjcxEElfbCAs2QCuHl0MKh0M5UEO/ogVuc+mbVM587pPK4tomab/Vm3mm7vx
	GDWmnUFfs4TMi9iNY6Ims4TSbiGsnSjEMwb8mJTpuP8QtQ0HEGmYbXNzh6RXgGtV8/zPLJgDeERjm
	enlDqJFIDoP1yAkWVN7HtopJSflwWc0cvOLSStwdaOS5LYsLlZsttw4xajdnG+IAL+fE0t4nuGDf4
	XZxc9HrHGYpfgGLU920MJ5SoaTD8XpHWey0rFxXW20fl/DN6bqC/Hg8c7ANkKv4dvvZp1xEVGDQKO
	wGIBeQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjKv-0000000CsDx-1NvV;
	Wed, 04 Jun 2025 08:19:01 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj0I-0000000Cod3-02Jo;
	Wed, 04 Jun 2025 07:57:43 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so11472627a12.3;
        Wed, 04 Jun 2025 00:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023861; x=1749628661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=LHs+IiuVcutNva6v8N3zgwvWG4MDVsns5dAXyg3UBXVYbK7drqeAFwUgaEtz4yKTSH
         MqVpMru1+xC6zkUWQe6wDiHvVoE3TdqWGJH+6dVwW52zfVGJXmY29DoXfGQaqzjR0HFa
         hpqIEL9qHLde/YUF/IBmMqmFL6rQ0df67gaVJpt3rhYKsg2TSQXZiENbP+zlf7gF6c8q
         r33wnB5PdqpXTayvOPJaGJB7x8YK266UBkRWHHzvidvsLng8aRmCg+WDpUJfQEmFp1wr
         xjVyFKmENGiU7YEXJ8AANLKXChO65eANmSB9Zdq7OxHbIk4UQfhiEge+iDXA9U7ykRyl
         5q0g==
X-Forwarded-Encrypted: i=1; AJvYcCXcz404SHxteFzGFv8hnOT4Cvc8rzVsGlrVtjLIxfZUZEQymeblOOPvhNfKex31yzVlHme84B51WPfk4r81PSo=@lists.infradead.org, AJvYcCXlgbhsERYfFvV7r9ZLvGdqW3tiQucLWYp4+2xcrcPLFN4CnFyCRMSkjPX2O0pPQzk+VEhL7XEqVGuuILYcVEqO@lists.infradead.org
X-Gm-Message-State: AOJu0YyItfBgVhiwlxJZyEELc/Bi88kuJJCzgVJqG9gS0kEXtBln94Bi
	MorZKGT7pbv5GlWrt8n4Mp6pHQQBKBHa0YOCsk3VPOim04yHEntAHOaPQc/3xAzT
X-Gm-Gg: ASbGncvU8NnTzS6+u/V+qU0JShv8kJ1kN6ORHvFnihVT3UsKNzJWQUw94Eywv8btvSi
	KdQM8eqPiv1/tWaM+aXU0zCiBcPskPz1KJh7NivMlsLfIaAAEhC2VLKc8mfNcpA1OCQqab1PH0R
	im15S2wgXpqZanIhCRon+sKC4RF1UI0FIEFRxx32nCvtJJlAcWSwn8RaLrdfRII2mGYLl2d2Arj
	Mw7219f9xMnQLGxaciiepopdRPSBp5Hnndftt2rT8Q3ugtwMWC4CGtPNvSM0IVlApvAuVMj2Q89
	xv9jobk/hvIysktJmCfQnUoihboR0jW8VqARKM0Li8HDOEHbw1m3k3HzjYakNI5XKUXV6pYkSwj
	O4uChBo3vQQ==
X-Google-Smtp-Source: AGHT+IEdWWoFUq/i9FS76C9R6P00UBxKykLRi5OkyXWDWifwVDn9o0aBT66QEk8p9MYrjo3JtwHUSA==
X-Received: by 2002:a05:6402:234e:b0:602:c6a3:3f6 with SMTP id 4fb4d7f45d1cf-606e966e9b0mr2028441a12.13.1749023860547;
        Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:23 +0200
Subject: [PATCH v6 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-10-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005742_056660_B0CAE27A 
X-CRM114-Status: GOOD (  12.03  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU on the ROCK5B uses the same regulator for both the sram-supply
and the npu's supply. Add this regulator, and enable all the NPU bits.
Also add the regulator as a domain-supply to the pd_npu power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1997e9e53a01d84973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -316,6 +316,28 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -440,6 +462,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -500,6 +526,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0


