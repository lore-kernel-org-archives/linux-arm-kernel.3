Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7D8CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0RxajuP8ZCM0/FK4DkLwHHfs4oMNuSDNV5bqTt5NSg=; b=C8MkHNFWrdybADHEnVrH1P13M0
	i+v2wHQ82srsrFdqdung2aBStX1+lRtKYZycuht1misXnaU8SEYo3diL/OMFh7Cok0tGlRvys0EkN
	FTlz0InI7XmEu+8DpXbsaW+7PO8Bl8EBCREqdkZsX8W+c1/WFG04sWCAwTa9L79Hl3d6qUM/uS+8G
	laQ/xUgsnWcRJnl68n+XEh7A2MFuACCPtQJRFETegbyHIKhry1AHCKYADMbgdS6wXP0xq67diygOg
	F3e/584sSLgyNxxKQOpA1iU+Q0H6aauU6G6+zg+8yvx4W05KNQ96hQZ6VnjlGSaNATFQOnM8Lpgfc
	qQi8IYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWiu-00000007zY6-0P4P;
	Mon, 25 Aug 2025 12:54:56 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVpT-00000007qw4-3iF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756123060; x=1787659060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2aZrMHjp5VNoFtmPYT/Q13ILrdcSo4FSZG4TtJl/mU=;
  b=MelDKx7Ouv0V60LAn9yFojFzo2s65N0T4dko5oegV+GwKq3teT/v/qT2
   COEUs7nGlxKZbP7FK3ORh+AlpEalOncqpgJT/GTSrTRWO/V/p/eACJHUb
   u9ujiXMFnwITm8hT0u/UGl+Mxkl8CNn1NCCLM4SN3HGHgNKSxUdOweyYt
   FSnhScpSQhNpqeeubCcjYAfx3hFfEGDshFQ0LuWGJGjKMfzUT3FUMnTgY
   yWCnL9U4Fvhcb+VLVaMerot+BQhDGJtap9oDZXg/ZlVX4epWbirLn+fEE
   AlIWInpR+AMyBZmC/30583lWvsZY+gSDXaEdF6QV/zJJMLHLtXQZSpMh7
   Q==;
X-CSE-ConnectionGUID: 5kDN8mYySJu9jichzY/cvA==
X-CSE-MsgGUID: b6UxKGAbTvaTgOgBJ4bugA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58479724"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58479724"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 04:57:36 -0700
X-CSE-ConnectionGUID: hdTgoxMQSJ63eWNqPKthrA==
X-CSE-MsgGUID: +r8EtaYQTHi9Cnk+LVEvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169178170"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 04:57:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F1E361203CE;
	Mon, 25 Aug 2025 14:57:23 +0300 (EEST)
Date: Mon, 25 Aug 2025 14:57:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Stephan <jstephan@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 02/12] iio: adc: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aKxPo3Kg0ppOcczG@kekkonen.localdomain>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
 <20250708231152.971398-1-sakari.ailus@linux.intel.com>
 <20250709163756.32b0e1d1@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709163756.32b0e1d1@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_045739_975414_671FF5E0 
X-CRM114-Status: GOOD (  34.40  )
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

Hi Jonathan,

Thanks for the review.

On Wed, Jul 09, 2025 at 04:37:56PM +0100, Jonathan Cameron wrote:
> On Wed,  9 Jul 2025 02:11:52 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> 
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > pm_runtime_mark_last_busy().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Some comments for the future as more about what can be improved on the back
> of this than what you have here.
> 
> >
> > diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
> > index cc326f21d398..3a17b3898bf6 100644
> > --- a/drivers/iio/adc/rcar-gyroadc.c
> > +++ b/drivers/iio/adc/rcar-gyroadc.c
> > @@ -163,12 +163,10 @@ static int rcar_gyroadc_set_power(struct rcar_gyroadc *priv, bool on)
> >  {
> >  	struct device *dev = priv->dev;
> >  
> This is a very clear example of where the *_set_power() pattern is a bad idea.
> There are two calls of this function, one with it hard coded as on and one with it
> hard coded as off.  We can just push the pm_runtime_resume_and_get()
> to the on case etc.
> 
> I don't mind that much if we do so as a follow up patch so this one can
> be the mechanical change and then we follow up with the enabled simplification.

Ack. I presume this pattern is due to one driver having used it first and
then other drivers copying that. I haven't seen it elsewhere, or at least
not being used as widely.

> 
> > -	if (on) {
> > +	if (on)
> >  		return pm_runtime_resume_and_get(dev);
> > -	} else {
> > -		pm_runtime_mark_last_busy(dev);
> > -		return pm_runtime_put_autosuspend(dev);
> > -	}
> > +
> > +	return pm_runtime_put_autosuspend(dev);
> >  }
> >  
> >  static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
> >> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> > index 48549d617e5f..f2a93c63ca14 100644
> > --- a/drivers/iio/adc/ti-ads1015.c
> > +++ b/drivers/iio/adc/ti-ads1015.c
> > @@ -374,12 +374,10 @@ static int ads1015_set_power_state(struct ads1015_data *data, bool on)
> >  	int ret;
> >  	struct device *dev = regmap_get_device(data->regmap);
> >  
> > -	if (on) {
> > +	if (on)
> >  		ret = pm_runtime_resume_and_get(dev);
> > -	} else {
> > -		pm_runtime_mark_last_busy(dev);
> > +	else
> >  		ret = pm_runtime_put_autosuspend(dev);
> > -	}
> >  
> >  	return ret < 0 ? ret : 0;
> So this one has a stub version which only brings benefits because
> we have checks on the pm_runtime_put_autosuspend() path failing
> (which it does if we have !CONFIG_PM).
> 
> I think the right option there is check the return value is < 0
> for the resume_and_get() and don't check the _put_autosuspend()
> return value at all.  Then we can just push this down to the
> call sites as all of them hard code the bool value.

Ack.

-- 
Regards,

Sakari Ailus

