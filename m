Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD58F013EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25fOIUrIoXmeuY0trituB/t7MXs2xjvvs4qtHYmm8Q8=; b=BANiqW+Oe1WdbjixuQ4Q5TkUgb
	/i6eHO2pVxg3sHIGFnHpNVcRpMBW2OsmUvnfqzHuC+UIxs/Xe3LiXnydQVL/mffq18Yb6lARhFNuY
	MWlQJIl7KNQlOy3FLfpRi/v+Te7h3MkmsASwHXjbUeNs6ANCHNaVW+xQS3dV+v5wx9F2liAYljNtl
	I6+kNjN+byTNZna2JmnNE7OhtqWHbahryK6ZKf1R6MzZneMd0Zgch0YNec/VzqdYR5tppFwtUJZO8
	kH5Z63FPzy9HiiitDBQrFw0A05JlYUeEjFJIq4VjBpcWjtJi29AjN+NF9oVwgyoAYr2f4NxkOvvwU
	VeTyxFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23lv-00000003aQv-1lwA;
	Mon, 16 Mar 2026 08:57:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23lt-00000003aPs-2P5R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B07E0600AE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EA7C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651476;
	bh=25fOIUrIoXmeuY0trituB/t7MXs2xjvvs4qtHYmm8Q8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CZRZ5aK9O8Euws0I71JOtlw9V5QdUQ/KSKx2woDuPfSUn0hrYRZCgs2KifbOAHUKD
	 ZOB4MStNStwseL0wzJMm6JeC1i2/09lyvqpgOM4vlUhZL8VMym4FlDLzcxr6EkHbmk
	 mNZw20j768Yb+NaNkpfaZWHLp4UjAL5aaesSCiOkO7jJZwfi/Oq82mJ/ww2Ze+pBqX
	 NApiKf+JjPCSDxxLtASL2zua6AAc9mMBcHcHzGjy6l6KE5jyD23/igVz5AmvGtTaMd
	 T3ceFnlvdxi4dvIjnLiSUMg2TDcepGoDC/hIvMnt0JmHlQkHBtHMpBQ6TTSQSTzgVL
	 5k55L/OBzBtwA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso4476276e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX13iGC6WME46ELelEUmEQYWBdQb3FK+ugj5aRmEhyKs8Uk8N6L8zDBjnpklaE9XVQCMv63D7Rp4SDtaE9GlGVi@lists.infradead.org
X-Gm-Message-State: AOJu0YzKkZIQD1hZFrYoKUpbzaPe9gU6o6bN9+uMZKj7ZdQ5h6YDm6Bi
	3e8R7IREoPKvj0VHF1LQK8V7j+A86OI3lGadnpWcmgdOzX18I4LndFnQTW7ePiRVuFT32rluC3p
	NrKWSS809cry/MP/PLbv0bhtfgdfo27gpl/B4hu20iQ==
X-Received: by 2002:a05:6512:3b8d:b0:5a1:ea0:afa8 with SMTP id
 2adb3069b0e04-5a162b193a7mr4253516e87.40.1773651474988; Mon, 16 Mar 2026
 01:57:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:57:53 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:57:53 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260315014205.471d6834@ryzen.lan>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me> <20260315014205.471d6834@ryzen.lan>
Date: Mon, 16 Mar 2026 04:57:53 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
X-Gm-Features: AaiRm51skQCXiAFRV40QqU-S5mBuX2dP16oar2NgBwKuTW_Y3PVl-jEHJ0Tjq4I
Message-ID: <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
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

On Sun, 15 Mar 2026 01:42:05 +0100, Andre Przywara
<andre.przywara@arm.com> said:
> On Sat, 14 Mar 2026 13:14:25 +0800
> Icenowy Zheng <uwu@icenowy.me> wrote:
>
>> =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywar=
a=E5=86=99=E9=81=93=EF=BC=9A
>> > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
>> > register frame. So far we were instantiating one GPIO chip per
>> > pinctrl
>> > device, which covers multiple banks of up to 32 GPIO pins per bank.
>> > The
>> > GPIO numbers were set to match the absolute pin numbers, even across
>> > the
>> > typically two instances of the pinctrl device.
>> >
>> > Convert the GPIO part of the sunxi pinctrl over to use the
>> > gpio_generic
>> > framework. This alone allows to remove some sunxi specific code,
>> > which
>> > is replaced with the existing generic code. This will become even
>> > more
>> > useful with the upcoming A733 support, which adds set and clear
>> > registers for the output.
>> > As a side effect this also changes the GPIO device and number
>> > allocation: Each bank is now represented by its own gpio_chip, with
>> > only
>> > as many pins as there are actually implemented. The numbering is left
>> > up
>>
>> Ah, is this a userspace API break?
>
> Was that ever a guaranteed user space API? Or just something
> that everyone relied on because it was always the same (until it
> wasn't)? Similar to /dev/mmcblk0 being the SD card?
> And ignoring the ill-fated old-style sysfs interface for now, how does
> this work with libgpiod? Would it still use the absolute pin numbers?
>
> I mean looking at that warning about the forced GPIO numbering we
> get, using base =3D -1 seems to be the recommended way?
>

My view is this: for libgpiod, there are no absolute GPIO numbers and the
ordering of GPIO chip character devices is not guaranteed.

For sysfs: userspace may rightfully expect the global numbering to stay the
same. I don't like it but this is the kernel policy.

Here however, there's another thing: the fact that a single GPIO chips is n=
ow
split into several. I don't mind it but if someone complains, it would have
to be reverted.

Bartosz

