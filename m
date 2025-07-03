Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D784C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pefmerJdn8/jbn5cGxudCHFA3qaC/GYL41dyFZHwfn8=; b=1lnBtjr+z8PBy8Rnyevzyxw4qa
	fSqHnw3dnXlMjbnEoYA9Yas79jOdX8YR6qGvYU6h5O/3dJpZNDuLzTv0ZM7cFqfMwZTaAWcHQpSAo
	gqdTH0JSbhnf3mAPFk+2mLiL7wZQylAHeXiAs4e+LohI3tTH1brIFXAjAuj28oOhtDIqMyJB7WEd+
	Jtc2zFcCyX0SIgoQDVbT35M2Nw0uepTlfA1/h45BB1SjI3M5dTIdHkRMhyh7RayAOgYAranbe6RYS
	d4y24xRr0/fIqQR1n3nHqu1VzsIQ0Lzo3qpW31QVXaJBmJCdcU76srp+kCjrQet2pXr9Vn+IcTugz
	ZvSZiXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJmD-0000000BSJl-0kxe;
	Thu, 03 Jul 2025 13:14:57 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIbK-0000000BF8s-3ax1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:59:40 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70e302191a3so78663537b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751543978; x=1752148778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pefmerJdn8/jbn5cGxudCHFA3qaC/GYL41dyFZHwfn8=;
        b=ul8mCo+2Ow9anvTBA4YL+P1zp1zvbDsPqPG806djlPXqSodF1bCYqkiPCe5s5gvNi2
         cjA7wXJNu04rMQlctatcIRRQ3WMxnKAFKx+edV8VMbTvvojnYNCCXucc9gl5YTTgLURo
         Pw5rjgfVDo/sJw9AevoLoDQ8PsA8V9dInOzZymseOpfmHpQEEF3rE4fj6hZ0Bhfs3gLj
         yuI0R+hO6iF9s8ckAVpd8u7jiCzcU6Udiru5+Phfq0TyYMP/n9sfAKe30vSY5U5ZYyvK
         YuW5j3Z0k9HM8BUqGTZzi6MaMv5RNiSy8f8T7+PtElaVkZcwrSogf7vB7kvqraVrBmwZ
         Sn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543978; x=1752148778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pefmerJdn8/jbn5cGxudCHFA3qaC/GYL41dyFZHwfn8=;
        b=lxajR8Icl7Ngpq0l6ftm178uPjQSngTRKeJJ7DLlMYsbi81RU8mTz6fudJRQFZHga+
         lpwiXyDTJN+NQIV66wbyuFvq83ztWe5R0pja0iKwz8uvW5hWR+WqTB61522mnhvSDMiI
         1LWY/j/HkavdigLUrnezj/ZKcQTC6RQswE0eTTjruXmZVDZ6ziVMvGicYbZtAFOdioL/
         ASneQbvDGwUbcEFZ58hnD1fnVzgdIy+nVBrvpnNs6BhtXu5/Q5SasTy+o6qFc7NbMyyr
         HEcrINzWoLmIF6xm0Y8uQxmUmib1zvQCWvnBVJ4DrkbWbn5Rfz5S5Eck+MiI6ICMkw9K
         Unsw==
X-Forwarded-Encrypted: i=1; AJvYcCVtgUorUJyfKaf8XpAgsKSkzKRJlreGkOCukZScHECBKH/0MIgotlQpsRGMc8pL1vXFIm7iJ1GJ6WrwW3St1FOC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmz19d0BDoO8mV3X8TS5F01qMPKU0TQwVRDvwpQhNBr8+YsqF1
	kGX47EBGbT61XCE4+JpUdgJvBFfPdyAfRj0RVfcEYUfVj0OVGDaz/AngJtMDskaF2vOGf/On3Aq
	XBUXnEGbfPQw2SB3v1dTN4PGDUC1yeTcEpikOMLM8Cg==
X-Gm-Gg: ASbGnctBn3IVnsXjMBTTEuGfNnf8rZ04HplN63vXBrDPz/qCnppuESUMSbqiXp88Ihw
	2zYsWqh/TzSDTQ/nC6n/kpIs4ixdjbCLb4tk5UlJPN3m7/OhjZdHdtlPcOEyjI3Z2CvY8ewna44
	EzZP6bK7IbEuLsJudxekNT4tDVIdfj8cLwlL+cfDKk7DKV
