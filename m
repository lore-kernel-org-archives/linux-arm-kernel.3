Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0188FFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46aRrsk4VduolpeCWiXh/05qrmB1zXwaQdpRCjO047U=; b=y+HugE774SlE3FjYERfY/8Feze
	T/VqEPPHNByK4xF1c7liX5lGd9gONKLyHGtDWYYJKYqWCQy+PYBjmoeDixlpeqqeFlYWklCnxeBf8
	S97tzn5uNTFJFABttPehIfGGF9xcns6hjmdInnyih2frHc6dWN1ufWUJuRsZMOAIYK2KmRVhAF1av
	pNuiBM1FxLWGBeYNfcFT6IXmFBHLYsjKY3292k2PVP65Koh/TByZ+PDjwlK/O0ICV9EvHlG2PAetx
	eCRxcPUamYn2ke+3qXPN3AY04DLw8hEY0VaK4eQBeV09s1en3A1mvboO58t5btzla4YL5wgjJuFyX
	fjvs3vJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILbd-00000004qtS-1NGu;
	Thu, 30 Apr 2026 07:14:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILba-00000004qqV-2hWn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC13D43EB0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0B5C2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777533276;
	bh=46aRrsk4VduolpeCWiXh/05qrmB1zXwaQdpRCjO047U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tEIo/BHrXapOle3sS8SkioMxXFcPjsI2jQUnkUaRFuV841rylOLF+7v7Rlgbe3hXw
	 7wb5CKJ3P0M4t2kym8ziYAs3VugHPoOdno6fhIRL8XvboMwKWzwHlmzzBt/NfFMT+6
	 5vygZ/4IDbIhfhgSDLrMOI/LAizvxBhhzP0Bwa4Mr9/kayg1snjpvLLMibHtWxI8bs
	 T9BrDvoKjvAHvFUpD4tV094K/6QFQ/gYBBmWnJiFxMYCbbsM2WQ7CLprcSDWQQvqB4
	 vkf/QNpwec6Vzz7i6sLVgxySseS4p5uQn0RfkFY6bvFGBxVXL2VxiF/hn3Dr31nyHH
	 FZnDdpfispWcA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a4113ab355so590394e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 00:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+X+p8fkzI1KWK1HwoE8LGh4pyR+fF/kaFjUZRKgSrHSTJSCV2pUsYqzkoAheC1whooC015VzjgV1wXy4ygCr7H@lists.infradead.org
X-Gm-Message-State: AOJu0YzpdmbWV7HPy0j9KkkrNbHsCKGS0lpRQx28FBTWC4TeVr2ykT6e
	giPs2E3JsAtEaLEV91BKDJg998tsj3fWq0gG60QHodiAbX24bHJDlXkoyJ28qJfmhBxYIqZb2RN
	PopbTo1YKgc010pu+mAUG2FZlKIToIyNUvHByAIQVpQ==
X-Received: by 2002:a05:6512:10cb:b0:5a4:157:5354 with SMTP id
 2adb3069b0e04-5a8522bc5ffmr518494e87.12.1777533275377; Thu, 30 Apr 2026
 00:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com> <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
X-Gm-Features: AVHnY4IoDCsL1ZG3kMceO9b_l8khTfjG1SHVMNe95GwlVs-8ZP-WhxK6b8MdIgA
Message-ID: <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_001438_768643_9F05E595 
X-CRM114-Status: GOOD (  22.58  )
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

On Mon, Apr 27, 2026 at 1:01=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >
> > On Mon, Apr 27, 2026, at 12:14, Bartosz Golaszewski wrote:
> > > Convert GPIO controllers and their consumers on the PXA platform to u=
sing
> > > "attached" software nodes. Since everything happens in a bord-file, i=
t's
> > > quite straightforward. We technically now have a way of passing an
> > > unregistered software node to platform_device_register_full() but tha=
t
> > > requires using struct platform_device_info and since the existing
> > > platform devices are either referenced from other places or defined i=
n a
> > > different compilation unit, I wanted to reduce the impact of the chan=
ges
> > > I can't test and went with the older method.
> > >
> > > Signed-off-by: Bartosz Golaszewski
> > > <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> >
> > Hi Bartosz,
> >
> > These patches are individually all fine, but I was hoping to
> > finally get around to removing the pxa board files completely,
> > sorry it's been taking me so long to rebase my series for
> > that.
> >
>
> If that'll be queued for v7.2, then I'm fine with dropping this
> series. Otherwise, I'd like to see it applied as I want to get all the
> changes required to remove the software node name matching from
> GPIOLIB into v7.2 and then finally remove it in v7.3.
>

Hi Arnd!

Before I address Russell's comment in v2, can you please let me know
if pxa will be removed in v7.2?

Bart

