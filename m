Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ztfMn1VNdd3sBgxsbvmNyvjhCCtBTgEPkzz2bCSzMw=; b=crOAu/dtf3JQ44
	IMy0VQ3AaMryqQjfX/qbS/kYFodw2XBGyxaCYU3BK40oNS3pSRfEJuv7Xh92bCc7HVYd+FNZHD2Ju
	fMAkbUHKV0e/lHQZIs13G5yW/o8jS0ZtM0GJf7va/shfYrVJGGkzDbXELkk3s9BdXeuJYMR07uG81
	XcliXbrl643zenlv8lfVhzryS2bo4ifnPKRmVhJUHN901lvCaLCvbYttFyH92JZPU5xI1y2mt66aP
	vXf5ONScJ78/fBQzzB5thNbO8kWjqCPWQ5+SSaiXG+1N2npR56tYEX5ZNKQoWRWJmiEitatr6SBZK
	TtWDcO3bCSl7DgbuStAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KBg-00000005Vwr-0lJA;
	Mon, 28 Apr 2025 08:50:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jzt-00000005U2F-0rrt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 08:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=1ztfMn1VNdd3sBgxsbvmNyvjhCCtBTgEPkzz2bCSzMw=; b=PQ9rP/IPjEbHjljCgzIKeG/JHH
	RkfksLmP9wXJsjVu4ytaFAFD7ZfqhrdHh//fz+xmWSNJX0CSwfdZkS8paAPcRQwDwfmgpg67mHdLs
	qPD5s3V32ZTZNLUqWmMq7FKno2MzU/yl0pwkW/2V7POFzvHvEr+zx0F/SwqBJdVtc56WJeds3W8IZ
	iG5vbRWJJCJaDmhSJLaXTxCKhNby92gMorZvHaGI8RPaiyQQcQQTGm6+IdESRZAyXQ/KIW+Met1uK
	FDUjdXikjfnxtaF+t4fqx9jHT6o9dUufKzIjZEYXo13vRA0uPM/pLslwIU1VnTnkwWw3oLKQq2JuB
	AOC8CJrg==;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Jzp-0000000CbYX-0lQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:37:51 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5661524e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 01:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745829465; x=1746434265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ztfMn1VNdd3sBgxsbvmNyvjhCCtBTgEPkzz2bCSzMw=;
        b=X8VP3m20LcHUPF1hkHmKB8YUDWh0+TsE1Go0wZ2uV5MyUbULBsd8TL8pdseBKXGZ5e
         w8hssFUa2H1ryEAjyHWGr9gnzVsBLq22y4MPLsRR9EyPLjo+aCNcev4G3Dnrk0R7epaB
         ZJwQxSW7umRDkxi2EDXUrWhKl+bmGoDJnc/4r2hSBN3wjZRkKmMPIriUKp32GeVruJCd
         2cIGCF9n6NRFnkUh6LhSbZSn2I66m2dsa+u9zMOAWSS1H2prjvhNfbGmNr8MJiJ7Dqtp
         Ht8iUHdBr4eMWFy3vvEz8sxrsWZfHH55qm5x4RzswmxOW7sCgk6++BsvQ5kq6/cQD9TN
         IX5g==
X-Forwarded-Encrypted: i=1; AJvYcCVn8Px4r6eIYpNKh+G4z68Vx2dbCqk5oD3m56M7CXmomQl7zISIDqvFbXK98sUQooXWIF+kaGx5rlVgjANIv6UX@lists.infradead.org
X-Gm-Message-State: AOJu0YwhYkQGY+lQUp0GIu1qkW3e4XN3kZ/XiCfuyY6nqnheZ5g40duW
	ryfJmoMXO9gakbrr7BJW3VIMzh9h74CPXYKDIVck/zueXoBhYPYdFCsi5ZIP
X-Gm-Gg: ASbGnctANBI9PzD2fE6XO0D8VLRbl2iN4Z53rdL0vOpk835GR4nskM+NM+yzJ/Tz09l
	NyuE5Ip9zAdlejc4qxaDDRnY6X3/IkifuGmL0d2lsPa6lxXgbe/fsZ6Nndc3/D5oxjxLPCstwfH
	TLOPvNvVh1MVd1JjGsNq+y7eLhQ51cVkr7E3KRCAE3TUedQ9NnhNpwNaz1Y3Va6y4akEAY8MlG7
	e+xIJ+rYz5G18bnYD+KoOsGXQHOuYwAW4/V4Z6esu9dwhL9k6CJr5ubKSI/oYN2VqOtEeoRF0BA
	6C803KzxvySGIPqWLzbQLJLxXow0hka9DBDqbkzuAOcPm3XBqKHbnDRvsKTTO5k82WoMZ3zhhg=
	=
