Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88940E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeH7JCGoH1pV9VvbMVUHObucX2uQ44KXOKRR9gYgtic=; b=ViwC85kYXtmhBWbuGw6RpB5Knz
	TFBIGjqmjdggWRcQgTe3KfS5fLI0rzWvd6WyznbIqL8F6q6t98cssw1uAn786OtO44StfqG0gA+S9
	huHW47TM8aPiMeMBdUIYQD3pxjc14LKC/R7a2PuwSq20z6Ana2Tg9yITG9BAX3wCS35uSbDj0XX3L
	L83kUxkQlsjb8gu3Bt4EViZ6G70+czaJg53qgPob8UMWwJ4lVKlgzWXZTwnVSuTadkTK5AVszC2zy
	XpAxrW1SXJb0PI+3kkaiarWYDYk1/sK5RmWDyvfg+Zdoamdd1X15fFSsSqjw5glVPHBzkurXsQH2l
	Q0Bs/oEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwS3-0000000CqtY-1cjj;
	Thu, 09 Jan 2025 17:36:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwQp-0000000Cqi2-1zuf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:34:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385de9f789cso869016f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 09:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736444093; x=1737048893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LeH7JCGoH1pV9VvbMVUHObucX2uQ44KXOKRR9gYgtic=;
        b=Ec5nKcSTuhjAGtb5HQsrkui8IMgBqeWYvD/iacjw6krMWQFHoOX9IDUIzXI8deAD1x
         h433kDyOytM9gUONgYbcvAcwwUoD+qmVzFFUEgQiBgUwIObPcA/TNQ10FFw9qBmNLdYa
         3m9efe85EzKITQ5JjtaerZ28kzh2H6LTgYdYTLkPHpz/MVJEjoEHYJQuXD/gGfDvsMp7
         V2gOD9Y7q3uq6EUVKfW8OuvpOu++IjYlgm9D7yxYbh73cKpF1MKK3ffPg60PX3l/w7e+
         Soouo/CRSPBf6TUPX8w0jlvPoY9BASP0K5EO14YVAfX6wo7CKEvlVMcGK5g++6ykC3DR
         +ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736444093; x=1737048893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeH7JCGoH1pV9VvbMVUHObucX2uQ44KXOKRR9gYgtic=;
        b=iVBHY0HJ7XgDSBUf73gugKa+CmE6KzDW4ajm1KHhxz5mln6NqCzwZE2XOrKs/9eGor
         PrA0+Rgz4OY17DXaTaHoBXTQ5QnatJgF2sKvtHhgLLZvvVcZ7pcqZatF8QS9t7HvnNYw
         xyLw8yFuqDd624OKqbPn3qC7DICIGAJRxMw9Mn31MKn5s004yRuwdEXP5NpUz4b0NVf1
         aBtsD2I4qVrqGBLJsgqVwLazm2gNfl9Q9cDdDqvaWM734QAQS+r7B5y1j8dzcMKp6FuW
         QCikzoryqcTolW2jvMq2QNKESCr15DoW429ntEs4sjkq2H8Vw4x9Ruc1vpzeIQjfYsG5
         2bBw==
X-Forwarded-Encrypted: i=1; AJvYcCU85/t2TVCOTXEOepQty7GsG1CgugroG7SiUaemJqSZFGIiBz6FLvMXDU4dG2461X+Q0MjqInAi1qqw4IlBOzGf@lists.infradead.org
X-Gm-Message-State: AOJu0YxhiizR8APEUlrWlam1U2VrNewXkkZwOlks/kn5z3CejxqMcYqB
	yRjsMmbFoxgzCl6/3UW+CTifeZt4GyT7W8Z31z+88F6eBCHM10vUONjt6Xa+89M=
X-Gm-Gg: ASbGnctG+Lltd89MfhzNzcPSvKOANst24DpSqO5M0d13jenvSl++4RojDrbQWxgEmZD
	oufHS6i08IqCf1NJlxUTwzGKAT4G/rHEecl6RH+IsRhEk+yHp9lMrRyioHKvr9SbDfGAmsCjEk9
	a1vdI0837n4YO/OXiYn2yLBg1UXNy3QhQiaDUhTOTSra4tbovGhJOgFTI+PtO2hWGNNPOaf5sCr
	ZtuGccoUde9Q2fyULGt+4k0GREEnUhdMpFTMyOL5W5oFwMxj8/47R9J0PphwQ8CZU4mB77QccRH
	kuGx+fiIfPVPjPWDUhPV
X-Google-Smtp-Source: AGHT+IERs5KCEwKQIucPIFyDT2/QI76eZVYMCRhArmVMVyZ0ZhvPLwhehl5XC+EpSW+RlEv4FQNlBw==
X-Received: by 2002:a5d:64cc:0:b0:38a:86fe:52b3 with SMTP id ffacd0b85a97d-38a872e173emr6778925f8f.22.1736444093317;
        Thu, 09 Jan 2025 09:34:53 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e4b82ddsm2339000f8f.71.2025.01.09.09.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 09:34:52 -0800 (PST)
