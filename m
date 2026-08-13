Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BD0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbgXz5++RlW5L6cDaDP8mafunaN5CoUMDCWXW8oXEmU=; b=RAkYmloZQguSQG6jGI+p0aT6do
	02vB4cJGsfF2/CxmIT/DBaKj19dtcdeh4/8ZCiqRxT2zLirx4Yugxh8TsWHq26NxlxTS5awt+IeV+
	B1DbX4nh663dfeLhe04QiVT/uZ6JPIP89DJdsT+f6YGoL8uo2NlZgqLqKLjGM9LybDhCFyroy+JEQ
	0HBb9M/YWv4DIbDzFf+HcXeuGz7Y1z1rXv2dt5d7AGtm6L5CWLdtTfzHI9LYBOQHrm1bI5ev3aqcW
	GUcv/SFhad5WEA0jXVsVSHui86QnoeJxAqD06L48nk+eO2U+AbhJgr1gWN6OzKy131iDao4rbiLFs
	E9utqHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNii-0000000HOJi-0a9Q;
	Thu, 13 Aug 2026 05:11:12 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNig-0000000HOIw-0GJG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:11:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3811f512167so2256543a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597868; x=1787202668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hbgXz5++RlW5L6cDaDP8mafunaN5CoUMDCWXW8oXEmU=;
        b=sgE79slImng6xGxsbKroe3QU7ipulzSBN2dlpB7LiUuxAHHNGrjdgTpSWHk2l94Lki
         y6AgadfncWtcOG1fKEfYs2kv+plMl5CXo4RQ068xXFeuzVwDnCu6zaRzwymheFcvBpz4
         bi+E9UDt1tsPlVnAY4k91kP8G7xOytyq9M5nTgz4Og+6wgRn0EfqkILIwzesu25uL4P3
         SYAjAq7ek/KHNFWohd6mSrypyIIY9E8hr0ikY8gTyAzbjzMuy3NJZcYwuax5umqPcsnn
         KvgIE0pGaQHrf4GsFPfExEk7MJ0m80jEMmXxBK2uX16ftIqu6dY6Rc5CdJWDbQxSiRO2
         gFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597868; x=1787202668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbgXz5++RlW5L6cDaDP8mafunaN5CoUMDCWXW8oXEmU=;
        b=qIEAgqSMXQ0YD3a94mFV3ZqftgKi7Ij3BoNT8C+zQCncPwtguRAbygknlppz+oL6gq
         pwf+qlomvlRi/+RfwvP26oIwYowV6LbZgjA0ZSkFw8WM1zxOa5BUYJmCCME448bxT4q6
         YVHHcXclkixRQi3flOmZHhK3kdv62Ft+a7Evva7fbgPVJ4ghyTZ0IR1apm1+eX20PLSw
         eRc5iYoUvVpdev2mScSeOv0dx+yA5A5bjzdLTa4khRz5+gDF7kHNN9ni3+yvZYxb0OCN
         g+RI/54n1DTK/RFxKvFUz+FrQNcRPqiLxpGxMVuUufIZu87v05fcqwQJ685XwvuUsEk1
         Bibw==
X-Forwarded-Encrypted: i=1; AHgh+RoN8HXa+bHdDmiVWuzI/fAD4nIQ/6BfbQeuTj1YVjao9gGmC/gPiJoSl7TcG+8g4GMMZaBRAv/c6w1/1aOAtCTo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9GnlQnFUrUprOxprTfrNTKBl2wpZ8Mqvh7zXSkyDdDHkRcxhJ
	0fCL0aT5MwbyR39u1WoJA2oiXemmgr397dUVWLYJCoujjbP9G1WOP9qN
X-Gm-Gg: AR+sD10uC9fnxs60GWstTAKNxmo5kImL40j8bUILUpwuABQ6YWDuiSGp4rnVWO5D7aA
	TC+k630iUt1ZDDOAAns6LnzN039NFKGffCOa8O0EBbDytbriCOhxSS/9opIH6j/nom1YPGJlsk1
	YzWaeYLNbgbMuwAgHfvJOd4FKHRCC5oPfPaVAAb1/jNWIsz/tGWTi3m6IiEDkyjbgf2y6wEfeZ8
	8hKwEid0oc2ZcewzYvVZwJCri0qmPuvwqq0vkMUSBpEryXgiNywT/AgY3+rcyriw1TlGYGB68Q4
	9YStCg08IvsBXdtB0y47I6OU5QxHjAwbjHyXQJXRrCbnQMf7GXMral7/u/t60AT+teJFi0sBNiO
	T//Dw1cHNQ3xBw+mplOsDIP1zfuM9UDXs8yWbNpuolS1ytYuSIsbSOvF0x022fMtkT7PNwmP97y
	QE40XwXMiCGnmxbshzDZal4iRD0gnJo0h6xGzo1QDkvssyn2ECCwMH65ZNZX/sxEljJzhiLxMVv
	w==
