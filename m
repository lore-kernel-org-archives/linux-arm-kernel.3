Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D0ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=; b=iDuXWpdCQzwDV6wnaTBbOysv0K
	FDEiDpapf1yfEi615N63LY5uL0tq/YatlRwDSyK8J3OyaVSEggfxMGYg2qkYrSJEvpqAc7x1JRf7N
	9qtifjurhB9vl3jNCQat3gYAjMcHUtJy5fJfKlzt0eel4cF/+guXiftPTREV8/Htxfl+ja0aqAOSv
	ERN6qaFot+YwgakUqIP10hnM3nzLQLOYu1rqv8KioXT6iyMZsc9VVfkm/KPehDMIny0e9nXXsHC0R
	jXxdE60bYe6BhFf6EfT2tgDRfDEMLbxdVm0jBq1CT2VUSv6rv4I142UF8z3Z1cl7heTALh7qDgKwy
	6Li9isuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1h5E-000000071IF-2Fbh;
	Thu, 25 Sep 2025 08:12:08 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1h5C-000000071Gx-0A7Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:12:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57f1b88354eso688754e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758787924; x=1759392724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
        b=HVqP53g0nHvGRq5+GmDfNvJu5xhZOEQwCzdyKsF6+9aQ//ie++SMEPMQpaN//uJNI1
         bBDz5PEOVg+KxjBItgnZztFKkvow9/atveK5ZqIWco8V1U8yLIutuVyL2gmdi0FAZbqK
         X2A6Se+HyPpDnqvktbZ1UHGEWqtUr4lSluGtIcgYrte6hesDvEwH4xacfmw7NYUS59xV
         YuNbcLSF/bw4B5tiYQHkhZeM169c/7oS/z5h+Wqm6f4oJXV2xYDVEV6de+NLkODvvcXx
         fvCM/9ZKUHt0rVcuB4MXD58JqrT1FU+18JR7FpNfQkM/zDszzxNpylKyY7ulzJlMHx9k
         +E5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787924; x=1759392724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
        b=cWPKRwItW9+Fqz4+xBO6rZQW0j9IPPu6wSZrJqWOpWU6Y2IoECMZ74UZ3Mh989Ff7b
         6ZcuEJ41qBsmg+uxziFWhsR6wmdwUzNL3VeWyUqIKPPBf6+C8uelg+aR+dtb/5gncbQl
         FivqyV1KGJq1LF7Bk9VpTmW9dxbQNaE9RnA3gvY0pYOT41CV1UHCaIPQMM33FZuqEskD
         1mUp2it7WyvyYmSi+9zNRRmIROj2GzuAypL1+1PJ+8QMHI+BZSXCsqibE40Al3GWUNkg
         tGa6FpJUMF29uubGXFRJlJiTaellyQIcYIpBBj/EWyKV3X6iGLnwVdrav60CmWuZrArG
         2D5g==
X-Forwarded-Encrypted: i=1; AJvYcCUAAt2JXP72UIOjVQzO4EsJamtN/1zu9X2iycu6P+ypImVQnC6u4lu/5MqIRx/WIJTWIo6OZSkpseisHC4Cq8MQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzK7eK20DeEW2p/SzP0mIHMCBpYOxeJ23bxkCXqzvVb5f7cPynw
	cylHU+pTMje191Bs2Cj8D/ozJhIAuVl1YJwW6YGcYmzENGdS/6fisuMNjORXL2GHdPzGA/PyVUP
	GLfG2uvrsNPxKgxd7W38NyRb5ArXll9rZJIJp7FpGLw==
X-Gm-Gg: ASbGncs2jf5Hc0NO3YCfMYVrzE5mYIRggkWhx5qbuDgmuR0WHgoL2yofW7/+juns9F5
	s7NgNHrQNWgr/qe+LqQO4PhpWjy8zI1wC7rsLxEMF9IUMTtmfIEH2pIAU1QXihinKHWFgYEMrRn
	LkSIk3QjtzORVUyihUv/CHiD40hk/e6wQEFEUHYsPhUS2vh0hhMfOq5CGXyejZCjagRPvK5MeB7
	2xIul89QxowufcCD9dBTtvqhKQP7+kjqlmxxQ==
X-Google-Smtp-Source: AGHT+IGJf55i3bv2L8+gmNkmzkA9WiH37A1+UEGPjEgNIhsONYzUjkvXwduJeRWAHBQx5JD4yW8UWOq3aNBoELENYBs=
X-Received: by 2002:a05:6512:114a:b0:57e:6aef:3ffc with SMTP id
 2adb3069b0e04-582d073fab8mr832508e87.4.1758787923677; Thu, 25 Sep 2025
 01:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
In-Reply-To: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 10:11:52 +0200
X-Gm-Features: AS18NWBR36rLL1CtueiFc1sMJzM_SH_VKHScbJyKloWTmjZnMKzJiRko6sa-obs
Message-ID: <CAMRc=MeR3iH7cH4aLuN5T+y5FCFyzpR3BBc4chE7CPAy8Ug2gQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20250925_011206_095938_2942CF9F 
X-CRM114-Status: GOOD (  24.54  )
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

On Thu, Sep 25, 2025 at 10:03=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The (typeof(foo)) construct is unusual in the kernel, use a more ty=
pical
> > > > syntax by explicitly spelling out the type.
> > >
> > > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl=
:
> > > use more common syntax for compound literals") in pinctrl/for-next
> > >
> > > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part=
4-v1-13-9f723dc3524a@linaro.org/
>
> This is the origin link to the patch (by you) that started the discussion=
.
>
> > >
> > > Looks like you (slightly) missed your target. The correct link is:
> > >
> > >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> This is the link to the comment (by Andy) that questioned the construct.
>
> > >
> > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> I know ;-)
>
> Given the "Suggested-by: Andy", shouldn't the link point to the email
> with the actual suggestion?
>

Ah, I didn't realize this is what you meant. I wanted to point to the
entire discussion and also this is already in Linus' tree so it's up
to him if he wants to change it.

Bartosz

