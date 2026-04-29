Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B42CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=; b=pcK5jbaDa7EGNFL0MeLAk/3XOP
	X7zmiVT+ilMu4ww/oJzTCxC8FkktQ9ISSpRPAbayJmwrKwg+OlrQRgN1SIt7goy6BLKI0GO5AWMfw
	NklI434gcfjqQ6yCh9Zpuf8MWnT1KkXHMD/NLrI6GaEWCRUId+WuOs4fv/PUIhOwsg4rpUgLZ+Fqa
	g3FNrIQJ1btKcNv6CxHoeyLFzKcIag0s2ORJ/WxHh2OECnsTRLuZCSp69XKPfvKhylR53CKW5Twdu
	XehzjYgNG1HS0mAXc4+MUoe0gfocSTel4QRHpPx9K2iJ/ufwgDoPLoyDgjQ/Ys5E+iH0GjZlkQHim
	S9647Jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5OH-00000003iAh-3gJA;
	Wed, 29 Apr 2026 13:55:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5OF-00000003i9i-1LHf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777470945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
	b=aaye5le9VF60v6sPq4CiCo/9qzuijopOb5flH3s2LuBRfAMvPzMGoAoqOxQUO0Mah2s6I7
	xZwl9Rt/ndjWlsIfBeDqIBI5tNcIpm5MaQnpq6TY6iuFhvQPjgIjN4ZmdwPGdTCf/gn/hW
	6NQxs60dSSYqLLlGdFhQxLqCDm4jyOA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-svWA4DxFPWKHkSGoVfTGYw-1; Wed, 29 Apr 2026 09:55:44 -0400
X-MC-Unique: svWA4DxFPWKHkSGoVfTGYw-1
X-Mimecast-MFC-AGG-ID: svWA4DxFPWKHkSGoVfTGYw_1777470944
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so185130746d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470943; x=1778075743;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
        b=Min7SOOpMVLiP6t5Pd+ycDt1GpBUn3f8Ghb1fhILaT2yi9D/hD7tInqEARiV7x6ra0
         6CezqMFxQtzIMfb4huiAf087wZUBAELaIvnxkum/wOPvctJBdvNxIevxK1KFNIYhzM1v
         eiHRfVSNmgzO+eWAkXN393YKM/77Smx9MguuXZ1fvY4Nh98rYun15Vjj7k3NZcB3HAB8
         8Pki9yjVhMKiGkWI1dx63pFJfgzUwlBxC/iva4Ji674hotHX4jXJnr9vYGDR3xXoNR/A
         OtmoJR5M6ZjrEjLzEqtTCrBJ20xHobMeuPwBHk9wxeDCU3KirrfHhTE8sYwFA+TacTGd
         wiOg==
X-Forwarded-Encrypted: i=1; AFNElJ/s5cPIh0gofCWL/OKkKhrrbTk315jc9/31VZ1b5C6D4kgvuL6bZlTDymIspzR/Ta5gDdTNtllTNzcxdZtRzPHV@lists.infradead.org
X-Gm-Message-State: AOJu0YzRaWJDlS6XtbCJJomJL0KtRDndV9d0bU/cX5N5Hv+Kp3piTbbD
	/KLP4hWdp/PGjdMkMOqvKWq6wwDaReJDwX/XgtBQ1eFem56zQfLr6cyuIUmzWqNiFW5qLIms/Ii
	6hYrV+nPiFJu4yqV22oejr/+iIJECYn5Wofy3RD+JSyqaJGTGPIgJqqcNOA22BmxVQxj2qmEjXU
	xh
X-Gm-Gg: AeBDiev+jafA5DdrfSNLwcv5H1J81FydaAZ7zO8ohpXS2ZpecVwUH0npWWhRPZYoB9F
	OCoCS9TwMAqQhbGpcVmauu5wFhVVIe2QoCxzZkEX8Qni8DPo9xQpqo/fGAm0ZxEUse+mFkUmI3E
	pNv3LUfbGRkXpET/hVHMAZKTKKQA9eIGMKYMxGLtP27lqiKePgmOz095ee0ryiadQYZuUALpxDz
	8Q5ug6I65t709AuNlRDlKCzg9v8R7kXD47FUHEe5Go+OHrAvhBKIuCb90jRmEybzNCOs+vu9Z2h
	DrnJn0tLk0S+5OzLfmcz8JJ9XrZeFrBhqqBwdpGCqoTcQTn55+xUMT3PkcDiZx3eD2dtKXAdZG1
	S6ZigGXGXs79SSytPTYV6UX5FYSVYGqEID/0XiPBnAhiGvS2ZzEwt4xbvUlbwOSIH6mE=
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443686d6.45.1777470943485;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443326d6.45.1777470943011;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef86e2f1sm21005096d6.48.2026.04.29.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:55:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:55:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afIN2y_PCGofGAKD@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
 <177742893645.5403.3938693995862346406@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <177742893645.5403.3938693995862346406@localhost.localdomain>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rt2ri3B_2t2SHWhKC3NDfTTVUu6TFPPM5oJ5AJD_G2c_1777470944
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065547_431168_A1EEEDB6 
X-CRM114-Status: GOOD (  25.18  )
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

On Tue, Apr 28, 2026 at 07:15:36PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-03-09 07:38:40)
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f43690d7dcf75a7c4ac3 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> >  
> >  static bool clk_core_can_round(struct clk_core * const core)
> >  {
> > -       return core->ops->determine_rate;
> > +       return core->ops->determine_rate || clk_is_rounding_noop(core);
> >  }
> >  
> >  static int clk_core_round_rate_nolock(struct clk_core *core,
> > @@ -3528,6 +3545,7 @@ static const struct {
> >         ENTRY(CLK_IS_CRITICAL),
> >         ENTRY(CLK_OPS_PARENT_ENABLE),
> >         ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +       ENTRY(CLK_ROUNDING_NOOP),
> >  #undef ENTRY
> >  };
> >  
> > @@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
> >  
> >         /* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >         if (core->ops->set_rate && !core->ops->determine_rate &&
> > -             core->ops->recalc_rate) {
> > +             core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
> >                 pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >                        __func__, core->name);
> >                 ret = -EINVAL;
> >                 goto out;
> >         }
> >  
> > +       if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
> > +               pr_err("%s: %s cannot implement both .determine_rate and CLK_ROUNDING_NOOP\n",
> > +                      __func__, core->name);
> > +               goto out;
> > +       }
> > +
> 
> This hunk has me irked. I'd rather we export some function like
> clk_determine_rate_noop() that just returns 0 instead of adding another
> flag. The chance that someone can get it wrong goes down and you can
> naturally grep for any clks that are using determine_rate() without
> having to also include this flag in the grep. It makes it easier to
> reason about as well because we can have code that just checks for
> determine_rate presence instead of both (i.e. clk_core_can_round() isn't
> changed). Plus a clk_ops structure is more self-contained because it
> doesn't rely on the clk flags to go with it.

I also like the clk_determine_rate_noop() approach much better as well.
I'll send a new version.

Thanks,
Brian


