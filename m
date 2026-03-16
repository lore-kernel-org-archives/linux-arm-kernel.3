Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319FF53D6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwkbFxjRydoL+3S1meFk7eWFdNhpUXApysI3YafwRzw=; b=RLpc1xbQ+Lwqhx7GQ/iJmD8FOa
	weqS5r9fO30LRJ5AQfIYuvnk7AlIiQhr7PedwLgO+yk7Pn5uft7O8MsEafnWoo3VQuGQxBWvUmfCH
	3iA+bmNbFOUiwQIWCViSTIJOfVpha//Mdt6jpWnO0SriHSNopKpj3AP781k+moFcoSlyvk1iFyPYc
	x0nFDuE8Ic1ghckDPfgGaAryWfmoOBa8JguIGuULVk2ZRbN2OxTvnMBK4DMg5ng+bLjNktGoaguY7
	FObYxeO5zieetNN1YUsdONniRPDVI2pg4Cg85Z1o/rGHaQtrVAfV4ZmZu7nOme2We27S9WAneTSbw
	M07tR0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Auu-00000004T30-2dUs;
	Mon, 16 Mar 2026 16:35:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Aut-00000004T2c-1lWN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 16:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FwkbFxjRydoL+3S1meFk7eWFdNhpUXApysI3YafwRzw=; b=PO2Gn4VDaH/tyLu7QVpGNji3Iq
	SXtRvjpeFe+9m5dV7yfirT9Kw0EQFH730P3BNugHm2HRKvPdD1zPlzIRZYM5BTGSr5NDJSuTeuPiV
	la8bKyx4dQ9V5qTcOsQNpYCVj4XzFVK+YOqz/oD+NJIkhVpPhhYBjNzHKbwouvQhQy317+mKdb4iO
	KJiv9gPh7DhlyGqGuS/Q9x0jr660Cs+j28y06/20vcLZYXIZRyQ1Vt0HEVwn+O28HMQgmxZhFuI8u
	iqrfLa/weSosAQTOfzsMf05DHhHZEtg95AhmIrgXEL3kBUicEnoaoTEQS0Sv7R9QUS9N8rCxkUA+M
	AEr0PwKw==;
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Auq-00000007DzK-1GDG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:35:42 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b069fed64so1902058e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773678938; x=1774283738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwkbFxjRydoL+3S1meFk7eWFdNhpUXApysI3YafwRzw=;
        b=M4ez/t/PvnWc3gXteLssS8GzE41GDb7HCk154aqoFZ6K+oQZRf2KAsFGUxmb9syVez
         50RfRcizQY/MzmQ7ui90I1tf5+CqlO8UvlInLiUrBgFV4eFLa1WHRAYyKvvqr47czEGT
         Yl5uFpMKT3kyTzKTtyRsj3FOVlYDV2ZrX3Cm/KXxTS5kNQL+AQ37R0hUqnYdXTXDxJ+E
         6tlPxweymZu6Z+z1fUlJ4cU41IhhxKDv0rtSl+sZjmV644X+kqoVVZVCFOuFMmRMozN/
         9WeYG4ztTLRXpLrTU81Ae7Nq96NEeEzNjb/omv98kNB8RrZk+NFYjgo7F4rNwot90zV+
         sOrg==
X-Forwarded-Encrypted: i=1; AJvYcCWC2p+pzo/BFpN4NR3x0FAQ/0kGhqJcchp/myVzUHbO7/gQsXv9EX6KxwsDAp08Vkn2A81LjPxBGNVbbExSVf2N@lists.infradead.org
X-Gm-Message-State: AOJu0YxACxvib13YOt0KSGd+RuEgWTBCYpvuxRRPKOohht+ucjHitwcp
	q1yP8Cz1zV8y4oTXfCFxGajehRxTc8dDIMaHf1Za9Mg1uZzbGsyrBZbTo7qn6Kyx
X-Gm-Gg: ATEYQzwh5ZX0J6IBtbRYAougkAqGOgTLt/F4Xm4Yl6tJWx9+EhpMPhPnjJowUPfsBcG
	qRynNYxmO5hMrtarki/NNn7SjPbQt000Ldu9m8SE3C70gAnXl1pXDfIOxpnqyeQGnv193aEW6qg
	xyhTwWjqnV/jIAo6pS3+/hI6GMRtDPYYWcJqaoG+701g0gKWZnLuBD11GDUxUrlFFQpy3bW0Usw
	eOR1340VRzs7RhkU2kxITvqJFWQnslOWvbRHrxt0z/1DtVzn6k4UFoJRFr1ybTejD3SofMji6BU
	qr9u32MJjjS1dtUPLT8ajZ59n6l03VxDWeHLjhpIenWeXA1jN4sinhZpreZtFU21YMtAB/MqyXc
	gW+Jti/NBvstqZFNdltMLGV2lu0EQQOb0gExQugHXU8aqxP7ATwk7tOfcZDnkCOdvyLIlwOZFpj
	DnxDMw5Dad4bwTfzpXkua/EAropuB3b/eVJx/32+Oh/cYzZYRjP54SDHj07hvtG/0I
