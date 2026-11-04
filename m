Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE9C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XPk2ImVC;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QbXZ68bo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F12AjCeObMo8GMff5Cd9gx8f+ATT0wwVACkVrTGxlyY=; b=XPk2ImVCUTA0SN9pKY4OxvXbBV
	kwptYJiL+IPwaoGbfcxKBeViM1s+vREagSQqOzYmxgqI8ruTXiV3cHBRR8N8iY9mZ8q1VGdBS39qm
	A6JG1ArzD6m/pkuV4JvKEgfswkgd+IrTwZ3ifz9N3+w258AciyEFOlYqsNpdRhWJp0tc+hk2cMeba
	2PXkVY2RTSlziMztAnp0NKnhs3jzKFfVaaX9sUwkvupU88cWqKxwthbnn8I4bBh4mxUjp5tMIyes6
	vnH3U8CJY50cHGkSqKB2Nu+1f79DjV4M6iulo0t79awMAtrWreBpa0MB92PeJcdlPYRI6WytCurzn
	D0C/pVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZa8-00000005EYE-47fD;
	Wed, 04 Nov 2026 11:55:09 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZa4-00000005EWp-1r4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=F12A
	jCeObMo8GMff5Cd9gx8f+ATT0wwVACkVrTGxlyY=; b=QbXZ68boAOIiNT4CEroe
	+FbKl+6S6VOO5SNwVsO9zbCtneUsv7Kh3StDFX05+gJ0/fpFdr3nHZ0Lw/mmQfon
	sJZwUkbYMFMPSlRCkubgjxgIOv1DeduEKrap57Juq3rb1SL1wVyZOMyyG2ZBuLdg
	lsKZFzb/xP26QmMlKZA4aOK5sudykwK3+Cu0fd6Pxp4Ogqpd33QFXqwnQmRwt5O6
	excbPdUWcA/fct9a5k079M22fD4lAW1nvou0qo5BdUHrT2WJG1mNe/kcF0T/U0G7
	jTrrsNtAO9+sJLGbeUPcQXsJ1bPMGIxIAEsYz8f/EdQIpUCSmwDb6gfkxpWs8YNa
	tQ==
Received: (qmail 708253 invoked from network); 4 Nov 2026 12:54:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2026 12:54:59 +0100
X-UD-Smtp-Session: l3s3148p1@jphgDHJf3LHAwtcC
Date: Wed, 4 Nov 2026 13:54:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: Convert to subsys_platform_driver()
Message-ID: <ausdEofHrBQMLiEO@shikoro>
References: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_035505_382121_656775A7 
X-CRM114-Status: GOOD (  17.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -896,19 +896,7 @@ static struct platform_driver davinci_i2c_driver = {
>  		.of_match_table = davinci_i2c_of_match,
>  	},
>  };
> -
> -/* I2C may be needed to bring up other drivers */
> -static int __init davinci_i2c_init_driver(void)

I'd vote to keep this comment.

> -{
> -	return platform_driver_register(&davinci_i2c_driver);
> -}
> -subsys_initcall(davinci_i2c_init_driver);
> -
> -static void __exit davinci_i2c_exit_driver(void)
> -{
> -	platform_driver_unregister(&davinci_i2c_driver);
> -}
> -module_exit(davinci_i2c_exit_driver);
> +subsys_platform_driver(davinci_i2c_driver);

...

> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index bd659dfa702f..cd4d6d6b32c6 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1611,20 +1611,7 @@ static struct platform_driver omap_i2c_driver = {
>  		.of_match_table = of_match_ptr(omap_i2c_of_match),
>  	},
>  };
> -
> -/* I2C may be needed to bring up other drivers */

Ditto.

> -static int __init
> -omap_i2c_init_driver(void)
> -{
> -	return platform_driver_register(&omap_i2c_driver);
> -}
> -subsys_initcall(omap_i2c_init_driver);
> -
> -static void __exit omap_i2c_exit_driver(void)
> -{
> -	platform_driver_unregister(&omap_i2c_driver);
> -}
> -module_exit(omap_i2c_exit_driver);
> +subsys_platform_driver(omap_i2c_driver);
>  
>  MODULE_AUTHOR("MontaVista Software, Inc. (and others)");
>  MODULE_DESCRIPTION("TI OMAP I2C bus adapter");
> diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
> index e1cc2b2bd628..9a9a12b7e981 100644
> --- a/drivers/i2c/busses/i2c-pnx.c
> +++ b/drivers/i2c/busses/i2c-pnx.c
> @@ -735,16 +735,6 @@ static struct platform_driver i2c_pnx_driver = {
>  	.remove = i2c_pnx_remove,
>  };
>  
> -static int __init i2c_adap_pnx_init(void)
> -{
> -	return platform_driver_register(&i2c_pnx_driver);
> -}
> -
> -static void __exit i2c_adap_pnx_exit(void)
> -{
> -	platform_driver_unregister(&i2c_pnx_driver);
> -}
> -
>  MODULE_AUTHOR("Vitaly Wool");
>  MODULE_AUTHOR("Dennis Kovalev <source@mvista.com>");
>  MODULE_DESCRIPTION("I2C driver for Philips IP3204-based I2C busses");
> @@ -752,5 +742,4 @@ MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:pnx-i2c");
>  
>  /* We need to make sure I2C is initialized before USB */
> -subsys_initcall(i2c_adap_pnx_init);
> -module_exit(i2c_adap_pnx_exit);
> +subsys_platform_driver(i2c_pnx_driver);

Use this occasion to move the comment and your code upwards right below
the driver struct?

> diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
> index 3a55f803e4f1..1ecf14890209 100644
> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -986,18 +986,7 @@ static struct platform_driver sh_mobile_i2c_driver = {
>  	.probe		= sh_mobile_i2c_probe,
>  	.remove		= sh_mobile_i2c_remove,
>  };
> -
> -static int __init sh_mobile_i2c_adap_init(void)
> -{
> -	return platform_driver_register(&sh_mobile_i2c_driver);
> -}
> -subsys_initcall(sh_mobile_i2c_adap_init);
> -
> -static void __exit sh_mobile_i2c_adap_exit(void)
> -{
> -	platform_driver_unregister(&sh_mobile_i2c_driver);
> -}
> -module_exit(sh_mobile_i2c_adap_exit);
> +subsys_platform_driver(sh_mobile_i2c_driver);

Here you have no empty line after the driver struct...

>  
>  MODULE_DESCRIPTION("SuperH Mobile I2C Bus Controller driver");
>  MODULE_AUTHOR("Magnus Damm");
> diff --git a/drivers/i2c/busses/i2c-versatile.c b/drivers/i2c/busses/i2c-versatile.c
> index a1ab6ef6f071..152ab19f272a 100644
> --- a/drivers/i2c/busses/i2c-versatile.c
> +++ b/drivers/i2c/busses/i2c-versatile.c
> @@ -116,18 +116,7 @@ static struct platform_driver i2c_versatile_driver = {
>  	},
>  };
>  
> -static int __init i2c_versatile_init(void)
> -{
> -	return platform_driver_register(&i2c_versatile_driver);
> -}
> -
> -static void __exit i2c_versatile_exit(void)
> -{
> -	platform_driver_unregister(&i2c_versatile_driver);
> -}
> -
> -subsys_initcall(i2c_versatile_init);
> -module_exit(i2c_versatile_exit);
> +subsys_platform_driver(i2c_versatile_driver);

... while you have one here. Please make it consistent to no empty line.

Other than that, looks good.

Happy hacking,

   Wolfram

