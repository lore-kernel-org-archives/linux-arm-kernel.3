Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2AC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYYtfqkC2z+zGFusXbLXfXaBLPq/Bv1l8KfzotDMXk4=; b=DW192iHWhhyynsB9uPbJ60e0U0
	zY2aWCgBbZEUNKLvvsUbFBgyxyWhMOldhDcOr7k7fzbHer3DklIDQ/AdQtvbkI7DexY9oEM2bqSd9
	wWjjyfVJpiGr/bAcPX8eF94ogmoe+ARVspTfoLgSLl6Fu+WkQeSywcknsfSEKoWhIcQuah7q2xLfa
	j/FGh+DZ+vyKdp6NchXYKiJiidWoY2QKcgy2bY9MJCdcKsbnNYYqJlfu52+qSYYW/35PtxFvoMsA3
	EM5jYXxqvgy0OocahohYlin11KjWa9I2ZwJQqg9GL6Z71TdI19Mjf+fv89ZV4p3/Mx8F5iMI3G1pi
	TZ9HuZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqujB-0000000HXwe-0ruI;
	Mon, 03 Aug 2026 15:37:21 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquj8-0000000HXvB-3jDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:37:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8423f236418so2801904b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771437; x=1786376237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYYtfqkC2z+zGFusXbLXfXaBLPq/Bv1l8KfzotDMXk4=;
        b=oUTliR7BlebiR+mDItJELi00QFCGCcd1da4m7nEoHLBFOa+HCYM6dsFBLlXsSH0QT+
         gwilMpzoHEr7zpKGg7XoZiwDTb6eqiHRUhCq/t1fwKDitqAL+Ac+B0UttFTjjRwmNCs4
         pF4DCxGjIbfzwV0njTEa4IfDJXITkVMnMNaynFhfM2EBRZV9E1QC8ftzHYuIGF5gu0hN
         fBxE3n1mTybBsjOwtYQQx6bMMYGREYbSSM1ym8vd/8wdEZE9hdxQeUyLdhOWJJY+/+Gj
         hMEXEoXyFX73dV18Eyl8Xa1MxGl8JUu1hwMkKYyzvCTo/lTPdgHkgcDIk4CFzGcCYoK8
         8Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771437; x=1786376237;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oYYtfqkC2z+zGFusXbLXfXaBLPq/Bv1l8KfzotDMXk4=;
        b=RygRJ0YNjwkK24BmyXSQy7f5qj37pdJT0xw4Ay9uJqsrbPDTIW95e3MavaBEeVuTm0
         9kmpgS22AhniRhGDpyuvP2vlYH0mpCVPO2SDzYG/1MIenEzaiuoJPL+92GmO16BylKi7
         zNKgbdsQcDON3Y3XNc9kzGi+jvNe4j2qRAv9TgcrusfQ9BZpJVZC62dtbEZ6CRX4tsgm
         aW9QjeNH+T0W+OR+ieCSESh/CFywJaygbt9Q8AyLj3AQ6VI6DxQxsfmH+eMiMLdHVJBs
         HbVCGhtDCrHZRgwTlJQC0AShBZzPVVRm3kfOPmp1Mn3KYlGrKgMu8tVRKHqD+5gBNIkU
         AB1w==
X-Forwarded-Encrypted: i=1; AHgh+Rrph/Gkqn8TnKp1xTCG3fMCBSetLSmnFE3+4dYAPM2XMcvyDX4T803N91UbU7HRknB+T6olZdkeV9qKSLbpbfpS@lists.infradead.org
X-Gm-Message-State: AOJu0Yynm/gVHpp9rUW7WCfnmPhdr05Nz9MV/mR5N9l9fuOebK3q0JOG
	0g7c8US70P72XTh6eiuTl0Yzqc7962lcV/4Rc0R9kM0bGABFE3cBQhFH
X-Gm-Gg: AR+sD11JcyrXhZ1Synmn+lo5GnyELyJyf7vQMOojZuzoxll632bq2WxrxEHSyStGj5h
	92oKSc5/YC4s8SvQ36t0A5gn55Br2RFfaFPbKdGem0fCqjiJhPVUpqD6vYvP6uwc0mOzeITpxvN
	D06kFqbukOWx5K/yaDs59yhSvI8qwlCF20eBUadFCV6Jx3lWJjmq/jDV9aKdGRAWe/1jfpQL51z
	cH6O+VKqxPDK4gCHNoIhCdNitjjSrC/GV41ow7h9YYEu+Yv2kZYZWaCTbALzHXFJR3khDYnkyI7
	pFuRvHbjwQ7VWs4G7ks7OTHoBiQX6v1aq0iKp5ZlMVX94q+jPZqEGQDmxGp0r9QA2kcITdcrNeH
	FwivmMbdjieLk0TwnVfjvvDsRpB9BD9gfx0h9GL/2dpZwqiREj4QHg6Squ3F+P8RL8DyS692xN8
	BC4/6TL1g1BWMQBZ3i4fp1rIp3Zv/8++IpYukWaXEKKTXP6WdB523gozIpDgkk2MIuuSDH9mP66
	mwtZlWqLQNc6aTvrhuRK0h3bHtb1A8MWgurHcI=
