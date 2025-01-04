Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+Mh3aTaCcP+5QY8RX9wcAwubgCOuVuuCWZcKrT8SyY=; b=TKIYB6ZUS/lU9UEqTpoU62hjUq
	UzZPI3HgC6Go97emxkx7OIy2XDJXJO8NCga0mpYPEdrL3cf01Cc0zT/A1DFaiuosDJ0go1blmSRRD
	b55wXX3clWzfkf6K8CIEc8xXM8zpgqFxchrKG+DGxrrxPGgJms61fOMaBDtsdIw2u2w73Nec3jPda
	dKBjHsdoSws9KRKSYTO7IHWf3W0B2urxndbj+LGshrqGC9utVqonQSFKkvwp7YfcDvbMhw11R8slg
	ftaXdzpdLxwoza+1XVho1ue13+YHrq2DeUfJEitR2uRee/PJL3n+NIIrjyND96RY0fr2ns7D4Eton
	trchYNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7NH-0000000FIxp-0DPz;
	Sat, 04 Jan 2025 16:51:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FP-0000000FHwp-1eps
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43621d27adeso90787695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009014; x=1736613814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+Mh3aTaCcP+5QY8RX9wcAwubgCOuVuuCWZcKrT8SyY=;
        b=Q0PV3O3fr3yrbb7ye/idfTqvO4SyFHo23D5HoOhZULWLg6uCBiymJ3qB6y3rzEARy6
         sTj/c2xOGScQXxg0Z918yHa+xwYuYaxZqiIT3/sLpKMb39/YglMnS1U9UPkeaytDaQ4S
         uHj9cfugxg0jJC/NYxMFwOnB2dgm3AjuKzKQvWN5QE23Ld6VvYDzsTSkAg2TcZ/zjMD0
         PNaOy4eNky1TNLXWdRyQsYMC1766bYMLCrd+zma0INh9MMxL3chw1mx/0FhiP5oOgrtC
         hrpXCXKr8QQ3bjB4b1zBWOJtiq8NIQaB++ztuk2Nz+jFnYU5tY+Edi43NaCSvqkJ/N8u
         ueeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009014; x=1736613814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+Mh3aTaCcP+5QY8RX9wcAwubgCOuVuuCWZcKrT8SyY=;
        b=ipTwDrrWA/4XoTEwMjN04W73qhXMPDSb8/qdMmGwWGASxpeizLVQTz40ZbDQ0vNxrE
         QF3+qXMmnU0aH1TQ496RqREqHuNxooyMgCY3CEnW0nH2BQWsxMLqn/WL6yZ38xtGAHCQ
         jX5NvnlKovIMDq5YE71xKZSC5r/gU2hwJVT+y2tPny+BEIMuKuKjsopErE2xu280UNYA
         GSMmvGG0x8DXI13QN1Jw02tgBosaH663bemFqswgCGxU3mI9PQMShUr5zzxqlTEzvrmB
         Eot1LTmORUdIe5el6/9QrDCCtg3w7m/7QdCJ26l6nYQB340rSz5Lm3WrIwTnumZEXvD9
         ADog==
X-Forwarded-Encrypted: i=1; AJvYcCWzfNL+AvamHAbDXOR1XVahJ8kEtkf0GmClcz/lLckhUA9Cus+TTMSzeQ9W8hUxfz+W+K1M4pA6MegT+YCZ46DK@lists.infradead.org
X-Gm-Message-State: AOJu0YwuqkKiv4qC4hu1g84R7L+u6MHa7D2EiH00oCEdNrqNMjnhe4XX
	yXWsaosEk0IbX/yo6G9UNBfDvss1gzmIPu59XeQhK1HeKCFsg/jeQP3HTA==
X-Gm-Gg: ASbGnctMh6Zgc67rUoqnvMcv8cqeYNu9/7LjDj7AhWY4u40yl3Ohdu68yYluHXP6gV4
	Vxf8n6Rg/aF6bfzzplEqmw0zt4b6ZjuI/zL14oPSNbyZ02ikRjRogNXVHt8bNJ7KgncRarO5Of8
	Kco0QTti+NIWR5qXb9xsgeb+drbAuj2CnwAhhmjygt4hbLMgjh2cABkD4gV0fZz+9iq+g6AC5F5
	2bD6Z8DdT8pdXU1510BCxTRxR9iouhuR6tWnMWQdqA+cSIrUzGOiKWJRtTH6TAHUas/j0w=
X-Google-Smtp-Source: AGHT+IGVyo1OKwPQhJDAQ+1vJHH1lkygpP9pytkfgJ0oMMtcQZBmktlNJMzxUHttbVIZzvBivDCxnw==
X-Received: by 2002:a5d:5f88:0:b0:385:f69a:7e5f with SMTP id ffacd0b85a97d-38a223ff3cbmr39539122f8f.38.1736009013886;
        Sat, 04 Jan 2025 08:43:33 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:33 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: exynos: exynos8895-dreamlte: enable support for the touchscreen
Date: Sat,  4 Jan 2025 18:43:21 +0200
Message-ID: <20250104164321.333669-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084335_429799_07A37A22 
X-CRM114-Status: GOOD (  14.27  )
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

The Samsung Galaxy S8 uses a Samsung s6sy761 touchscreen over hsi2c23.
Add a node for it in order to allow using the touchscreen as long as
the previous bootloader has enabled the required regulators because
there's no support for PMIC yet.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8895-dreamlte.dts   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 6c4f8d4a9..d9b51d884 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/soc/samsung,exynos-usi.h>
 
 / {
 	model = "Samsung Galaxy S8 (SM-G950F)";
@@ -93,6 +94,33 @@ wink-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove once PMIC is implemented  */
+	reg_placeholder: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg-placeholder";
+	};
+};
+
+&hsi2c_23 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+
+		/* TODO: Update once PMIC is implemented */
+		avdd-supply = <&reg_placeholder>;
+		vdd-supply = <&reg_placeholder>;
+
+		interrupt-parent = <&gpa1>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_int>;
+		pinctrl-names = "default";
+	};
 };
 
 &oscclk {
@@ -155,4 +183,16 @@ sd2_cd: sd2-cd-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
 	};
+
+	ts_int: ts-int-pins {
+		samsung,pins = "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
+
+&usi9 {
+	samsung,mode = <USI_V1_I2C0_1>;
+	status = "okay";
 };
-- 
2.43.0