X-Received: by 2002:a05:6122:d08:b0:56b:7779:15ac with SMTP id 71dfb90a1353d-56b7779169amr2862827e0c.9.1773678937794;
        Mon, 16 Mar 2026 09:35:37 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b7e7623e3sm2734917e0c.7.2026.03.16.09.35.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:35:37 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b8541a00dso270427e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWU8aEoSS/Raw5rvOXsLHI2frEYjaJa8hGu17uz+Yu7qWF7KAbKM+XsQ7YLpYqIb+yZIPEBWzmBrcHIbILXkX6h@lists.infradead.org
X-Received: by 2002:a05:6102:41a8:b0:5ff:f366:dbe1 with SMTP id
 ada2fe7eead31-6020e2ca6f9mr4658842137.15.1773678937299; Mon, 16 Mar 2026
 09:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto> <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
 <abgsW1yoGtMNE3c7@pluto>
In-Reply-To: <abgsW1yoGtMNE3c7@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
X-Gm-Features: AaiRm51lpyc-i3j3bxjBB2lDNXTNKjsxn3Z8MoQ6iXS2hbjQwIIJtMCDQtgnhDA
Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_163540_441801_D73ECB51 
X-CRM114-Status: GOOD (  58.99  )
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

Hi Cristian,

On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > > rates.
> > > > > > >
> > > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> > > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > > >
> > > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > > -               if (!ret)
> > > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > > +               if (ret)
> > > > > > > +                       return ret;
> > > > > >
> > > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> >
> > Apparently it is not just CLOCK_ATTRIBUTES, but also
> > CLOCK_DESCRIBE_RATES.
>
> I was indeed suspicious that I could have opened a can of worms by
> more strictly enfrocing these...
>
> > > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > > are available at all.
> > > > >
> > > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > > >
> > > > > So there are a few possible solutions (beside reverting this straight away)
> > > > >
> > > > > The easy fix would be instead change the above in a
> > > > >
> > > > >     if (ret)
> > > > >             continue;
> > > > >
> > > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > > FW releases to fix this :D
> > > > >
> > > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > > quirk targeting the affected FW releases...
> > > > >
> > > > > This latter option, though, while enforcing the correct behaviour AND
> > > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > > >
> > > > > ...that could be solved with more quirks of course...but...worth it ?
> > > > >
> > > > > Thoughts ?
> > > > >
> > > > > Let's see also what @Sudeep thinks about this...
> > > >
> > > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > > the firmware baselines are derived from it. In the worst case, we can relax
> > > > the hardening until we figure out a proper quirk-based solution.
> > >
> > > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > > Geert with proper versioning....so I can check that there are no
> > > surprises round the (quirked) corner...
> >
> > Unfortunately you cannot "continue" from a quirk, without resorting
> > to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> > control in quirk code snippets"[1].
>
> Yes ... just realized that this afternoon when trying to draft a
> quirk... (see other thread)
>
> > Then I came up with the following preliminary (have to check more
> > firmware versions) quirk (Gmail whitespace-damaged):
> >
> > diff --git a/drivers/firmware/arm_scmi/clock.c
> > b/drivers/firmware/arm_scmi/clock.c
> > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > clk_protocol_events = {
> >         .num_events = ARRAY_SIZE(clk_events),
> >  };
> >
> > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > +       ({                                                              \
> > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > +                       continue;                                       \
> > +       })
> > +
> > +#define QUIRK_RCAR_X5H_NO_RATES
> >          \
> > +       ({                                                              \
> > +               if (ret == -EOPNOTSUPP)                                 \
> > +                       ret = 0;                                        \
> > +       })
> > +
> >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >  {
> >         int clkid, ret;
> > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > struct scmi_protocol_handle *ph)
> >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >                 cinfo->clkds[clkid].id = clkid;
> >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> >                 if (ret)
> >                         return ret;
> >
> >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_RATES);
> >                 if (ret)
> >                         return ret;
> >         }

> > Does that look like what you have in mind?
> > Thanks!
>
> Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> behaviour with continue, BUT if the set of clocks not supporting attributes
> and the set of clocks not suppporting rates is disjoint, I feel we need your
> double quirks :P

I could have used

    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

after both scmi_clock_attributes_get() and
scmi_clock_describe_rates_get(), but I wanted to keep the check as
strict as possible: the former returns two error codes to ignore,
the latter only one.

> If you are still finding out the exact FW versions that are failing maybe
> it is better if you carry on and test the quirk-framework fix above together
> with your quirks and we can make sure to pick all up together...

It is not urgent, as R-Car X5H SCMI support is not yet upstream.

> ...OR maybe better I can also drop for now my offending patch that breaks
> your FW from my V3 series and you can pick it up and post it later with
> your quirks and the Quirk framework fix you propsoed so that we are sure
> that we dont break anything while fixing all of this...

While there is indeed a chance that this hardening regresses on
platforms that are already upstream...

> Also because we are already in V4 and I dont want to risk to post the
> breaking fix (that was at the end broke since forever) BUT not the quirks...

s/in V4/at rc4/?

> Let's see what @Sudeep thinks

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

