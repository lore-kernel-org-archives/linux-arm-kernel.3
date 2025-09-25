Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CC8CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=; b=jt4mfscffFkFODMnZTCaEcfgAF
	6m5c3vj/oUfRCw4RCjUXYqf04pMVylfGAUKa/E9QSQay4+kO742cNdQ8iW+FVSDyx70+Ug4I/5hyW
	OIAL6xFJLrRuOouJFm/63yAktUQr3cjwlXw7QR03rXXNPy5wZ5mlN8VdRSqKdl67fehJVKbo21j/6
	Py30oAPpaMKKxt8Ip3gNPYgiVzgFgg9XT+lGv98nFgcQGOZt6zChXRlhXJANmy2ShF5F6N5MaaHcT
	JgxxMKkvhlIqvu+VRg63lcgm2vnf7Svt05e6jVmj63c0ONLUblX09U2NfCuK2r9iyPdzd9Xp7GhkS
	vID+x//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1h1F-00000006zaC-3yon;
	Thu, 25 Sep 2025 08:08:01 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1h1D-00000006zYL-1gmP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:08:00 +0000
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78104c8cbb4so355442b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787678; x=1759392478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=;
        b=XS6QDTXn4TY1WPnl98kXhRAQTVdsEAKDBz94AbKar8Xt6flOnKFvhyi/yse26Y3Ipo
         xDc2Dchycu3Ghi7rld3gZ50HzmcOtUhfJJwI7Hw8Z/CPFUiLVIGmnPw5Y9DB74lRRRxs
         JTmBl3IoydGPTjqTM4N/+q1XS71yrf7hFG/z2Kl07uxiZHmQS6OzXkSTNKbQLRjkeOsh
         KBSfSWNWfZZSsSISipwcJSVaL7COcKM0+PIYrvUdhLWtr+0xFvRsogf3elriu/tGUMkb
         F6lDIvjr4iDQZn9gnK17SS9OOGIKgYmZ1pRFhHDwDUHHV+FsaZM75yu2qczQc5Fx98vm
         mYLg==
X-Forwarded-Encrypted: i=1; AJvYcCWu3V5MfRCcK++Y30bQHj1kBk8wAyc6PNCylAJqvGyIHXhBBBa9tjNjYXBxhPN5qwU1MWqtvk34rrqizsGh0Pg5@lists.infradead.org
X-Gm-Message-State: AOJu0YwbDu7MGf13CtLwdw3CNx1s5s702O7vTeCOxCKBMwHUj0jczHB3
	CB9N0uS55wMhsmq5JA1mu7LhzucK9bEWVCANYExiuBHfpoGqAk7bSMwhE1iUdour
X-Gm-Gg: ASbGncvMd6Br6RBGGniZ6Sy3CId2IfWdLzzhFjeMowiEQe0tovLKZ7VHUKll5vmbHTS
	4ZsVoloBykBr5Y5EIjH/7TmykIHpM61OkPp/5OiBFaqw6CtrNpEiZ8HGZIl5ldfSQEiKaKtdP/q
	DtrS4WtLXwZpvVulVICuaf0wcNvtejDlWRPW+euQJ8AOGn4jroV9eSazk7SgoYBOPVSOOs0PpzL
	PG4JAGcbMoGdSO3hsPdpuh8yglwn9veWWJ7I4UZ1iOS2OwFc9/DTTGbsHD0Kf6s6PFFWhU3em+s
	vJ1B+gR7nmfkRzqJWnLdD40VPcfxA6MfgGZw5xll3TcrVqsPaWj/tow/7SpGZF82L7mvDV1L0d3
	Q4MU+9pJJfCUCRUSD+mh0p9M4FujY8mvTUjRk7V83G5om66QGq92gIhuvadfxn47j
X-Google-Smtp-Source: AGHT+IHs77vy5sWpBHt4bZ2kQXLCUbXZGCTTbl32npFiCFtL4TzB9i0Rr+MYqrToQJK1iDMPpEmmew==
X-Received: by 2002:a05:6a00:4b14:b0:77f:169d:7f62 with SMTP id d2e1a72fcca58-780fce34191mr3190924b3a.14.1758787678307;
        Thu, 25 Sep 2025 01:07:58 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca1esm1236539b3a.11.2025.09.25.01.07.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:07:58 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f1f29a551so945184b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:07:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwiVGLZci2YANRLrK+ynxvE3ocgCEnGj7/2M/hqLAjEH7Rwp4ShJ/a0WNiOJxDO38cejb/iFzME+VFNy0z6iSj@lists.infradead.org
X-Received: by 2002:a05:6122:90f:b0:542:2912:664f with SMTP id
 71dfb90a1353d-54bea2f2d56mr980779e0c.10.1758787332548; Thu, 25 Sep 2025
 01:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com> <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 10:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
X-Gm-Features: AS18NWCyYwXSHgwWU9cjWnhwFzyaiaKh315kbRG5kwTsoewxQN_WDT2npG3qPmE
Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_010759_462030_7DCD1950 
X-CRM114-Status: GOOD (  26.95  )
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

Hi Bartosz,

On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The (typeof(foo)) construct is unusual in the kernel, use a more typi=
cal
> > > syntax by explicitly spelling out the type.
> >
> > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> > use more common syntax for compound literals") in pinctrl/for-next
> >
> > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-=
v1-13-9f723dc3524a@linaro.org/

This is the origin link to the patch (by you) that started the discussion.

> >
> > Looks like you (slightly) missed your target. The correct link is:
> >
> >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

This is the link to the comment (by Andy) that questioned the construct.

> >
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

I know ;-)

Given the "Suggested-by: Andy", shouldn't the link point to the email
with the actual suggestion?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

