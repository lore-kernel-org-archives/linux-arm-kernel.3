Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96D7C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DD47gfXQGF6nwCSKbyRAaZ7LXoHHtibmaDJ2ODdpViY=; b=nm9gJbvLL8MzQGUj5CWo7ThPkb
	f1ajHwOZC5NQ0F6ejOXVWIMpFbEv9L4ewcQ2i3rm3JWGnv3fH/liI/QdcBAtN78CpT6bO4qx/6mbQ
	uIbAM0DtVEqjA8QC5anGCfswXkxzk1mYLmuil0/2H1C23aPFvEYdgzAChHJniej+eWrc9EW2HZQhY
	rO9QVw55hGoKgtDVGexsdoHe6A2jM02wh9rcU874X4DLkuVDIxeRaexJo5k2kuwVaLZZLebYEB+BH
	laurnTYDu2SI9sMEUu1IHp0JZHIoHWEDrUDKFQhM8VESflAnK71ko7se7t+yBMp+tjqRb4gOhe1yE
	wmsaSgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNkV-0000000HOZ9-265M;
	Thu, 13 Aug 2026 05:13:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNkT-0000000HOYE-3G4s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:13:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2009870a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597981; x=1787202781; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DD47gfXQGF6nwCSKbyRAaZ7LXoHHtibmaDJ2ODdpViY=;
        b=B6tOLx9qnKXufmYkAhdlj4+TJadFPALMHBYGzadumbY+ByPVLTrBfrazmLiR+NwoMv
         dj9PmUXHAg7leXZcRtf1VSgAZ96Nl0URK+j6d391jOiFx7cjRb3EQulJ9k/YopZfEUk0
         pv0zUGIOf2EUseUg/70OFBR6jCvKInf/wjcoWCfmxKYTmIVueC/GgEjAN/kwUxoWrlX4
         i5bwU7Q9x+vjvS6yWQgVtbfPW/4SegAF6HDvlL32OltllMgbLeRUTpaET7zrFyH9HdMu
         Ab6aE8ed+9HIWznyewik0P4tHjZGiEAA+K0aAu1tO9Oxco5YB/VZx7lq4e6j+h0/Mf7v
         aaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597981; x=1787202781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD47gfXQGF6nwCSKbyRAaZ7LXoHHtibmaDJ2ODdpViY=;
        b=Y6Hmpuj//eu1KI3c3p5/hdfKfX0KYF8Cpf1w4pATzJMjVYK6QPZSMT6Rc6+9CGFY8R
         hyJK+u9ZQRbIIDcTliHJnYfQGUpFqbY16WvqFoJ+TaQTg9HWJeUH4H1mXdmm+h0Lns/9
         wa89Kgem9o7fwx7uUwnUdSDnEUPxYtUMO69rCSx9gsHWd671nmrD5RZoz+kJ9vTLjyPw
         FBqm0jdobMlVvF1JOXdhjnLtgyCzv9z+N4G8Q7joOT/q5Q71hbG4XY+6Atpk0CTKAFBk
         vBGkKMEeI0ek45720BTz17g5feme6/+SJqPLGqvbNKKNXel4DFhosuXG56V/CIh7SmOg
         ZylQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqg4aTgxgu509MmX/x1v5OoZbC8e/MZflZJJ6jq3tdoHskXKDKuBE2w80ImQDUPq6xnAm8CU0EoaD1BctzJ9++5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7VWQgfWhzJC6RrrHFTH9tFNA041VgnKJDyRDQEpqplDSj/cW6
	J8wgr5RutsaPdMIHRu0MryN93iZ8VTxar36pXQIps1xq2hjiwUr4+3kV
X-Gm-Gg: AR+sD13Lt/KO6ud+nMSQPDENy1DoDnmCpbkjxk7sLtS0XWR3rp9wvxhEHlWiIv0KMr0
	1Elna0+yQshveA+UHgqBsQuz3XUbEd9PW55rQD7Lsg1q8fp6jVzgMYhTdkSgr2dDVZXWejoTuQE
	GIxfEfHpCNMO6PnZ/N7LbRt5CFIjN1MzvGnTgAdTJSwG4OC4/2zYH0vabqTYFkzpzr8mxb4dDF3
	InLqCk6G+8XKFp2qjRP5GB6346gP1+Uo0N616ArvM5GoLoL7L7jvlfLAPu6zArA8RgdSY9eEzE4
	CMGQDfdr3QuyYfh+Za5Zq8+hbXKDMR8yPDo3KXYZPbdoe1eYTIW7yZBtCcarquviv1OVcWGfU8J
	LS/BklmxFL4wrud4di4+x9TdHp+rx4HojMiGDrOjHXncdBc6hPfsgUy0Q/Ea8hjo+Q+Lg5+e3vr
	JQvwah+ZKaA1zV5f2llX6iaEpHfYRLM/BiXE1ima4+8vhQQ7+czYqjQX9eMNPgslxWXgeGfg6CU
	Q==
X-Received: by 2002:a17:90b:180c:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3931e07548bmr3673397a91.8.1786597980659;
        Wed, 12 Aug 2026 22:13:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f41cd2fsm1324751a91.12.2026.08.12.22.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:13:00 -0700 (PDT)
Date: Wed, 12 Aug 2026 22:12:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] watchdog: sbsa_gwdt: add early_enable module parameter
Message-ID: <27ebd686-c5de-4abf-9683-6a700b7592bc@roeck-us.net>
References: <20260813041228.23084-1-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813041228.23084-1-ot_zexin.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_221301_823851_811FD4AC 
X-CRM114-Status: GOOD (  34.24  )
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

On Thu, Aug 13, 2026 at 12:12:18PM +0800, Zexin Wang wrote:
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

You might want to wait a few minutes before sending new versions
of a patch.

> ---
> Changes in v3:
> - Fix indentation of `early_enable` in watchdog-parameters.rst to ensure
>   it renders as a separate parameter rather than part of `nowayout`'s
>   description.
> 
> Changes in v2:
> - Rename `force_enable` to `early_enable` as suggested by Guenter.
> - Update commit message to explain the UEFI handover gap motivation.
> - Add documentation for the new parameter.
> 
>  .../watchdog/watchdog-parameters.rst          |  2 ++
>  drivers/watchdog/sbsa_gwdt.c                  | 23 +++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 502cb6adbeda..348229ffcb43 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -515,6 +515,8 @@ sbsa_gwdt:
>      nowayout:
>  	Watchdog cannot be stopped once started
>  	(default=kernel config parameter)
> +    early_enable:
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

Still unnecessary noise.

> +	}
> +
>  	watchdog_stop_on_reboot(wdd);
>  	ret = devm_watchdog_register_device(dev, wdd);
> -	if (ret)
> +	if (ret) {
> +		dev_err(dev, "Failed to register watchdog: %d\n", ret);

Still unrelated.

> +		if (early_action) {
> +			clear_bit(WDOG_HW_RUNNING, &wdd->status);

Still pointless / unnecessary.

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

