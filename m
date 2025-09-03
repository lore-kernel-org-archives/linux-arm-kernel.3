Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F644CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knWYmZlS1tcNLIvNHwra67g63fbf9sRjO2H/UvMZ5D0=; b=OtWLCz2VfoRPaGZK65lgS+Yobw
	+l09wcJENPlsGEIzgy4vwiviof4X1D6Uv2jt/2z2wVS9xrvWNKDbe6nNH29o7P6KBtcVbCsSJ6TZ+
	lK+JD+oFuAXV/YVymw9QtERqPFmL+U2+CH7/74v8oGxTT9Us2TIIh6R+hKokhi1VQFis7gL8OZ0eN
	MsCtl82nfvEuZejvCQfuK07qLOP5U43gNSmcceUmanHEHQUg+xMO70fE+TBJVin5vCgKRUkimYbp3
	KDVG/AyQ5P0qQxmQd7IM1fUK9ipkQiiBUC2UaOBLrPBwmIFvnkyDPFIt152GG/DziCg1a03NmLwH3
	xrUn7k5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrv2-00000007GQp-1sUW;
	Wed, 03 Sep 2025 18:09:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyi-00000006f4b-2AD5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b86157e18so24288425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907807; x=1757512607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knWYmZlS1tcNLIvNHwra67g63fbf9sRjO2H/UvMZ5D0=;
        b=mvwK8pERzRSXpe1zexQP0ZIfPzVUpPGeDUCX+8v7/HkZlwM10NfncoeSnpLwkauP3E
         c5zNUZHIErdThWNAL9VZMSw/RTHnrUSxsnjg53HaA/ztlQsSUQiyh8pB+VIhcuHlKHU4
         uY0Bp9xjEFT/MNXF2lxclBwbIBlyHz75dkGZexGzf3LALHXParO9udQVZJkebyjk5iky
         2wsDGLxCaS/WkuTNl6WG3oZ+DZULhb9RvEC0nIB/iAyrFzygVbkzjieHKGQ8hU+ul3Hn
         OxW14xfe6KtsC3R+hWSkods25/m8qrB76Fhdv+KdE9gw+m34yph8SdCJFEoKYa1tsAXw
         A9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907807; x=1757512607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knWYmZlS1tcNLIvNHwra67g63fbf9sRjO2H/UvMZ5D0=;
        b=grQWGSOYwVzNlDkkcvmj9KGw2waMWyod7ZD0Owb2K8FawX9hh4C1YhXPLjYntFj89a
         PzQb9Z/xX6Tu9W0JEzPwEmmgDIQJvJCjqJNdar7tuWsBG6day6Ss9d7vd98qhnGqrX5R
         0Jz4EeNcKy2LSG+R0BDj1LWs4hXBACUvjkbGWC0CW5rpFJWDYCmjpx8kQ+JYgYnIO5Jo
         FdMcDDPKrlGo7jSvWrT1Uwq+75z+s0tV5g/sv7c4zS+DxbxPo4T2auR66i8BDs+jvUyZ
         /Tomz/X89R5D1Pl54e0FEw6xMWi9GFvhC5xhaYSkmvnqW7TM37rIjk2ii8jPJU9FaRgu
         AFjw==
X-Forwarded-Encrypted: i=1; AJvYcCWyFXeBnkxnDSdJErONyasW7estr6YA15MBoNhSaFsQ7WqIhKV/9i5NsDKAXqjDzSv1AVY2SdqQyhnFb7fRdIQb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcp/PP5rzEJo/t1uXeFtke6yAyn2QnkEJrrLJnDAwv4Hi4nNUX
	+Vpr+/peroQQyIXEDV4K0tde7xWoI9Oh5ith/vUcCbKz+pdlal11t0DX3xl7Tx8l8ys=
X-Gm-Gg: ASbGncsS+6j9+U1ICvg/jF5CpsLgRzU5EXFWkCyMljF0R4HaZZNwATUv7yCwjK19Bjs
	TU+kZDS2eTBs12yEIKlvC4EeduT4eSLHzjhHeB5EeBZ7NZpNhY/PTxp6qwvXULtnmhuIMDgAg6X
	2YCltfqEJmfdmetwfpZQpiXbJkxXw37ekKRmW2UXJvIsJ4I98TNPx7L2zTnk9dSESQkjSdEBwi5
	sVyNEYFV8YOtDzF5w7gKg02oKfvabiFlrZR4AXuVSK6ztaRfC+WKPFMo3OhYJeEibt5iWKWYUYv
	2EQVnQdhdKY+CciUxTjQpZgG3sPEcUhI/Vrc51gvB1OKun9nrsmh+0pAzVpDQfINuhmvv6kWfp9
	VRpfYUY5y/q4yMnzLnUVwZPgYf3rTtYudvg5QjaZsdAV0SlyON+jYcOsyMmhZxn9OvZ3oUr4DCx
	KWTWsxCM9MhBQH
X-Google-Smtp-Source: AGHT+IEEbe9zmys+SdHs+R+yvKPrY3H8cKyU1UJgBhivbEglt1LnfQ35e5S95bN5Q3yU4Jw1QrwtWA==
X-Received: by 2002:a05:600c:5253:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45d98bef030mr1077085e9.9.1756907807066;
        Wed, 03 Sep 2025 06:56:47 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:46 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:42 +0000
Subject: [PATCH v3 5/5] arm64: defconfig: enable Exynos ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-5-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jmSGd1LEiJi/OzRrbMT0IdOTY/EPAZZsAFW195MpqOM=;
 b=uHbQ7xT3bV6lIp0HqgAN0MLCg6QtXHzra5fcYf5Lk5NwyHh5UfcdGdrFyQvIdgzD6dfszLV11
 AJJjST6HJPrAxYtlucE/6MSFIODMgces/93QGOxMCFOl2jtohAP2doq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065648_558712_1D50E66E 
X-CRM114-Status: GOOD (  10.37  )
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

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.338.gd7d06c2dae-goog


