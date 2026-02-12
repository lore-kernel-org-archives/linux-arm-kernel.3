Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54B5EB4910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh8EvkxbSGrnTWC/VbjKWDGUhTc4iJr3Q0U9QcNO9zE=; b=KKfrrG3J/2NLVIZ4N9qLJ2gpVm
	OY5tOejHQ4Re/qPWLY72YJo7ZiG7nafGFh4uV6nWLcy9pG0QEey9IzyKziWOak1jHrwJYx8T5t6R9
	D9AZHh7endUxdbI2rTdogJfEJSfMR1+IzlJXYWOvIpjPXzjCNRCBKweVtEP2AJ+Hv9nGSvTtGs0/2
	wh/s8QWC3BbvKjUEchGq7H/0qCinwiRmDkupgXqcZ+sBRgj6gF47hySB6xVY/8VpZ5d2xtccuWLSa
	522ZtQRPRCbB/whNypSGeA65bfGM2sKo7L1I+JLWce9+/RPNQW5penY0Kw6JZCvrewPtlt/mxcx/e
	TsMbx4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV45-000000020o8-0JAN;
	Thu, 12 Feb 2026 11:40:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV44-000000020o0-0zDG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 500E860018
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057E2C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896455;
	bh=cR0ZtIgPDyATIxSFGdaV+xz08Ci/kVnvO0ZEE6vgbao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKzFnfac63N7IG/adifXiKpS9V4EL5jHB5s9q/PFCbmVLeLH0qm7ILehYV3NwTwL8
	 EIpPf3vYk6i5jeTdNOktfPjph/gw6K2rsfBFBnqcSwXd1VPPpua/Bmc4lqZSKgfRcU
	 9ReNdK8Gecu4e6e2QNCXzoKbhW6fLXIKbCLlhz6LBv1N+J+dcaCZezUi11Ooct2J8w
	 o+LuTahFdOP+WRcSKTf+y6UP/mxCpvUk0I3rHTTWM6kSvQL5FCat+PVZtESFxMRaPu
	 nDiCTgMF23JSFJZOETZy/HxoLnM07GKD1Oq1MLEH645Wa9whd13ZUHOO4+W/UQTrgN
	 lg58yZjQR731Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3870902760cso12738481fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 03:40:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhlhan8Hp9tMtGKLSXkAQE9RJTguinnq1G/PWThZ/4IiSXHzdtoKCjnMGet18OqoBZfdVeNrjZT7fMnf1ejLgU@lists.infradead.org
X-Gm-Message-State: AOJu0YwRpigYdHytiqxr75hJHLRplcB3Qy1V/34rXQ2uI7bq6Z3+oLfI
	p0fz0s4KEXwriGOIw94NDtp6/4eodkc1RCNN9pSPGmiXQQBK3Jw8pNaCc52X5TE19Raw/Kz/btS
	4opytXyVo9qopgL2heB2PJY1/JJSTX1pCgaMN0OQUMA==
X-Received: by 2002:a2e:8a95:0:b0:383:1d66:c1fa with SMTP id
 38308e7fff4ca-38710f142dbmr8770101fa.10.1770896453688; Thu, 12 Feb 2026
 03:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com> <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
In-Reply-To: <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 12 Feb 2026 12:40:41 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeWgo3b8DTG3w8U2bxR6ejd2UmFVGASvRe7_tJkK2f4ug@mail.gmail.com>
X-Gm-Features: AZwV_Qgc-yqBkaOF0yHyRhNZKzkVUTOEMiYSQPwa0VrLdPcUMMJ-QQP2mbVSAbo
Message-ID: <CAMRc=MeWgo3b8DTG3w8U2bxR6ejd2UmFVGASvRe7_tJkK2f4ug@mail.gmail.com>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 11, 2026 at 5:32=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> On Wed, Feb 11, 2026, at 14:13, Bartosz Golaszewski wrote:
> > Currently the board file for Nokia 770 creates dummy software nodes not
> > attached in any way to the actual GPIO controller devices and uses the
> > fact that GPIOLIB matching swnode's name to the GPIO chip's label durin=
g
> > software node lookup. This behavior is wrong and we want to remove it.
> > To that end, we need to first convert all existing users to creating
> > actual fwnode links.
> >
> > Create real software nodes for GPIO controllers on OMAP16xx and
> > reference them from the software nodes in the nokia board file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> I don't see mistakes here, and I don't want to throw a wrench in
> this patch, but I wonder if there is a way to take this one step further:
>
> > @@ -244,6 +263,14 @@ static int __init omap16xx_gpio_init(void)
> >               iounmap(base);
> >
> >               platform_device_register(omap16xx_gpio_dev[i]);
> > +
> > +             ret =3D device_add_software_node(&omap16xx_gpio_dev[i]->d=
ev,
> > +                                            omap16xx_gpio_swnodes[i]);
> > +
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "Failed to add software node.=
\n");
> > +                     return ret;
> > +             }
>
> I was planning to go through the remaining 'static struct platform_device=
'
> definitions in arch/arm/ after the planned board file removal and
> try to convert these to 'platform_device_info' or similar, using
> platform_device_register_full(). Since that function already contains
> code to dynamically allocate the software_node, I had hoped that
> a lot of this would just go away.
>
> However, I see that your patch creates pointers to those software_node
> instances, so  think that would become a bit harder, but I have not
> actually tried it.
>
> Do you know if there is a good way to do this without using static
> platform devices?
>

Add a pointer to const struct software_node to platform_device_info
and then use this if it's set and there's no fwnode? It's in line with
what MFD does with its cells.

In any case, I'd prefer to not overcomplicate this patch, let's do it
separately?

Bart

