Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ED6FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjUe+40tU8KgywhMGb5EBcnInYwRid7F76KcJIk5PoY=; b=MmetWWKaKBbAU0YzFCk2xOYEbs
	rS5eHwLdmTrDhLOU3BfX5uBcOxQfpj3nAlbCX2qvBvJc2f3MdMvQLzZMO6xZyoQEJRIItyfYWqx5b
	YfPEtg/nO2xhMfuS+zYSVYv9iqz5Y+KRxnNxs83STFF7ahFeJwhpe9AxSPQlNFfQIxHo6VzORX5iV
	cJiuysTiS+xzd6DikOxMnreOI//ChAOBss6y2wTN6ce778W3Vj6861aKD95fvvnWmVpM2UPd6H+w6
	lL9a/tCwB80a/KQTp3zA1caxcAktmRSLsBpZTrGOXXkM2ZF6LCEtuxGTpEUfKWCXnn72rDQS5Ak8Q
	KkqoZskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJH6-0000000GhUM-0aNV;
	Mon, 27 Apr 2026 10:33:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJH3-0000000GhTa-04yK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C92B444556
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58DBC2BCF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285987;
	bh=sZdY/36jbKK4QMgRBN3Be3QYPzzEjzIo9WdGSHUOuZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y0XBdBb6tsh/ct062e3s+3bE94qJ7F0kHpyLoBxLkCN+lfEar/pvjFUd/RKMGyheD
	 vFw6NYZCVZwYZgk2dntGAr3q/a3O4D0X1ZYamoL6uv/3fjk/449FT/AZ4mFdKBAVLA
	 nGpH723lrtieknWZbvSUM0wyrqUxqC7B5BO4Eir4/errEGTlMlSvRE07ngkuYcdcu1
	 NYe3pbVngxZA9cdwKycU7w4eBTBiawdIh5bWStdkIBtrAFuawAifW2OnY2/x0T+BE2
	 B4XTykxZYm0/rAc5TkD16t7UbtyWEasojnVV55gbxpyzfDyCQMxRq5C/E4ORal1Sv2
	 3CEvHOLViU28A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so8606306e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+yeucoD2lcSvtCMTcVm8oX21M5vGmYSC8j/E4rvgBpyyXgD4u69Hi70yrrp/maz2jX7k9KXvHxwl+Csle4MzJB@lists.infradead.org
X-Gm-Message-State: AOJu0YyUvnxB11Fr1kICH9B/g6zwclLCaUS0iMPkQ71V3ZUpgqdP9ly2
	4vSS8lgMg4bq/d/UIHU3v/1blwrlYpbtu6sRxxzVUmWZcG/DgWR7sKPU4OHJjkKcQl46DbMbPSc
	20RatBUjB1QwW31Ru4wgyWNdNl/GGm2U+QcvukdxhhA==
X-Received: by 2002:a05:6512:3b91:b0:5a3:f2ed:87cd with SMTP id
 2adb3069b0e04-5a4172d0085mr15446256e87.10.1777285986242; Mon, 27 Apr 2026
 03:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
 <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev> <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
In-Reply-To: <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 12:32:52 +0200
X-Gmail-Original-Message-ID: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
X-Gm-Features: AVHnY4IwzDLYhHPbIaUAVZBlf2N-kg8RzncpCvZK6axdzsTP8InukubITrev7X0
Message-ID: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Linus Walleij <linusw@kernel.org>
Cc: Frank Wunderlich <frank.wunderlich@linux.dev>, Frank Wunderlich <frank-w@public-files.de>, 
	bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_033309_096460_9CB8D597 
X-CRM114-Status: GOOD (  17.65  )
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

On Sun, Apr 19, 2026 at 11:25=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Mon, Apr 13, 2026 at 6:59=E2=80=AFPM Frank Wunderlich
> <frank.wunderlich@linux.dev> wrote:
> > Am 13. April 2026 um 10:01 schrieb "Linus Walleij" <linusw@kernel.org m=
ailto:linusw@kernel.org?to=3D%22Linus%20Walleij%22%20%3Clinusw%40kernel.org=
%3E >:
> > >
> > > On Fri, Apr 10, 2026 at 11:24 AM Frank Wunderlich
> > > <frank-w@public-files.de> wrote:
> > >
> > > >
> > > > Gesendet: Freitag, 10. April 2026 um 09:09
> > > >  Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > > >  An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@k=
ernel.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthi=
as.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@=
collabora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > > >  CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org=
, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bart=
osz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > > >  Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::ge=
t_direction()
> > > >
> > > >  If the gpio_chip::get_direction() callback is not implemented by t=
he GPIO
> > > >  controller driver, GPIOLIB emits a warning.
> > > >
> > > >  Implement get_direction() for the GPIO part of pinctrl-moore.
> > > >
> > > >  Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > > >  Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_c=
hip::get_direction()")
> > > >  Reported-by: Frank Wunderlich <linux@fw-web.de>
> > > >
> > > >  please use the email i used for SoB in my linked patch (closes lin=
k below), the other email i use only for sending patches due to mail provid=
er limitation.
> > > >
> > > I can't fix this up because the closes link isn't working right now.
> > > Is it the same
> > > as the one this mail came from frank-w@public-files.de?
> >
> > yes, closes-link works for me
>
> Fixed up and applied. Will be going in as fix for v7.1.
>
> Yours,
> Linus Walleij
>

Hi Linus!

It seems this one got lost somewhere along the way? I don't see it in
mainline nor next.

Bart

