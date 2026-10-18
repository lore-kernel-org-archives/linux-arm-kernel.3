Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A69CCF2CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=; b=trVBnqMJ18GR8NglBMmn1CODbb
	kcI8VrbZs4kPFoo5kzkWXlo2LBVFhp9vxNJFDgRJXJ76KF5sJ6fCjD07Bf9h2NjLuBFWsYlAEGPaM
	04h0P6Fi76b6xAi2Tc4w2QUO+4+qMz85WqeXmf8mzmCI/tAqvAI9Tew24PGLYFSGLFxiLdO2BwH+D
	MFyEBM9+SDQip4jpyqo2BCnpGBy2nmSbyorU96wb5Ysk6gV/maW0h8DgO+6Qv0F9uassOaDdOgQC4
	G80+Mx84JtrWADV1tB3vap2L89h8NRaDXjYSXyT7t/k5XrOTPRQq7Ii6RC2Ac3WWNTgjRL+G0xUZW
	aPsk0i/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4U-00000005qnQ-0taX;
	Sun, 18 Oct 2026 12:33:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4K-00000005qfM-0EJR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:32:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so3759685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326770; x=1792931570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=D0gMvUV6x0bQ/6sAgEO4XOoBw31EVZOYTGc44mhQEd6lK/UwutYSXi2FPkQ2g39UT+
         BXxmyeYCjkTNDP4siHXx/zdCXZEZ1nopLmTZUWstDmAAWkesTWYDlH5QD3IHmX/dmnC/
         hPWTmzLZYOmu1FOlLj+4IlxUYWbpvBKb44Fa1hrp3wPBdtUYVtji1IB+Qk4SzOOQ0pTq
         E8M+wQO2g0Zob6ZqWmBHlKPhp4/1YnYMkY5frr5G/CVeO/TLPe++fxlvOirmkHjjFWkx
         j5+kFXNefVaGHCXIJm9bSh2ko0tXqbSmAbBL3j/Wx/ujU+GwMbByXaNJWlxyEGhUueLI
         YY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326770; x=1792931570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=Y79rclZTrWYx0FIR3UFoG2tGN/HHgPTqgjwEP0s4l5FCkJnc7VeDBoxfCxqyvy69VX
         d8NbO5iPPl4zcNgyhCiPWKdC1zFpyxzaRA0ak2DGkLUA2gq0FChFDofd64sFsfFRPrmj
         brq10RrS6aG+Hg5V3fQ2T0vYWXQV3DtujM5DUhEfOZDxtMLX9LWfev8iIDrnj9XBzkLh
         rpVsXQ5XoAO+lW99COY4ip/ckl6VBmgJE0KIBGdd/+sB48rjgLLJ8kizSpMsGc48ROQd
         kNNvL+NclCnkcihbGZ84xnvV/lhju9mZczQT7lBV9btvn59RPiBnvbjb9tUCw0pW5LKM
         6U3w==
X-Forwarded-Encrypted: i=1; AKwUvBxJLN8/wwaiv91uVHBxHKKHNmLi0J7CKUz70FtUpLNiAfIDFmlmEcLQFaZjmzrQ8sgn5F1jbgZ+HhfWirC3k2uJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLmy5AkS0dZf8BTGEtALmU9Rk4QO4ke8Rh3ogp1AYQ8yTNnq/A4
	OZGEhfGGxiVwuJ3Rvf5R+otSc4592dRl6W9BzK/YkxDewL5XmEcnEyUl
X-Gm-Gg: AYBFou3Q9BJSJi9itlxh4mL1B1AM7iCAClh4uH2ENKa5nnhmXSJJyXB2ZiIX+523APY
	BonUPyIhFQ8ZsBDcadv3rLAIyEGjTUPM69ElH/SaKlOJ7Iju8Vq+ssnw4zT3h97x74jqkxkDSXN
	xkCi+DO28QZ1fbzIDeRnxwwF7dVWpSgAzXdVefWNbK3Y8fc+nf7h1uwdusGFKtK+2q15UjqVzf1
	wfFMxrQHzoQUhKPYLgv5ztrCAM15EKQZtwAyNuvPqmmTwfuazTjTzU2jB4PMRjEbNM+QD4ztugV
	q+NG77OXTY9p6Lij8wOtRSYmYXrl5E2JeyoD4D4dUQvzii4CSStRxRYKqNBYofrebdpQFKfI8gl
	wnhyZBI17rt+Cs7eVVfxFu1iXrPlIwl/hrTS3j8NyKBsH7XVhwwmVLKlzni3UwhrWLu83LIAS7t
	Z2bDrkZoi1bSQFhXgglGepHmGTgRHc7a/D1OHGEfAGV8eYBfmOFCCiDOiOyGzmFZnfsPnYO0P5s
	oFVp03LzVttX1OwUIIl/3QWj+y2RaEPF1F3/a1PHKPGbll9Ae2TWQ5dTqV+k/5LmSLA5KKK0Dud
	W0DouMQb2SQFdzFMo+Izn7I=
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1d75af362mr75981735e9.4.1792326769990;
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:26 +0200
Message-ID: <775959bbb03ff0b5dd5c45b5c8793ab8945adca3.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_053252_112102_9C661E0A 
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 24063bf8183d..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -104,8 +104,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3


