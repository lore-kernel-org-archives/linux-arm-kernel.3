Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F69FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WSn3Gp8++tbsczQV3o+avsi3Hm1AnDhWAFzNoHqmYE=; b=4QjCp1LW/Tkl3lW0rgVyHO8rWU
	HEXTpzMsBfgG9KidfxcCkjCCatokrhGnUaB+GmI5kZ23RUq/h8aph2nlNy9uIX5cbFMYpMR1ERUCe
	xpp5VsTA0FG/xRQ6If8vxk7VVdolVvpZi9CX+H2k3d8KAkt12g9+WOKyJ4HNCgaKkO0YNtDdL6DpP
	OsIfs8JkFuiZuC6f0ilAB/yu3ZVMCuMUHFb2agq1LTdhB6bp9T3wAh+flfQo/6MPY24fhEGcEvoCZ
	i97Zgei11dGnPSuBYwbsSe2WdxQuqXU5PXA01qq25MPGwdDzlbhV5OA18r9ATJnPXQ32jLql94yEB
	kqRY7MMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEOv-0000000G6vB-0R0N;
	Tue, 05 May 2026 11:57:21 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEOt-0000000G6ul-1wZv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:57:20 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so1021672241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 04:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982238; x=1778587038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WSn3Gp8++tbsczQV3o+avsi3Hm1AnDhWAFzNoHqmYE=;
        b=coOvGNa02BmFi8WIIzpP9P6hbugKfNZ0bfHsWxl/3DCLe+aL/5UEk5IxxyjfMPvcXh
         Sw5IlTWYhCZ1UKB/dwrgn1NscWi+h+vRAwx2XcIm6Tq7/Nchl1+y4CBmhY+az4bzaqyy
         2dPj+iFjC2V7Xwqqm/zrdX8YH9efcGP6WpebUv02cl5KDbJTV1AOFtxta5+oNQNwbWAx
         Fmqy0+4VxJ+9gOYVBCFLK5C8rLvU2nXt3okEn0aQqK4zegyAWHQOvE8txTnTZ2NstBtj
         VeS2w9aM4/ZzCjcVKlVh5RT7kcn2dUkvDa2+UkGZsYeTBrmrBBkJpYWJ1sq41dwCjqq4
         NZ4w==
X-Forwarded-Encrypted: i=1; AFNElJ+zUj4WxbJxbUsXBQMRzJoRskYqQBqsk5eWZzNnaYAGh6zaEIL5/MXK0CMSwnsfACQHqdp5oQLLcYkJXeemNtCz@lists.infradead.org
X-Gm-Message-State: AOJu0YyfcyOrwelAN4yFR5Q7xqEL2gauuU0F5ZifEDgDXVAdltPKjiZQ
	+iGDu6ZVO/VSFc3qmXaiBUv0zyNK0CrCf0gsftnY+LP/XpFZnzFD02iuP2NG6xsh
X-Gm-Gg: AeBDietgToooeZOjvJVkze8Sis74O9BjDqY+hABAChQ2R5ZV/Cn3a47rlzmXvcHAAMv
	h1/vdqnknG+PwkXtwl9xz2bufR1rKJCT2ovyI9REgJbV0sayVzDOSO4mC3e8K5nq78IndWjaNkp
	TgEs9r7IEa+gY+a661rkPa6BO5xN5yHPEj55v+I7oWZX8Cj2yPeBZpQcb4hzCFP9wvXu05AG+uz
	ctGNyuXKCxyPYVFBt81QQx6kgCtqLb+ZSbeJnt71XD6u/24mb9Wj/FkORGfqgSzldbY8NupfIJO
	08cqxhd7oNzKkp3q0wp00xCgraKMbbu0khAXgNh1nlnnJD7QlCVnbP7AgX1GPfkTXLv8WUlgNbx
	21TIIasCNy/P/heLpBpmOl+2ErDaYcV5E9TUp3V4Ud516B0edb3fjmAtEtcXGdMZTHfrt3PwOEY
	e0NGwiHYggXDADACPGOZioUnyXrE0bYL3lcMIFbDXAJduZkbXivhrVQ2wk42UgDZStOLLFERE=
X-Received: by 2002:a05:6102:8012:b0:62f:43e5:c157 with SMTP id ada2fe7eead31-62f55984103mr1269931137.15.1777982237771;
        Tue, 05 May 2026 04:57:17 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfbb75140sm6983343137.5.2026.05.05.04.57.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 04:57:17 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso4357580137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 04:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CBEHgShJUoa/Zr6y0Od3kcI4U8U8fXYZ3By3v65pQixcPEBqqi8tMcr9Nh15vj7km/LYd/cCRexh/4u217+46@lists.infradead.org
X-Received: by 2002:a05:6102:d8a:b0:607:d68f:d0f6 with SMTP id
 ada2fe7eead31-62f55a492fdmr1354982137.20.1777982236245; Tue, 05 May 2026
 04:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-14-cristian.marussi@arm.com> <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
In-Reply-To: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 13:57:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
X-Gm-Features: AVHnY4Lq3Zggrs4Qv91iMEofghVqKQUPPKW-R1C9WbhWCH-RGMfKoh_-yjYR4Ms
Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_045719_551535_1E7D9056 
X-CRM114-Status: GOOD (  30.09  )
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

On Tue, 5 May 2026 at 11:59, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Clock rates are guaranteed to be returned in ascending order for SCMI clock
> > protocol versions greater than 1.0: in such a case, use bounded iterators
> > to minimize the number of message exchanges needed to discover min and max
> > rate.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> Thanks for your patch!
>
> > +static int
> > +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > +                             u32 clk_id, struct clock_info *cinfo)
> > +{
> > +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> > +       int ret;
> > +
> > +       /*
> > +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> > +        * be discovered in ascending order, lazy enumeration cannot be use for
> > +        * SCMI Clock v1.0 protocol.
> > +        */
> > +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> > +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> > +       else
> > +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >         if (!clkd->rate_discrete) {
> >                 clkd->info.max_rate = clkd->rates[RATE_MAX];
> >                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
> >                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
> >                         clkd->rates[RATE_STEP]);
> >         } else {
> > -               sort(clkd->rates, clkd->num_rates,
> > -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> > +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> > +                       clkd->info.name, clkd->rate_discrete,
> > +                       clkd->info.min_rate, clkd->info.max_rate);
>
> Printing clkd->rate_discrete is futile, as it is always 1.
> It would be more useful to print clkd->r.num_rates instead, although

clkd->tot_rates (sorry, my local tree still had your v2)

> that may still be lower than the actual value, due to lazy handling.

clkd->tot_rates is the actual value, so there is no such issue.

>
> >         }
> > -       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >
> >         return 0;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

