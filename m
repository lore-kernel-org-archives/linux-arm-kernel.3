Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162EC83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCAP9oUJOsFvGWTLrKOXFPth+eKlOP4E6OXsGQLMlq4=; b=NNj8oPRRwJHpr7yUG5uHxCWc1L
	dZjxfVVyVBUSwC03KRAUNK6G7AOOHoxnwg+9c5esJA6ekU2VjTqrj8P/FEjsK7PPsVu6wbh8ljvtb
	NYGJMd2F61vcPpjpaEKNjRDKDikA5MHOUABqHvCiye9GP/Jr4dRjkJxN/YC4OKW3ckgPcPwjeEavV
	Pq0XggEabOqdJhRCeKSTBll4V5H5nyAla3RKuKVa07niNrnjhS7cHqdYdtk6bWYDI7VURqcuyJ9Uz
	iffGSTlh8ZTPpL6kyBRNf15UMrd80P5v3gGCWS2J7pdqlYniaXzBgiDw97ShzzJgcjO4R16gruZEw
	sj7ZEl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFG-00000009fXb-3m9e;
	Wed, 09 Jul 2025 19:14:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWs9-00000009Bkn-1ZQ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B715343EB8;
	Wed,  9 Jul 2025 15:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C79C4CEEF;
	Wed,  9 Jul 2025 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752075492;
	bh=Xl25DKWUzLXWpg5KhyYoRSsxahTDR5DpYlzJd9W9CaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uYdDGgmoD68kb2rNpNP/hz5SiwAXDsyvezTzMSDMKDb2YClMAF2yt/AxOjTPs7sNl
	 ZTOE8jKrng1ejwdimLIcfCR+DZXhizhMc2qXzwb7YBRhhYhR+Xnf7h120quqvHtuXQ
	 vwH5eiko3xNTUaDORSLeGHicywXRuFhftgO6XszyBy6kDg/HN0KkQYjiYK9KT3zzls
	 T5Wx4zQYlggDBTLa0AXA3d8QhmsyQveEUAZY1P8m2i8gSq2eYriSLniXhAiyw5Yn+g
	 o8IjE8LQibgIjGnYjnHpSjOCrrGvcXASgZXGde0dgcLjH93VVyf4X6KUiYxOt+Ess8
	 Oo5M4FmCysnGA==
Date: Wed, 9 Jul 2025 16:37:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Francesco Dolcini <francesco@dolcini.it>, =?UTF-8?B?Sm/Do28=?= Paulo
 =?UTF-8?B?R29uw6dhbHZlcw==?= <jpaulo.silvagoncalves@gmail.com>, "Jiri Slaby
 (SUSE)" <jirislaby@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, "Rob Herring (Arm)"
 <robh@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Stephan <jstephan@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 02/12] iio: adc: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250709163756.32b0e1d1@jic23-huawei>
In-Reply-To: <20250708231152.971398-1-sakari.ailus@linux.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
	<20250708231152.971398-1-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_083813_458941_7D2F1498 
X-CRM114-Status: GOOD (  24.02  )
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

On Wed,  9 Jul 2025 02:11:52 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Some comments for the future as more about what can be improved on the back
of this than what you have here.

>
> diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
> index cc326f21d398..3a17b3898bf6 100644
> --- a/drivers/iio/adc/rcar-gyroadc.c
> +++ b/drivers/iio/adc/rcar-gyroadc.c
> @@ -163,12 +163,10 @@ static int rcar_gyroadc_set_power(struct rcar_gyroadc *priv, bool on)
>  {
>  	struct device *dev = priv->dev;
>  
This is a very clear example of where the *_set_power() pattern is a bad idea.
There are two calls of this function, one with it hard coded as on and one with it
hard coded as off.  We can just push the pm_runtime_resume_and_get()
to the on case etc.

I don't mind that much if we do so as a follow up patch so this one can
be the mechanical change and then we follow up with the enabled simplification.

> -	if (on) {
> +	if (on)
>  		return pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> -		return pm_runtime_put_autosuspend(dev);
> -	}
> +
> +	return pm_runtime_put_autosuspend(dev);
>  }
>  
>  static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
>> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> index 48549d617e5f..f2a93c63ca14 100644
> --- a/drivers/iio/adc/ti-ads1015.c
> +++ b/drivers/iio/adc/ti-ads1015.c
> @@ -374,12 +374,10 @@ static int ads1015_set_power_state(struct ads1015_data *data, bool on)
>  	int ret;
>  	struct device *dev = regmap_get_device(data->regmap);
>  
> -	if (on) {
> +	if (on)
>  		ret = pm_runtime_resume_and_get(dev);
> -	} else {
> -		pm_runtime_mark_last_busy(dev);
> +	else
>  		ret = pm_runtime_put_autosuspend(dev);
> -	}
>  
>  	return ret < 0 ? ret : 0;
So this one has a stub version which only brings benefits because
we have checks on the pm_runtime_put_autosuspend() path failing
(which it does if we have !CONFIG_PM).

I think the right option there is check the return value is < 0
for the resume_and_get() and don't check the _put_autosuspend()
return value at all.  Then we can just push this down to the
call sites as all of them hard code the bool value.

>  }


