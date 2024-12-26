Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A49E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZM4CEUh2HGYEJA81GK95AB62iIhj0se6/I95TBn3+Q=; b=EuZ8uK4mYYv7OaxmLO2j3vylcg
	seIRkVoHUFvzfkBJEabijnlTW5mrb+uUhGO6gX6lhEq0WE/6lhxKO19ZDmKG2CYK/hktaRtxm3P0O
	Dpt5Ml2nN05HINL7igA5DDNv5gbNQmPca0Fgp9RgczpF9XpmDPtaYTIJT7TOImUygB2He3H8Y2U27
	p4QpMqfEoB+GmvElT5JbrQj1i+9S6ENTa2iTLLGGS/QMlJiLqrxP01WRwXN7HV8j3XEL7YTEp3w19
	h0/nHFcWf7Dpr5/OXXYBT/+dp9DdQMi4yLlTh4o/6knOkPbGcKKyiJ9djlPepg5RIeK+2sPL5lzc3
	Voaq2Xyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrgT-0000000G8jH-1TNM;
	Thu, 26 Dec 2024 17:30:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrfI-0000000G8cZ-2ArM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:28:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216281bc30fso90025985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234131; x=1735838931; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZM4CEUh2HGYEJA81GK95AB62iIhj0se6/I95TBn3+Q=;
        b=RuhT1YhFBvswWkFtCTWVjLHlwuFVLR+fdfmCBkMJLgNAwupVAMwdcrGqceAeSxywYB
         5YYMqPrkhzO7Yqpt/GfqSrwTyxkMOomEB2f0BgVBQldLsIqPiCCyOzshjdnq3rp6+fcT
         84jK5847r1UXcuKCsTYHbU1nANK8R854WBfqP3lZqy2F9ZALx2bMUhx2o7Un9nx8Wxkq
         7R17E+9IsN0V4CU83pKWynsX+hObMxetswrEmIvzd2wREnnl0pASh2bhnF/Ix5lorHbd
         TKR8OdKvwBpjJ1BrukTjNd5ME1gYcXUUnEs7P5cngytGBXSbXZbO+S+mCrCIrfS991Fj
         pd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234131; x=1735838931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZM4CEUh2HGYEJA81GK95AB62iIhj0se6/I95TBn3+Q=;
        b=Ttizpgbhce8VL+P1xpCNaP7Uh5xAhntsg4vG6V//lOHgqG3FO3yT9zOJDByreztNh8
         EonVJtmdjF9vp++y828LaGxw4cSG5XZeajCYAPF9BRbT0TnH7ZQQIUzvGmh5VJsvnQC1
         B00AeU7X0PRd0y1LA2YurMsaoCinJaRE/152JqMpE293i/FlDl2/rh/JX3k5srxWEK24
         x/HqkPnt73WGpvWDFgjT5TxApjsA5eYygo6MpcZ86XI6tvQ+sY91FOVEsf1EkIWoIC/c
         2HSHQUcTKF3Rg4L/dftMAKcCi7ceJmP4V2X4scvj84U80YsNGKdlVzHOkT9wwe1WJFRF
         Kc4w==
X-Forwarded-Encrypted: i=1; AJvYcCWu77LMqJ5qKJ0YrLzmpcXsyFOJ0bCyw68kjagZXXmLaOpl4A2FTOf7QRoDNSIgZxkP5iDX/7HoEyhUNJgAO33Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwtKHrGE/B1To9CcM2exTovCu4QOn5T9+3Jn5LRUryDOwEQTt7y
	4UVkB+2VhpMq7krljE2sgzYq63HU6vdItiR9QJqwZeYi/vHoWjjqK5Da6sNAVQ==
X-Gm-Gg: ASbGncvq254V7PabrC6x9UShQ2qBlD53G1q4j7f8oWJeHk1XRv81w+3pROYVxJMTl36
	NXFJfxmpnnAAtB5kpZF/Km2roJtzSieMgCzrmfJb9pOphFcXRTwyjN4xYPidbuStih+quv2gFs4
	mGUfXhB5vHnhP8Ycuuf/hSzqtC+T+G2akcQzkc+Kc2xdNTIJuSmGNeEO4/d5tfbIMlqVXWbnh4w
	wjcvDUCc34/mKa534XMLdUXIYoaR06e5OwGYNluuH1zNUJ2Qd3uOP2D6kgoTQSpaDxMOv8HyzZJ
	+CPJFZc9JUfaWNrVuQ32+ki1
