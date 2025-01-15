Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5AAC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=; b=dQglYQhgy6GGx6RX4c1Sz3RwO7
	uGYNYb0YO1pmtfyqHZICvX/rp7TFVABDtQ9i5PpMe+SqCpCwOPhc5zF2zi3CKVKyF/x/nu1u8TEIa
	V7lbnEY1i6x71bkAYr34od71kMVnLuWU+ohJG6cdPxjJx1BU8LFFYtbNMJZekVzDJ+2evKKdx5Kgd
	pjcE+ZfJ8Y95X9qo8xuqobCrYT2A8T7WqWkxTMVTIcaJj8xHdOlly6yZFiQdJ8d50nCQ5tdW1bu2H
	uRUd3pZMLXCOC4KpOCVYXrUzeADeIe6bz0ZksTIOaozzvOnUF1sMrfwP2eM0POmsY35kxZzi9dzIP
	F5MXX/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY36a-0000000Bvhj-2uRA;
	Wed, 15 Jan 2025 13:06:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY34d-0000000BvOZ-3FYi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:04:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2167141dfa1so15136175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736946282; x=1737551082; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=;
        b=PiqmiUnXuE+ozbpew/OM9l7JArMPLglu5utxz2lBsYOoWzKRGrGBLBejgaO9Lg1sNb
         sfdsclirWSHAjYFxrHaETnd92UbYXTRgqkA0FU4VeTaanxYy977Z07LK48GBIE4zzJkD
         sS7UV2YTfUgieHCklE4yrfu8pDfpntMLOn0OD0jgZgUyusxyIzig+wlFoimagClQX53m
         RWAmk7JsyXTVziFPEutsqM4OU2EtsV1kjW2l1egJccZHJUiDyIUGWdUA9UI6q7ftNWxv
         DT6VvwJFoktRcSQXCGkf2bQib1rZeGJBc6AwErI5n8lE7/XqvekCCrg/TcTSMRviN8XJ
         aFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946282; x=1737551082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=;
        b=w1GE7vtSaQ8UBz13Y0u1+DR2ULfMJ26AI+wscebyljRxUDuKFPT1rJ7SYFv9hYPSkN
         nRZp6R4sFH2NgHYEZFcu0v22i7mCLuYGhV1iF+iuNXlXTYCRS3P6IiWsGnqBMOAejpV1
         b5ZbDjonOStP2OryCgafRXmHJvYENXWW5AG96ZNJgPoH98wYNc8BFOSf+QXSAE52LnJw
         SXnVAK2C5cU9cntbenscHtZ3TzdleGF9/kQuXkHI8JawpZ17cKchRRqH/q4DHPNlrLBh
         EQ2H1I3cDsegwj9bCkRc2zEbDNf1/a/vyKDlxbqqR/bGlFTEiIzd4RyBn8uexdy+zznf
         Uf/g==
X-Forwarded-Encrypted: i=1; AJvYcCXAsRedWk/qUToIqVZjiD24YJZ6uuLWavHZVvCbC3AcK5Np1zhDb4r+EWKk5SuHv2RqaQ14LTV2vZeG68Fd6GDQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FocClZHWpYF/fqHviR6BSefLI0siTZ0icWejLzdJyRYf6XD1
	5+7/UL3db9x59/oW7y4qiK9y1bQlAS5GrfTLpWTcaFYGe03RbOWv
X-Gm-Gg: ASbGncuytjRIOplHEdNeggI91HeLyCEkZQggKqs1IigIayKTcUMVToDCuZCc84aiiLz
	GQFph1MKHcWjdKdSz/a2K3MBPYUT8N4s3Nz0Y/Be2cCuQeMZdJGUOwEDBZS0GR74+y0FbLT7/oR
	8oxsVpR3o6qkpkxRUVoOkcaq3Dg0SgZJMN2sWg1EU7fWNg2+2Mrcqml5RVlUAtXUNEpVKTlRO/j
	2He5G9cc1E/l9vrd9abvQzXW1TBr8eLatG7HKGzzJHgsnRRzqAmAjcscqPAcBtu8t+fE+C2DDdj
X-Google-Smtp-Source: AGHT+IGP1MoK+TswjCTX6n6RwzyNOH2KSgOcYC27N3Q9DsQ1b+VWnKsHu/ZOWjDg/b36Z9NPcODScg==
X-Received: by 2002:a17:902:f605:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21bf0b76a43mr47212525ad.5.1736946282107;
        Wed, 15 Jan 2025 05:04:42 -0800 (PST)
Received: from rigel (60-240-216-120.tpgi.com.au. [60.240.216.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f1386efsm81502525ad.75.2025.01.15.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:04:41 -0800 (PST)
Date: Wed, 15 Jan 2025 21:04:32 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with
 static GPIO base
Message-ID: <20250115130432.GA159787@rigel>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
 <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
 <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
 <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_050443_812074_4B1E7182 
X-CRM114-Status: GOOD (  25.02  )
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

On Wed, Jan 15, 2025 at 08:07:38AM +0100, Ahmad Fatoum wrote:
> On 14.01.25 20:38, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:06 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> On 14.01.25 10:49, Andy Shevchenko wrote:
> >>> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>>
> >>>> Some drivers have had deterministic GPIO numbering for most of
> >>>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> >>>> ("gpio/mxc: specify gpio base for device tree probe"), more than
> >>>> 12 years ago.
> >>>>
> >>>> Reverting this to dynamically numbered will break existing setups in
> >>>> the worst manner possible: The build will succeed, the kernel will not
> >>>> print warnings, but users will find their devices essentially toggling
> >>>> GPIOs at random with the potential of permanent damage.
> >>>>
> >>>> As these concerns won't go away until the sysfs interface is removed,
> >>>> let's add a new struct gpio_chip::legacy_static_base member that can be
> >>>> used by existing drivers that have been grandfathered in to suppress
> >>>> the warning currently being printed:
> >>>>
> >>>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >>>>   use dynamic allocation.
> >>>
> >>> Warning is harmless and still a good reminder for the stuff that needs
> >>> more love.
> >>> NAK.
> >>
> >> A warning is a call-to-action and it's counterproductive to keep tricking
> >> people into removing the static base and breaking other users' scripts.
> >
> > Are you prepared to say the same when the entire GPIO SYSFS will be
> > removed? Because that's exactly what I referred to in the reply to the
> > cover letter as an impediment to move forward.
>
> No. But this gives me an idea: We could make the warning dependent
> on CONFIG_GPIO_SYSFS and add a comment to the i.MX code suggesting
> users do that instead. What do you think?
>

AIUI, the purpose of the warning is to remind driver authors, not end users,
to update their drivers, as the old behaviour is deprecated. That is
independent of GPIO SYSFS - that just happens to be something that makes the
change visible to userspace.

Rather than making the warning conditional, how about making the fix for the
warning in your driver, so switching to dynamic allocation, conditional on
CONFIG_GPIO_SYSFS not being set?
That would provide a path forward for users that want to dispense with
the warning - as long as they dispense with GPIO SYSFS.

Cheers,
Kent.

