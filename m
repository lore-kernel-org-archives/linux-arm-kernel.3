Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC70FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uww07cUdp7duxGiMrR7iOp8DgfbxO1hObNoJqUTt4uE=; b=HE+QM7pOEkqnwb0HjLQuQWudgo
	WehiBqKgwx0bdOoIZ8yIvYYK0pW2DIqSbLFrcqP3g2D+ee6Tb1vRuKgOLh6yKVPuhBqDEQ0vNi8jS
	B8xVSWgwARNSTnsGTcImVyeA/wKRHC6x04KSKOrlH+cy4BDKc/jjNHYNoJTDyUnI4q2HDkORulXDJ
	/heeb1pL3cW0V/2emvM6ZKKjJzHCHh73gjK03CEDEqwxxKCkp1ylGwAiM7xJyaptt4HA890A+CB7v
	T0akDIqWHj8RcszHHedu02UZ/U0HUNnf8HYZq5VgxRCBsYfpb4HWwc/7lvPVe96wfFTyUhY9FcXUa
	kqlS4obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5AS-0000000CFHe-10mR;
	Wed, 15 Jan 2025 15:18:52 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY59A-0000000CF2V-0ZwN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:17:33 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5401e6efffcso7063582e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736954250; x=1737559050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uww07cUdp7duxGiMrR7iOp8DgfbxO1hObNoJqUTt4uE=;
        b=YiPdy3qaGB061fdlLpJouojEWoYH0hU/LyDKmL0UmO5hfjIYKnfRwsVcavgnO/+PI2
         s4/sahPk4KAT8ECbkyrmcUX3ltO1+Rfc5p2KiWzlGSQtwPqOIfvVaqjOXff6w6nY+vLQ
         Bm9dtlBnkkepjYT9exntCn7Nf3vpeJGHI63lKKFMQ6hG9fVxgcwTkYCdfJIg+8riRG7B
         kJ4Y6vEZdagzsn0cyaWUFFJBzYhfm2vtuldSZifVLzTawf4sdnmR6R+Icw0XY7scbXAP
         QDRD06WmxqtqEQoEMmeIGxvazuhLDnw1HKcnp/XgtgkDkaxtLBURi+JhmBmo5ClzXokn
         0NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954250; x=1737559050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uww07cUdp7duxGiMrR7iOp8DgfbxO1hObNoJqUTt4uE=;
        b=F6d5QP+UNOLqzIMlH5gcLEQhH1CPHgh8SAbT/DiWzn5ZWkpaM/x9BMurBFMC387dgc
         tujI9/KxR9mHuVqkBY5sC+SGdZz/AKajmJwWZQNuIvfff8hS+6+1CEowoa4tbYokMaCN
         J4DExV7SSrUOTFiZ4zOcoAWiC5yPW7F8WAFkRoYk0Y8AsL/Pk1fhkg86jV4B2iasarvJ
         AGFNDPFnQW8DHMH7skcNMyIwowibA19Bi8b/ybIxU18gj21S1JeyKWU9Ij2eZklpb4sb
         JdV6trBmuXv12R1/Fc0+xFd83jKkb/CAxanLD7mbIuKO4uAKVKFoVT/jxq0GaiDUff/+
         2Suw==
X-Forwarded-Encrypted: i=1; AJvYcCWZqKmIVJPpATwVxQg9cmQvwuzE3tMI1/FgT8EoSk335Df+lHZAgn98lZSrw2Bx8TMnCq7T/RwT+5ZBwX6qDx6g@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjs/inHzRoPZ8tslK7VhHmo5bKgGm5GhmrnztwMZJ0vdUr74V5
	alY74MjiV3HIN9pgkvW4p9jYPcv1ENtldIiuwoInsm39TcBaKrF4OoJBdmCS66rkkMYiPSplH79
	xUW3C0rGsr9EJFphSmk6vRQ1rAzGPxZLX
X-Gm-Gg: ASbGncsr11Jtux/DqamC0f6PXXObY29tCRaB4rABAXMj9OFqyrIpG1oHwz6rIhlVvbP
	RAHfd2XORZ0AUa+EWe4ofC2vYrNY5vo1M/li+lMtI
X-Google-Smtp-Source: AGHT+IHGJenQer00L8FQdCDyLhA9ljuwUu/NbZxKPmPHZwEXGy2YYYib0yUljfuUi7FMmKfhxtEzdPm1wl4o71fhPWE=
X-Received: by 2002:a05:6512:4029:b0:53e:2900:89b4 with SMTP id
 2adb3069b0e04-54284820222mr11108397e87.49.1736954249510; Wed, 15 Jan 2025
 07:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de> <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
 <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
