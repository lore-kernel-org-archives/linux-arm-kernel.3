Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766E6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=; b=eNurafcwK2sujdpgV4agy1e4jN
	Wk2fth58uNDh8WvZTjyfyt3cf4b/gm/zCXA3iycKgu5JC8Ah1IYwjHWEVyLwFVNLQ8k35+pHTvEUi
	a2Vbriuihr08OZKx8pBtcEzaOcY+GdeW5i7eI/31xO2MtEJv4Wd7vkfzymOdI5fuwBCPOx20a9p0s
	ARKZkdFFlsuE5r7fkLN4B2biEDxir/imL/NqkaYRXrK/W/SiwZ/qwIcn78Vcknii6S1OHnegPlbBn
	us+NQH7Ah4llTHuRN2s6GLbJ+I/h9RQk9Hd+QH1SXVnER47YI5TZdc6KjpKUEryguA/K8n5vf3fRU
	ynoAz9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4gI-00000009Z9S-0CVC;
	Wed, 02 Jul 2025 21:07:50 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4dZ-00000009Ynm-36cs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:05:03 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e81f311a86fso5743460276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751490300; x=1752095100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
        b=ZZOumU1tVvmtC08lS/8rEZNNikESP0xwqjdYhoFV6DSJlitUw0NPCUTbK2TF+NtxiN
         Nti2AShmYaaEHAiBWhWNHzF5B3+xcjgOLcZf7R5v1ge5mVvkO9vR+8o0csvLtG1lG+2s
         WPtdQUQgM5FtZq6sOZgyBW7wQ6PYKEhc9GAxLkmSuUdyskApyvDmRCWAxH2g9dLBWwrz
         zidHXKgQwNAmvEp/sURSZOlAFKZVigY1tyOPlH8UWSzL9jxBeBoFvVnUK3rTPGvfgGzI
         Kqv+1uq64GImrVjzSVSxvAWdF2NRItEfGXFbrSawMOwBWupzYVPgHqg6DbItTauaOMqZ
         EQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751490300; x=1752095100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
        b=xLfrJZTN62ijcEUeB6FXc+X+TVteG4XtiipDH3RCPrnE5+m9CUTZ2aNi9DmamgVhvI
         umk3/MNVgi65vZEDezGe7j6GKuZ0iqKB+fCgTc5f6FyrkV/o3jWEdTwFaRr9RoU/j4UJ
         29H46KC4yINhFvMgisGPdOsLAfviJR4EdH/3fFaOvFxM5sD6sRjafyeYmZa4en8j0hpN
         +fC5OEMQ29PQ7c3VR+B0pKBpEalQJUGy/vURWawRjSzTn7Yow8zfYiRKPUo5xsCa9gC0
         2peSVmQmGBwMKf020ILQl0Xza8OMNLashH//QnajeAvpZS+vBNXDzA6IDnBlzLMgpc55
         2fZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQZrmZAEpqWR5iUXHhTM015LexuMFjriQCumrOVv7WoRaoMP4I+g/jsoBLEupMx22BTyWPo+dtkdggjdNjeftl@lists.infradead.org
X-Gm-Message-State: AOJu0YweQAN+QInVeW1Mxt1DL1TOovgiZusUbcfMNKkhJDDc/VSqkmN9
	94ujEzZqsVwanIDBEgjHaaOHTcw0pdM5ye9mcwqWYuEAzKIQxyjpWAKAqXF3uJbZQGXR1KsdNKp
	qX6lImS66lSpaGTWgN6bbonj0p/FiVdrP8/wBEZnS
X-Gm-Gg: ASbGncttuC6evQBr64Dp6dQtSH9yoUTap3quEVcshyYe/trPHrDzaSo4J1v0w/nboJJ
	tQRUdRbDlfqsQjTEvK+7JrNX0z8vEWkqanPiYw1jhlZowRdD2l7JWn5JrQ5PJCcD79+OVqFBL+K
	OYemEexF371au/DyW7aRTlLYhMj4moE5Lllgv561GniV+PTRlotcO3w/8fXZz4Y0gov2Y2rWpAF
	nr0
X-Google-Smtp-Source: AGHT+IEiQuh5LjlsCcA7qaI9oQhIPWCsjEyB7JTNTj6XFbJ9WVg7qPtMe5Tz7PrvBDjuqNqnia9yn5ArtcfzXOoCqd8=
X-Received: by 2002:a05:690c:6ac2:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-7164d4db0b0mr64094247b3.22.1751490300545; Wed, 02 Jul 2025
 14:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
 <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com> <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
In-Reply-To: <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 17:04:49 -0400
X-Gm-Features: Ac12FXz2eBEQpE1uXBge_BXeozibSAfNnKLrTRR6ZVdJLMP7Abjjpj73aBSCXy4
Message-ID: <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>, 
	Anand Moon <linux.amoon@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_140501_933114_2D0C604C 
X-CRM114-Status: GOOD (  28.08  )
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

On Wed, Jul 2, 2025 at 4:57=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Wed, Jul 2, 2025 at 9:07=E2=80=AFPM Da Xue <da@libre.computer> wrote:
> >
> > On Wed, Jul 2, 2025 at 2:40=E2=80=AFPM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> wro=
te:
> > > >
> > > > On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > > > ...
> > > > > If, as the description suggest, the regulator framework somehow i=
gnore
> > > > > the timing set in DT, maybe this is what needs to be checked ?
> > > >
> > > > The regulator framework only cares about timing for regulator on.
> > > > Regulator off just turns off the regulator and returns without dela=
y.
> > > There's an exception to this: gpio-regulators without an enable-gpios
> > > property. My understanding is that regulator_disable() is a no-op in
> > > that case (meson_mmc_set_ios() even has a comment above the
> > > switch/case statement), see [0].
> > >
> > > > The code makes incorrect assumptions. Then the kernel resets the bo=
ard
> > > > without having enough time.
> > > Can you please name the board you're testing? I'm worried that I'll b=
e
> > > looking at one .dts but you're looking at another one.
> >
> > https://github.com/libre-computer-project/libretech-linux/blob/master/a=
rch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi#L481
> >
> > vcc_card is a gpio regulator that gets toggled on->off->on.
> Thanks, that clears things up as I was indeed looking at a gpio
> regulator while this is a fixed regulator!
>
> > I traced the regulator framework a few weeks ago and forgot the final
> > regulator disable function call, but that call basically returned
> > immediately while the regulator-enable function complement had delays
> > implemented.
> Yep, for fixed regulators there's an "off-on-delay-us" device-tree
> property (which translates to "off_on_delay" in the code).
> Its implementation is smart enough to not waste time by adding delays
> at runtime by implementing: on -> off + remember time -> wait
> remaining time + on (meaning: if there was enough time between off and
> the second on there's no additional wait) [0]. On system shutdown it
> will not add any delay unfortunately (where Linux loses control over
> time-keeping), meaning we can end up with too little waiting time.

Yes, this is evident on quite a few Amlogic boards but occurred rarely
enough that it can be overlooked but never-the-less should be
addressed.

On our SM1 board, this occurs more often than not. With this patch, we
can reboot the loop indefinitely.

>
> Also my understanding is that it's not something that can be fixed in
> u-boot or TF-A. This is because bootrom already has trouble reading
> the next stage from an SD card (which is a valid boot media).

Correct, not fixable in TF-A or u-boot.

>
>
> [0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/core.=
c#L2754

