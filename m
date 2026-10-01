Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EE0CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXgwDcjt3oL3FBnIimeVJTsO9Athy2H48105XxaThRA=; b=RfPIY/YKRDEj/XNqEdiVT7uPCN
	dBDNmNYXogItH3ktIJPCMpGa2IHZl+wsU/uD+JQ7Tq25R7IRywojKA8V/V45QqOrDhFisCKOfWJ7E
	2OI9xKUyQ0Txumx62axN2m+FeIdYs4PBLSLllPyJENmQWgI5qsD95VOqSd09RtPcasCsUVAkoJC5j
	SJGEyrXFWPlR/p82kYbIyCM1QB5aT63QnVAsfLat/tEBn2uce68pFo21XFbBQM24UH4DnCKQuypMY
	meyUq2xgB3ltNZ+ubCvAvZPjAEKN4EssBZyLjkDuiFVKdAzRSii5pVrWKpzFo6cIb70DIjNYFTglk
	8EtNZ9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Aw-00000007e3V-3mFX;
	Thu, 01 Oct 2026 03:09:38 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Ae-00000007dyB-42ZI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:09:22 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so33527645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824159; x=1791428959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXgwDcjt3oL3FBnIimeVJTsO9Athy2H48105XxaThRA=;
        b=uYDvMvwJ3U6gve0D9sasC5hiMwQKjMnLNeMO99sbxSWc3uBV0Kd7OpVYis3TFqKQjP
         Bg4bSjmXqOt6i+h5khv0BeOjafdyk8fBmq3kmwF6R5Q6UeeqqhLBy4chEcCACyH0FSml
         a6uk8FGI3ELhd9Ajsd5I9HMPRCOJsJbQQ6VZhx3ZNV8VmF8SlPqTT1ZU2oxw0P3LbNAn
         THN0X6U6J1tJ5qaj2tt7X5h0pHsW7rL5yMkJWWKXloJ/3bpBF/HMQNgQlR6Zcgi5hptP
         /BfW8Qk9UmqkxnhE4an6a/s2YSkHI6aFM9YwYrtFvwknHZrmTOyf+76GYKRDA+4yAa/h
         rFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824159; x=1791428959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXgwDcjt3oL3FBnIimeVJTsO9Athy2H48105XxaThRA=;
        b=rSGvzdQLlqPMK/1eLL8ndGT8DQLMY8FthAeXra7MrDxZw4y+SU1UqWX4udXLh7v2ZV
         CQFdyvZUD7Jfv794hLQavETTf09UpqFDVH6ux2V6amplP1L4i1dT1sxooO1Nk5HGlq1I
         uegtvLU8vMFWvmlTcXUbWC4dLBcFooNuw06GeJ+hWfP2pWpV9BaHDWBognMi0hPGEv62
         JGGdE34PFChegAV3gbmMn+wh6BnTJMbf/23PewgkcqwWn/8h1tC1sLQPzXGGST1dL6LN
         xpvKusZlNv63QVd5kPPsL0+4HkhK7GxP4Pe2CagpMi5otpOZLQXq+0//ZEfVl8gZjn2z
         jCHA==
X-Forwarded-Encrypted: i=1; AKwUvBzRW2SlKEMrD7G4ZHDaU8NMIUAc/gXdwuwVoGuz7fVNst1ac6fbYx79CrAXz1MNStRXTUb+o5HWOkA1JBdAcfw0@lists.infradead.org
X-Gm-Message-State: AFuF++le6AHsoEVM5Nauvw0akP2iaKaE6PDMUz94kj3WGqqBRGVfjTtA
	U4hQhCQ9yZzzI3OWECINFSzcO2xhgiqddwv3mRlJTdMM9Fd20xZ8NrSN2k1i0gCPwPE=
X-Gm-Gg: AYBFou3fp1n+p5JKXAvn5var24WcO6zZoppCPOvMnuAal/iGJVGJEu4ICLg+S8hjIy9
	spS0wuhPvbGmBDtVtyYZxa8wz/iOvJ1QuY+oZYWM5KUbLuxjrYNT7audYp2b7bI1GzdN9H+aAnM
	4r0Cf9w7ghegD1Nt+0ALjLhJjzZ34O9GHImMAIrseIydtmbb76jrsdR7LumvdpNlYV3okA2NDho
	PhYmr9h3EfOjwgpP7l7NUtmCcZGoYa0vbPVRReAgGlIgCHnYu7z4nF/amJi9bBERSVJtXHUnF+c
	yHyevdxUUVJchHvbKi83jfn3qzj+SJ3Kbwyo0QP1jdjUagrp8zdT3YFvewhV/5mmwhMaEppB45A
	ujdghdsK7t6VM9ceHZwpKhQR6IOMyZRXLV3PtkRC7XxHFTeic5b5zmrFgdlgB1oSMlGLhQarb9B
	B4OpAAJAIpTlVAOUd2/2qK7Eq3NZBD/q/Jp48qtAFlxQbpsib166BlXGI/cF9Mznk3VM6e8RImX
	6MPYO0oXRqCzYGbzMqx1NOK1RbSETCXFu4rbrbimeqS5X90RS5AdLnPRFPe/YcKjP2/Hn1y
X-Received: by 2002:a05:600c:8b5b:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-4a01b12055amr52287295e9.25.1790824159423;
        Wed, 30 Sep 2026 20:09:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:15 +0100
Subject: [PATCH 4/4] arm64: dts: exynos850-e850-96: add soc thermistor node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_200921_046501_52D84B89 
X-CRM114-Status: GOOD (  12.43  )
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

The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
near the SoC package die and connected to channel 0 of the CMGP ADC.

Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
add the board-level thermistor node linked to channel 0 of exynos_adc.
Regulator is represented as a dummy one because we lack PMIC support and
should be replaced with a real one when PMIC support will be implemented.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index afef32ad4ee2..1abae8b9fa49 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
 		regulator-name = "dummy_reg";
 	};
 
+	/* TODO: Remove this once PMIC is implemented  */
+	vdd_1v8_dummy: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dummy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usb_host_vbus: regulator-1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_host_vbus";
@@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	thermistor-soc {
+		compatible = "murata,ncp03wf104";
+		pullup-uv = <1800000>;
+		pullup-ohm = <100000>;
+		pulldown-ohm = <0>;
+		io-channels = <&exynos_adc 0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
+&exynos_adc {
+	status = "okay";
+	vdd-supply = <&vdd_1v8_dummy>;
 };
 
 &cmu_hsi {

-- 
2.51.0


