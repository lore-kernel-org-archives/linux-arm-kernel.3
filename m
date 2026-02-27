Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5217FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=; b=v6tYsVhNLwf30jDTLKuhD5Af7Q
	xAC+9RapVd06rFIbW42kTnu3wTf/TIQAI+gxOhT8ToHsJIQRNwVtY59IFbzWT+XlkIvdUkkNso4qt
	iAcJ5BOBMmcJ18fIV175R4l7z2Xdgng42BXlMyhHse3utRZRH5MNMU1HidL/OmRSuJfdhrHbr9LUm
	T6Arlqix1NrhGeuK2O4Iqdl6g0wFW21M2LIbUhkpHtWrwFX3QAUWr0chVpdbQ9tNNLY9FZAnHKk5B
	Yg8VKeA4/4byKYnVE9ZS02UuP+t8Xd04UWoO7ti2o5+nIKFP1+RFPhtYcs6Mqr/1XV0R+V/XvboPb
	flMI4OAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvz5X-00000008Vic-1Y9b;
	Fri, 27 Feb 2026 14:45:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvz5U-00000008Vi3-0SW1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
	b=WX6dpmLjkzmLG9nIcv5mxUuo6vl9SsXARh2gICDf0xyBiPiJx1+6vpS0GHdoTdMOHtwU6h
	uHQiClfrYJYjKoY9HAWl3nOOkmuCBL9WDUrsYQEH1tYXTUiM0Ff7huRc+fyKwcASUMMugJ
	WE5+lwQnn5xJ4J08AD6VzpGIVzgHArs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-3ieQceZpMe-4cG7aJF8JCw-1; Fri, 27 Feb 2026 09:44:59 -0500
X-MC-Unique: 3ieQceZpMe-4cG7aJF8JCw-1
X-Mimecast-MFC-AGG-ID: 3ieQceZpMe-4cG7aJF8JCw_1772203499
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899b4ce513cso203042686d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 06:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203499; x=1772808299;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=dG2x4Zf+A/WYRJet7rktrBXS7GyiXOCIZW+wzlKfTBLZf64KwFlCMIYF/FJD3ggf+h
         aeBZ8GkuK/JW2SN/NvmmWI8GormZP0+cwkMB4oXimKZNV96VvOZnli8sXyuzRZ6fC3Bw
         GDv38fh0Ap3Ja9Oa+wXNWFxEG8qjfe4LJEsT2JZzWuIzSQBtG9CmoEcQOFpVQCUrMfG1
         wasLvnSRjzi2UZe8h/5BjyCcAKZKQpC3TndvYii+htsF4bjYLBH4EZdEz7OkTh//2CdN
         CWrCagibCA6J8bjIc+OMoL1+FzkolPTmbzhhnyvJUrVmZgC5WfVto/ag/pwH+uKcjZ5w
         jH/g==
X-Forwarded-Encrypted: i=1; AJvYcCU9qX1KT7xmOfSNFV4v8qCvhpNN6ESIIIQT7+yRUR8ExRBhcTuQ0t/HVwn8lNhHqYxLPGdo2E89fj2v2tCwTSMQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/f5p1dHh9VSNkQ8bz7ggXjL5kdlWeD6M07U7JW2gl3V2/9wU4
	O2JHU4SDm5aPXxjF8wwUgLUFYE/hjZsVyGxDF9ROl3JxNovvzdbfhXUtcGuEI13JcAYdw6vsK/d
	VOIntipu8tSzH4ObWMbhGtRCpxwhXNlUvi7JcS3yiLShXtkcsXkHl0bZzXxLUThYWkUPRqP1azb
	il
