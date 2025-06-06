Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98116C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=; b=PX2awV/hoDB3M8hQjC27wXM0D6
	gBJDLOOBf9IX/AwQRZ0oZZI2Q22cFKqres+wS01X9lQqAnev2jfX5Ap1WIgs7t0VWex3/h2vSCw77
	MLk+cq4bKG1nmlYXg0ijT5rfn8b98HSJlTO2mIlfQ78KCwFLcfEgm0t5dcOX9MvspVkp++zTGV4u3
	76ECcKqOXXWh/cBFW/QHw3a5wMYyuuQIXyUwmq9JVHGwb5TtO/4MvpLw8ZZm78/eLotOUD/CSGuus
	WjUZB9mDjS2RpgJCOgjo70/rmfDgXPdxTRkN2eOsC1Q8B6q7m7V8UKaAvIwIC5x6RWcIXI7YxJzIR
	oKy8PC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQvl-0000000HF0m-2Tp7;
	Fri, 06 Jun 2025 06:51:57 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQZm-0000000HBtT-43EE;
	Fri, 06 Jun 2025 06:29:16 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad88d77314bso348353966b.1;
        Thu, 05 Jun 2025 23:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191354; x=1749796154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=OgVxUE7ICrQawVJeK7Aft8CWdxHwPE3nQv3WZPFGkffe35Godsw7jJ+aX3AwN+o2AV
         hL+Ac2B3+FbvfStiwhOE9GsQBb9CHs6s7LCzGNlD3P089Nvys63DUwOoInoQPR28fKcG
         rlNRx5EtgHlpKKR3Bv4GUfwalbgQJgi3ZNEJjjde11l9Xs+S0GgrCoAY0DNgo+Xrmbgx
         xGPGmktVG9A9B0WDoD0rGdZQYLljLOic75fZZkviZo1S1IpLvAxB2frGIkbdj4F0u/qT
         USo/64AoUlUhwHwGNR2pwzri9cbe3gudnj3yrJRJpj0Qwhm6Zm8oapRwVGoSblKt/cKd
         07Iw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Qsv2ezUuMu86PSaftAUCxBgpCSi3izYVJ6QIYo+JSDBvDmLDwooCTAWp5qjY8hXbtWsi6+P8x6+2a0DuAGI=@lists.infradead.org, AJvYcCXkV7o0V8yx/lqCTS6log4piIuOfKD2d4XyKRtPuoFdPx8g8QKi5IzskJDTqscu6/ij40qdOG+NQqZ8oS7lhs61@lists.infradead.org
X-Gm-Message-State: AOJu0YwU4xPSmLTFKe1fAItDs+Usjz+ccJ1Tdy/vGxViWiWYJiOgqVFG
	0HpST5o1VtOq3rEINcR/FclOmipDnptt1FvdA0OXv08CLaslMY9CCuwU
X-Gm-Gg: ASbGncsbg8cCxpTe1dyDAabAYZQeu8iUJkkFkXIiWuoM+BzTKl0ZLI17eg0QVra4Jx9
	AkPR3QNTc9asZxtO/4sTupiGCdK3fpoLadg+hjT5KPlVArvRowNCO/gG3mw5VSn6KBHytzEAmrz
	kJlOQITqsfcYmAONmIw8ScfGquFLz+7K+Hpr8xMLVR0042otYYT5F92DDkDznT2oWYpCEqxnZ2B
	W6LDwhp5cbsR/d8qeqiYvE0BmrGKJzriJdlwr9vOXPmR4EM+1Tsfri1IvDbeskyjo1h9kgsJh5G
	/Zr3IWxWqyD6sGpk4aalFZySpeK6lm8azlBcHHfk4+HDpXt5xTETXJ+Q73aFQcP2MH9zVIQqKyg
	aTTs3EzZIhfT5d3yG7Ewx
X-Google-Smtp-Source: AGHT+IEQhHpZGVCxH1ZaUqlfgXtzTnbNuSiyE94GQATLfAusLPGKyuMEVAdsVmPX89pYi5j539z3bQ==
X-Received: by 2002:a17:907:94c8:b0:ad5:55db:e413 with SMTP id a640c23a62f3a-ade1a9248d4mr174784266b.26.1749191353364;
        Thu, 05 Jun 2025 23:29:13 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:30 +0200
Subject: [PATCH v7 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-10-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_232915_000236_892F79E6 
X-CRM114-Status: GOOD (  11.40  )
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


