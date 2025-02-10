Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25CDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucIIiCS0ueGRQyU8ONCC0RQdQE11PYRCusiobKkbAOI=; b=W91ge/wnZpQep07maQGaArc6DG
	XRPNfiM/n69mYEZ/VmA8gnCDpwJHIuL0wYHQWZpiI2p0YIoX1HmgjpWqxiFJL3FeKOnBcBQnmKXJR
	GhjoOOf/hGSJ5RGztgzmBeSG6eaEO8xtZQSSFCi5fGkMoc1vreRR7f9aWH/87B08AOGy4A1GRhwoU
	skfIyQRGwUTR0oiTkwP7WtPyCbaTFAJLiERFOFu00ocPd++rsDv4B6v9Whq0dZE632ptgJI4Xzb/Q
	HJGrPX3qIXNc99vMWIfDR98aBkbylQ1vMv0sMVQYrH07zMt3D/KfDoR5cKpIJgUtdwETxKj4Wo/H2
	vwW9lwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQDt-0000000Gqdg-3sAO;
	Mon, 10 Feb 2025 09:37:01 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ8V-0000000GpLs-1ZeW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:31:28 +0000
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30227c56b11so44492111fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179885; x=1739784685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucIIiCS0ueGRQyU8ONCC0RQdQE11PYRCusiobKkbAOI=;
        b=wGOWE7OMb1QBPlwYACWcZDKVoSwaSTLMFgvG9WcPtNCH1YvllKZLwkLmbvmlnSbAdU
         Rb5wyUnbArLdWcMxgNSMo4oeAerLF8rPJYZSuEpKZdJu/MQDQQRWqrHshew+2saIleuy
         EjELFCQxhv3nJPi07pM/UFZLlXx25mYqhUaevvNJU0IDLsXt2Fd7olQN1KFcq67ofomp
         A2nXjZ1OtJPmpIlHBDinLRWVVMehFxFXLnZ07YWWzLBShEIl4YAcNc6hmI8z3djLTy+y
         sQRUJRlNBrrTxmLQEZNHFkBI10FGtad9/JJ9io+KBxWd5O4DjtZ6gMuSkauhXAW+QjDA
         Q95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179885; x=1739784685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucIIiCS0ueGRQyU8ONCC0RQdQE11PYRCusiobKkbAOI=;
        b=GaqU4tPb6aUiHO6Vjgph2aafw7lTLEEo/vlDlEdpW4+GnOK84IBg17qmxPg0FHKrbu
         YtggnrxEC7cbs7fD3Ptvq9UJsvZFg9r0dte3ybBX9qFFMrycsbvvoSOfqIcwzPWmMfMr
         MLoH1x7sahQxxDCWigQEahFZ6u3VLE6gBR7iyPdg+UeeGVZcPwjWDVB1/Fa2QlBb6iY9
         Wr4w2rzVK7+jw8JFp79k3w8AQ/NTnDwqEWkOLiHbbPH8Zhm5KeZ3BTrlLozdf3aLAcAp
         x7Poq/4v8SJShRgGxhewdXb1NLk7/RiRzPdoJcqKXYAp++A8msGeNOCO0PmQFDXf3PCj
         bicQ==
X-Gm-Message-State: AOJu0YynJldFkIRN//Z5tujJ5ar7sdWwDVEHkI5tnxod/J7DJJXED4g8
	b9G9GPQduuYsIlSzGLT22U+7jDeTi3VfTZkHGUx5pkyR5z8OAuOj/IwalNNt1Jk=
X-Gm-Gg: ASbGncu3lF9rdShDy4I3YBTvyKi9rZoM+v7G08Buth0kWokbBFAX4ZfRPb0w/3Hfp3v
	QRy63ZwP2wDrqdU8Zp1AgCi3XKISQ3tZT0ugS59xH5tmMh85vqphQa+2yYvXXobnnN4FxP9LGOi
	aPz5XHhS8MBQTN1c/4qEka4Kpl3TmkfpeFjDrezWDWaHmC1Y6kNhzuUQ5kkScGFRMD/lq9LNNPx
	oxHMuIoJz4JJ9Wcjr85fuIKIKmhjo7kP7ubMCZ3hLrI/dKU310cW/7DwUCdI1UOBBuF2N+YV8aU
	xzVE+tfMd52Y/5Zk6cEmy6JqVQ==
X-Google-Smtp-Source: AGHT+IFtvwueQ7c+e3PaLKf98HVOX1kUVt+8R0wzkEbCYyYeWULHWatmu5uSjWQeTxr/KOcvLpBuRA==
X-Received: by 2002:a2e:be89:0:b0:302:3356:7c55 with SMTP id 38308e7fff4ca-307e58002e2mr35606591fa.10.1739179885076;
        Mon, 10 Feb 2025 01:31:25 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:31:17 +0100
Subject: [PATCH 3/3] ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ixp4xx-dts-v1-3-6b752d745e04@linaro.org>
References: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
In-Reply-To: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_013127_425980_2B739657 
X-CRM114-Status: GOOD (  12.66  )
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

This adds GPIO LED indicators, the reset GPIO RESET
button on the Netgear WG302 v1 to the device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
index af7b6a976d3dd61f3c6846c73b8788437dea20e3..a351a97d257ead984a3ee05a8a0e50714ad7fb43 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
@@ -8,6 +8,7 @@
 
 #include "intel-ixp42x.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Netgear WG302 v1";
@@ -32,6 +33,35 @@ aliases {
 		serial0 = &uart1;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		test_led: led-test {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "test";
+			gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		wlan_led: led-wlan {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN;
+			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			linux,default-trigger = "phy0tx";
+		};
+	};
+
+	gpio_keys {
+		/* RESET is on GPIO13 which can't fire interrupts */
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		button-reset {
+			linux,code = <KEY_RESTART>;
+			label = "reset";
+			gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	soc {
 		bus@c4000000 {
 			flash@0,0 {

-- 
2.48.1


