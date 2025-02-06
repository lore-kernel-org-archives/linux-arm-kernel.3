Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB63C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+MsE/zF9zDds4qukyGIesiPUZbnIgLqUPUYYu/7jGg=; b=mQCfcjzWZTZHkfv0LAWbf7Q6GB
	aZrWkMAFoNPukumphyaRDh6U2JLEGn/DMz41wxfKiCSQGlTFtL3k+atRG0A0NZatRL+F97wRCRd5n
	fUz6eGvwjN4hOqJE7/dJyGNRIm/gCLL/kBBhari5ICQByifAvsTcCcjuxfvu3k9ln4oykZAj8lnjx
	qJTD3g8tjKFfUyWsO8LOlFJUZvv7Id+UdGvGf7N1bWFDDSaqPKWxrJscYMZ05M4fnjnJS3GxYrtk0
	xLDJtQJVgop4e2MOjqAmpfy2SJMKxgkiov0LpDWO9AnZlhJaN3ij6OLMyHEAqyNHPo6fYhyN+XOWk
	z0DXjbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyVX-00000005tUQ-0SIn;
	Thu, 06 Feb 2025 09:49:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyU9-00000005tCr-3G6G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:47:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfyTq-0008NS-9e; Thu, 06 Feb 2025 10:47:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfyTp-003meg-2S;
	Thu, 06 Feb 2025 10:47:29 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfyTp-00HMaX-21;
	Thu, 06 Feb 2025 10:47:29 +0100
Date: Thu, 6 Feb 2025 10:47:29 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <20250206094729.7ebs4ocruw6yrnxc@pengutronix.de>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
 <20250205120215.if3egfj6vbnynwl3@pengutronix.de>
 <PAXPR04MB8459CDBB65AE57CDE780339A88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459CDBB65AE57CDE780339A88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_014749_971307_257B9E4C 
X-CRM114-Status: GOOD (  36.69  )
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

