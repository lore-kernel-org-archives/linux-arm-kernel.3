Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556D4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMAiIGxOhs/NRNnqxe1Q5w1Z2sjpATlomzVPp7WhyYE=; b=YAchgBORqkqdlRGSmqykkti1mD
	3hLLxvj17XXZCjmxOtwEPu4kzWjMQziAqOEJU0rGyjRwzVHxFmsKUWoGl5OyhsAXD/Vgfd99+9hLH
	XsqgmACr7SEFeXSHSojdxTkRkSyRrr5lZ/TQibcdhgurY4Y5ftMzocKxNsg+UIjWSoDvcBppExkSL
	ZM6B5Duq/5h0e/iv1R4j+JmDKZ4XFxB5skKzyFVkO7ftReNNhVvpc/SkEPDfqVstJd/PJ6Zuso31l
	t+k/x9ZZmDVvisVUdUnUOEmgZiMRYghxS8aZVvgv4Yi6fSnIIAAxF3/92xjbWuiAo5V2R4qhDUoMA
	jW2rFT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtRf-0000000H5ol-0JwC;
	Tue, 25 Feb 2025 11:49:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms3M-0000000Gngp-1CJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:20:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7c4350826so90371066b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478839; x=1741083639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMAiIGxOhs/NRNnqxe1Q5w1Z2sjpATlomzVPp7WhyYE=;
        b=O+TJwKwuQLfhV3ffFjxTdEsKR6MDyomwP3MOAcIbU2bMq89i3LDdKF46iQzGNcGB7S
         z0pPyx6CiIKROnzygVCU4xB85cVVJUpLzFV8Q4hPBdK2SAPBknr0TcRhJAS0F1/WULFC
         2cH+96cN5/bnsz+l+acG5nW3jem7KAndsRsVPu+5zd3KQ8B1Rnw2IJ1rld7jLEpZshKm
         y5iBFtBx8dtFnPFJLkoiPXgmBUPr6wVdUjRZjpAU28g7E9mlVCQKybaFjQ3WziUDAmrs
         b1DauYlhZl7MontWNBInAop7zJgxs73KIWKyOwB6peJvGEuAv8XBGZnTwm47uIWgM1PO
         Rj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478839; x=1741083639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMAiIGxOhs/NRNnqxe1Q5w1Z2sjpATlomzVPp7WhyYE=;
        b=YUhlfPJaYOzd5WH/vhLhLxgq8gbwkckb61MKpNmVjzSyJGF+1AMbPESE/vHuQp+XZp
         WfFBCJBYM6Upx20rr9xY5TNI7aByNeg+GZWV2KPXkqBUqMXgHKL6dux/oz1zTX8LmrEM
         yk+mzBNi7ngSvctd3LP7C0bjWPRihJ0E7QZmy6TPmRdNcTYuzdW8OEJwMNCsWSDjVSfj
         tXbmX4rOhL8S/HmbEMw5wwgkzjT09qi6V+dQT8Bgy+Mdd61AMOFb7oiBJWwalPcxgX1a
         0Lo3a3osGJHq7MM+anqhSEjyKcJIz6W//m85c7IloyZ6C5qzRcIPnoP0Lxf8PK0m61CW
         yaOA==
X-Forwarded-Encrypted: i=1; AJvYcCUys4/+eWAQRBH2vTGiiY7A9hx1FqR6VmxJHPNPwh2d7KBZaYwT+vWWM7hMnvTH5DWhI7ZBz3dLSddyFMdYK3fB@lists.infradead.org
X-Gm-Message-State: AOJu0YwsNRTVOZ/MY12wjtBCi9Nw7YeJPoP4qZWdZNVP3lp72OLqiYET
	pyV9DMIEJUV/ENk+bF48w6JJ3CigFjvszD/K2XEuUKEgsukrd0Um0Nvt3b3i/EU=
X-Gm-Gg: ASbGncuh4BPERNy/O1IE4P3hVPWa2iJIyIi1+szM5kAyhbtIgzCNBztkBwisKw29G3Y
	SLNbfpe3Q3hf+bMqGAUcUwTux0A+Bz0csqdXHPNu5W5dfRmdtTSk5TWJXIqab1bYcyBEDRHyjPT
	c1f2oXuSKQiDzNvU9rK2DjvcFiUyYF63PDstFilNJEXGF/QXl8PlXk/Q3GON6oxcUwYcpzIwmoi
	pytKN6BoiKoPZKjLoy14iPutADFBCxI9Z8ibxG/WqkHi5o9IP3Zx1CGVTYYMlgNcFOrK8Zfxz/m
	ZQRxe5gl3sMYvco9IngaGjlSYN8To4qOUr63xt3XVzqiaghNJ8RA2t3aKmHOEUpTClbxQdKxYJw
	=
X-Google-Smtp-Source: AGHT+IEZErkXFchQBHcjhpLOcz0ntlnRWjG+dqb6HL0cgbpdGQt3G9rUQQ9bKlCBwVV+K4XlTqA59A==
X-Received: by 2002:a17:906:fb09:b0:abe:9c69:b71e with SMTP id a640c23a62f3a-abe9c69c1d6mr280644666b.3.1740478838702;
        Tue, 25 Feb 2025 02:20:38 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010decsm116931666b.98.2025.02.25.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:20:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC] arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant on RK3399
Date: Tue, 25 Feb 2025 11:20:36 +0100
Message-ID: <20250225102036.107913-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022040_324737_421CA281 
X-CRM114-Status: GOOD (  12.54  )
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

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Dependency/RFC!

RFC, because this should be merged release after driver support is
merged:
https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
index 9e4b12ed62cb..be3ae473e562 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
@@ -36,6 +36,6 @@ wifi@0,0 {
 		compatible = "qcom,ath10k";
 		reg = <0x00000000 0x0 0x00000000 0x0 0x00000000>,
 		      <0x03000010 0x0 0x00000000 0x0 0x00200000>;
-		qcom,ath10k-calibration-variant = "GO_DUMO";
+		qcom,calibration-variant = "GO_DUMO";
 	};
 };
-- 
2.43.0


