Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511ACD3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=; b=4rFXjORtO3eJcRd7IBNV6ZWE0k
	uAPu2YXie8vz053BxxZEFeB+uE7uPotvTaco2FxZIVos5E1PmnZXApjSs4EUDTaaTECmZDA6QsFZy
	2nCD0iTeFL813SJQWynHfg5iLYt1z7X1SSQBZSMKHsU199MucZNKxXwV1uv1jtsg1LkN+mT3KjiPg
	YvuXZiH4hHSvRM2DUGMk9J2qjhWHNi/Hf7Wu02gGki3RJ1M2tSYLsYSe1FGi5HraKjOfqwBS7Dizj
	gHtk1r/PXD3scgoBT6QRsRGZMmz6tH9Hw139GNhGLHrJsNIh5KPuUZSuj/G3tfDwRiDnTZIiRmfR5
	px9Foiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVLn-00000007YNs-0zjG;
	Mon, 25 Nov 2024 09:25:47 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVKW-00000007YAs-22aR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:24:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso2137359b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 01:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732526668; x=1733131468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=;
        b=cV9Eutp1MPHnFJFbZB95tVnQwG+NAZgUa1iNPRPFtPt9hbhuqnvIijR3/EryzLMOFK
         7HEojyzBPMvUINwtj1FPT1Bu/DbocokSgrQQflDCuuaJxmRsPUSbcaLzGF9wxXSs6Ztt
         hWLeu3OFN0Ctk2D8jWU1W6oFEoXX5PDLlfwy8vK0DKpLd9Mrr/P6fV5ZDIQKWYJJx6N5
         U+h2k9Kvkt0ZpP8QLCrvgutPw1KbMvG+oQKNKUOQIk8OtrSgHbgtQyN//hXaZN37WnSa
         hoh/kilHMD3sdPi5BfBEfLb67uHXPLI9w1J39puXoqsgGwtSNy7VKoPZJpzFVTG2HK1A
         D9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526668; x=1733131468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=;
        b=SK6wfqVP7HGX6mMpbOtM9immud1wBiTwSJVYSMKr95fIY0C2l8It0SeSLJw9NBcHBf
         xvtQ6owmHEJGo8azO7Fb224Tj82jKW2H0X6pM04sCVwb3culpk8TkSEoATzNRg3lrYv5
         rxbrfR7W8AcmPiKAoyJ7q8Ixbo4mPpLkctoiRYQMQUEg+0tVUS1lM/KMuzMwb7mTJXf+
         HeqgFlHXvX4ffg+H3GyjCHTNPMg0Gvessezl8EAfV/uXJvNTmv4RHo5WZqcqvGKR0Ona
         n0hAcLZDQ7RLSAc5Hzrvw8YmDH+Sgk1eOykmuWbGcW5TbUdwLCTqv4GrQieaHTSFgoEU
         LIHA==
X-Gm-Message-State: AOJu0Yz7ZXb1gueKL8JWu7l/HOf2ljdvfXKUEioSDztwc3X1AbAkLR2R
	e/rCLzatSrCaFUVUbjpJ6ivOOHcXa9V1PI6T0KD1eUjBJleU7SkO
X-Gm-Gg: ASbGncvl1tn8Z55QA8OFJem4GYL77BgmJ2DR8OuwLG2qbLi6j7jvQFPcC50tv5TrwX0
	7ywYYaJDeVHElG8K4MVTm7i2TAB3KINPSfLIIGqfn5lU3Q+/lXr0IyIVFcyMdZKTGaPqhJrQ2mE
	ASnI6bA/xUQOEO1EDkQJQeuZlfF5A7EXF1ESGVkti0nWB6MgbtQV3d7MWIG55Uknef/9awa+1ud
	0yLgeEWt0Du+DE32AVA6lUo36NeTzK+dhtstS0leTaiVUNw9tjjFPgTMxMc/clDEk0b
X-Google-Smtp-Source: AGHT+IGH/2hu7Jr9H6sYJsbkLS36GY64EFbufco7FimN9lRF0ny00OASpXVX5qeXHk77eHloKg29MQ==
X-Received: by 2002:a05:6a00:a8f:b0:71e:410:4764 with SMTP id d2e1a72fcca58-724df5d453fmr19361348b3a.8.1732526667715;
        Mon, 25 Nov 2024 01:24:27 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de5762b4sm5950940b3a.179.2024.11.25.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 01:24:27 -0800 (PST)
Message-ID: <54759f1f-2575-4e84-b351-119cefed2b17@gmail.com>
Date: Mon, 25 Nov 2024 17:24:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entries for touchbar display driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_012428_522622_81CF8CF9 
X-CRM114-Status: GOOD (  13.00  )
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



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7f0170977013889ca7c39b17727ba36d32e92dc..1964bb705cae0b0f12e2174fc96c5cd123d31520 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2164,6 +2164,7 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/arm/apple/*
>  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +F:	Documentation/devicetree/bindings/display/apple,display-pipe.yaml

Missing F:
Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> @@ -2183,6 +2184,7 @@ F:	drivers/bluetooth/hci_bcm4377.c
>  F:	drivers/clk/clk-apple-nco.c
>  F:	drivers/cpufreq/apple-soc-cpufreq.c
>  F:	drivers/dma/apple-admac.c
> +F:	drivers/gpu/drm/adp/
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> 

Nick Chan

