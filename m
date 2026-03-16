Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E87F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMV00VBJWKkaqpEtH1LAiLdHckZZ6qshJN4iQQpaP6g=; b=gN15GBHuzRxOtMLS3uLd8iEgEQ
	3lXYIUbklu9k2eWDQw21XuqvpUssyvfUPkFi4w5S3hEz849sxeQi1rAJC2P3YMA5qCiyliwNMJ9zu
	6mWcTb3qF9PxAonu6yXcIwkCiMFksyS/h05IU9W1xYaMnwuhoWC/M6xKWkJT3z1r48N2RRA34IDNq
	S8XJRZjz5gdexjkuoJglj4cvGaGrc/AqjGJ29FqxBCx5zTsZVX4aBCQNl53Hg5iJVnJFaH9KHi6la
	63njRxYQ2tn0jXDk/XP3LZrYSdS70krzVqFY2PxI+m3KmmjoFKcPImlCI6ExgA61fXkcd5ukjJ6VS
	PNM+S+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ADE-00000004NKx-1q8e;
	Mon, 16 Mar 2026 15:50:36 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ADB-00000004NKU-2X0d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:50:35 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1908600e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676232; x=1774281032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMV00VBJWKkaqpEtH1LAiLdHckZZ6qshJN4iQQpaP6g=;
        b=XqRvNO4H26SBVwcoYJWYdRSXpvZQPZ5CyceFSelAm0dk1LIyqS6EhJrAfg5WHOzEvd
         ss1KM8Odg3nSSN4kGKVoA+C2GkqFNLDpNQ4ksp9cYNRl9owVuJ+dNT5KZZ/9p4IcKxJv
         JhoJnM/i9pU9uzHEgkwXXtK+lVZiIrD3wipQtqYWjWJdK7nHvfroghWr8Y4M+LK6w+SU
         Ph+/Nxwnd69/Tc3SaEROCigYAM2xm8CjNcHLTlYabBxF+UafT/ZnBASe+JD5nJXagf/u
         O1og0AsoJBIkoDhOTDpdzckZN/N3oQhIY17nfTn+MKa9Qk1aTpwizeekaES0HWWsWcNh
         twww==
X-Forwarded-Encrypted: i=1; AJvYcCWZgop2B1lYOjeNR+MhIwmcZtHCB1/YwgzCsfoi0CqH/RIMhxsDyOusgdnFsyBkwr8UqCq3nz9vdFkU8BpArKsd@lists.infradead.org
X-Gm-Message-State: AOJu0YwRuBysHJults0WFwnvIF419dmhB8LdW078P3ALlQ9SYKrI9WDW
	m1YxvhFkIXNz6b+9uQcWQ2Tywz6AMkwuaqCMksdc75ZLUlNmURi+vngF9XVZ05zb
X-Gm-Gg: ATEYQzzDWyTVz7BS91z7P4LfLTH0BTLwUlT1bShqd59RVQX7SJUcDENNH7W2ds/w07n
	F0T8TokwKhFUK4JVBNX/2nM74ohLJvpuYnQKM2nkLHnJ76+DuCis5jeyl7WrJNxNbzO7NFWo+95
	iJgGBiaGyc+ZAiv5WP9VWwX0PLTS4KuIFsB5h9YCvMQaPQFwnv7vqL2tYjq8TWCdjYEAmhy5gb1
	3W5GnbSKHGz+GfNAimnikhSZrgbXRC17kgbzAAeda4EyjCS4Dn0/0cYPECIYtlRr0ObTlldATmc
	7IRD7LCvl0FCPk/tWb52Mo2Iom7Ei8/ZCivXKjpWaasyqKiok1OrddyZCkfMnSKRArq2UOjpaT4
	epJVMRugv0yQIhlh2IbDSRiu4ziD/9cU822Lhxmbk0ZGaKkztUzab6w7OQFxwvtRvYAqSOvPlM1
	P98esyIeYlfCvD17S93Ti1XFcXoR8ZiZLiH1rOVx72lKRIznoMDxO5SWKoMgYD
X-Received: by 2002:a05:6122:d26:b0:56b:8103:79f6 with SMTP id 71dfb90a1353d-56b81038885mr1990217e0c.4.1773676231821;
        Mon, 16 Mar 2026 08:50:31 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464a4235sm8115516e0c.16.2026.03.16.08.50.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:50:30 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffa277c156so653474137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWc0sLgNJM5+sCDm20iS0QlXhb9cZ3IWElZYGDNG0cGXaf5hCQbOEpenWJbGTE1od85BI7ZvN4S+uS4FtZVhBPE@lists.infradead.org