X-Google-Smtp-Source: AGHT+IE4ABxmPlTweefnMNsTpO2kCyQ9vfeRptaKcZLVagFwBqIk7hKHDQ6xwciT22sGwc042fPZVZE0KvPkjt/nFfA=
X-Received: by 2002:a05:690c:ec7:b0:70e:779:7e84 with SMTP id
 00721157ae682-7165a3d82bcmr36904677b3.27.1751543977760; Thu, 03 Jul 2025
 04:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
 <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
 <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com> <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
In-Reply-To: <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 13:59:02 +0200
X-Gm-Features: Ac12FXxCb6oqZOa8O1MizlWOqoPM1IT9eH5G_i8Ay4xusdukzHzWPjGOuUZDyNo
Message-ID: <CAPDyKFo_1KHLw0_OE2ppJnA1TKmmd4EKjMKcSqOdGo91bMgMTw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_045938_919207_01527074 
X-CRM114-Status: GOOD (  32.05  )
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

On Wed, 2 Jul 2025 at 23:05, Da Xue <da@libre.computer> wrote:
>
> On Wed, Jul 2, 2025 at 4:57=E2=80=AFPM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > On Wed, Jul 2, 2025 at 9:07=E2=80=AFPM Da Xue <da@libre.computer> wrote=
:
> > >
> > > On Wed, Jul 2, 2025 at 2:40=E2=80=AFPM Martin Blumenstingl
> > > <martin.blumenstingl@googlemail.com> wrote:
> > > >
> > > > On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> w=
rote:
> > > > >
> > > > > On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@bay=
libre.com> wrote:
> > > > > ...
> > > > > > If, as the description suggest, the regulator framework somehow=
 ignore
> > > > > > the timing set in DT, maybe this is what needs to be checked ?
> > > > >
> > > > > The regulator framework only cares about timing for regulator on.
> > > > > Regulator off just turns off the regulator and returns without de=
lay.
> > > > There's an exception to this: gpio-regulators without an enable-gpi=
os
> > > > property. My understanding is that regulator_disable() is a no-op i=
n
> > > > that case (meson_mmc_set_ios() even has a comment above the
> > > > switch/case statement), see [0].
> > > >
> > > > > The code makes incorrect assumptions. Then the kernel resets the =
board
> > > > > without having enough time.
> > > > Can you please name the board you're testing? I'm worried that I'll=
 be
> > > > looking at one .dts but you're looking at another one.
> > >
> > > https://github.com/libre-computer-project/libretech-linux/blob/master=
/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi#L481
> > >
> > > vcc_card is a gpio regulator that gets toggled on->off->on.
> > Thanks, that clears things up as I was indeed looking at a gpio
> > regulator while this is a fixed regulator!
> >
> > > I traced the regulator framework a few weeks ago and forgot the final
> > > regulator disable function call, but that call basically returned
> > > immediately while the regulator-enable function complement had delays
> > > implemented.
> > Yep, for fixed regulators there's an "off-on-delay-us" device-tree
> > property (which translates to "off_on_delay" in the code).
> > Its implementation is smart enough to not waste time by adding delays
> > at runtime by implementing: on -> off + remember time -> wait
> > remaining time + on (meaning: if there was enough time between off and
> > the second on there's no additional wait) [0]. On system shutdown it
> > will not add any delay unfortunately (where Linux loses control over
> > time-keeping), meaning we can end up with too little waiting time.
>
> Yes, this is evident on quite a few Amlogic boards but occurred rarely
> enough that it can be overlooked but never-the-less should be
> addressed.
>
> On our SM1 board, this occurs more often than not. With this patch, we
> can reboot the loop indefinitely.

Even if this patch fixes the problem, it doesn't really seem like the
correct solution to me.

Would you mind trying to extend the regulator subsystem to deal with
this instead? Feel free to keep me in the loop if you post something
there.

>
> >
> > Also my understanding is that it's not something that can be fixed in
> > u-boot or TF-A. This is because bootrom already has trouble reading
> > the next stage from an SD card (which is a valid boot media).
>
> Correct, not fixable in TF-A or u-boot.
>
> >
> >
> > [0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/cor=
e.c#L2754

Kind regards
Uffe

