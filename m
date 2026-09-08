Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BBFC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=; b=pONppMTR5Arzecv1gh6w66MDHv
	DSeryYms9D05TpJOrhuKIafBBfS6/K3X6JqE1mZXZW6VOwnjzm6+R1H4K0Hgi2Y4Qydpcn2mHh+02
	BbWCTDhOGCX88oW/OPz3FuEUi+EczbvkIY1msPf64apv9ZDnMMQ/lgQWZrS6S4lkmMrphZOWg/JOE
	pPelZqkZDSgMLLU7yDV0UnR8Nw8HtU3kOSqo51himEx/75bf+BA27K1g/dHOHSogP9sRY/gonTsVf
	EzvX7S3RATFRp4LX5Ace4H5QKMMOMPMAM2jZ8x2FeDZt0w0OU7NYoeVWrRGORvv6gd1Llmtpu2HmA
	D2Tqa0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41g0-0000000A5Xb-2akM;
	Tue, 08 Sep 2026 19:40:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41fy-0000000A5XA-25qd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:40:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-484392e3d33so3597240f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896412; x=1789501212; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=dNhGfn1VkRTgx5KaKABhVbvxjftnV/SGiWDE4fSmGzvFyfPPNVctC1oSoelFmwkfw+
         b+d9tgU+5+RvLhvavyBGCD4Okd7fgV6c+Ddy8ACthr2pR30RqTBvvbsg9WxscRVkuJeK
         fMtHJFnH2kqKllYYAr/HN5gu2lFgr/MPiQaXxIcLluJ97S3r2F5DSDq79q4TGgG2V4dc
         ngisOkyG6Ikqay6jA5kGVYuUetoP28/KcZuweWKkAmTcebN9AtQShPFSQZmkVUgfGJGH
         jbaUXpfDUqS9288r1ZC0yC+EB+JNWSZAKnQhyqWUgFUKL5lsd07eNEsTz4hsg671AvYY
         kMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896412; x=1789501212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=To4+ek/PcTyBv6HeQO3X0TNvb9tVl/jZ51jZme2XB+h50ByVC/IeU/4Q3N2c/TWPHT
         6/xknpdHygO+sIzI4pxb+BkNVIUmoA5dWD+nzRpjtuOOdHU5z/fqzLrUNyKiRA/QpF6j
         2T1zhZyFv4pS9A3VQmEmiRNC7sKNYUi2G5lYZEilrIBchNVNMCL4K68Bh0AXq5HBwrFV
         mdpVy3E9hOUNlfAX/S4zttLSJVS/gRdwIhCDsW5hNiCtUhQuvmOHbkUf43xBNwquYz36
         TJhJVEK8RZgsFUnZUz5pEDjOVEBP8Niir4eDMLfak+ztgD46BjW1ynwPNvj2IfwnvRnb
         REpg==
X-Forwarded-Encrypted: i=1; AKwUvBy8or4cdYj0SVWDvJOvaQTWX/cSlxkvtgUuiNgwi9pdEsTDfl24fz1jskanTYsWRYBnwT5FLQsKGsBXFlNOMAXD@lists.infradead.org
X-Gm-Message-State: AFuF++mHOQmh+O6hTcVhDvV74bXPPYB+nNjUDfSSC9nDo0+DIxW7/iMZ
	skFRJ5xDNmupF8NeBk9TiPo/zohShiuTQ13L328Tqxz2yDLq9mhc+cSs
X-Gm-Gg: AYBFou0YMeDjNNBe/U4mv2A4vjDVGZQED0InLysOFvVAYMKtU+Ydmxag5HV5wdV7zTt
	RFWvkBs2g3rNtpppKbmSfya0oM7HeaKDMKvKoWMg7EY/omZKXdxWGCNLPMBpNAjrW2isQT+fmna
	5odY4NaVmuksu/7lBzTHn0ny2CbrYNnmCA71hx8c9pbz5NVN+pyz80qpozo9hoHyhxrlJpTNvyp
	Rpk1KUYni+UN31jz4lWr/8NV1yHtXxXy7n+a+lx8n3muPptZZkpyJZFBbtuZR4sJJD2cj4EEZ5r
	i7QYHzlmqWLS5Z2cSt0k9cFXbQ951qmT+HBRWaSWREOZ8l+NTfTvq+KsBd7edtIFYefQBsXOsmW
	rX8lmssoFEmfD0hcYzyNXuzFfSuKhZiqfSSeVy6uiOYsUqCM0viq6Ea7Zy6XwRmCR17KxQ2OiiM
	C8L/E+luEZd20XttOjv3l8MlTHF8yINlT6Ft02c88u8D0dkSDhND8ZMGrd4aZU/NtgjUc9pElES
	sO8bZSqVJw1Mf6QNz7MLUDg516sNthyDTMPNTv0q86EqmM0Bbc9LcG7z/FbU2ZZMh/80t6V7YRc
	RDBf+x2PwNJOpNlfP4thyUSC
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr321721005e9.15.1788896412155;
        Tue, 08 Sep 2026 12:40:12 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm991795e9.4.2026.09.08.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:40:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:39:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <aqBhF5oS1A2W6dAa@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_124014_555204_6402D3B3 
X-CRM114-Status: GOOD (  19.24  )
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

On Tue, Sep 08, 2026 at 05:27:51PM +0100, Arnd Bergmann wrote:
>  62 files changed, 19 insertions(+), 10501 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
> @@ -275,18 +275,10 @@ static int sa1100_rtc_probe(struct platform_device *pdev)
> -	if (IS_ENABLED(CONFIG_ARCH_SA1100) ||
> -	    of_device_is_compatible(pdev->dev.of_node, "mrvl,sa1100-rtc")) {
> -		info->rcnr = base + 0x04;
> -		info->rtsr = base + 0x10;
> -		info->rtar = base + 0x00;
> -		info->rttr = base + 0x08;
> -	} else {
> -		info->rcnr = base + 0x0;
> -		info->rtsr = base + 0x8;
> -		info->rtar = base + 0x4;
> -		info->rttr = base + 0xc;
> -	}
> +	info->rcnr = base + 0x0;
> +	info->rtsr = base + 0x8;
> +	info->rtar = base + 0x4;
> +	info->rttr = base + 0xc;

This drops the layout switch but keeps "mrvl,sa1100-rtc" in
sa1100_rtc_dt_ids[] and in bindings/rtc/sa1100-rtc.yaml, so a DT with
that compatible would now silently get the MMP register offsets instead
of the SA1100 ones.

> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> @@ -614,16 +614,16 @@ config S3C2410_WATCHDOG
>  	  be called s3c2410_wdt.
>  
>  config SA1100_WATCHDOG
> -	tristate "SA1100/PXA2xx watchdog"
> -	depends on ARCH_SA1100 || ARCH_PXA || COMPILE_TEST
> +	tristate "PXA2xx watchdog"
> +	depends on ARCH_PXA || COMPILE_TEST
>  	help
> -	  Watchdog timer embedded into SA11x0 and PXA2xx chips. This will
> -	  reboot your system when timeout is reached.
> +	  Watchdog timer embedded PXA2xx chips. This will reboot your
> +	  system when timeout is reached.
>  

"embedded into PXA2xx chips" is better.

The RTC_DRV_SA1100 help text a bit earlier in the patch also still says
"built into your SA11x0 or PXA2xx CPU".

Thanks,
Karl

