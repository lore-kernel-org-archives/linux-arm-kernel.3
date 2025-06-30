Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C939FC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HHyttpDTe6qStRsM+nsbJq6FKJZTXS/oIqRBj8ZQtE=; b=jEMmYXOjS8CYramI/N8JVyQIWx
	5+UAluZo5fsBD+n1DxVnOThqxNSDdsodQ4OwZmpWd1yocW4XVqVQwq2998deEMcnkBS6reKuF0dnD
	1rXDzJ2Wd39zD8phwlSVw60uaMXGbBkGB1vmb+OAzUrFG9SiE80Sw5gIbPTA0ZauTlnDnu0IMQ5fg
	t5CvkbwZfCakVfH6KVdc9bRCCpy15KQHDWbNbo7iva417mtYfxXxwzhF/IOywwrmd1pDQBnDmfjJa
	SX60R4Y1j2D+ZLWzClQyWhSOC+OfGS36BvmXaqPXRPqX55tkIsWssunNAHNd3sBtnkXXQQbegCNv7
	N+IJAGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAuP-00000001lON-3ZNY;
	Mon, 30 Jun 2025 09:34:41 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAs6-00000001kxl-14Ul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 09:32:19 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso901938241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 02:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275934; x=1751880734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HHyttpDTe6qStRsM+nsbJq6FKJZTXS/oIqRBj8ZQtE=;
        b=mn2WWCkzedlYTnbLiAk98dpzyHiW1dDKiL7s9yTuqk3YdY/O/OfWcAUzSzFZ87VRQE
         FZMJyy/zSWn8AotQQ0yYW3nQchVd6mEUHWnbn0eEjChi62ng+R7yMMaR0Nv5cc/R6jnt
         Gn/4tHcwQJ/DQ+r4BNvEYk46800PwFNt4vpp465fuY4sogeT+4sVAY7JOx+HVsJqydyU
         ErSUfquqxn5mrsse1Odl99lAkEfo/IRlqe11pl0uhKEqpAbCjwUABACCHzGXTTXqYZu1
         +EPRp/LaO1p25YF5tvO0H6S6qnABhJ59FmRow3PuAPibdeledk+tWFfZ7rsn4TrLkAtl
         fRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9iSrFmNKngYGmIsgAY1XpDS3zKQB0qZwBw4yh0yabFICSYTkohB20eBDRgRfCCgrm1tR/u7Y+DTUdFs1U7RRL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz7t668DQeGjylo7Pr4tQiU0ih58UXeCw/jyKSWpytmDJZtqZQ
	IeV86SX+UgQ+tCggHWpJvZ3qrsOgEt5HWknBYWfl2SUn7Xa4nX3AtD0XnUj7HZDA
X-Gm-Gg: ASbGnctysA7po707DFzhcfNYZChxu9cowpeKnxpTvxXdGsmYQwJ3YDgaa1fDbevO7Dj
	C3jg8l6bEfHCXQQkVWxErRfqT4KvcFzAmk3OiU9PX7uB/PHqBrR+Kip3kRnW/ekk68r3h/N5Q4P
	qELpM7+irlDjJp121U+63mcFCM3E3V+DiTG2eZlmQYflHGSReqI65RA1a+jxf+FztZu9LwgPafK
	1ZvVpS+uL0J5fetvfGr10MI7JJMkocLXFe2Oqgi7r8ml+6uDh6SQZ2R1s4d8mbf4OTR3Ru2fWBw
	QpLH/D9FQWAuMiYOjRqJPKk5uxJMQXyD4cSID/AZanLPuDaf4HY7z9q1owV/dmV7Jk273jc/aA9
	khhWIcsap8icsvWYVBbLUSUQx
X-Google-Smtp-Source: AGHT+IG1V0GmZfyOlERzGknEUYM2xzbfjnJKO7jgxMwxVm+7x7eZxz9GBOwssXWw+54Za39tY0Sb6Q==
X-Received: by 2002:a05:6102:548c:b0:4e7:c14c:9e30 with SMTP id ada2fe7eead31-4ee4f86caafmr6515326137.21.1751275933562;
        Mon, 30 Jun 2025 02:32:13 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1da06ffsm1531396241.26.2025.06.30.02.32.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:32:12 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso901917241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 02:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEzYNm8iJMcoytkFlpbRzs0C+p6tVHSQl3JoROIZzCA8/IsRMyApY57t6ifWr5wbvEmK5h2T4HOol+cAcGhqeB@lists.infradead.org
