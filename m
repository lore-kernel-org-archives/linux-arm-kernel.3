Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D4FCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtFRSKfEXv9sTEtY0fJuqJ9qFTz4CL5xSoIvZVEfRx8=; b=14yhnpJFg6Pu7Dd1taCy4VOJiZ
	ZAJWPs8k64mCq9NY/65ugN57LJr8RfwhhNx1J5uaktvv4SeRKyu2AIwSrx/woo2KWYSUHLoLt8mZa
	ozyzdsarS7j6ntnzOnjJ0K/pSDZsW1JsWTIjU+/CJuZqHSAiUgX/NyLGgvSSQwcmQNcv2B/j5k3Tq
	LjS5ngg3HpD3gmhWMCyWk23MmxNLxKIPFdvl9SRxhXKGAlcnJ38/t+iDGzdg4TvHyqChVX41sloQr
	+6RrPwULIzu6pPt5fZdHAW98D/RWu2L0Y4q1fRD0fpa83eX7LZn6uXrmHVmWOmVLNajFoKbYWwiGg
	tQ97zUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXOH-0000000081O-06t4;
	Wed, 06 May 2026 08:13:57 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXOE-0000000080o-3fEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055235; x=1809591235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FwViEFZHiQJ3iExOzuEZ2gtzbIGH5AsMXLZKpIKtCA=;
  b=UYxnw5OIbvezWn9OtUOy/qtuWNH6NKaTO5p4Lp/nP3HfUzpk+7RQ3i+H
   mhJXPVXrB8s7aj3R4Y4vuBKZYYnI8s7i5swrVq3vauWJWsrT0zRniBeao
   1y+o3TUF9stEpRuSFIqqHqt2f185YbGy5HSx0Gj+3uMojacEF1OXeQQgh
   W/1rtdGgpD2oQIoFhHeAtKDU3uMyMvFhuHpDYMG0Ut1e4q9YmTTZMb/Z/
   lq/vsTmAwcHZo1s+hlqGt22GgwZzk6yYr3e7FLGk1wwGCeer+UGTQ9Mi0
   WDtaTFL4RsoQ/QCiNP1kmLoXoesMIdEAH5U6YaLUxq4l+a4sv7k8cBFqO
   Q==;
X-CSE-ConnectionGUID: Cxd394e8RfGb5Ea/LjpIsw==
X-CSE-MsgGUID: GR/h0LQURFWE9+MSmuk+Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89287892"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89287892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:13:53 -0700
X-CSE-ConnectionGUID: 6qVlkn3CTKCyNwjRFVC9cw==
X-CSE-MsgGUID: DEaDb42jRkelGndeWVrH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259500826"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:13:50 -0700
Date: Wed, 6 May 2026 11:13:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afr4PEk9OPpJnu49@ashevche-desk.local>
References: <20260505202426.3605262-1-arnd@kernel.org>
 <20260505202426.3605262-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505202426.3605262-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_011355_157737_62A8A9EE 
X-CRM114-Status: GOOD (  20.04  )
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

On Tue, May 05, 2026 at 10:24:25PM +0200, Arnd Bergmann wrote:

> There are no remaining static platform_device users of pxa2xx ac97,
> so the rest of that code path can go away as well.
> 
> Since nothing in the driver uses the gpio number now, constrain the use

GPIO

> of the legacy gpio interface to the architecture specific code.

GPIO

...

>  #include <sound/pcm.h>
>  #include <sound/ac97_codec.h>
>  
> -extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
> +extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, bool to_gpio);

Looks like this is the only useful line in the header, hence while at it we may
drop 'extern'.

>  #endif

...

> +	if (cpu_is_pxa27x()) {
>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
> -		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> -		if (IS_ERR(rst_gpio)) {
> -			ret = PTR_ERR(rst_gpio);
> -			if (ret == -ENOENT)
> -				reset_gpio = -1;
> -			else if (ret)
> -				return ret;
> -		} else {
> -			reset_gpio = desc_to_gpio(rst_gpio);
> -		}
> -	} else {
> -		if (cpu_is_pxa27x())
> -			reset_gpio = 113;
> -	}
> +		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +		if (IS_ERR(rst_gpio))
> +			return dev_err_probe(&dev->dev, PTR_ERR(rst_gpio),
> +					     "reset gpio failed\n");

I *slightly* tend to have my patch just as preparatory for this one as it does
one logical change, this one does another. But if you think it is not worth it,
okay then.

...

Now looking at this, I am not even sure that we need that if (cpu_is_pxa27x())
since optional GPIO will return NULL and everything should work as long as
there is no mistake in DT or platform code that provides the GPIO.

But such a change should be done carefully.

-- 
With Best Regards,
Andy Shevchenko



