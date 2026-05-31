Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0A7CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kgt5nOofv85XgJ9weykvam9yTbMpDc91iTloiOIMZT4=; b=fXssqbgQIpgkVSnxQMJnuRIKx8
	IOY+iYN0/rwOF/EYufucwwqhpSjSH/pxlsFfawr7EzlFfV2Ck9vBvbPZhpDPcfAliiURN9pJbHGHw
	63wiYspf75snT24qmf70MNRc+A4S8DsYpucqqaDlSsMRp27HAoFhe1Wgr8oY/yWelK7gb4VItqQzS
	oi5GMk34tyS5QMTi1DOsuN2n14l+mBmuK50zZ4u9Rd19347c4gnXDEePzriA4OsKiLqLT5P0RguyT
	1yn9zHBwioc5FEjJ1WN/CLxXG2gNlqQncglNPzpgCJsDeaavKywp7RRVDpa3Kbt6dAt8B/8e3km2p
	giyzzj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdlh-00000009W4a-2FgK;
	Sun, 31 May 2026 10:51:45 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdle-00000009W46-2z6H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 10:51:44 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3967717c951so5460531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780224700; x=1780829500; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kgt5nOofv85XgJ9weykvam9yTbMpDc91iTloiOIMZT4=;
        b=ZHyPH1DcewhUFMgb6232XjdASw3TQb9XlU9D9Sawe/3veILJtJGluTpGm+cugddc+b
         wQmDoXiA/e89dw0wuasNFM18FHuxZfq8kYFX6IT7oV4Ca/P6QixYALn/Fd4WcK1KkK31
         4MYfI0XOlU7XEGxh8OS9fTYW7ENmzijIZX4G2fZgplBsvNZcI9Sb2I4v2klgtx33krTc
         E2vIcjJRqvCrMDR/ELybfIIfU1z9EkSfYqgPyvxxms1MrTA4zTEDEm/tr2HGhNQlL6uP
         jTTAVdeFnBmyK9tuQWAsDJGYc0k7HgANqB1ne7JkiJ3BpZ9QRLxBqHbErLoKjh2L9E4s
         4HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780224700; x=1780829500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgt5nOofv85XgJ9weykvam9yTbMpDc91iTloiOIMZT4=;
        b=oxQhUf+sJgpEhCSLqIarLbvp+EPuQngdjtL2xsVUhcqsNrj66P2aiiloLvzJEkWRaX
         0jCqf29XklLWcdocxLCR75xlbmlCM2QPcxdirkIuZiWDKhmRHpHX8YCVRyzL6DfialKZ
         qiMRhmMvNZqo7e/lXrcNAhxEY1joF/vHeEQs9VYq0+/dh57CoNGqp4RjPQceN33GaP+5
         yhtD1RYyqO/9c5rBho9rH/IPxTMrKrQjdfR24yx/hqgd5QGTDmkFPFLZvfHCKWQ1Cmkz
         xg4ERzI5/Tdu7OZf9XDN9Cf4K9Y5VzoYMWnqru96WnGEHNfj6w4kwX1jEj5k3eaxEclS
         CYAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2d8GHLS0NZwE944Jh2SSJjEm0fIEavGJ2FpATd+qs4g7jetlHfFOxfPxynnDKbvdOZd6jvfCacnP2j148G9VD@lists.infradead.org
X-Gm-Message-State: AOJu0YxMNQaTN6u76dh1mRXy3zFZEfpXOS4sbR9eTHuteFlRfSBOU7vU
	bHYQbkYv1ML8sL9bw0UvU2lhZ901/hE+G6EY0pAPRd5UPLfAi0XbKB0N
X-Gm-Gg: Acq92OG+FbUQegcxFR8rpkP/etlAhcXg0PHBMiTZyFXhX8wrJJtqyg877bM0PIxUREn
	3ysHMEbEaK3htkSwtqMWoBHoE4/3x1Ip2zdk77vGHR3nYncQprVcdRUFv0rammKxMkByOMnCT7o
	fLTUo5w/WGAgJ7Q95ON8Z6a9sXKpWs0NezBPVSRDNpyxFJN/yE6UjIJmfKoDGmJTR0s9UH367uM
	L7NkGooxYM1MLdWcOGkqFJvyVJQC1BLHWufeHYZlNZwB7xIg4OV5v5vuV3ReltTwVZcalil7kHv
	0FSqpiD80BD1DzwYoPLf8d9T7BJdTgEb+ovznIQEcVK/Oej4PpSFhgQVJkZBuib9ohs6pyHehcr
	fo7Xd3QpDTvRc+G17rX4Korfry1mdEyHek19o0y4lQ8QzFXX0i/BypdpXFilLkp58uwkYMWkYxt
	0ypyQ/0dDylFJuKw9vDkXIMsRGTNVMMJISxB+k6Etq9WRf0EQsfkARU8mRLv3yBrXqd1b3XCE=
