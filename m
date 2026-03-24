Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A3F54AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3UNdFM/2oVC0aBHnMmb6liNAkmGmbywgRrpmh1ChmU=; b=0ojbwqRIaqU9OzIOODEYbG0H3u
	1WTexOk9zJl3kE88bPUgSaDWo6TB2QvFP/KokrCbSsMqdJByjGKkpt5PfqKA53jf8X0NMt9aS2Ojg
	TkW0RquA5oJn4NqoAarncPpcXvtMaPdk38ZeFRXKMA21iryw5nG2HZiGLo9QS6t0T/YHv/AyKixKq
	6N+egCAtECN/Ra2QTFAjRvUDh9lU5koa+09WFiWZK89iE5KOoX4g7WQS8PqTPIoI+vKAewr2wfpj6
	fB2yDpiAsTSeF8zY7GLxwnPI7z2GgOaKozTYV6msMii3W34HnBmwdHeQYbehJNOgaozyUB+Tubw8F
	+8Ahry5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5233-00000001Z8l-24wH;
	Tue, 24 Mar 2026 13:43:57 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5230-00000001Z8N-2np8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:43:56 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1814347e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359833; x=1774964633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3UNdFM/2oVC0aBHnMmb6liNAkmGmbywgRrpmh1ChmU=;
        b=VjUGPckRTkO5kJJCeqUIYVx3CR7claQyyyEERBAlmk3nsqFb9OCnmndlTMWxFae7FY
         5XMIGE3LjH/SalMR0aN8AP13+aYDTVyDoEWbB6Sc7VvV7BDSqcm8YItTPWEH9NtrGCi+
         QpRkeWx0T5BgfGdhuoUyV1+XH6KjLkkV39L7MQqb241ArXHSyPexQMeqIhI/M8qsGQaZ
         lDPjWPHsJkkgyVcG1ED7SaTd+NWl6t4t2+yzIDHZ/7Lo4XnGLz1udPJDJMV1OVHI7p68
         5LnMab59T02hbEZch1fuO/QFL0wdA8HTKvHs1Vdu0ihuPLXqO7fwhLli7tSQN157jRMU
         VSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnwlK1VW7XHhXd7d5/kvcyhM3xW72QyeRR3tICCZVdrtPVByY96vVoOAakP4nxLIEtCcajmGUVWLx4HUhk771c@lists.infradead.org
X-Gm-Message-State: AOJu0YzGFnnROxqBSRFvUuz4AVuVIblBkD/7kF/KwWO+xiU/BoeET1Ev
	hO3gaihwGp6HTPb/XXvznDYey/xRpHSt63Bci3cjDXTKHEqSs9fdb5FwMqwILJ5Sglg=
X-Gm-Gg: ATEYQzy+adF4HkbAqqVHkwJvYG7TkGDMaQ3hrNpCGLZh03PdwgO6YvnQBmMqZfU008v
	bE/iy8nm88xEAhYn+iGQr1POcWpVwX5lkMd9DDmF63waDCJvAdU3zwkxjghEdvP/ZumWzXJC4A6
	ni8i1NNpBDsxI/RnfwSs9FtbXlZv6EfARl60hAf8NUooQkpYcTGIebSUz2eUldE5CJcfojBdKOa
	is3VTuoCeLkkabB1ymbxexeAvPiqK+g6MNwwYrdUCNhGfOJQc6lZSA7YGBOW70vsfJqW13exfGA
	1vnub4uxuXbT0/8xDt/IZKa1BuUMBem4yqNCtmfBWs5rVSSlqv9BBb00aNSVA5tBiBPmI39iCYy
	aAuA7mpR0BKmF+j4DBR1sqSsBy0bx9O+iqPb7inyC8+cVNTXhc260xgAPvwDUyNWKVQKaVMLHeB
	rKxD4ofwhE9EzqUqa4Sr8sg/TOhRfQVm6jZXJiAAt6aKHjywVzvbsSOj2LoMF1QgR+
X-Received: by 2002:a05:6122:62a6:b0:56c:db9b:2eab with SMTP id 71dfb90a1353d-56cde324b67mr6968911e0c.2.1774359832970;
        Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cea30c727sm13765296e0c.2.2026.03.24.06.43.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56cde757d3dso1435536e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU62Gk8KnhO0exdGLn4F4g6fNxuKoGvx7XYsaR5/3K+hNYAZz+vt2uym539AH4Cn48OcFLlqsq87TR48sC7hTcE@lists.infradead.org
X-Received: by 2002:a05:6102:5812:b0:602:71a7:63c2 with SMTP id
 ada2fe7eead31-602aecd0de0mr7186355137.23.1774359832015; Tue, 24 Mar 2026
 06:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto> <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
 <abgsW1yoGtMNE3c7@pluto> <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
X-Gm-Features: AQROBzDvNZgLoQvhVJc-PSdP06Iq5zvkWOybQz-6zVMkfKMPvuuu_fBc0vUNAPY
Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260324_064355_815583_22148CBD 
X-CRM114-Status: GOOD (  33.78  )
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

On Mon, 16 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > > Then I came up with the following preliminary (have to check more
> > > firmware versions) quirk (Gmail whitespace-damaged):
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c
> > > b/drivers/firmware/arm_scmi/clock.c
> > > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > > clk_protocol_events = {
> > >         .num_events = ARRAY_SIZE(clk_events),
> > >  };
> > >
> > > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > > +       ({                                                              \
> > > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > > +                       continue;                                       \
> > > +       })
> > > +
> > > +#define QUIRK_RCAR_X5H_NO_RATES
> > >          \
> > > +       ({                                                              \
> > > +               if (ret == -EOPNOTSUPP)                                 \
> > > +                       ret = 0;                                        \
> > > +       })
> > > +
> > >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >  {
> > >         int clkid, ret;
> > > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > > struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> > >                 if (ret)
> > >                         return ret;
> > >
> > >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_RATES);
> > >                 if (ret)
> > >                         return ret;
> > >         }
>
> > > Does that look like what you have in mind?
> > > Thanks!
> >
> > Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> > behaviour with continue, BUT if the set of clocks not supporting attributes
> > and the set of clocks not suppporting rates is disjoint, I feel we need your
> > double quirks :P
>
> I could have used
>
>     SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
>
> after both scmi_clock_attributes_get() and
> scmi_clock_describe_rates_get(), but I wanted to keep the check as
> strict as possible: the former returns two error codes to ignore,
> the latter only one.

So these are two mitigations:

    #define QUIRK_RCAR_X5H_NO_ATTRIBUTES    ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

and

    #define QUIRK_RCAR_X5H_NO_RATES         ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_RATES);

gated by a single quirk entry clock_rcar_x5h_no_attributes:

    DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
    DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL,
                      "0x10a0000", "renesas,r8a78000");
    __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),

In general, when a specific SCMI implementation has multiple quirks
and needs multiple mitigations, do you prefer to have individual
entries for each quirk plus mitigation, or just a single entry with
multiple mitigations (which may not be limited to a single protocol,
unlike my example above)?

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

