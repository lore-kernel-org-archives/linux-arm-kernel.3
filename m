Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86ACC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 05:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=; b=KXUAW6koGRlz2w/FQnXpZtggT5
	OzXGb0z2BZlUCCoZ+ITtz7IdXyiFnQgwJN12BbWnfDHSHe34dLVSsESjOXC+7171N/RHbrPssiyZF
	MNZvemwftcLrAiVQd3NUzLMWx01mTCTBTxmUuXssrTgzylaxOmahiEYJ3/JWma6eHxWa/xnMo2ruF
	5T8hsqM/sBC1DGJ7EqKQVQUxPgMGHWpf7s/nXQGqM8KR9PRqNMO6850dd2NLlKQrGfqww7ZdLahYO
	7/D/l8uEWTn4HSLg/HQlbBNwM7NsUUgTSWpbP2hld3DelF1rqfHtqIdUGgGpPZMC2ZF8qinZoVyeV
	P34I1nXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhV0-00000005KMY-385V;
	Sat, 24 May 2025 05:32:46 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhKG-00000005JhO-3GaZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 05:21:43 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-601d10de7e1so835351a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=;
        b=C7g+gSPotlEIIcuRfow9H71Yas4fP6WTfCMXlenrEVefQ0ZiChcCbSDG8d30HySAjT
         O5cfWhmx9P7zmNz0XmOjn6TCWMsF5bY6GhtBKuZx+19D6a1bKhHVDa38S0kO0WNUup6s
         5T/BCQGmQe890m2CyXEEOLhGrkJhxs3X195ZELOjhZkrdRRKOeNROhcLLzmuGIagFO6c
         BVQvadQtg+ITN6qEdzhG6m1ld9P19zYlU2R9vSlkE+LILoAw8H+kpx2IdciChGqiiFMD
         6BYLRFyMmsgLybiD4EUe9oR3m/y1U6rhDzvHjJf3qhIIhEB+t/XKbUtUQItY6AcnJn6r
         TBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=;
        b=VNZXrZpYJxhBzWIPRbERaYhR4U5GHiRp0xLl+QadnDybfoA03LPjlaIBruAkr3sgug
         YHXFeSTzPTZO5inlTVF22tfc1k+B/3/iCj5MRrz397c+ZflsH86VPd3CAxH2f133e4QG
         /VHea9WsoGaUm5cQMCKIgJ0zbyuOrnzmnq7EoUMpCSe+tXlb+whlvmTInsRlzVTFYlK8
         WcU3C3XbYHTmyAk925L0RciWLqhuSSTU9ITDjvfJh3KIjwPBCwRESl5JidYnDgDrRJy/
         WA1i/rgasv4C1K1GwNC9H7QlqITXP+eQLML7LNxjR6fpyJQJ2MjhxchO4UtRYee4+CTs
         zBlg==
X-Forwarded-Encrypted: i=1; AJvYcCXzLJiqPtIeGjg03niaK6pqn+uvzxu/qxXAUoq8aFdCMmLiuGoUQYs+eEz21HZOCR4KpKUKCnKyfHcuRsdegrXR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Fcxn7z1FQpku7642UTK40/YkHyZ+r7smnWYiRtGigeLtJd/u
	mAxX+ZNMKyqqq03er0kW7LcgCQdmI9vbIbtb0TcEAKhZoYlhspD8JwBYMjAI4JUoz/Q=
X-Gm-Gg: ASbGncstMwQNwcWv2EfoumsmkQQgPlV3UdSyy9aVu19GNoK9WKlsLKBEGOIKGc7CV0I
	vCw0erazi38nLCfnHJzo3EnIDy7EmZsBflk/SafBFtj7hHkJrd0cIAJqsWNkgM3729c8f6RE/2a
	GztV06KSOZw236iq5DUJD8JGBJXs7fEyoE/GYk61EQp7/dEnYLRBcN6nvBnYe0p31jgKj0vQe7Z
	Xv9GwBb/dSMUwV3wM3R1HC/AHXoxoYL7MWVHypSZCjfSceMsanV7SAXKhAf6QOKTgMhIlk7w8Ym
	/OnbaIRFSIDOjPPi2/Z+0grr8PMwIb3UQ2S+R5CCYULX2EA3b37idhGE0N8OTETOvHMsuhFqEmm
	DbZ+lrZHv0fmqqZ82Be7h37yJm+Wx3srs1no=
X-Google-Smtp-Source: AGHT+IF8pgsRiLru+xzCs3/kYK9IFFjLgdgCKETe4qhqLvBb/0iNzUicN2Yb4j1NXVYdjuG8Y5CZ0A==
X-Received: by 2002:a17:907:d06:b0:ad2:2ef3:d487 with SMTP id a640c23a62f3a-ad85b329c74mr142108566b.58.1748064099139;
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:29 +0100
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_222140_819470_484F2B16 
X-CRM114-Status: GOOD (  12.22  )
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

On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO & NVMEM)
  * charger
  * fuel gauge
  * TCPCi

This change adds the PMIC and the subnodes for the GPIO expander and
NVMEM, and defines the NVMEM layout.

The NVMEM layout is declared such that it matches downstream's
open-coded configuration [1].

Note:
The pinctrl nodes are kept sorted by the 'samsung,pins' property rather
than node name, as I think that makes it easier to look at and to add
new nodes unambiguously in the future. Its label is prefixed with 'if'
(for interface), because there are three PMICs in total in use on
Pixel 6 (Pro).

Link: https://android.googlesource.com/kernel/google-modules/bms/+/96e729a83817/max77759_maxq.c#67 [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- update commit message slightly
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index d6ddcc13f7b20c6dfbe92e86abafe965870d0c78..de5c8d236b705505c0745827c5c6b67d94ba6227 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -188,6 +188,60 @@ usbc0_role_sw: endpoint {
 			};
 		};
 	};
+
+	pmic@66 {
+		compatible = "maxim,max77759";
+		reg = <0x66>;
+
+		pinctrl-0 = <&if_pmic_int>;
+		pinctrl-names = "default";
+		interrupts-extended = <&gpa8 3 IRQ_TYPE_LEVEL_LOW>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		gpio {
+			compatible = "maxim,max77759-gpio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			/*
+			 * "Human-readable name [SIGNAL_LABEL]" where the
+			 * latter comes from the schematic
+			 */
+			gpio-line-names = "OTG boost [OTG_BOOST_EN]",
+					  "max20339 IRQ [MW_OVP_INT_L]";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		nvmem-0 {
+			compatible = "maxim,max77759-nvmem";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				reboot-mode@0 {
+					reg = <0x0 0x4>;
+				};
+
+				boot-reason@4 {
+					reg = <0x4 0x4>;
+				};
+
+				shutdown-user-flag@8 {
+					reg = <0x8 0x1>;
+				};
+
+				rsoc@a {
+					reg = <0xa 0x2>;
+				};
+			};
+		};
+	};
 };
 
 &pinctrl_far_alive {
@@ -211,6 +265,13 @@ typec_int: typec-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_UP>;
 		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
 	};
+
+	if_pmic_int: if-pmic-int-pins {
+		samsung,pins = "gpa8-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
 };
 
 &pinctrl_gpio_alive {

-- 
2.49.0.1151.ga128411c76-goog


