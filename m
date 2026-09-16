Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733BCC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3prVhhjxauBWG8qfoe+eEDvbRKE6KXSyVNyWaZNvTE=; b=ZnE02ZoHKjTBUloRnqoVEmL6yn
	Vsa1wQE8u5ELaSSotNTCMyBCjszr3EeWc8gyztOh4S5gAtwrd9rxgR2OPpUsgOq4Btafj6uPNFdFE
	hfmH8gdRqUK7MeZFLHFY8zciPckOOWBYkMDfHiqgZORL30HjUHF2iJnoOuzfGFW1/G9s3GaSOLHEp
	vQeIuHzPZVpSOcLZD6cc/Kdet7QLgjMmWkKJ2br9BNVKYhhpd1lD3jefTAxhRnhAbgQV+al6WSg1F
	bfvt3x+RPKzR6lhXOrEVUG7InfVptDoQwGYRT7tf+15Lfot50o0f0hvcvhx7TnfXKut/24ozaM5Rq
	M77sRZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lXB-00000008nB0-0JbY;
	Wed, 16 Sep 2026 09:02:29 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lX5-00000008n9U-2xgZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:02:26 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso448144f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789549341; x=1790154141; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3prVhhjxauBWG8qfoe+eEDvbRKE6KXSyVNyWaZNvTE=;
        b=KDHuCR3r6aXLZzvq0fNk+3aVUnJkUKlr0Yb8Jpl2tj5FNrX77dCXGsee/3Se+TcmAh
         vKTgx9pouxmROck373iciuQMYnaTTOW2eDwClap/bDNsfn8qpO5JNF58fQwdGwcJ2CdG
         ynyXe9xHdTbv4yJAFkTVplgvmxdzQkFcEVJ152ZA3+cyGXVoHnkD4fviJmvs0+Cb5OBU
         vpZit2KVpkcXTOklk2+k0vRwzkMRdq8k2ItVIJyWoWvMJpXD+RmYj+06JA7IZmI/65LB
         hPF20maqqxzrUDYd5LOsG3nG8rk/dcibD2YX6emriFel5aNYkUEx3XVx1Y0aMfN2w1If
         MlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549341; x=1790154141;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u3prVhhjxauBWG8qfoe+eEDvbRKE6KXSyVNyWaZNvTE=;
        b=bwA1Q/H9AHgaT11cbFTEEqqF1epNJlF24R+7rYu/LiBn4wOcL9XOq0p+M0YPp6DEtq
         9m46vWAd+9PPAWIeoSeorFNtOwO2Tkix1E02kU2AmtUTCWK0Lwx+uYy0usu/82mc2V09
         O2l85bbd9pY5mjKNSu7lHFZBnEM6U8YYQfkD+p+teYUMKxc9tjgC+FYxDXjFVtxsZlAe
         5K2Z5wmMG/gckopF84HgCPg4jYUCa1kTNbeG+2+cRWFwU6YJPRLP4bpdTKdCkRnmgu41
         KNmgISvfDOb53fVAGKftq6kAMsnLpams3b3JcbSgjIETuBMFQnNgKG5nSCZzfdv8nD7k
         WYvg==
X-Forwarded-Encrypted: i=1; AKwUvBxQNNigCyLUBNx1ZVLlwB9osCAn76x1uWWSMt9q7bdc8XLw/AMUn8/E8pOLAbVURQXh4qCzafhsaGZ12qFty/xe@lists.infradead.org
X-Gm-Message-State: AFuF++mhxLt5jSiTFhIuMMbUbelmz0AKmN8ubg1KzWMtFkf40WI5J03L
	LMOVSeb4f/05/bRidCySEf+o/gwFvkjwzYZz4zqi5nckgMY6jTVGx3Rt6w/MrrOyr3o=