X-Gm-Gg: ATEYQzwaoAD6dcaOVdamJIyc/1AgmRxtWC6+B836BdaUjvmWTdA13D5+c2STWCgD4xg
	TE1Uq+UKkd1/7ziYSnLnOC4u1m8q7YYjeWfeFUce7BT1AzM3YlxNg2/n4jicVRAGc9j6Vq5QtJP
	jld4gcWbOzaG4RoHPjRO500afMtpwhrGnUESEvifSTDPlGCpMmjIXqLiAhPm0yyJJwKIVxIHCsk
	+f/9d2jWaKgmJiPYB59xmeTSlA/5wyWFhpAjRNJC/aSaut0A7pJHL+eeqDmjpw0BA5dvkluqd7y
	v7KVNqY1+SAblxKg6q2nLuiwKVIgzAoEWQB05BItPGpNWIpoZwVPDRwPBkKm1Wfm8+s/h1Ikg5W
	dMizPNoHdB+TbZfswRfOTusmbxmJH5nZ11r2+xL5aMUc5i7/HqLsSGCRF
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187756d6.12.1772203498568;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187146d6.12.1772203498037;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a3130sm45123526d6.49.2026.02.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:44:57 -0800 (PST)
Date: Fri, 27 Feb 2026 09:44:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaGt5-ZWoXQ9Hz74@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
 <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c25Edvdhsi5FuBvRx7P_3XRuB_qfEsHb0pS69s53h-c_1772203499
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_064504_226980_0DAE470D 
X-CRM114-Status: GOOD (  33.07  )
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

On Fri, Feb 27, 2026 at 12:00:55PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Brian Masney
> > Sent: 26 February 2026 18:17
> > Subject: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
> > 
> > There are some clocks where the rounding is managed by the hardware, and the determine_rate() clk ops
> > is just a noop that simply returns 0. Add a new flag for these type of clocks, and update the clk core
> > so that the
> > determine_rate() clk op is not required when this flag is set.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
[snip]
> >  drivers/clk/clk.c            | 24 +++++++++++++++++++++---
> >  include/linux/clk-provider.h |  2 ++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..0a522a0817411c7f7c6e9cffd6f024e672a331a8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1557,6 +1557,20 @@ static int __init clk_disable_unused(void)  }
> > late_initcall_sync(clk_disable_unused);
> > 
> > +/**
> > + * clk_is_rounding_fw_managed - Check to see if clk rounding is handled
> > +by the
> > + * firmware.
> > + * @core: the clk to check
> > + *
> > + * Clks that have this flag enabled do not need to have a
> > +determine_rate() op
> > + * set, and will always return success for any rounding operation since
> > +the
> > + * firmware will deal with the rounding.
> > + */
> > +static inline bool clk_is_rounding_fw_managed(struct clk_core *core) {
> > +	return core->flags & CLK_ROUNDING_FW_MANAGED; }
> > +
> >  static int clk_core_determine_round_nolock(struct clk_core *core,
> >  					   struct clk_rate_request *req)
> >  {
> > @@ -1589,6 +1603,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
> >  		req->rate = core->rate;
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > @@ -1673,7 +1689,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> > 
> >  static bool clk_core_can_round(struct clk_core * const core)  {
> > -	return core->ops->determine_rate;
> > +	return core->ops->determine_rate || clk_is_rounding_fw_managed(core);
> >  }
> > 
> >  static int clk_core_round_rate_nolock(struct clk_core *core, @@ -3528,6 +3544,7 @@ static const
> > struct {
> >  	ENTRY(CLK_IS_CRITICAL),
> >  	ENTRY(CLK_OPS_PARENT_ENABLE),
> >  	ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +	ENTRY(CLK_ROUNDING_FW_MANAGED),
> >  #undef ENTRY
> >  };
> > 
> > @@ -3906,7 +3923,7 @@ static int __clk_core_init(struct clk_core *core)
> > 
> >  	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >  	if (core->ops->set_rate && !core->ops->determine_rate &&
> > -	      core->ops->recalc_rate) {
> > +	      core->ops->recalc_rate && !clk_is_rounding_fw_managed(core)) {
> >  		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >  		       __func__, core->name);
> >  		ret = -EINVAL;
> > @@ -3920,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
> >  		goto out;
> >  	}
> > 
> > -	if (core->ops->set_parent && !core->ops->determine_rate) {
> > +	if (core->ops->set_parent && !core->ops->determine_rate &&
> > +	    !clk_is_rounding_fw_managed(core)) {
> 
> >  		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
> >  			__func__, core->name);
> >  		ret = -EINVAL;
> 
> 
> After applying patch#11, I get a message as you removed .determine_rate, Also it breaks display.
> 
> [    0.096414] __clk_core_init: .pll5_foutpostdiv must implement .round_rate or .determine_rate in addition to .recalc_rate

Thanks for testing. This happens because rzg2l_cpg_pll_clk_register()
doesn't have the new flag set. I'll fix this, and go through all of the
others again just to make sure I don't miss any others.

Brian