X-Google-Smtp-Source: AGHT+IGxDTXqNjd7Kqcab0chpnofTnWbdHwgZq8PD8rDvunrqElGJJ33s/N9HmpAtlk8x/29cIntaQ==
X-Received: by 2002:a05:6512:400b:b0:54e:8194:9a72 with SMTP id 2adb3069b0e04-54e8cbd8793mr3435395e87.28.1745829465236;
        Mon, 28 Apr 2025 01:37:45 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26242sm1612111e87.21.2025.04.28.01.37.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:37:44 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bf1d48843so39334451fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 01:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMTBkS3tz0MZeIoEJPwZlLA2i03pCPPuaKBxTAP1bGVLhiP14x/y/kQsyepZJaHAdcCHa1e/e2Q76VhHo0o2KQ@lists.infradead.org
X-Received: by 2002:a2e:bc22:0:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-31907611d07mr36339461fa.30.1745829463977; Mon, 28 Apr 2025
 01:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
 <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com> <aA8tsao6hhW50k4e@probook>
In-Reply-To: <aA8tsao6hhW50k4e@probook>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Apr 2025 16:37:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
X-Gm-Features: ATxdqUGWc3W8r_9HVJ8EOFRWh1ggm3Yd1EhRVjGqxp6FjjlbklMvKQE6GcEe8I0
Message-ID: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_093749_385607_80FFD90A 
X-CRM114-Status: GOOD (  31.91  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 28, 2025 at 3:26=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net=
> wrote:
>
> On Sun, Apr 27, 2025 at 01:28:58PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 18, 2025 at 7:32=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > >
> > > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> > >
> > > Line out playback and microphone capture work, after enabling the
> > > corresponding ALSA controls. Tested with the Orange Pi Zero interface
> > > board, which is a (mostly) passive adapter from the 13-pin header to
> > > standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> > > microphone).
> > >
> > >   https://orangepi.com/index.php?route=3Dproduct/product&product_id=
=3D871
> >
> > What about the USB ports?
>
> Good point, I could test these. I have not mentioned them because they
> are not related to audio.
>
> > In any case, we don't enable peripherals on "headers" by default. That'=
s
> > up to the end user. The description for the whole adapter board could b=
e
> > an overlay that users can then apply directly.
>
> For features such as pinmuxed UARTs (already present and disabled in the
> dts), I fully agree, because they could as well be used as GPIO, and
> that's for the user to decide.
>
> For the audio pins, there's nothing else one can do with them, as far as
> I understand it. It is possible to use at the least the Line Out pins
> with very minimal setup, e.g. just connecting the pins to headphones or
> something else.

Sure, but you are also adding the routing information, which could be
different if someone designs a different adapter board. One could
include GPIOs and I2C from the 26-pin header, and make a headset
adapter (mic on the TRRS instead of tv-out) with a headphone amp
and headset detection IC.

It's easily overridable, and I suppose providing the basic use-case
that one can directly use via the pins does have value. Instead of
doing a lot of editing, the user can just toggle the status via
the bootloader.

> I'll clarify the following points in a comment in the next version:
>
>  - The audio signals are exposed on the 1x13 header described in
>    https://linux-sunxi.org/Xunlong_Orange_Pi_Zero
>
>  - The pins can't be used for anything else according to section
>    3.1. Pin Characteristics of the Allwinner H3 Datasheet.
>
> Although I would prefer to enable the audio pins by default (because
> they are present on the Orange Pi Zero board), I would also be ok with
> adding them as status =3D "disabled", as is the case with uart1 and uart2=
.
> Please let me know your opinion.

I think it's better to have them disabled by default. We don't want to
confuse users that don't have the adapter board, who might end up looking
at their audio mixer and wondering where the line out is.

If they have the adapter, or they are explicitly using wires to hook up
things, then they can toggle the status. If they have something else,
then they load whatever overlay that matches their hardware.


Thanks
ChenYu

> I will test the USB ports and write a devicetree overlay at
> arch/arm/boot/dts/allwinner/orangepi-zero-interface-board.dtso
>
>
> Best regards,
> J. Neusch=C3=A4fer
>