X-Gm-Gg: AYBFou07YPFCJd919q1+5RrRlHv3D8V2vO85towai+CQ0l7XpvNR5gsuJKtl2I6Dtbs
	Y1eHfDABKg+eibCooRk8kgsiQENXdILcYftQCafrUXKsJb9wxWFm8YxJ4YFtJi15hIMA35+u1Yj
	3PhBEydkeEJ68o/O9ui4rR9XfY3o6rG8LBWJHuEHk3s23hiwKpCz5aVHDgtYjbRDtpai6uFOgcV
	vXX4lvaFKjqovGIxqgyaJH1chfWDcDigUpeD5Ti8szjKIlmPSGMb/HGK2U6Yex3q7+cEmZ5XLTR
	Lxt9Lx2FlD2yJWERV50krFD+DBKWdBcsqAnRvjWr/6QGTErtWQcU7k1k7fe4BYgiyllOpfZDuo0
	joaj9dagqV3MU0gz6CtuhwDuvMkEBNPSXJFLwoodEis9BPohtH8DK8bq+0o+LEXC4XKRuMdxK8I
	1SfxKira1lp4IDBe25xKjr06mYA4Cr4GvI0+WgzcBiO0dDAgcKoALO7h5+vqRjVmuRkg==
X-Received: by 2002:a05:6000:40cc:b0:487:403:f2eb with SMTP id ffacd0b85a97d-4870d0452d3mr4199288f8f.17.1789549341185;
        Wed, 16 Sep 2026 02:02:21 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33e01sm6702324f8f.23.2026.09.16.02.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:02:20 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0a03f14af8c74b8b8ae71ef6964c726a8430f5297d9c30f5afc655f5a6b4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 11:02:15 +0200
Message-Id: <DLGMAND8UBI6.394OZTY3JSLDX@baylibre.com>
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
Cc: "Andreas Kemnade" <andreas@kemnade.info>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <letux-kernel@openphoenux.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com> <20260828230445.3c2510b9@kemnade.info> <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
In-Reply-To: <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_020223_764700_86CCFB22 
X-CRM114-Status: GOOD (  13.26  )
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

--0a03f14af8c74b8b8ae71ef6964c726a8430f5297d9c30f5afc655f5a6b4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Aug 29, 2026 at 9:23 AM CEST, H. Nikolaus Schaller wrote:
>
>> Am 28.08.2026 um 23:04 schrieb Andreas Kemnade <andreas@kemnade.info>:
>>=20
>> On Fri, 28 Aug 2026 20:47:45 +0200
>> "Markus Schneider-Pargmann (TI)" <msp@baylibre.com> wrote:
>>=20
>>> Registering clocksource/clockevent for the older platforms breaks
>>> booting them. The older platforms have their own implementation in earl=
y
>>> boot that is used to register clocksource/clockevent in
>>> timer-ti-dm-systimer.c.
>>>=20
>>> With am654, the timer is much more complex with more dependencies so
>>> doing this in early boot with the other driver is very difficult and
>>> gets ugly. Instead it is implemented in the platform driver for am654.
>>> However the old platforms may not register clocksource/clockevent in
>>> this driver as that would break the boot.
>>>=20
>>> Add a system_timer_capable flag that is only set for am654-timer that
>>> gates the clocksource/clockevent registration.
>>>=20
>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@=
goldelico.com
>>> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource =
support")
>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>=20
>> Tested-by: Andreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OMAP3 OpenPandora
>
> BR and thanks,
> Nikolaus
>
> PS: I would suggest that patches for omap-dm-timer are also routed to lin=
ux-omap@vger.kernel.org

I agree, it should be added to the MAINTAINERS file.

Best
Markus

--0a03f14af8c74b8b8ae71ef6964c726a8430f5297d9c30f5afc655f5a6b4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpbFxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOC
6AEAy1JS2SlpxrlOQuQLSOsZO+CBah23b1Dff4+ir0VdUhYBAOU9suaTsiifYV/k
vBrj8QHXWS0SbgbXDKjzES1Abp0O
=kqWV
-----END PGP SIGNATURE-----

--0a03f14af8c74b8b8ae71ef6964c726a8430f5297d9c30f5afc655f5a6b4--