X-Received: by 2002:a05:6512:110b:b0:5aa:5279:142e with SMTP id 2adb3069b0e04-5aa60a4e72dmr1623402e87.40.1780224700124;
        Sun, 31 May 2026 03:51:40 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa62f7f539sm936578e87.4.2026.05.31.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:51:38 -0700 (PDT)
Date: Sun, 31 May 2026 12:51:35 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 5/5] docs: i2c: i2c-topology: add section about bus
 speed
Message-ID: <ahwSt2wYHp-cjWK5@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-5-5292b0608243@gmail.com>
 <ahX4_WaqodYt3PmD@shikoro>
 <776cefab-fa6c-4092-8b95-236a3eaac729@lysator.liu.se>
 <ahqrEe_m4K4T7LaC@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ahqrEe_m4K4T7LaC@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_035142_824394_D8575326 
X-CRM114-Status: GOOD (  38.39  )
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

Hi all!

On Sat, May 30, 2026 at 11:17:05AM +0200, Wolfram Sang wrote:
>=20
> > What makes the topology bad is D2. Without that device, it should
> > be OK. So, the question is which is more important?
> > 1. protect ignorant system designers from creating a topology
> >    that includes problematic devices like D2
> > 2. allow multi-level mux-locked muxes with variable bus-speed at all
>=20
> My take is: as a generic operating system, we should try hard to
> maintain a reliable system. If a device gets stalled and blocks the bus
> because of a too high frequency, this is really bad.
>=20
> Now, if this is a flaw of the HW design, we can only do so much but not
> more. If the HW design is OK, we should not introduce risks. This is why
> I want to disable this feature for MUX_IDLE_AS_IS. It cannot work in
> this setup, but the bus itself is likely designed OK and would work at
> the lowest speed.
>=20
> > Checking the rules at run-time feels complicated to me, as devices
> > may come and go. Also, naming people "ignorant" over a mistake such
> > as the above in 1 is perhaps not all that fair. But, it feels sad
> > to disallow things that in fact do work.
>=20
> Like I said, as a generic OS, we should play safe. If someone wants to
> implement a more risky version, it can be built on top of what we have.
> This is agreeing to "I want this and I know I am on my own now".
> Obviously, it reduces maintenance burden a lot.
>=20
> > > ... unlike here. We have MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT defin=
ed
> > > already. And I'd think we should only allow bus speed switching for
> > > MUX_IDLE_DISCONNECT to avoid out-of-spec scenarios. Opinions?
> >=20
> > It is probably not unwise to disallow MUX_IDLE_AS_IS in this context,
> > at least until someone actually needs it. Which does not seem all that
> > likely?
>=20
> Exactly.

I agree as well.

>=20
> > However, it seems like it should be fairly OK to allow a predefined
> > idle channel, as long as that channel is not lowering the bus speed
> > compared to the parent. But maybe supporting that can also wait for
> > an actual user?
>=20
> I agree as well. I hope that Marcus' use-case is MUX_IDLE_DISCONNECT.

My use-case is MUX_IDLE_DISCONNECT :-)

>=20
> > > > +Supported controllers
> > > > +-----------------------
> > > > +
> > > > +Not all I2C controllers support setting the bus speed dynamically.
> > > > +At the time of writing, the following controllers have support:
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > > +i2c-davinci                    Supports dynamic bus speed
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >=20
> > > This paragaph is easy to get outdated. We can document that only
> > > controller drivers with the callback function implemented will work.
> > > People then can find out if that applies for their driver...
> >=20
> > There are other such hard-to-maintain lists elsewhere in the text.
> > Not saying that this makes neither those nor this list a good idea,
> > but it is an explanation for adding one more.
>=20
> You mean the list if a driver uses parent-locked or mux-locked. What
> about putting that information into the driver? The core could enforce
> that it is set to a meaningful value and not left uninitialized?

I would prefer to have this information in the driver.
But I must also say that I found the list in the documentation useful
when I started to work on this.

But it is hard to maintain and not optimal indeed.


>=20
> Happy hacking everyone,
>=20
>    Wolfram
>=20

Best regards,
Marcus Folkesson

