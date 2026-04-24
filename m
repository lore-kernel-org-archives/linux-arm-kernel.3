Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDFFED3C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W09Put2d2jcS6dMqMtNkVaKBleBYHmqz0mTuj06mJ8=; b=b/sqNqS7ihg0BCV8MN0hgiZ+Pt
	bUtsIhH+nfZrBpkM/MXFQyJhggkfmIGgLkCk++5uxCu4rUH4CGjK5q7yfuljvvo1BrSvW//sLdYRK
	1n/Rmhu/LR5+U363RXrXBLC3aO0xk+KJuvC2jge1FzIrvGPul0sF8Pd7/RBNY+JbdAbrKVDC2JUyZ
	v4Qz0BBAnegfHs/pj93ZusqT/MuzJCGDIUmPqi1Kj6u1FdBf/GRIkiEafwtGqRgutTuKB2n0azk8c
	VeKHOPT7SyKNksl3O4wldaty+ksGjfcqz3LPejXk6ij02w+np4DMp1AkIQ8u/sLbCQh06+Vqie9ug
	mR+tC0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGH09-0000000DHOD-0YGr;
	Fri, 24 Apr 2026 13:55:25 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGH07-0000000DHNf-0ck1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:55:24 +0000
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6108228a851so2659044137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038921; x=1777643721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W09Put2d2jcS6dMqMtNkVaKBleBYHmqz0mTuj06mJ8=;
        b=sznZgw9Ik7OrDVJtpveqYdvwEdsljEnbwJEqmy0l89h98mQDtOBr45xlCTGr8YPFtf
         c5q8yjltTW4Nd72jgetw4w86MSwOGClTXcoBwOTZlsM1T3TKvjSMg8I2VzsyiauDsO2C
         U87rZVxVA5pPgE01l2QTGY3UUQvKrFOTtN6oCbOaVo+WvhHsdbLuWL4z15RZTqq9OzFT
         Y8UfF+nQs3zhhNBjApVlg93filZYlJfv4y/X5Q/eSGD6TC74LXiPDHktyGbyAkQpE50p
         5hE4Cs+H/AQhcXz/dSbqTZRDtTYv9f4niYTdVH3SNQoOcFTuF/BujEGKKjJsakEVmeWM
         07IQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EfiEIBipknguhySBaZvtwVqJtVN6Cx5V/zc0Vp8vCn9SnGOuIkKy+8B0X5dAVpozza8Qb36+b1CB1rhuPilHE@lists.infradead.org
X-Gm-Message-State: AOJu0YwuK/uIp7O0vAU9JwTXIEJRNbAlAYcDuSlDZeJ1uZg3kyy945wi
	uEMxHVKFQG6YxwNbkBVlwiNmyM3dAfzY68nbmwz6ZyJoNFkn7F4120F5TWMNROoJFKo=
X-Gm-Gg: AeBDiev3wNBZlsAYaKuFax8zt5I7VkKC+lug0zUBAjNMLHDo715BWa+3zcC28PLkyEW
	jPEEo0BX5cGvpKC9S4iqEzEIenpn61Y7wF4A+GFI8gQQ5fuSfjZ5Th9wa+uJLV6dirobm1qpHEM
	y8g7v+Sg6ajuS1GXyeNuZc+dv4KhOvGG6+Qqh+qdRxjTiF8VPFUQ3uQJaj9ZrJgIE5WoORnCjRy
	U7Os+u8QyBK2yuy+9IlDZjkEiK7rpLNNQBeOG/UEztve+P/6eoIbte2GkQXYODrG9+LE3jO0jzs
	9mPDs0h/WdhbZUJTBIhWGMvRr/CEQLj/fiiNXBa4yR9Gs9rEz9TyVt8ngbaF9UemEOFoEa394g5
	Hg5l/nFnfLEuKtNx4lCNe+sIYURMyH2PDo0uZP2BNDPC++7QWjlMN5S4bX4tXqOxREBFxjd6Swv
	f2aiMeCte4mzCxACPU6MqmnT1qCVeQd0baU2zdOZui+1bGhBT/kMyS9sxIqAzlyWyGhzrolaeh/
	3M=
