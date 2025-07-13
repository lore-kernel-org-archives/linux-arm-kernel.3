Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08212C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeyMo4Jt7UfkzhL/r2KfmA979+uFc7fR7QoglkpcpSU=; b=ugxfQB9LOhZi7bEobszAfg/h/5
	JTKlUcXH26ZFg9ElpDfUeCa/J08ip9WDJb3v95kcgOUxgk843Vd6WwagdHzBJ/q0Me0r2MfPWPS4c
	AoIvTqzIxw73+cg0G6u6a0/lTTZx+VAbl6eeYS3iB+taOrCBIHuIU96iztYykYxRirtduj12oQXex
	JkxEZRtZ3NHUm3NlNSRKYvANSCOlFSx4RBf0AHQHrHSdhFaDhZnE8u/P3mMG3HfXDwv8tyegqKeyh
	UHiyoAKyegsON+5+gPbjdggaZbfCBfQw81/pw7L4TTyuLFUcajxTZOjLmAFDKXp4c1CJ7jwg0mDOx
	xz/37x7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasmz-0000000HayB-3fk8;
	Sun, 13 Jul 2025 09:14:29 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasF2-0000000HXJB-3WH1;
	Sun, 13 Jul 2025 08:39:25 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so597462466b.2;
        Sun, 13 Jul 2025 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395963; x=1753000763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeyMo4Jt7UfkzhL/r2KfmA979+uFc7fR7QoglkpcpSU=;
        b=T8NUYKRBDCe8qmwhzXQqqD0Y+KBfOFwN2f/n2LrUD/5teqmhLtomh6VS9838ecrXOw
         s/iD16rCcuRR8PZbYzdGD/g916viGlqgIAuRoW1Y0KLSUK6SF0zlW+70Hfvts6NwCI2u
         FlC6/B5DSiyy3oDAyvt8hbgZ3NuSbc/tEgf1BXqKjNFgOQdI6KKgru/iHlDBORahYNYC
         z4FoXiWvOvXXnOJPAYpYHtPmHkXsw4L7SYSnKz1gtB8Uv+Vj6SmM0/EflOEqo4mBfAL5
         lXzMAfO/EatwnAoM2raJ3dgeBRaugdVSywIKKARNCIbNCQdlkZVFdmpB6YputCxPQjrO
         ZCoA==
X-Forwarded-Encrypted: i=1; AJvYcCWcjKeNYSJD/rp2jBet7yhvoNWWR29G9/hsyT3TVNQ0QBeMZxFlCSbpxnf4mFuLc90iy0Lf8D4U/WqaqT43mWqF@lists.infradead.org, AJvYcCWjn+sihN4aRTrq/niyrUcUzRFKjh82H2YIe1s5YAhaJQBcsqlG8bxPmSdUMAiehJCa8DjtF7t43znGAKjeb/0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMsAg+Z/aotnI1WQ/tessmu6EIOOtwXYfJro8EyDKxPJ1cWLBR
	zgvU3C3ScMLwIQudwudlhOsd96kjsrewlrJHhmpvPHhMKquE1E6rXK5HZA/Oa37Q
X-Gm-Gg: ASbGncune2PzkR8IzO6i1lDqlHmsnLMDsVx6EH9EOftgz/XXUnIQwyVd9rJXZi13/e7
	zC5akSiF0frrEECuKxOTz/DsMye2EFlVmsB5qX3u/DsWBmm+t0MU0BYf4BeC0zSIN7BmQjJmfD8
	DH6toy3TAYx7pcJKToggvNHZKDjJBwAc84+NIUhV/caER/Qt4n7hyEl72ZCzcBOpPkzicqx2wrF
	qB//Mg7xKn8fzWLocXpUEBEbv3ymvCdx55lbUh3DuHaMRvMyB3X0uSiDC5q522bRphI2sulzV8E
	X7HKPaNxnjpdfny6AoYgrcWrJQAQtOxitfUjT7fSvRTp9nSSwky/0HJ8BKoZbVsrlP4VNyu2nu0
	jZvwoQGD03WPb39PUZCTY5o64uniONny1lkXDN+dwtW+eXvZ3kyoqJ+7g
X-Google-Smtp-Source: AGHT+IHxIHGjEkE5SiJCVQleLSfE7Ew8CiAdy3INMXoGnJecgmb8mpelQgFGDmsS+2hlzLznSM+Hlw==
X-Received: by 2002:a17:907:803:b0:add:ede0:b9c4 with SMTP id a640c23a62f3a-ae6fc0c3696mr934268766b.42.1752395963198;
        Sun, 13 Jul 2025 01:39:23 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:22 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:39:00 +0200
Subject: [PATCH v8 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-10-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250713_013924_882277_B196104A 
X-CRM114-Status: GOOD (  11.10  )
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
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..06f73f16901026485c02cecf9176d0d7dc7a021a 100644
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
2.50.0


