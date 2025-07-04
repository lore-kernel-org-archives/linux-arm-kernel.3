Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B16C83F0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fiLX+GfVb0n9Y4k8VvC9NTcLFi9v5Ue7smeOJFVhAY=; b=OJ3sKJK9SSmBtlsvpUZ8iwjPTU
	Z1xTUSiQBXujgGT2DWfHuOxsKjKlGLLJjgX6xvPdi26fyPE43pbszZGfhvCDPTHidXHTid6cO3USg
	CIsC0yJhae1nXdlAiC+syh38MdMcMHYBdFxzg2i5yINzqgz+9C8YtyQu6GK5kZ3kZWjHDZZHL5noc
	gkVwGWnfELIaDwMZHSX9pteeaSTOWaevpa8jRC/oG6w3KCIu6eEOd2qpugkYnXKjN+zG5M6DsmeTE
	d8hHvRi/dCMBfdHol0wsh3lopGTBY7bvWYOAvbzXM9qSNVInuxaTFMEPiG7Mu2POp+9JcnV8BnNEM
	0m30YotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXey8-0000000EHlA-31eY;
	Fri, 04 Jul 2025 11:52:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcQ9-0000000Dsuh-2mOO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:09:28 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bYSRb2XN3z6L5HM;
	Fri,  4 Jul 2025 17:06:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C9103140393;
	Fri,  4 Jul 2025 17:09:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 4 Jul
 2025 11:09:16 +0200
Date: Fri, 4 Jul 2025 10:09:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron
	<jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, "Shawn
 Guo" <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Francesco Dolcini
	<francesco@dolcini.it>, =?ISO-8859-1?Q?Jo=E3o?= Paulo
 =?ISO-8859-1?Q?Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>, "Jiri Slaby
 (SUSE)" <jirislaby@kernel.org>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>, "Rob Herring (Arm)" <robh@kernel.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, "Mike
 Looijmans" <mike.looijmans@topic.nl>, Olivier Moysan
	<olivier.moysan@foss.st.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Julien Stephan <jstephan@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 28/80] iio: adc: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250704100914.000042db@huawei.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	<20250704075420.3219092-1-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_020925_999728_8058558A 
X-CRM114-Status: GOOD (  19.46  )
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

On Fri,  4 Jul 2025 10:54:19 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/iio/adc/ab8500-gpadc.c     |  1 -
>  drivers/iio/adc/at91-sama5d2_adc.c | 10 ----------
>  drivers/iio/adc/imx8qxp-adc.c      |  2 --
>  drivers/iio/adc/imx93_adc.c        |  1 -
>  drivers/iio/adc/rcar-gyroadc.c     |  1 -
>  drivers/iio/adc/rzg2l_adc.c        |  3 ---
>  drivers/iio/adc/stm32-adc-core.c   |  1 -
>  drivers/iio/adc/stm32-adc.c        |  7 -------
>  drivers/iio/adc/sun4i-gpadc-iio.c  |  2 --
>  drivers/iio/adc/ti-ads1015.c       |  1 -
>  drivers/iio/adc/ti-ads1100.c       |  1 -
>  drivers/iio/adc/ti-ads1119.c       |  2 --
>  12 files changed, 32 deletions(-)
> 
> diff --git a/drivers/iio/adc/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gpadc.c
> index f3b057f92310..8eaa1dd6a89b 100644
> --- a/drivers/iio/adc/ab8500-gpadc.c
> +++ b/drivers/iio/adc/ab8500-gpadc.c
> @@ -607,7 +607,6 @@ static int ab8500_gpadc_read(struct ab8500_gpadc *gpadc,
>  	}
>  
>  	/* This eventually drops the regulator */
> -	pm_runtime_mark_last_busy(gpadc->dev);
>  	pm_runtime_put_autosuspend(gpadc->dev);
>  
>  	return (high_data << 8) | low_data;
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index c3450246730e..67846fefe21a 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -896,7 +896,6 @@ static int at91_adc_config_emr(struct at91_adc_state *st,
>  	emr |= osr | AT91_SAMA5D2_TRACKX(trackx);
>  	at91_adc_writel(st, EMR, emr);
>  
> -	pm_runtime_mark_last_busy(st->dev);
>  	pm_runtime_put_autosuspend(st->dev);
>  
>  	st->oversampling_ratio = oversampling_ratio;
> @@ -971,7 +970,6 @@ static int at91_adc_configure_touch(struct at91_adc_state *st, bool state)
>  				AT91_SAMA5D2_IER_PEN | AT91_SAMA5D2_IER_NOPEN);
>  		at91_adc_writel(st, TSMR, 0);
>  
> -		pm_runtime_mark_last_busy(st->dev);
>  		pm_runtime_put_autosuspend(st->dev);
>  		return 0;
>  	}
> @@ -1143,7 +1141,6 @@ static int at91_adc_configure_trigger(struct iio_trigger *trig, bool state)
>  	at91_adc_configure_trigger_registers(st, state);
>  
>  	if (!state) {
> -		pm_runtime_mark_last_busy(st->dev);

Getting familiar. I'll not comment on other cases but {} should go here.

>  		pm_runtime_put_autosuspend(st->dev);
>  	}

Please fix all those up and post a v2 series for IIO.

I'd guess similar are present in other subsystems though so may well
need a v2 as well with the excess brackets dropped.


Jonathan



