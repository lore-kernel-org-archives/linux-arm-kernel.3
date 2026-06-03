Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAA3CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=; b=fRMbKXFGUJWTsgOFTDOKA3xzO2
	GRkO/ZImlC/WEq/Vy1zqBOa4mxaDLDflrah+z+Ez2CnQ9Fj/ZTcZC4zSv+Bnf4VaFYbogJsZXRpCB
	UcNYMcqVsi3ZO3SXHlUSIEXt64osVwHb1UjHfjN5PoFpaX4hRyZI4XV1eG49FvrMou+4q7JlMjtgn
	P71I9NJZ8bzM7/39VSFzrDrul9rXUcED5DeoCXbk+aY6Xdzaty11Tikq1hILUQYN+yh3/fs6fpWUq
	mbXb6x+3P0OzsiuUslve3mbrVpcpNHFPwjieKD/SIKsUBog2rXLuyuK4QgVRoewHAekn41HmklFKz
	REaPxRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCt-0000000F6W2-0qRn;
	Wed, 03 Jun 2026 13:00:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCp-0000000F6Sy-33bl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:00:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2132247f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491622; x=1781096422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=;
        b=GpFV9xyOeP0BlDZ9xGXLdqiy7yxzSoOyNx3cWv5jjE19HS30RO/Db2+8Bhokc9DdWM
         NDO1I88R6xuRwmTtzMyefVs+GdaDAEhrn+XmkJMzEi1WvgvCIZ2NcXmdXXEyFv9dGI2I
         26xKjMdGKIfHEuXo2lbRk1I6eBVA0ZJsef6y7sNZ9Cpqb2FtGmqB/1lBbjywSH3dnydX
         kziWnc1DLC22RWVvB9VKRTOTkJ56FMabaaPpG7GuEuX2FLE3807lwXUPxn/pJ9aF8u+I
         aKgxoBY2E7sFHKq1zEiRx7I/w0mXncFDSW4nAQSOdxHWZpRjsnBzJSeUsFIeYpVJjFGy
         CXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491622; x=1781096422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=;
        b=c6BbysfVYH9q9+F4Mg6CUN22QRre379IKOnhAhcj63bne6e4F0ysCQ66ygFL0IdEUf
         nLU3KaBVkFLfRLGFpTsGoJxjc6lELe75wTrHVp5irop5OSy0iLV1o51mnlW0Grc3O85j
         sCMPSOlSaeC6YWx772pOmkOTO8kr4+c0qhma3Vnl5lfj4nhDcys1q87eJDMv76v2v39k
         Oz2b8kbzEmzu2AwbCLvnZfEkiy85hb3lqbeo8URgRFVyV0TOBFmk87y/aYrUDJpwZWa8
         FpTnu6RC8oFMSWiX04EnxOz8NrhuDNXpC+fGUl161+51+zfpsTI1MtInSvGUOUfa76wA
         ttgA==
X-Forwarded-Encrypted: i=1; AFNElJ/LYDJiq3gOX6hFj1pJv1nTk2nOGes2MQljOgwj8RwHi1VjeJKx6tQG9ct7/oGnpY6xHcQriSiXNpd4eEMvn67U@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7yttp9j5mB1wesAF3emITzHi1HNu2yx6oESCEO1OYZYIwnEj6
	OdpqdqKxlsulMHYxAgp42EzSWDpyzaySnNwwwwj6xbkQFQaAvvI/abrLmS0fm0QhfV8=
X-Gm-Gg: Acq92OHGsZpxanfFi3hNiGhghr+O1oy6vP6u4V9e5rvCpz21xQDEqfYBgoZFVWGa7xZ
	gwU4tZnLZ/yLnKv7/mXxyvMzGiBlV5EIbdkjO5dKicgA60ibX4ZXVu2aMhDasfqmjIvcsEndiRE
	UtwFhC4214/QYKjfsXo8QJFG8BmqnnshT9Ww8APc6kdIaqnSB7eZD1PcwpxLNnzQ8XDCwvUzjET
	EnxPAWsaV6iwM4/ucK+ARzb9vu76C0uzXw1S+b9XjOOPQusa/wAT8bzhGAfuKH/Em4NE/YdK4W3
	xIaAFU0a2d63zOqrqdphx8byA8f/C6oTJtjfaD4h2WdDcIYo35IJHiPxLra+7oCv8ZozGmbIjFo
	lEJDEp5L6/T3kj2N2P4+NOidzp3deochj6rkwF+8S/RfVoERanx46EJixGB3W+4hg9r0v9evK9m
	BBHP2tAi6/mycINPSDFobLiHXCBm/qNgNGz0tZJ9fnRH1+YPN4tNieR2L6o6/Xo5NS82kB1jtfh
	gQ51LsJgjtOvlE=
X-Received: by 2002:a05:600c:c174:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b5eb82b2mr55987505e9.10.1780491621605;
        Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:20 +0000
Subject: [PATCH v8 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=795;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=APjGOr4rSujMx24P1jDIzhjkfbHKcFK80a9vPvVqD0g=;
 b=gCX5AtDDJC3f+OxPmw3TNwWEn5IdXUI49obuY03uhwbjrXH3wrFPl2PrGLvyeK9L/I5KQ6xVA
 Fe+1lxEnh5cAHVbF9vZx+6xjJo7WU3pRmhyDsfkcxOP/ZiYgCxjet3d
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060023_797729_F461DB37 
X-CRM114-Status: UNSURE (   9.48  )
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
Exynos SoCs (like Google GS101), used on pixel phones.

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
2.54.0.1013.g208068f2d8-goog