X-Received: by 2002:a05:6a00:1256:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-84ee47dbef9mr9500711b3a.5.1785771437475;
        Mon, 03 Aug 2026 08:37:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29c7e3sm3939704b3a.38.2026.08.03.08.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:37:16 -0700 (PDT)
Message-ID: <45698e38-73c3-4548-95fa-3037c9d133c2@roeck-us.net>
Date: Mon, 3 Aug 2026 08:37:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] watchdog: sbsa_gwdt: add force_enable module
 parameter
To: Zexin Wang <ot_zexin.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
 Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260803071823.27759-1-ot_zexin.wang@mediatek.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260803071823.27759-1-ot_zexin.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_083718_945220_AE2950AD 
X-CRM114-Status: GOOD (  28.22  )
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

On 8/3/26 00:18, Zexin Wang wrote:
> The sbsa_gwdt driver only manages and registers the watchdog timer if it
> was already enabled by a previous boot stage (such as firmware). If the
> watchdog was left disabled prior to entering the kernel, the driver
> will not actively enable it during the probe phase.
> 
> Introduce a new module parameter 'force_enable' to allow overriding this
> behavior. When 'force_enable' is set, the driver will forcibly start
> the watchdog and register it as running during the probe phase, even if
> it was disabled in the previous boot stage.
> 

That describes what is done. It does not describe why it is needed. If the
watchdog is left disabled by firmware, there is nothing that can be done
if the system hangs before the watchdog module is loaded. Enabling it when
it is loaded will in most cases not buy much additional protection, because
the userspace watchdog daemon is loaded shortly thereafter. In many cases,
the userspace daemon will be the entity loading the watchdog driver.

So, _why_ is this needed ? Why can;t the firmware enable the watchdog on
systems needing such protection ?

> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---
>   drivers/watchdog/sbsa_gwdt.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index e04d42cc7774..4b49e1aeef84 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -122,6 +122,11 @@ MODULE_PARM_DESC(nowayout,
>   		 "Watchdog cannot be stopped once started (default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> +static bool force_enable;
> +module_param(force_enable, bool, 0);
> +MODULE_PARM_DESC(force_enable,
> +		 "Force enable watchdog on probe (default=0)");
> +

This enables watchdog while booting. There is nothing "force" about it,
unless everything the kernel is directed to do is done by force, and
everything needs to be named "force <something>".

Please drop "force". Name the parameter "early_enable" and describe it
similar to other drivers (such as omap, s32g) with the same functionality.

Thanks,
Guenter

>   /*
>    * Arm Base System Architecture 1.0 introduces watchdog v1 which
>    * increases the length watchdog offset register to 48 bits.
> @@ -296,6 +301,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>   	struct sbsa_gwdt *gwdt;
>   	int ret, irq;
>   	u32 status;
> +	bool force_action;
>   
>   	gwdt = devm_kzalloc(dev, sizeof(*gwdt), GFP_KERNEL);
>   	if (!gwdt)
> @@ -386,14 +392,27 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>   	 */
>   	sbsa_gwdt_set_timeout(wdd, wdd->timeout);
>   
> +	force_action = force_enable && !(status & SBSA_GWDT_WCS_EN);
> +	if (force_action) {
> +		sbsa_gwdt_start(wdd);
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		dev_info(dev, "Watchdog force enabled.\n");
> +	}
> +
>   	watchdog_stop_on_reboot(wdd);
>   	ret = devm_watchdog_register_device(dev, wdd);
> -	if (ret)
> +	if (ret) {
> +		dev_err(dev, "Failed to register watchdog: %d\n", ret);
> +		if (force_action) {
> +			clear_bit(WDOG_HW_RUNNING, &wdd->status);
> +			sbsa_gwdt_stop(wdd);
> +		}
>   		return ret;
> +	}
>   
>   	dev_info(dev, "Initialized with %ds timeout @ %u Hz, action=%d.%s\n",
>   		 wdd->timeout, gwdt->clk, action,
> -		 status & SBSA_GWDT_WCS_EN ? " [enabled]" : "");
> +		 watchdog_hw_running(wdd) ? " [enabled]" : "");
>   
>   	return 0;
>   }


