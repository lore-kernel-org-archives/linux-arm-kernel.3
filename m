Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09893D339A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZu8xvjHxZba+3eh7yj1gxmmXMRVMkdDPiFN2ynDSGo=; b=18V3C7QRf2FwjALO9ylpNzvFFC
	BlZHHdFrctN/aX/1rQUfCE1q838RfO3zbrwxhioY4NItEKZTTOyGIrChz3EVeFvI3hNgvmQfLZPdG
	ILM8xLXztA0AHt5YRKj6WRkGdfxevxebCJR3JV/z+dY2+ydOWJbo5bDvTAoNeJfdhphFJ31KDDK5g
	eqQZ17D2/PNZbkfJQ/piC/aldAQCV5WYA2OQlTC7LN26a8kTGgwEU/YBhaCVAz/w3TnNciRsliNYl
	ZkouXj2Z70HDGUvMrMJiqXcTNIo6gHECQbPb1KtuPIw3FD4e8lRvq/Cs25goZG3WQwTn5RqiZ43e2
	LcW/lF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TWV-0000000BeWp-3fH4;
	Mon, 28 Oct 2024 17:27:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TSP-0000000Bdwm-2vTK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:23:11 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb49510250so44519971fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730136187; x=1730740987; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZu8xvjHxZba+3eh7yj1gxmmXMRVMkdDPiFN2ynDSGo=;
        b=UyZ8K0PzV8MWvEdV4/EXKcz1rMFHe02qCdYClEGg7VPPRx3Fen9p5jAZ16L5X/OMsI
         ANi7h8RFDDPJZqNqS8BvftLbne/D4RqtNSvag5Y8CR/sqbigM73zqvgldTKbsve3wshd
         GgdiYMZG9RrhJ1Mjllp54WXOplDdlBktnNXYUAbH6zw022xXRzGJuVWkDoQh6gc4kHhO
         AzKYXLT3T8R7BZzyr2N+q4WXygLYBs1+HIwFHlj0T6yBJaZrcPtmu5BLuqTRPL/mzyYK
         k9koRCOqA84DAw2/ncYCtYU+wXK1ZdwqJk4V2eHqCZyDqbRjM7oh0Qcd0LHnO8B0HCqT
         abKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136187; x=1730740987;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZu8xvjHxZba+3eh7yj1gxmmXMRVMkdDPiFN2ynDSGo=;
        b=IAJ2pCxJ+Iy2g/CZH+nYPkhHUVx9rnHvLRpaHMHP68pNmKSehyCf8cREpn15+jOPkf
         EDCceOY/pGA9VOfh21y9aAzvTO/nVgg/F32mA5QF2O1CuyTWLCMDGnreAbn0x0Sn3wUe
         pNWR9mSyY7X+xn1nEFxeXlPuh+JUZBrY35b7r0VdLR0EBj46DDyGOhS1AK1H/5Eozgaw
         ydT1kcGyxb7mNc9sY+EJCNT9eK9u8xdy2kUL73S4z8GTVn43y2LVaXLnkGU+RSMnHEL2
         4mg0jGYGG7xxV/oAyFKBoQowxqBH95lRCm+tTX6sVfVO8jVzlgZimPuS4424L+W0bpmh
         f8/w==
X-Forwarded-Encrypted: i=1; AJvYcCXHHm6De3xdcyXEZWWyZkt1l6c0nhtVF5NBW+D4sfGWfLB82FNYzojUtiVlT0bFpljxCwnmJhg6tXGLna5b+Sy9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSAE+cULsE+GNNmxMnYRFdwyrKGAPmRKqY2PiBm05T67aAq0s2
	adupKFNurqtIxmFLRaY7hiTkamSSfkYRTOpNXBZNA3ogw+5wTU9O9G6PkYBlPFk=
X-Google-Smtp-Source: AGHT+IHgK/eV4on9k8mtCyUHrPvuiJUh7pQDUSq/q4wEJPNA22QGtkqRpLmwAMr6fW897v1uNQTfNg==
X-Received: by 2002:a05:6512:3087:b0:539:dc87:fd3a with SMTP id 2adb3069b0e04-53b348b508cmr3989900e87.6.1730136187288;
        Mon, 28 Oct 2024 10:23:07 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43193573cedsm120692905e9.4.2024.10.28.10.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 10:23:06 -0700 (PDT)
Message-ID: <be7ad677-f7e3-4eab-8b7e-1c375eed3ef7@linaro.org>
Date: Mon, 28 Oct 2024 18:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/of: support thermal zones w/o trips subnode
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wenst@chromium.org, rafael@kernel.org
Cc: Icenowy Zheng <uwu@icenowy.me>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20241018073139.1268995-1-wenst@chromium.org>
 <20241028171901.2484882-1-daniel.lezcano@linaro.org>
Content-Language: en-US
In-Reply-To: <20241028171901.2484882-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_102309_755155_7639F7F8 
X-CRM114-Status: GOOD (  23.49  )
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

On 28/10/2024 18:19, Daniel Lezcano wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Although the current device tree binding of thermal zones require the
> trips subnode, the binding in kernel v5.15 does not require it, and many
> device trees shipped with the kernel, for example,
> allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
> comply to the old binding and contain no trips subnode.
> 
> Allow the code to successfully register thermal zones w/o trips subnode
> for DT binding compatibility now.
> 
> Furtherly, the inconsistency between DTs and bindings should be resolved
> by either adding empty trips subnode or dropping the trips subnode
> requirement.
> 
> Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> [wenst@chromium.org: Reworked logic and kernel log messages]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
> Link: https://lore.kernel.org/r/20241018073139.1268995-1-wenst@chromium.org
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

In order to fix a conflict when merging this patch I did the following 
changes. Let me know if you [dis]agree with the changes

This change will go through the 'fixes' branch, so for v6.12

Thanks

> ---
>   drivers/thermal/thermal_of.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index a4caf7899f8e..07e09897165f 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -99,18 +99,15 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>   	struct device_node *trips;
>   	int ret, count;
>   
> +	*ntrips = 0;
> +	
>   	trips = of_get_child_by_name(np, "trips");
> -	if (!trips) {
> -		pr_err("Failed to find 'trips' node\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> +	if (!trips)
> +		return NULL;
>   
>   	count = of_get_child_count(trips);
> -	if (!count) {
> -		pr_err("No trip point defined\n");
> -		ret = -EINVAL;
> -		goto out_of_node_put;
> -	}
> +	if (!count)
> +		return NULL;
>   
>   	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
>   	if (!tt) {
> @@ -133,7 +130,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>   
>   out_kfree:
>   	kfree(tt);
> -	*ntrips = 0;
>   out_of_node_put:
>   	of_node_put(trips);
>   
> @@ -401,11 +397,14 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
>   
>   	trips = thermal_of_trips_init(np, &ntrips);
>   	if (IS_ERR(trips)) {
> -		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
> +		pr_err("Failed to parse trip points for %pOFn id=%d\n", sensor, id);
>   		ret = PTR_ERR(trips);
>   		goto out_of_node_put;
>   	}
>   
> +	if (!trips)
> +		pr_info("No trip points found for %pOFn id=%d\n", sensor, id);
> +
>   	ret = thermal_of_monitor_init(np, &delay, &pdelay);
>   	if (ret) {
>   		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