X-Received: by 2002:a05:6102:4411:b0:60f:7499:9b63 with SMTP id ada2fe7eead31-616f68d3981mr14620898137.17.1777038921318;
        Fri, 24 Apr 2026 06:55:21 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bca3fdsm11025541241.10.2026.04.24.06.55.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:55:20 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso3199872e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+B4q2x/wjwMYlSMtZ5Dp87rmepxpZu5eswV0rv0DiBeqmysj1p5whebKl4x9GtG1c1aqv+8cw9aEVz7cb3pfuK@lists.infradead.org
X-Received: by 2002:a05:6122:888b:b0:56f:adb8:7c54 with SMTP id
 71dfb90a1353d-56fadb88baemr9569375e0c.3.1777038919660; Fri, 24 Apr 2026
 06:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
 <aetw1WcSCDxk11AV@pluto>
In-Reply-To: <aetw1WcSCDxk11AV@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:55:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
X-Gm-Features: AQROBzDgUwf7y8JAYn7HmssU55ZLu_QWLKDdr6HYpgz_IN4dOPPU1wpFaeXKzVc
Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com, 
	f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	dan.carpenter@linaro.org, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_065523_208023_C426CDAC 
X-CRM114-Status: GOOD (  40.88  )
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

On Fri, 24 Apr 2026 at 15:32, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> > On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.

> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > index c9b62edce4fd..bf956305a8fe 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> > >                 SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> > >                     clk->rate_change_requested_notifications = true;
> > >             if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > -                   if (SUPPORTS_PARENT_CLOCK(attributes))
> > > -                           scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > -                   if (SUPPORTS_GET_PERMISSIONS(attributes))
> > > -                           scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                   if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > > +                           ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > > +                   if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > > +                           ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > >                     if (SUPPORTS_EXTENDED_CONFIG(attributes))
> > >                             clk->extended_config = true;
> > >             }
> > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >     for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >             cinfo->clkds[clkid].id = clkid;
> > >             ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > -           if (!ret)
> > > -                   scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > > +
> > > +           ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > >     }
> > >
> > >     if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > >
> >
> > I see that a quirk is being added for this, but I thought I should chime
> > in with my opinion for future approaches in this direction.
> >
> > I don't see how this hardens anything. All this does is break platforms
> > that were previously working by returning early. At most, this should
>
> Certainly the naming in the subject was chosen badly (by me!)...indeed it
> should be more something like "Enforce strict protocol compliance",
> because at the end all of the broken platforms really run a slighly odd
> out of spec SCMI firmware that does NOT implement one or more of the SCMI
> mandatory command...
>
> > be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> > returns nonsense, a clock driver should imho try its best to work
> > around the nonsense in a safe way, because the alternative is that
> > a major part of the system (and thus likely the entire system) no
>
> ..well yes we definitely dont want to break deployed platforms BUT also
> we dont want to legalize this kind of out of spec behaviour in future
> firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
> let already broken deployed platforms survive while discouraging such
> implementation in future fw implementations...
>
> These firmware most certainly wont pass the SCMI compliance test suite [1],
> which indeed we do not mandate, but the reason these bugs happened is
> exactly because the kernel SCMI stack was buggy and left that door open...
>
> More specifically these kind of out-of-spec behaviours are not really just
> a matter being 'picky', the problem is that any resource set in any
> SCMI protocol is defined by the spec such as to be described by a
> contiguos set of IDs and the drivers are designed anyway under that
> assumption from the allocation point of view, so allowing a clock ID to
> just fail one of the mandatory commands and skip a domain would jeopardize
> all of this and, even if clearly is NOT a problem here, seems a fragile
> assumption.

How can you have all of:
  1. a contiguous list of IDs,
  2. implement all mandatory commands,
  2. restrict the use of some clocks to a subset of the agents in the system?
Use a different list of IDs for each agent?
What if a mistake was made, and a clock was exposed to an agent by
accident?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