In-Reply-To: <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 15 Jan 2025 17:16:53 +0200
X-Gm-Features: AbW1kvaECDnmeWgZSodqxxBJzlN_QPL7YCb8AhABJXAcNlpFGDGQ5vdnnE27s7o
Message-ID: <CAHp75VfZHZ7Xx1SnryBX683B=gm70SE_bvhivn+ecUePebQLdA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_071732_177503_06F97EA1 
X-CRM114-Status: GOOD (  39.80  )
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

On Wed, Jan 15, 2025 at 9:03=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:
> On 14.01.25 20:43, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 11:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >> On 14.01.25 10:46, Andy Shevchenko wrote:
> >>> On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengu=
tronix.de> wrote:
> >>>>
> >>>> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >>>> for more than 12 years.
> >>>>
> >>>> Reverting this to dynamically numbered will break existing setups in=
 the
> >>>> worst manner possible: The build will succeed, the kernel will not p=
rint
> >>>> warnings, but users will find their devices essentially toggling GPI=
Os
> >>>> at random with the potential of permanent damage. We thus want to ke=
ep
> >>>> the numbering as-is until the SysFS API is removed and script fail
> >>>> instead of toggling GPIOs dependent on probe order.
>
> Please read my cover letter / commit messages. I do nowhere object to dep=
recation
> and removal of the sysfs interface. But I strongly disagree that a necess=
ary step
> towards that is having Linux start toggling random GPIOs after an update =
on
> platforms that behaved consistently for >10 years.
>
> Can you explain why we can't remove the hardcoded base at the same time t=
hat
> sysfs support is removed for good?

Because (if follow your logic!) it won't ever happen until all the
platforms that are using the non-dynamic bases are being removed as
well.

Otherwise this situation isn't anyhow different to the broken platform
as you described.

> >>> While I understand the issue this tends to get never fixed until the
> >>> entire support of iMX boards will be dropped.
> >>
> >> i.MX is an actively developed and widely used platform. Why should sup=
port
> >> be dropped?
> >
> > Exactly, Which means "tend to get never fixed".
>
> Imagine ReiserFS deprecation strategy involved shipping an update that
> just corrupted your existing file system and developers insisted on calli=
ng
> it a fix, as ReiserFS is going to be removed anyway.

It's not the same. If you still want to compare, then it means that
what I suggest is to move from Reiser to say XFS.

> >>> Personally I do not like
> >>> this series at all. Rather let's try to go the hard way and understan=
d
> >>> what's going on to fix the current issues.
> >>
> >> /sys/class/gpio is deprecated and when it is finally removed, this ser=
ies can
> >> be reverted again. The alternatives are either do nothing and live wit=
h 6 kernel
> >> warnings cluttering every boot or show users the finger as described i=
n
> >> the cover letter.
> >>
> >> Do you see a different path forward?
> >
> > Yes, try to write your scripts based on the libgpiod or the tools
> > provided by the project. I.o.w. follow the warning that SYSFS will be
> > removed at some point and prepare yourself for that. If some kernel
> > work needs to be done, contribute.
>
> I have been using libgpiod for many years, but have in the past used sysf=
s
> or been involved with projects using sysfs. I agree that these projects
> need to switch to the GPIO character device and that they will be eventua=
lly
> broken. Yet, I still get warnings despite doing everything correctly IMO =
and no,
> I don't want to fix a warning by doing negligent stuff like jumble GPIO n=
umbers,
> with the reason that it's going to be broken for good in the future anywa=
y.
>
> To reiterate, my issue is with the manner of breakage:
>
>   - broken, because /sys/class/gpio doesn't exist: good
>   - broken, because script executes successfully, but toggles arbitrary p=
ins: bad

I understand that, but what the series is trying to do is to put on
hold _any_ sysfs removal activity along with reducing test coverage
and motivation to fix the certain platform to work with dynamic base.

So, prepare your scripts not to toggle arbitrary numbers then and use libgp=
iod.

P.S. I think this discussion goes nowhere. Talk to the GPIO
maintainers for the matter, I'm not preventing you to put on hold GPIO
development for _this_ platform, but I'm strongly against that because
of your platform others should also be on hold, hence my NAK for that
gpiolib patch.

--=20
With Best Regards,
Andy Shevchenko

