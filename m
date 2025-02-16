Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFBDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FDJ8ZAosIgJMDHyRhgR/+IbzksVeeI6dYKzBIqtwZE=; b=MdV5QBe3zRIgCC/Ld7/dgWxE1w
	R0d1soP3Pq4VnGk1ZFB+UnVNxdFNunScDlNs/n/xK0Chv2mldFiHGPjWAmauagLdoWp5RLzP37KuU
	KawAU4mAq6uObocxej31w0ABYfCOL/Fp8BT1kw2xBD3opCmiWwu6deACx8lBWWY5xyFyyLInp3c6j
	yYP74rf/WOJFOC7pl8sl+VtRtuenJXHWuL5/ETrKyMNCA00wOox+3Rk967FfEkXfaYa/kpP9MkQN4
	MJOh4S/sQrCxZqKXNwfAjUcd/IqIyXWyiYmdeHOSs3KPeMEFOY9nXb0Y8P8SZbKBF6rOhopM0c59W
	/GUyi9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjd6v-00000001jEV-0sR0;
	Sun, 16 Feb 2025 11:46:57 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjd5S-00000001j5x-0uZH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 11:45:27 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5dfb26020dbso343944a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739706324; x=1740311124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0FDJ8ZAosIgJMDHyRhgR/+IbzksVeeI6dYKzBIqtwZE=;
        b=GwWW99v+NNjL3r05nBG70vIfPyNkSH/8gk4XBSyTjBf5oCuuPdW3IDsbcGO+l5yq4u
         fwt4zMuW7ULYEl8yYS4h5XoU1W9rLqNzGtommp13rQ1gENNh7+VPjJcRql6WqHrv0EJb
         tY2OV47evHn+mIecmf7vc/OvW49sYkwYS5mjeJwMO5JxpdCS8/2vgYXR/rVZWN+CncBU
         xj4fmE9hWjW6PpiBSn3Kp9wcK3zjy0ZucO4EpIs7ZXAvcmgvm1B1UtBWnAOg1Oa8pQ73
         fgN/XSemPaNDqA4+c2Ocso1XgVsK49WVxRRPFCIQZf64PYE+5MiKysRg6RPVhinyIJ+z
         Rvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739706324; x=1740311124;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FDJ8ZAosIgJMDHyRhgR/+IbzksVeeI6dYKzBIqtwZE=;
        b=LpDw6AWBIcJVdpuDMx0T+LAboHRYdyjmeCm4q+dJ9uCK/u84Hj5P4gV/jXhI/jq9d5
         lcVCIy+8eJEavxINJqXAE0zpdG2kkEk7MOdSJ7DXAbROBGgXe8YCfquABfk2K39Q3O3e
         e6jQdPvNmIuG/XabbHt4D9d723xsz53aQkLigniqqq5fN90+Z7vliCOoFM7jo4uX8nwl
         a39qv4ESc9Nb6emihP59ITjiAod5dOHD2oNzMNaVaZ8CeUqhpSInuIfDtOyf2V44uEqz
         YIS2wftoHepDF3EdjTBBuF8aCBqxcbtn7uIIrgdZCJDaIsvmYqx+GIkbINteekhtJbR4
         F5/g==
X-Forwarded-Encrypted: i=1; AJvYcCUubISSfJL9BtCgcEHUSktKeHb9b6Y/dVuXZb9JrqVOvMNnv5/+IX9fZYkZ2ZU3phHyThF2FgTVXMYsJP1MXVIk@lists.infradead.org
X-Gm-Message-State: AOJu0YxmOq0FHe11cLuiDktt8Io9K3N9DSuSfEh0n2iwjFOVL1QGDnJG
	cv5zkC4oNeIy3nz3gBc6yV75XO4iCDhVHO0ihG5106f0CuIgFAkpCRR45/JhXwg=
X-Gm-Gg: ASbGncsezFhzCSZCNdB1OaRgZBFG5moUBzjYe+84mYyxoJ3oGYMS4ikrLeTDvWHvA7L
	dpIDMN5CMY9I6w85mXadoEMnR/9z4uJnoT9q0rbH+VlhOPsURgM//kE2qbJ5xzHCL9xF5WtO8oh
	Nmhlq46Yxzj2fQ+0h0zug4KHak9PxYBSCDEQhgvh3EShdhj2tgUV0zEFfZvkG5WsnZj7u3REVA/
	c0wE7/v2PsbZovRhQUeX2o5liRePXHL1qmC7QOztzW8LAlDQx8M4VRx9NY5XYhDToCmHBruUaN5
	d9zg0mmH0kLMr7qTsyXuhViFnE+88ghVLBQ=
X-Google-Smtp-Source: AGHT+IFyJBEbNKKiH7hvBmMsBfMZcW56f4DRp53Of4ItbGHoakD53OsGw79hZ5TnMUnxgOOJX1AUfw==
X-Received: by 2002:a05:6402:2793:b0:5de:b956:a749 with SMTP id 4fb4d7f45d1cf-5e03602c7abmr2341246a12.3.1739706324518;
        Sun, 16 Feb 2025 03:45:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c416asm5765041a12.18.2025.02.16.03.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 03:45:23 -0800 (PST)
Message-ID: <63c0557d-1438-42e1-9edb-7b5a00ad7cee@linaro.org>
Date: Sun, 16 Feb 2025 12:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422
 (TYPEC dependency)
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_034526_269352_100FD962 
X-CRM114-Status: UNSURE (   6.83  )
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

On 16/02/2025 12:41, Krzysztof Kozlowski wrote:
> +
>  config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>  	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
>  	depends on USB_DWC3_EXYNOS
> +	depends on PHY_EXYNOS5_USBDRD_TYPEC

This probably should be COMPILE_TEST to preserve previous compile
testing options on !ARCH_EXYNOS

Best regards,
Krzysztof