Message-ID: <46c8e8ff-ea39-4dbd-a26c-67fcabf4b589@linaro.org>
Date: Thu, 9 Jan 2025 18:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, ulf.hansson@linaro.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_093455_516469_03CF247D 
X-CRM114-Status: GOOD (  30.23  )
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


Ulf,

can you have a look at this particular patch please ?

Perhaps this scenario already happened in the past and there is an 
alternative to fix it instead of this proposed change


On 03/01/2025 17:38, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
> clocks are managed through PM domains. These PM domains, registered on
> behalf of the clock controller driver, are configured with
> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
> clocks are enabled/disabled using runtime PM APIs.
> 
> During probe, devices are attached to the PM domain controlling their
> clocks. Similarly, during removal, devices are detached from the PM domain.
> 
> The detachment call stack is as follows:
> 
> device_driver_detach() ->
>    device_release_driver_internal() ->
>      __device_release_driver() ->
>        device_remove() ->
>          platform_remove() ->
> 	  dev_pm_domain_detach()
> 
> In the upcoming Renesas RZ/G3S thermal driver, the
> struct thermal_zone_device_ops::change_mode API is implemented to
> start/stop the thermal sensor unit. Register settings are updated within
> the change_mode API.
> 
> In case devres helpers are used for thermal zone register/unregister the
> struct thermal_zone_device_ops::change_mode API is invoked when the
> driver is unbound. The identified call stack is as follows:
> 
> device_driver_detach() ->
>    device_release_driver_internal() ->
>      device_unbind_cleanup() ->
>        devres_release_all() ->
>          devm_thermal_of_zone_release() ->
> 	  thermal_zone_device_disable() ->
> 	    thermal_zone_device_set_mode() ->
> 	      rzg3s_thermal_change_mode()
> 
> The device_unbind_cleanup() function is called after the thermal device is
> detached from the PM domain (via dev_pm_domain_detach()).
> 
> The rzg3s_thermal_change_mode() implementation calls
> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
> accessing the registers. However, during the unbind scenario, the
> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
> Consequently, the clocks are not enabled, as the device is removed from
> the PM domain at this time, leading to an Asynchronous SError Interrupt.
> The system cannot be used after this.
> 
> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
> be used in the upcomming RZ/G3S thermal driver.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   drivers/thermal/thermal_of.c |  8 +++++---
>   include/linux/thermal.h      | 14 ++++++++++++++
>   2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index fab11b98ca49..8fc35d20db60 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -329,11 +329,12 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
>    *
>    * @tz: a pointer to the thermal zone structure
>    */
> -static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
> +void thermal_of_zone_unregister(struct thermal_zone_device *tz)
>   {
>   	thermal_zone_device_disable(tz);
>   	thermal_zone_device_unregister(tz);
>   }
> +EXPORT_SYMBOL_GPL(thermal_of_zone_unregister);
>   
>   /**
>    * thermal_of_zone_register - Register a thermal zone with device node
> @@ -355,8 +356,8 @@ static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
>    *	- ENOMEM: if one structure can not be allocated
>    *	- Other negative errors are returned by the underlying called functions
>    */
> -static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
> -							    const struct thermal_zone_device_ops *ops)
> +struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
> +						     const struct thermal_zone_device_ops *ops)
>   {
>   	struct thermal_zone_device_ops of_ops = *ops;
>   	struct thermal_zone_device *tz;
> @@ -429,6 +430,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
>   
>   	return ERR_PTR(ret);
>   }
> +EXPORT_SYMBOL_GPL(thermal_of_zone_register);
>   
>   static void devm_thermal_of_zone_release(struct device *dev, void *res)
>   {
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 69f9bedd0ee8..adbb4092a064 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -195,13 +195,23 @@ struct thermal_zone_params {
>   
>   /* Function declarations */
>   #ifdef CONFIG_THERMAL_OF
> +struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
> +						     const struct thermal_zone_device_ops *ops);
>   struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
>   							  const struct thermal_zone_device_ops *ops);
>   
> +void thermal_of_zone_unregister(struct thermal_zone_device *tz);
>   void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
>   
>   #else
>   
> +static inline
> +struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
> +						     const struct thermal_zone_device_ops *ops)
> +{
> +	return ERR_PTR(-ENOTSUPP);
> +}
> +
>   static inline
>   struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
>   							  const struct thermal_zone_device_ops *ops)
> @@ -209,6 +219,10 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
>   	return ERR_PTR(-ENOTSUPP);
>   }
>   
> +static inline void thermal_of_zone_unregister(struct thermal_zone_device *tz)
> +{
> +}
> +
>   static inline void devm_thermal_of_zone_unregister(struct device *dev,
>   						   struct thermal_zone_device *tz)
>   {


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

