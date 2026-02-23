Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47141E98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvtD0OvtEl5ebfqFAgzr0sxC9a0vVwyJ14n7eKCn/9M=; b=McIIAjUVNlnAwv
	fQVueKzp5cJAzAYnLxoMQXurvD2lUOUcyaGkDxm+1p3yU9FU1AwArLVETg3B/ICYOk7Hi+hiJUsZg
	h3OXiqIKKtNg96+B7s2WB8O2XebDlU2xyXT7RSC5iH/R/av43yc9U9/69IrryiPt7d9iYR47v7QIK
	wg06ACv1b3c95819WpwOkx/ftJNNG3PqXsuXtOi401ZqFivAKmvK9xaNJhGD0rJfG5NECcjjc5B2O
	VhohhoPU3HgtN6AkkylhQILFfp2FIycg4WGvnu62H8OBpfmgp8SWzWK+1/RsuAKvMNCw03Y066afX
	qv7ogvpWPJEoNlm2TXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSEI-0000000HXI4-0Elw;
	Mon, 23 Feb 2026 09:27:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSEG-0000000HXHw-3da6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E707060097
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C43EC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771838867;
	bh=OyGFTWWAQRbhcAjRDP0+Rd6GLfLhNM1/YURdgrzC1b8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Mzv8+vRt5AgwSaXc0SQkB8ORQyVsexu03SzZnhyd0LnhlPuCAo/hWG6cTh1oD6LaA
	 HeyYMJmg4v4g1Iez+LUfoAZLcaWmdBPJ0tuWWt0jqzfeqFJntQay9NVzrDbJvwChE7
	 QBNFKloYi7SW02qj3fWX8HSZJHn8A/axkn8eGisoaQ/vAHvkp8kmvAXE+4Gkrv5nwY
	 xXhVnd1RWiLg+5FUx404w+bo/Ewr8PEm4rr/hvDISzSdEQLKdHxzf6KyZ5AIqftWg4
	 Ytaaw2moiUoqTdVcMqx9GMk5bzfR5q7/Ts7ISqCMD40OBfPUycfQo7m9+gQmJoBCAi
	 64d3Ua0vmChQg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-388126f79bcso34500451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:27:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYosRicwu6VPP3RH8nlVvFwv9hALf9oyqpO52EL4/oVm2NmEnHJ3fj+/4bBq/u8C9Hxp4p+eIkFMpXJ0t/4RzB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/+sJegB1dOKzKz74HjRcnlMBh1hDvyQdd06zneLP4lADw0IVK
	MoinvtJznWioa3qxJLbndR95yWHbQhUIbORGMByyyuSADcvoODtV9q7rFZCgIBsJf8TF7MgetW2
	b6Kfsatj0vODGyY0XEEbCiCewvWF1XQY=
X-Received: by 2002:a2e:a99e:0:b0:386:1ce2:11a6 with SMTP id
 38308e7fff4ca-389a5de767amr21982451fa.24.1771838865947; Mon, 23 Feb 2026
 01:27:45 -0800 (PST)
MIME-Version: 1.0
References: <ZnzulZBukibZUXKM@google.com> <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
 <aY1GZQJLKAF0fsz6@google.com> <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
 <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com> <de212734-0b59-144c-7ec9-91d1b3443148@gmx.de>
In-Reply-To: <de212734-0b59-144c-7ec9-91d1b3443148@gmx.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Feb 2026 17:27:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66a=joEGmwyoEZ6_FJQFdGqSLoVzg9DLn5=c-VpK5AJig@mail.gmail.com>
X-Gm-Features: AaiRm533zyjmIVjIQdEPqa5bOiZeeQphW8VIiO6gupdt7m4aGch75EKhJ5fdiuA
Message-ID: <CAGb2v66a=joEGmwyoEZ6_FJQFdGqSLoVzg9DLn5=c-VpK5AJig@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
To: Marc Dietrich <marvin24@gmx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Feb 15, 2026 at 4:40=E2=80=AFAM Marc Dietrich <marvin24@gmx.de> wro=
te:
>
> Hallo Chen-Yu,
>
> On Sat, 14 Feb 2026, Chen-Yu Tsai wrote:
>
> > On Sat, Feb 14, 2026 at 10:27=E2=80=AFPM Marc Dietrich <marvin24@gmx.de=
> wrote:
> >>
> >> Hi Dimitry,
> >>
> >> On Wed, 11 Feb 2026, Dmitry Torokhov wrote:
> >>
> >>> Hi Thierry,
> >>>
> >>> On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
> >>>> From: Thierry Reding <treding@nvidia.com>
> >>>>
> >>>>
> >>>> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> >>>>> Complete conversion of the WiFi rfkill device to use device
> >>>>> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instea=
d of
> >>>>> a lookup table.
> >>>>>
> >>>>>
> >>>>
> >>>> Applied, thanks!
> >>>>
> >>>> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for Wi=
Fi rfkill
> >>>>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880
> >>>
> >>> Do you know by any chance why paz00 does not simply configure rfkill
> >>> switch via device tree? The driver (rfkill-gpio) seem to support devi=
ce
> >>> tree...
> >>
> >> last time I tried this was rejected because the wifi chip is on the us=
b
> >> bus and "rfkill" should be a sub-function of this chip [1], but that w=
as
> >> some time ago...
> >>
> >> Looking hard the schematics, the wifi chip does not have a gpio input =
as
> >> first thought. Rather it seems that the first gpio toggles a regulator
> >> which supplies the wifi module (m2 card) with power and the second gpi=
o is
> >> just connected to the wifi LED.
> >>
> >> Not sure how to transfer this into dt, but I guess this would be the
> >> better solution.
> >
> > Then the first GPIO should probably just be described as a fixed regula=
tor
> > feeding the USB controller that the M.2 module is connected to.
>
> I think that is what rfkill-gpio is for, so the proposal of
> Dimitry looks fine, execpt for the reset-gpio, aka LED which is
> already included in the dt (but maybe with the wrong gpio).

I did that some years ago and was rejected. It was for SDIO, not USB
though.

Note that if the wireless driver also registers an rfkill device, you
would end up with two rfkill devices in the system, and with slightly
different behavior.

One would just disable the radio portion of the WiFi device, while the
other would cause the WiFi device to disappear.


ChenYu

> I will give it a try on real HW and report back.
>
> Thanks!
>
> Marc

