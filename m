Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC647C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkXB2c1oP/E/k06GcTgcZXpElzLoIFNZDVG4i5HTvOM=; b=IUOXgHF+F09rvPSXWlMR+4c8nn
	Q2xeQ8zGjAJFwCX4wtPSOsdr9RfK4Cp0rL0NCv7kShocge+f0i1Jcv3OMvTSlqRGhSd+ximu9oQyT
	ksIDhOTR3uXqoAFTHeML7Y//ezhmi6fIRNzRmQn69ZTFCp23RDfRTzU6BItXsG7Oy0vgSwB2tKgsH
	WwKuIi0uzqQ0dbcm40gIn0m7zQwkPpel+6b73WTR7UtXPwS0g17axM17OuR3G6rdVXBOK1MED22OR
	28FXrjAPBQn8zKkVnXtFgaWO7M6nVjQD6dVF+DxjOi3owqScrpaqyi83fDYGBPm7dMiae1ycg1dTh
	swsvJ4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMe-00000007YU1-1Zg3;
	Thu, 24 Jul 2025 13:52:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesfz-000000078Fo-1yuK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:55:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so8040015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753350946; x=1753955746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkXB2c1oP/E/k06GcTgcZXpElzLoIFNZDVG4i5HTvOM=;
        b=ipEzVgTrMNszcPIQDHNGRlfD1Tomg1QNYDDC5cFGFxmSGXwV48WCHPYbA21KAgkQEI
         E3V1OssT1jXpmaklEGNUJYNlrqTsFnVFyV9gxDrYLMGGcvPmMuxEIpUjSJqHRId2djvU
         YlwbbtM0RE9+NaQrE1BkGAEnsxtgRI0Ypv92NG0rMch52cPoe1IaKpNFwi3Lgq34JIOx
         0D4B25QV9NCuQI7z6kF85GiKcjjdXjxjyVMkhSR7clWniLNj/GZTIWw4XqgLGZ7COWK/
         ZyY3hrP7QaDSGD2SKh3vkoosFtz/h/YjAUnfuITmsGy5DDFbwQnjvv0AE01JvlWI/QJ1
         4QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350946; x=1753955746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkXB2c1oP/E/k06GcTgcZXpElzLoIFNZDVG4i5HTvOM=;
        b=Cfk+qnUANJEXXX8y0Ctn4MCqvfgnM5e6HYvzug+6bz3bSjn+qkReIEryTwxuJLDI5O
         tBaAp3Gq62cOqcHA847dTVS0Y1i785L6e/xC0R2IQ0yRGibF7Ptx0O6cbjWG3jN4bYFp
         k78yfP4knKAVYlUoNEr4nmEenPD3cxEssx04SF6ntB1O58N7OK0KMuofGyoSaqZiW4Am
         i2KFrnmneBIOwWy0JlUD3AZHfG+DNO/TLc2x2ncUqKdDe5qLYEXA0n470D/dE19BqK/D
         +8x0EI2jm2jcu2iT6dUuyHhWD1wIkBQj8J3dda0B+LKuVNDfv4lvoOZZvzPaE0Fg+tOg
         RPAA==
X-Forwarded-Encrypted: i=1; AJvYcCXaWlxxyUIadmBVkUsVH6maLfXRpuRe2ccJAhAXG+i/P9ahHnyLTs1dv+Ucs+dk4z2dH2q4//GeGisx9MraKRNQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5j6wulaO2YnkzXKVB6kianu+uUq2yyjN+UaaqLaNBsZc/iqUF
	39DbgxdRVjNW57oRcBJhsemPko50yupahAPAzXL+fs/V3wI/Y2gqf/4gw9d9Wsx/48I=
X-Gm-Gg: ASbGncuNYdrjxtBMAGyVWKnoc+duW9ffR6G7Qv0QYRsu1IDaflvgkssmFCwcXnRq8uf
	+9m8jop6oLw4vSTL5KB2y81XQygXisOJrUaXi6YF3r2nn9xnI5xjtL5MGoRw6b5jn4NOjx8VJDb
	6sIj+TKbVS9HvK8W6vZHWXwHpZ424Rr1pIhvCBFb4GMUr6qXhbRjX5y5y8RgjeK8ssru0MTBEM3
	59IxdmUQHEnoADaFyjhD5f9C51bDZ94sGoGWAgZXs+gHouQCsCzUBoxAl4sEVhofw7KFED7p3n1
	lrrxzfsa4LFUAaiR7XlS8edcUexmlL/IrUcFHVsTvTjljoGKq38RLV1+33S7PxCig3m4ZVbSlYO
	sge+2j4uOqhg+47GyDAYBQfw=
X-Google-Smtp-Source: AGHT+IGRP/pIwNEZN/YSf647P0VBiKuokrllq5cryuGfggOfcoyMAvsAeQOTeSXR8LCaWYe+gmrK6w==
X-Received: by 2002:a05:600c:37c8:b0:456:cdf:1ecd with SMTP id 5b1f17b1804b1-45868d76755mr53246535e9.31.1753350945830;
        Thu, 24 Jul 2025 02:55:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586f88cfe3sm10532965e9.0.2025.07.24.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:55:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] rockchip: Add power controller support for RK3528
Date: Thu, 24 Jul 2025 11:55:43 +0200
Message-ID: <175335094187.68378.6716301267666015992.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250723085654.2273324-1-jonas@kwiboo.se>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_025547_510171_6C3BB4F1 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Jul 2025 08:56:42 +0000, Jonas Karlman wrote:
> The Rockchip RK3528 support multiple power domains, one PD_GPU that can
> fully be powered down, and other that can be idle requested.
> 
> Vendor kernel flag all power domains on RK3528 as always-on, this takes
> a different route and instead tries to describe all devices power-domain
> in the device tree, even for controllers with unsupported runtime status.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: rockchip: Allow use of a power-domain
      https://git.kernel.org/brgl/linux/c/cc2f156a33278d9b23b5cf8f738c55c842d0f225

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

