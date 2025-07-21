Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3AEC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyYROlBQpaQA9CwEtQJyumLb2Se+Dm1/eLYmwuEMq1o=; b=JYmrJLuPbNNlrQIEVWzA0GlPgD
	Gkkq2dn5T72my7rW6obiwSU6BjA8gw0xPhlxKwjNz7V8UrSjQrgJFhiyoIwnkYWTCbejIi1dtZ9if
	d49rBpbyr7FVcd+RxjTWP9IhOiFROF7GoQ1+zUMtNLciY2X3MuDM1vNceHdpwZflzvDoHm2UR8/j9
	BccikP33AzjrQBROSIcDTjujIWkaLxPGHC70gPIMTW/kznCBCzyepjPk9I9MHDXXKcHT5CNdvBSwl
	equ8S3AagH7/gtA/MFEm4j3GIpOLQZRVHC/OF49isIOriDSuZGi47xiysFvsqu/1VrePbaE81pGou
	ju4NSwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnVH-0000000GvcX-3AnL;
	Mon, 21 Jul 2025 10:12:15 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmfE-0000000GmRM-2d0Y;
	Mon, 21 Jul 2025 09:18:29 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so671604766b.2;
        Mon, 21 Jul 2025 02:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089507; x=1753694307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyYROlBQpaQA9CwEtQJyumLb2Se+Dm1/eLYmwuEMq1o=;
        b=nXLD4QzgKs7ATd2C473G+URlejOtaLJUoinnAcMptIGX8LE4cuG5axaeLjT6PKcs8G
         plJdxZk6DLNQUQ+KFq81VWMWQW5iTRhW1jedJ6GVS8X0hhK9+NGJiMsZcpyONJMXoSfh
         rlFA2ct3mHztDoQXSc0QsgNyDO1oLdOb3o/RARbrFjiX4sqP8lcEYvsx9TnSBjP+85op
         DColLVY9WMjW60R+1I/pwC4RljyrDMysFj1BEOB5GhNepMii8vH3zLkt9vwkk2tScRGQ
         rJPMRoxFQE34f4lAyB+RX7gZnmAEHLEvJvtzQI6Hc63w7eSBDLTFkNHDhQtcDWoFVbHe
         Jkzg==
X-Forwarded-Encrypted: i=1; AJvYcCWKBXt7I8469ygGHmLgiy6MWhYLRIxfH0i3LaOyoGy1tCU9W13AZIfTucMywRIxmmMsbUTqwl/JdZPaM7rHoT8=@lists.infradead.org, AJvYcCXbr/zR0d3y1HtaeOGPY6fowQsp3EWQ4mz7uBxTpKMcdqnOniAh7m5BW1BjlEXUNS+uCN6r+o+ptLHVc/2ZmW1n@lists.infradead.org
X-Gm-Message-State: AOJu0YzvRppz1dIWd/M21gdiI+QThYg6T4ynsE4X7TRW0ncnjEpYHvPQ
	zuyKgGymknmGEAIW7sGHFDY3gII3ezbFw+mSn2FfQgLJg1pMvytpuYfu
X-Gm-Gg: ASbGncuEBv547cMiVJQVft8/ubpZQ/Syae8YWaH5vJI5buN9UCoZD4UNDha2KM67IVI
	gbMr3oFcZcaQXlkQYX9AEo01BZfetg9/EkJbMcIGb1BNIjPAiReT5rcqCPIC8BxbhojTIHQfR9j
	lH0MrzJbqxnkjqcgMoB1B54ZXBXqGJOnoG4V05A1ztyKsbku4QPZ4TimWBzppsZQQHqEZRjuOJR
	07p0vl8u3PFAvI6/TB0te+LA4g4FhszpE6Fqb1Pqo/6kCUQYjVGRGIhITEMRdwHRDtRxjLXst3+
	cS0Uo9fZ4zsw2BAMYPoGxGDLD8Of1tDupNFCZoaCYEIEIbNJymb2ZGsRnh940+36MD+scLd9XPc
	422USPi6/Jb4fQqxAa/Uc3XC72+pRH267Kmv5VObjL00Ex3s2kGuBTQI6
X-Google-Smtp-Source: AGHT+IGLjyUKAxgg6t7I154f+BsmQXn5G2xI2hCpG0zZ9fD3Tr+3hSJlZ3Fv9sf5iHBEa2ta4Q/EoQ==
X-Received: by 2002:a17:907:1b93:b0:ae3:6d27:5246 with SMTP id a640c23a62f3a-ae9c9b72f65mr1263912966b.48.1753089506882;
        Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:37 +0200
Subject: [PATCH v9 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-10-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_021828_680298_BB0A813C 
X-CRM114-Status: GOOD (  11.49  )
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

v8:
- Remove notion of top core (Robin Murphy)

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..a1f3571b177fe00b1c169f62b7dd1d27024a663f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -309,6 +309,29 @@ regulator-state-mem {
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
+		regulator-enable-ramp-delay = <500>;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		 };
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -433,6 +456,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -487,6 +514,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_0 {
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
+&rknn_mmu_0 {
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
2.50.0


