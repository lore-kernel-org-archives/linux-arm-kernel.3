Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD633CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TsR1mX2wHDSgzQPfx51FzMucuFNRcZzEimrpeG8plE=; b=eKmxeab45i3jRnWqNsGgrJ+3l9
	jDLpZwq8fuRrlMqFn1ABRcoTpei3IXMAVfqXK1UNCSMkFlkrCV/gotYF8cy3o9RDTGO1Gq4VuPkZT
	BJIrYGnHOTPlSKqdizoWw+t9SevM0WTdef3UFhfWxmJLVVWGXguPf+WzmHE4kWPuzVZTOkl6Rhg2A
	B4vzB3psAY8WXeG/QMyP0mv16AXP3jz/yHk7We3DCozn82t1L8rWKrWMqSsWI/6XTvrMFwjkL9qfy
	Fi5DOstasi511LywzWo1j1waXaGodViwPHyaT6df40iUzmByWcNn1yL5vvVIvlbUKn0KnUrXRormI
	xoWFvK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlZ-0000000HDws-3OoA;
	Mon, 25 May 2026 12:50:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlO-0000000HDt9-41x6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:50:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so25051065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713433; x=1780318233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TsR1mX2wHDSgzQPfx51FzMucuFNRcZzEimrpeG8plE=;
        b=PSGs0yfkvxaIMfdTIfRiAavoaEwVBNTKre7UoU2HCuaq0Ai59fPEYc+H7hBlig0fKV
         5zZGYxLnHnHOZ+HUCk5t+WeR72HG4DgOm6loTkjwQU07twF6lrRXKjnOoI0ANZGF+gec
         RwVK6N04Odh7/bPqvgKgOUvd/DbxNOaTdimzQSJ54XPJn0sc7EyKouNnj4McLY0vRDLc
         Ozd1G76FSn4aLx8SLJfjuaY/xchOKV07CT/CQHiD1F5BVWJIGd6OlVXnRo1r3BuEYq3m
         AgzErb+tKVO5aKWB4UE4FLn8V30X+zErvg5gedVxlAk6y1DLCdN7hIJpLd727vsozedE
         PIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713433; x=1780318233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5TsR1mX2wHDSgzQPfx51FzMucuFNRcZzEimrpeG8plE=;
        b=cE65fFuVGSVOH9gn1v5vrsasZ+xwWCsIT/TioZsu3Epdl+B3rwlkjSKvEyYpku9cNv
         47LQe0kRGDBJ64XMGY8xUNP8y0n9bfqCTu/LBD3Bz575Y3X1OTNn6kxkQ133niZao15r
         5iR+EBzP0KPswx3rJ7TJ70LNsjhQFdesFtxGOoPVMXzbqyF+eldK7ON8RfrjfhQRQqUL
         wnVIbao80O7Aann9NW+t8K1LjkM8+U+pHMhvWrOQkBMh0a5W0HrTW+qgYcUEqbilQVM1
         vzEYmp34X9+lwSlOPrQ0Fj002dAJ3uzzJ9Sc2WVwMHZEoZ7naTtPBKG/R97mvoomifPF
         O4GA==
X-Forwarded-Encrypted: i=1; AFNElJ98ifcPL3xQ3j5t7HayeFiREJOu1TS5H/3663KnmBCPDhiPNfNzVTh1rnPxHeN12qOqEGf5gZ2vGPx1yQi8LFNi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/1VwWid81gobU+8BBY7Sx7G9irOfdWsdv9DcRrwxB2gwUG+yZ
	OfC9bwpFPWAdGSjs1E9ZYi5hKswMiGyI6NDMsIkkPAOcvnpRrYx7ikXxSS51enifDCE=
X-Gm-Gg: Acq92OH2KEKyMLtqPetM9lLXVE0ctaZMiEsXneQB5L2OQbubWT9qBSji95HTikl9wft
	Q5kMLRfHjJwJ9YhH9jegxmNWZbp7HzbMjvqH8IacHr//G4VW4B2MsNl5fub8eLtePaslDTls0A/
	FdN+OLn8Q708Rms4upai9QLoO2oEH5WOMGLl2oRbXZWCeMP88rWA2KYbCLuIxtTfQ38b6LBKF7h
	fm//i6zrOUFJYmEMJqNQMlPO9DOyDMX2t3H74YDbku6d9wREe0HfysaMHC+ihR9etMcwCmOA2qi
	UmPxzA3x3HPsWLQJYXUGQ1Ie34M5zLebrfphEDr2yvzeOOGZDzqeM7lZoUYqHnDuGATMqYsEcC4
	0e4jEFoZOtyP3GWvhGW8eW7vZq26nuZ3QIeHJJOVcyDS+WHaq6L0THO76+rmGBnB2zOYxUcMQie
	/6Tf0MJ0siPtgIPMOosZ0T+gt5VajdtYmb3tkGab9O3xY/KzaZlfdDOKrn62iItCHgYrdgdVxX2
	f7Ek5wqx3Rs9SfuGA==
X-Received: by 2002:a05:600c:a30d:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490424ac7bcmr173716725e9.1.1779713433180;
        Mon, 25 May 2026 05:50:33 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:25 +0000
Subject: [PATCH v5 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-5-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=812;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0Frkhb5ER+1m5KgNQbdP8ycXkPjLHDxA2xf3r2hyTAM=;
 b=ysDvGnb5sGnYo8XyHtqcLtMEVBuxYqkwONOnmQLPxdEJXX+Z8JRyBK2v1SJeQkFgvjbrITrcE
 +ypUtdm16g9B+l1i2lE9lC28ZQzQWSfcXVHHHo8co3aVihoSxuORly3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_055035_044956_BECD4098 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.746.g67dd491aae-goog


