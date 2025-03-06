Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7375CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkEq7z1q0YiYub9Ku1p0lF3+8XZaxzvZ7wbudwieneg=; b=Mxq3LoQQmEOjfSMwsoxnNNgYfO
	aQz44xHkqFirv8CLy/c/vW9jSnVJDp2MYsC5ss9CnX1ZP8rS7e/GFqaoqqRBZmy6lG2gHX6MEp7pu
	vddXlMNuenbGayHI6+1ZC579UL2nyIJHWTQmghBcf/JOgf8rMupb23QWCPL4AD3fII6KjmedNAD3v
	Fwh7NK4HCEKbmhKgaxdOnA9+NOSrXihXaXFSefNPXhTxXRwbE6eCe+WJNxLuH2ovtyVOkGU9BzUk5
	CeHyrSPxUgEW2/cM3oo+h/CG+gtlRc+5ZI5CqkYGWoCemISlNrd9hchU/5LMly/GlulCNhmpvAoCu
	eBalDT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8M1-0000000AdaM-2noT;
	Thu, 06 Mar 2025 10:21:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ff-0000000AcCZ-47TQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:14:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb379so707016a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256090; x=1741860890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkEq7z1q0YiYub9Ku1p0lF3+8XZaxzvZ7wbudwieneg=;
        b=Oum6hSq4Wk+sQxKv+iB5r4FHQrWIfiEFp0cY5pKhxx1sUvTd2gX1SPRx86yMf7tP8D
         +MHFWXJBi4D6nUqS0TdIqKvVuN7rl2QWEH5c+lU2nVGYc/usGi+f9R5pCQCE7zWxm/ul
         mmthpjSC/DzOrREZuzkiBf1f9imoDauhoIGDbaTC+07YkII67rHm0eNEwk5qZrZ2JDHZ
         AM1I2Z4dpFPAlUowZjP+UgjWWflSLAjTgCU7t6jDBdxb4NudaLDsz7vjGlCArY8oMAtK
         CNf3cO+S6SNI5bdfIFi4/+R8SBlAU1eA9+OhuXgaIkP9zzUxW0+KreynYjcJytE0tyNL
         W92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256090; x=1741860890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkEq7z1q0YiYub9Ku1p0lF3+8XZaxzvZ7wbudwieneg=;
        b=xKwRKmqOp4MMivrdYUUU663VaEELnL+NWfmu9a6/ihIdsFJkVogf7Baahf3J+ci+Nl
         HiY9YP3lmXxnBCd1uuI2CScmdqoiN6O5vQDM7ehsu9WJXXBdAwna6SUvU6SFtvJE8BRm
         bJkxpQNhK5rhlZXKzq4QUK7LQ4Keh/kEV5yJ74OPE6oA9toS5f7p3RJd2zrQvjosYlrT
         +CiaGAX8uHJN9uQ1ZUYJvRJtJsSXAJ6qGONuvS/q7fumZ1EHBoAZZdDOfw0WhzVxwSUl
         8kLQpXgeHfX9ksr1EDEE11sxht5qRiekR3xzc7ic9b/8w4cg6XlCWKflxHXeq1vrszMB
         0O8w==
X-Forwarded-Encrypted: i=1; AJvYcCX47uQZNGFW+LIDqrEoKYHul7QVsMG+iasRmz58RTPjoMKt4N1+hvtiQdaTmvHGa/9ZHtmUAl13Ez9q6lsCr1Nz@lists.infradead.org
X-Gm-Message-State: AOJu0YwLVA0cO7JlcWC85G6sGmNjp2o7ZbpwAV1XWn/2jSjLM6nJ4Z93
	+duBWUb2Qr+oxGkF01IuSfDb7+p4tfExdzy3xQ5+HSwgfojwtth4t4y0BPKpuvQ=
X-Gm-Gg: ASbGnctMe7XLNDERhlt7RauIa7cnQAUej9IS+3yS6398HcK0cz6xwTFRT9AkuYZ2p4H
	8Tu0k1mGQPgBygLWkiRlfaV/tWLGqMMr0AvRxpONl1+X5/N2vgK4bNc9+bAAXAi3F9PWNlc2VyN
	jTzfbJj6XcyK3f4uXLY+9XnEuXw6929J8otQrz9tMBlq9sysSfDJruv4GB6Am/VY/OQS2iftuwt
	EnzXUR8J25KMdzb8cv6HRsLPlVkMImHnezyB6MK7LXCHuE2eUjrAmKsSJCwmklAAaMWzWJwK9U3
	OT7fnuks69qF6QpAQULjQLFgKW6cFK0AbaVcZcxNkJotj0nrcQZg83g2IrgCtOlAjCnVwsPC87Z
	ivUtD3JQ8Hv3mZOv8US/xGRPPqHlL
X-Google-Smtp-Source: AGHT+IEcenJXCCsPX8fwCFChlhI8lsHvDUUR4lKpJP1AeP2qAkwJ1RuV+lWKabRvAciorFjPsTy0lA==
X-Received: by 2002:a05:6402:2714:b0:5de:de2c:ea90 with SMTP id 4fb4d7f45d1cf-5e59f37da2dmr5692667a12.11.1741256090167;
        Thu, 06 Mar 2025 02:14:50 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a6af7sm708972a12.33.2025.03.06.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:14:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Mar 2025 10:14:47 +0000
Subject: [PATCH 2/3] arm64: dts: exynos: gs101-pixel-common: add the
 MAX77759 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-b4-max77759-mfd-dts-v1-2-9fe8b0eb8123@linaro.org>
References: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
In-Reply-To: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
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
X-CRM114-CacheID: sfid-20250306_021452_048469_4E8CAEB0 
X-CRM114-Status: GOOD (  11.72  )
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

Also add the subnodes for the GPIO expander and NVMEM, and define the
NVMEM layout.

The NVMEM layout is declared such that it matches downstream's
open-coded configuration [1].

The pinctrl nodes are kept sorted by the 'samsung,pins' property rather
than node name, as I think that makes it easier to look at and to add
new nodes unambiguously in the future.

Link: https://android.googlesource.com/kernel/google-modules/bms/+/96e729a83817/max77759_maxq.c#67 [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index b25230495c64dce60916b7cd5dcb9a7cce5d0e4e..f67fa1e84d994de4d40f29a2d437ab6401ac133d 100644
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
2.49.0.rc0.332.g42c0ae87b1-goog