X-Received: by 2002:a05:6102:d87:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-6020e2823b8mr5534337137.15.1773676230555; Mon, 16 Mar 2026
 08:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla> <abLrm7x8ggzAhYOg@pluto>
In-Reply-To: <abLrm7x8ggzAhYOg@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 16:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
X-Gm-Features: AaiRm50iTDhKDonU-J5qpw3zzDb9304AIvkxbNozshzVrNKZQ64ZXXeHYUSrWsA
Message-ID: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260316_085033_667409_AC8954E2 
X-CRM114-Status: GOOD (  49.74  )
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

On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > Hi Cristian,
> > > >
> > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > rates.
> > > > >
> > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >
> > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > >
> > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > -               if (!ret)
> > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > >
> > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > do not support the SCMI CLOCK_ATTRIBUTES command.

Apparently it is not just CLOCK_ATTRIBUTES, but also
CLOCK_DESCRIBE_RATES.

> > > > Before, these clocks were still instantiated, but were further unusable.
> > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > are available at all.
> > >
> > > ...and this is exactly what I feared while doing this sort of hardening :P
> > >
> > > So there are a few possible solutions (beside reverting this straight away)
> > >
> > > The easy fix would be instead change the above in a
> > >
> > >     if (ret)
> > >             continue;
> > >
> > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > FW releases to fix this :D
> > >
> > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > quirk targeting the affected FW releases...
> > >
> > > This latter option, though, while enforcing the correct behaviour AND
> > > fixing your R-Car issue, leaves open the door for a number of possible
> > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > >
> > > ...that could be solved with more quirks of course...but...worth it ?
> > >
> > > Thoughts ?
> > >
> > > Let's see also what @Sudeep thinks about this...
> >
> > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > the firmware baselines are derived from it. In the worst case, we can relax
> > the hardening until we figure out a proper quirk-based solution.
>
> Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> Geert with proper versioning....so I can check that there are no
> surprises round the (quirked) corner...

Unfortunately you cannot "continue" from a quirk, without resorting
to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
control in quirk code snippets"[1].

Then I came up with the following preliminary (have to check more
firmware versions) quirk (Gmail whitespace-damaged):

diff --git a/drivers/firmware/arm_scmi/clock.c
b/drivers/firmware/arm_scmi/clock.c
index f62f9492bd42afbc..6f2af6e9084836c6 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
clk_protocol_events = {
        .num_events = ARRAY_SIZE(clk_events),
 };

+#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
+       ({                                                              \
+               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
+                       continue;                                       \
+       })
+
+#define QUIRK_RCAR_X5H_NO_RATES
         \
+       ({                                                              \
+               if (ret == -EOPNOTSUPP)                                 \
+                       ret = 0;                                        \
+       })
+
 static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 {
        int clkid, ret;
@@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
struct scmi_protocol_handle *ph)
        for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
                cinfo->clkds[clkid].id = clkid;
                ret = scmi_clock_attributes_get(ph, clkid, cinfo);
+               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
QUIRK_RCAR_X5H_NO_ATTRIBUTES);
                if (ret)
                        return ret;

                ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
QUIRK_RCAR_X5H_NO_RATES);
                if (ret)
                        return ret;
        }
diff --git a/drivers/firmware/arm_scmi/quirks.c
b/drivers/firmware/arm_scmi/quirks.c
index 3772139a758c8a78..5a69f119e1b6c806 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -172,6 +172,8 @@ struct scmi_quirk {
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000",
+                 "renesas,r8a78000");

 /*
  * Quirks Pointers Array
@@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
"Qualcomm", NULL, "0x20000-");
 static struct scmi_quirk *scmi_quirks_table[] = {
        __DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
        __DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
+       __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
        NULL
 };

diff --git a/drivers/firmware/arm_scmi/quirks.h
b/drivers/firmware/arm_scmi/quirks.h
index 74bf6406dd043049..13f28d13bbd74d4c 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device
*dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);

 #endif /* _SCMI_QUIRKS_H */

Does that look like what you have in mind?
Thanks!

[1] https://lore.kernel.org/51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