X-Received: by 2002:a05:6102:f82:b0:4e2:c6e4:ab1e with SMTP id
 ada2fe7eead31-4ee4f55bd15mr8009074137.7.1751275931927; Mon, 30 Jun 2025
 02:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com> <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
 <CAPDyKFpXcpwkacnYqWz2vxaTd7pW5bSRa2F063BryFxVNEAmPA@mail.gmail.com>
 <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com> <CAPDyKFoJHFuY278eEobje4TOv_+-i966H2OuP9fqHMLLevb0qw@mail.gmail.com>
In-Reply-To: <CAPDyKFoJHFuY278eEobje4TOv_+-i966H2OuP9fqHMLLevb0qw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jun 2025 11:31:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVo1eOZiRpcH_XNqP6Y0imk4+bcAe=+W4_Su1pF16uRVA@mail.gmail.com>
X-Gm-Features: Ac12FXyy1jcX9FikFs2NK5_wkqpBj31k8jOziXAUTCaEyHrb3yLbemdWFSlcECU
Message-ID: <CAMuHMdVo1eOZiRpcH_XNqP6Y0imk4+bcAe=+W4_Su1pF16uRVA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Saravana Kannan <saravanak@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_023218_294189_8A724373 
X-CRM114-Status: GOOD (  49.33  )
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

Hi Ulf,

On Tue, 24 Jun 2025 at 17:30, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Mon, 23 Jun 2025 at 17:06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, 23 Jun 2025 at 16:21, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Thu, 19 Jun 2025 at 13:40, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
> > > > a postcore/arch_initcall?
> > >
> > > I did some investigation around this and found that both
> > > drivers/pmdomain/renesas/rcar-gen4-sysc.c and
> > > drivers/pmdomain/renesas/rcar-sysc.c are registering their genpd
> > > providers at the early_initcall() level.
> > >
> > > I was trying to find (by browsing renesas DTSes and looking into
> > > drivers) if there is any consumers that actually relies on this, but
> > > so far the earliest consumer I have found is the
> > > drivers/irqchip/irq-renesas-irqc.c, but that's at postcore_initcall().
> > > Of course, it's difficult to say if my analysis is complete as there
> > > are a lot of platform variants and I didn't check them all.
> > >
> > > Maybe we should just give it a try and move both two drivers above to
> > > postcore_initcall and see if it works (assuming the irq-renesas-irqc
> > > supports -EPROBE_DEFER correctly too).
> > >
> > > If this doesn't work, I think we need to find a way to allow deferring
> > > the call to device_add() in of_genpd_provider_add*() for genpd
> > > provider's devices.
> >
> > Commit dcc09fd143bb97c2 ("soc: renesas: rcar-sysc: Add DT support for
> > SYSC PM domains") explains:
> >
> >    "Initialization is done from an early_initcall(), to make sure the PM
> >     Domains are initialized before secondary CPU bringup."
> >
> > but that matters only for arm32 systems (R-Car Gen1 and Gen2).
> > Arm64 systems (R-Car Gen3 and Gen4) use PSCI for CPU PM Domain control.
>
> Geert, thanks a lot for providing these details and helping out, much
> appreciated!
>
> > While changing rcar-sysc.c to use a postcore_initcall indeed moves PM
> > Domain initialization after secondary CPU bringup, the second CPU core
> > on R-Car M2-W is still brought up fine.

To rule out relying on anything being enabled by the bootloader,
I offlined the second CPU, and booted the kernel using kexec.
The second CPU still comes up fine.  Which is not that unsurprising,
as rcar-sysc.c ignores domains with the PD_CPU flag...

> > For R-Car H1, there is a regression:
> >
> >     smp: Bringing up secondary CPUs ...
> >     CPU1: failed to boot: -19
> >     CPU2: failed to boot: -19
> >     CPU3: failed to boot: -19
> >     smp: Brought up 1 node, 1 CPU
> >     SMP: Total of 1 processors activated (500.00 BogoMIPS).
> >
> > CPU bringup/teardown in userspace using
> > /sys/devices/system/cpu/cpu*/online still works.
> > R-Car H1 was never converted to use "enable-method" in DT, and relies
> > on calling into the rcar-sysc driver directly (see [1]).  However,
> > that does not use any actual calls into the genpd core, so probably it
> > can be made to work by splitting rcar_sysc_pd_init() in two parts: an
> > early_initcall() that allocates all domain structures and populates the
> > internal hierarchy, and a postcore_initcall() that registers everything
> > with the genpd core.
>
> Yes, that seems like a viable option.

... so it's just R-Car H1 that needs some code to run early.

> Unless you prefer to have a stab at it, I intend to look into it and
> make the patch(es) part of a new version of the $subject series. Of
> course I am still relying on your help with testing/review.

Sure, I will do testing and review.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