X-Received: by 2002:a17:90b:17cf:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-3931e32f509mr2910539a91.21.1786597868370;
        Wed, 12 Aug 2026 22:11:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cce8a3esm1866321a91.1.2026.08.12.22.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:11:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 22:11:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] watchdog: sbsa_gwdt: add early_enable module parameter
Message-ID: <a5e2f50f-4f3c-40aa-b881-fc730b9821cf@roeck-us.net>
References: <20260813034900.20235-1-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813034900.20235-1-ot_zexin.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_221110_113559_C440CAC4 
X-CRM114-Status: GOOD (  30.58  )
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

On Thu, Aug 13, 2026 at 11:48:56AM +0800, Zexin Wang wrote:
> On SBSA platforms using standard UEFI firmware (such as EDK II), the
> watchdog timer is often enabled during early boot stages but explicitly
> disabled by the firmware before handing over control to the OS (e.g.,
> during ExitBootServices). This is done to prevent unintended resets
> while the OS is loading, assuming the OS watchdog driver will take over.
> 
> However, this leaves a protection gap. If the system hangs between the
> firmware handover and the userspace watchdog daemon startup, the hardware
> watchdog will not fire to recover the system. For safety-critical systems
> that require continuous hardware watchdog protection from the earliest
> possible moment, this gap is problematic.
> 
> Add an 'early_enable' module parameter to allow the kernel driver to
> re-enable the watchdog immediately during probe if it was left disabled
> by the firmware. By setting the WDOG_HW_RUNNING status bit, the watchdog
> core is instructed that the hardware is active. As a result, the core's
> pre-userspace handler (controlled by 'handle_boot_enabled') will
> automatically issue periodic keepalives until userspace opens the device.
> 
> This bridges the protection gap seamlessly without requiring firmware
> modifications and without risking unintended resets during kernel boot.
> 
> The parameter defaults to false to preserve the traditional behavior.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---

Change log goes here.

>  .../watchdog/watchdog-parameters.rst          |  2 ++
>  drivers/watchdog/sbsa_gwdt.c                  | 23 +++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 502cb6adbeda..47867a621ada 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -515,6 +515,8 @@ sbsa_gwdt:
>      nowayout:
>  	Watchdog cannot be stopped once started
>  	(default=kernel config parameter)
> +	early_enable:

As pointed out by Sashiko, bad alignment (tab instead of four spaces).

> +	Watchdog is started on module insertion (default=0)
>  
>  -------------------------------------------------
>  
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index e04d42cc7774..ed913be3d1cb 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -122,6 +122,11 @@ MODULE_PARM_DESC(nowayout,
>  		 "Watchdog cannot be stopped once started (default="
>  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +static bool early_enable;
> +module_param(early_enable, bool, 0);
> +MODULE_PARM_DESC(early_enable,
> +		 "Watchdog is started on module insertion (default=0)");
> +
>  /*
>   * Arm Base System Architecture 1.0 introduces watchdog v1 which
>   * increases the length watchdog offset register to 48 bits.
> @@ -296,6 +301,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>  	struct sbsa_gwdt *gwdt;
>  	int ret, irq;
>  	u32 status;
> +	bool early_action;
>  
>  	gwdt = devm_kzalloc(dev, sizeof(*gwdt), GFP_KERNEL);
>  	if (!gwdt)
> @@ -386,14 +392,27 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>  	 */
>  	sbsa_gwdt_set_timeout(wdd, wdd->timeout);
>  
> +	early_action = early_enable && !(status & SBSA_GWDT_WCS_EN);
> +	if (early_action) {
> +		sbsa_gwdt_start(wdd);
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		dev_info(dev, "Watchdog early enabled.\n");

Unnecessary noise (it is also reported below).

> +	}
> +
>  	watchdog_stop_on_reboot(wdd);
>  	ret = devm_watchdog_register_device(dev, wdd);
> -	if (ret)
> +	if (ret) {
> +		dev_err(dev, "Failed to register watchdog: %d\n", ret);

Unrelated and unnecessary addition.

> +		if (early_action) {
> +			clear_bit(WDOG_HW_RUNNING, &wdd->status);

Pointless. The watchdog was not registered.

> +			sbsa_gwdt_stop(wdd);
> +		}
>  		return ret;
> +	}
>  
>  	dev_info(dev, "Initialized with %ds timeout @ %u Hz, action=%d.%s\n",
>  		 wdd->timeout, gwdt->clk, action,
> -		 status & SBSA_GWDT_WCS_EN ? " [enabled]" : "");
> +		 watchdog_hw_running(wdd) ? " [enabled]" : "");
>  
>  	return 0;
>  }