X-Google-Smtp-Source: AGHT+IFBYpPcdLPqV6zNyGAlMP+fcIVUdggCbxsnyGgouqIm8mTzus1DxDfWnUwkq2+QguJv2z5GcA==
X-Received: by 2002:a17:902:d502:b0:215:94eb:adb6 with SMTP id d9443c01a7336-219e6f2605emr383250035ad.40.1735234130575;
        Thu, 26 Dec 2024 09:28:50 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962c05sm122006295ad.43.2024.12.26.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:28:50 -0800 (PST)
Date: Thu, 26 Dec 2024 09:28:46 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Message-ID: <Z22STiGYnLdSkNnW@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_092852_569050_ABA06B2D 
X-CRM114-Status: GOOD (  28.98  )
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

On 12/06/2024, André Draszik wrote:
> Hi,
> 
> This series enables USB3 Type-C lane orientation detection and
> configuration on platforms that support this (Google gs101), and it
> also allows the DWC3 core to enter runtime suspend even when UDC is
> active.
> 
> For lane orientation, this driver now optionally (based on DT)
> subscribes to the TCPC's lane orientation notifier and remembers the
> orientation to later be used during phy_init().
> 
> To enable DWC3 runtime suspend, the gadget needs to inform the core via
> dwc3_gadget_interrupt() with event type == DWC3_DEVICE_EVENT_DISCONNECT
> of a cable disconnect. For that to allow to happen, this driver
> therefore needs to stop forcing the Vbus and bvalid signals to active
> and instead change their state based on actual conditions. The same
> TCPC notifier is used to detect this, and program the hardware
> accordingly.
> 
> That signal state is based on advice given by Thinh in
> https://lore.kernel.org/all/20240813230625.jgkatqstyhcmpezv@synopsys.com/
> 
> Both changes together now allow cable orientation detection to work, as
> the DWC3 will now call phy_exit() on cable disconnect, and we can
> reprogram the lane mux in phy_init().
> 
> On top of that, there are some small related cleanup patches.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Changes in v4:
> - separate out patch 5 'phy: exynos5-usbdrd: gs101: ensure power is
>   gated to SS phy in phy_exit()' from this series, as a stable patch
>   shouldn't be buried inside a series like this (Greg)
>   Link: https://lore.kernel.org/all/20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org/
> - Link to v3: https://lore.kernel.org/r/20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org
> 
> Changes in v3:
> - patches 1 & 2: update as per Rob's suggestions
> - patch 7 & 8: drop init to -1 of phy_drd->orientation (Vinod)
> - patch 7: avoid an #ifdef 
> - Link to v2: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org
> 
> Changes in v2:
> - squash patches #2 and #3 from v1 to actually disallow
>   orientation-switch on !gs101 (not just optional) (Conor)
> - update bindings commit message to clarify that the intention for the
>   driver is to work with old and new DTS (Conor)
> - add cc-stable and fixes tags to power gating patch (Krzysztof)
> - fix an #include and typo (Peter)
> - Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org
> 
> ---
> André Draszik (7):
>       dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
>       dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
>       phy: exynos5-usbdrd: convert to dev_err_probe
>       phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
>       phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
>       phy: exynos5-usbdrd: subscribe to orientation notifier if required
>       phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)
> 
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  21 ++-
>  drivers/phy/samsung/Kconfig                        |   1 +
>  drivers/phy/samsung/phy-exynos5-usbdrd.c           | 202 ++++++++++++++++-----
>  3 files changed, 182 insertions(+), 42 deletions(-)
> ---
> base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
> change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2
> 
> Best regards,
> -- 
> André Draszik <andre.draszik@linaro.org>
> 

Thanks Andre for getting this working! I've tested this on my Pixel 6 Pro.
I was able to verify runtime PM works in both orientations with high-speed,
super-speed, and super-speed-plus. Feel free to include:

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