On 25-02-06, Peng Fan wrote:
> > Subject: Re: [PATCH v2 1/4] clk: Introduce
> > clk_hw_set_spread_spectrum
> > 
> > Hi Peng,
> > 
> > On 25-02-05, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add clk_hw_set_spread_spectrum to configure a clock to enable
> > spread
> > > spectrum feature. set_spread_spectrum ops is added for clk drivers to
> > > have their own hardware specific implementation.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/clk/clk.c            | 34 ++++++++++++++++++++++++++++++++++
> > >  include/linux/clk-provider.h | 32
> > ++++++++++++++++++++++++++++++++
> > >  include/linux/clk.h          | 22 ++++++++++++++++++++++
> > >  3 files changed, 88 insertions(+)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > >
> > cf7720b9172ff223d86227aad144e15375ddfd86..e11f9615e683af52c7
> > 19d4c8419b
> > > d30f369f301b 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2790,6 +2790,40 @@ int clk_set_max_rate(struct clk *clk,
> > unsigned
> > > long rate)  }  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> > >
> > > +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int
> > modfreq,
> > > +			       unsigned int spreaddepth, enum
> > clk_ssc_method method,
> > > +			       bool enable)
> > > +{
> > > +	struct clk_spread_spectrum clk_ss;
> > > +	struct clk_core *core;
> > > +	int ret;
> > > +
> > > +	if (!hw)
> > > +		return 0;
> > > +
> > > +	core = hw->core;
> > > +
> > > +	clk_ss.modfreq = modfreq;
> > > +	clk_ss.spreaddepth = spreaddepth;
> > > +	clk_ss.method = method;
> > > +	clk_ss.enable = enable;
> > > +
> > > +	clk_prepare_lock();
> > > +
> > > +	ret = clk_pm_runtime_get(core);
> > > +	if (ret)
> > > +		goto fail;
> > > +
> > > +	if (core->ops->set_spread_spectrum)
> > > +		ret = core->ops->set_spread_spectrum(hw, &clk_ss);
> > > +
> > > +	clk_pm_runtime_put(core);
> > > +
> > > +fail:
> > > +	clk_prepare_unlock();
> > > +	return ret;
> > > +}
> > > +
> > >  /**
> > >   * clk_get_parent - return the parent of a clk
> > >   * @clk: the clk whose parent gets returned diff --git
> > > a/include/linux/clk-provider.h b/include/linux/clk-provider.h index
> > >
> > 2e6e603b749342931c0d0693c3e72b62c000791b..ac0270cc9ec13395
> > 4b1f8dcffed0
> > > 15723bd1ff5d 100644
> > > --- a/include/linux/clk-provider.h
> > > +++ b/include/linux/clk-provider.h
> > > @@ -84,6 +84,28 @@ struct clk_duty {
> > >  	unsigned int den;
> > >  };
> > >
> > > +/* Aligned with dtschema/schemas/clock/clock.yaml */ enum
> > > +clk_ssc_method {
> > > +	CLK_SSC_CENTER_SPREAD,
> > > +	CLK_SSC_UP_SPREAD,
> > > +	CLK_SSC_DOWN_SPREAD,
> > > +};
> > > +
> > > +/**
> > > + * struct clk_spread_spectrum - Structure encoding spread spectrum
> > of
> > > +a clock
> > > + *
> > > + * @modfreq:		Modulation frequency
> > > + * @spreadpercent:	Modulation percent
> > > + * @method:		Modulation method
> > > + * @enable:		Modulation enable or disable
> > > + */
> > > +struct clk_spread_spectrum {
> > > +	unsigned int modfreq;
> > > +	unsigned int spreaddepth;
> > 
> > Please use per mil as unit since I noticed that 0.x% is a common value
> > too.
> 
> I use " The modulation depth in permyriad " in dt-schema, since
> Dario said ST chips has permyriad.

Ah okay, thanks for the explanation, this wasn't clear since also the
comment says: "Modulation percent". I wouldn't call it permyriad or
per_myriad since this unit is rather rare. Instead I would call it "basis
point" so the variable name could be 'spread_bp'. While on it, we could
rename modfreq to modfreq_hz to make it clear.

Regards,
  Marco

> 
> So change it to moddepth_per_myriad?
> 
> Thanks,
> Peng.
> 
> > 
> > Regards,
> >   Marco
> > 
> > 
> > > +	enum clk_ssc_method method;
> > > +	bool enable;
> > > +};
> > > +
> > >  /**
> > >   * struct clk_ops -  Callback operations for hardware clocks; these are
> > to
> > >   * be provided by the clock implementation, and will be called by
> > > drivers @@ -178,6 +200,11 @@ struct clk_duty {
> > >   *		separately via calls to .set_parent and .set_rate.
> > >   *		Returns 0 on success, -EERROR otherwise.
> > >   *
> > > + * @set_spread_spectrum: Configure the modulation frequency,
> > modulation percentage
> > > + *		and method. This callback is optional for clocks that
> > does not
> > > + *		support spread spectrum feature or no need to enable
> > this feature.
> > > + *		Returns 0 on success, -EERROR otherwise.
> > > + *
> > >   * @recalc_accuracy: Recalculate the accuracy of this clock. The
> > clock accuracy
> > >   *		is expressed in ppb (parts per billion). The parent
> > accuracy is
> > >   *		an input parameter.
> > > @@ -255,6 +282,8 @@ struct clk_ops {
> > >  	int		(*set_rate_and_parent)(struct clk_hw *hw,
> > >  				    unsigned long rate,
> > >  				    unsigned long parent_rate, u8
> > index);
> > > +	int		(*set_spread_spectrum)(struct clk_hw *hw,
> > > +					       struct
> > clk_spread_spectrum *clk_ss);
> > >  	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
> > >  					   unsigned long
> > parent_accuracy);
> > >  	int		(*get_phase)(struct clk_hw *hw);
> > > @@ -1404,6 +1433,9 @@ void clk_hw_get_rate_range(struct clk_hw
> > *hw, unsigned long *min_rate,
> > >  			   unsigned long *max_rate);
> > >  void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long
> > min_rate,
> > >  			   unsigned long max_rate);
> > > +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int
> > modfreq,
> > > +			       unsigned int spreaddepth, enum
> > clk_ssc_method method,
> > > +			       bool enable);
> > >
> > >  static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw
> > > *src)  { diff --git a/include/linux/clk.h b/include/linux/clk.h index
> > >
> > b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e
> > 11cd3b927688
> > > 96c4e45c4e7c 100644
> > > --- a/include/linux/clk.h
> > > +++ b/include/linux/clk.h
> > > @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned
> > long rate);
> > >   */
> > >  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
> > >
> > > +/**
> > > + * clk_set_spread_spectrum - set the spread spectrum for a clock
> > > + * @clk: clock source
> > > + * @modfreq: modulation freq
> > > + * @spreadpercent: modulation percentage
> > > + * @method: down spread, up spread, center spread or else
> > > + * @enable: enable or disable
> > > + *
> > > + * Configure the spread spectrum parameters for a clock.
> > > + *
> > > + * Returns success (0) or negative errno.
> > > + */
> > > +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> > > +			    unsigned int spreadpercent, unsigned int
> > method,
> > > +			    bool enable);
> > >  /**
> > >   * clk_has_parent - check if a clock is a possible parent for another
> > >   * @clk: clock source
> > > @@ -1088,6 +1103,13 @@ static inline int
> > clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
> > >  	return 0;
> > >  }
> > >
> > > +static inline int clk_set_spread_spectrum(struct clk *clk, unsigned
> > int modfreq,
> > > +					  unsigned int spreadpercent,
> > > +					  unsigned int method, bool
> > enable) {
> > > +	return 0;
> > > +}
> > > +
> > >  static inline long clk_round_rate(struct clk *clk, unsigned long
> > > rate)  {
> > >  	return 0;
> > >
> > > --
> > > 2.37.1
> > >
> > >
> > >
> 

