Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A48C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=; b=x6oOluBwwDLaiBnG8bZCOsKE3Y
	IY/Y3+Q40bz87o7cJHqvKYEa3rKCIom60JllOJJ71KN4G4qm6Y84YFjx1FQGioa5GnCzSnnijEFhg
	aZaqpsG8FTy6dcoUAQAd0TEheMkl6Wl5VEbzLyDLtwkgM5y4BXcywrt0ABIG1N/PqAeJ94Oqsqk/d
	LvlohLADhkjJJP3/xp4FAP13tW/cbCyF5HvVZHnhQlaJq+8PnbzV3jNxhqkVloBgPagR4JF+sMfh7
	Se1UALnrw+BWpSu3Pf6Oji3IKJULg+IJZPtvo6EPqRTnB3cqHwjqDBXUn8YKW/E/YhPPLZYstCoYN
	mfpKgp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyhq-000000049Kb-2gky;
	Fri, 16 May 2025 17:18:46 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyJh-000000044gA-3uhC;
	Fri, 16 May 2025 16:53:51 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf680d351so20264805e9.0;
        Fri, 16 May 2025 09:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414428; x=1748019228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=Q3ezBDJYjuRpM1qAHGlc7joNOli30qORIbT4y7uNUtjeGem/54OSuwB7RASOmYn9ws
         m37WR3QOUbqox00+Kk/rbH592Q8bw01BUWo6vmwbwXe90ZN9XobGQyI+QVTLg+DIRf+q
         YMAqAATYIl8wZHybYDoy7j3iWvOA/0fZ2IX7M1aKVY1cT8uCMdnWVKzbdVG1mkuCNWrT
         qeTv0YzKii8fcdOcXMqo3Z65ATauXXr43VMLUBWwZIzFnwqyiJKJo6YvLLvk0SSzHJ58
         UvBB19Ufl98q9Cs26noliGQ6ouNafcZKaeU0ZoH0G00pz03m7TXtP5YmVckHFohpTqIO
         X+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOH6sKRh9zdcHdCtuPMiAcsJ9WaBXZh1tll7LSoRoC0BtvzJ+QK9dlb4dn62wT/fmLACsaPdYsQ9cRHk9ziYg=@lists.infradead.org, AJvYcCXIS97i8WqKh4iCdFExdHy5DZp8p6kTutYjb5lu3IGCM73zhnhYxpP4RZfPB/GSFRTF784UZAuTIxcZihqARsyh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8eMFBAn9ha+xEzwQjGGlZpQa1hL0zaXIHrY87s/+WTUU1mAE
	YyJt+EHmvQmH3HzpwW7fFok9h5GGsLY+sHqMXlQvK5+KfbuIcYHKwRB9
X-Gm-Gg: ASbGnctKHAUlaDwlP/vQ49Zj7KjBcRQtD4iJfVcX66vBYCM4c3vPfJz+MvvhMcR/Moh
	xAulT81W4b5K9edp9OLABVkwsWzjebRaEvZFP+VTKvzei8IUnQX8d8XxKh0CWDVNHv6Rb1RvTOn
	XRzCUwVXx92uHQBaTNqwe+JwKacJXT6Y0zXh50dwFGFgOW3REJhDvxy75t1FubfHtCY9s5mUxMo
	JuAYDKTVI6s/L+l11MxYUN+Tfv/LcKpi8MmE0QcKsxtlX6fUNgSUopZGqDppnGy770AUPRgr3ZJ
	GCod8vATb9uA8obRL+xqSM6k+KwjFeiVXx0uxMka03d8n9rTXb86wTajpU1ben98Uocfh01cD+y
	68uFGlKLM0A==
X-Google-Smtp-Source: AGHT+IEYfDmifEa0iTxLazrxFoXXzBf3KmDVOnp4+FnO5DW5ap6WM75YN8wmhjMrbGLA/7/G7xIfqw==
X-Received: by 2002:a05:600c:5012:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-442f84d5511mr89042655e9.7.1747414428190;
        Fri, 16 May 2025 09:53:48 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:46 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:24 +0200
Subject: [PATCH v3 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-10-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_095349_984774_462D33E8 
X-CRM114-Status: GOOD (  11.73  )
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


