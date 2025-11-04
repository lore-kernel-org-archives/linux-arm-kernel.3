Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDBECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11bSiUD+SmZfIvfIbLOIP25mSIZX2XAi0MWZOiJraoM=; b=LByVUL+p1SDitANyKMM3hRk9VN
	VqX39BFPsErygbarvnR6d4Pr/h2McGpkr6VMOHNKBze2pqJhm07HTz/4imkwOc1RcuaReBdwR/yhp
	mfEGZGuC11OBGAD5x56JR/h+W4qZywgvXY0nxAwU1OMxh6vhPNllouozvsvoAEbG6lIAv0NnhpOeK
	8axkam62h2Y9muRqXAM3Lk1Q3I+fWrjCgogzi4Eb3vERFAuoupq3U26T9AvQXkwf3/AbrsG+/shgF
	7JW4UuAvCkQUvHuo3R2Q0iAgbULnPP0eiaNFTnRsQB0aT1tTSnUDubXyVZAeTdzQdlQdX82JA0PGT
	f/9giPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKcw-0000000CFqj-1OMa;
	Tue, 04 Nov 2025 17:15:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKct-0000000CFq4-1Y2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:15:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so31535365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 09:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762276521; x=1762881321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11bSiUD+SmZfIvfIbLOIP25mSIZX2XAi0MWZOiJraoM=;
        b=VGibBeZxp3Z/xv8RSQ1PaiBtfZNvEqXBAiUZubJinMP8mb/CRkjRakAZ2K+H6b7Q+/
         2OHvJzHKGN/TwOjpxUhd1Gf5PIS1pa+N/0mlgbYWs+i1rWXmv0cr935pOSyR3jJ5427b
         n+y9kaZiiOVLU/pbgcZpaI6MAZWMK/pi2uPyLiO7FzZ3rt7D3rhBIMuWDCcpBpXmZFgs
         TniTHwYI8csWWGOXOjICtmCIG3OeFrMKL57xc8e9QNvV8TJ/ZABvCTZEr/uXo+36nT2e
         Snb1lLKTuKuIOFLh7oem8sEF0dcxIUjeYrXVTSanOAQItzJZdlz8ArJzUCcY7Um+pmbu
         YOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276521; x=1762881321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11bSiUD+SmZfIvfIbLOIP25mSIZX2XAi0MWZOiJraoM=;
        b=eKiqHNg95UNQlq/LkkMBO0IuJopwQQy6lWU2qCF11DIR2NpLHHwnErjU27XjdUWgMS
         1dA/nS/wNUoAzxBladFqCZIbFLC+OhkoWLeIHfdKrs2KZRdyZPmZD+h5fa15XXEDIX9S
         ZurVblYjg8PmbO9APJgJsxUrhSswDoL+PQdfFJ+5cnijoDVyG1oiYstj6ZDe00PNrmlD
         bkuwowSWb6IQnF21H84gGr3OceLRMv6m0z+59iCIBctevsnqyy67YWunPKjaGOmP06o3
         rz+tVwd9DlMdVoXVN/ULBC8H35qeLIHUDBpaou7880q2JVsk0oJshS4kgIdtDZS4wf08
         1WGg==
X-Forwarded-Encrypted: i=1; AJvYcCVF3ZFaqRKjjWW3Ay4jA9Kdy6dFStDIGxafSkwJDhp4Pq9JVHVt1tUkCFV9Dry4v+S1EoOWwunfbuMMGyIQYWGu@lists.infradead.org
X-Gm-Message-State: AOJu0YxzOFlJF/oMbeG1WdCAb+XGR8R6yA3XDaEmG2+zkowkPiXbPfID
	V9aj/rwnj28W3pXKZz8Y3OLBzOq7ayHZC00mvza48H5XjPdjBdzkT+LttadqSPuvYf8=
X-Gm-Gg: ASbGncuRg3vNZIp04igIomjld10mWTr+c9UajuDHyX/6xty5xawVtt7Rn79HfbIFKre
	kXCGmddQ+vX4hw8MJcXsRYZFKrROe5i0ygkvBeQpJ1kvq7m+zTjch0aiimcvMsvCyr8l0oGKxLc
	jCrspOmNgMApHDPbOL5rLjLmV1P9h2ilV2mySs4+b1GtTkVI3O9gyo2ZEpClHfpT7J4XVzmGQCm
	zd8pmTeGoldk4ByRcVuGUjxX2VlkkZAn886fMXH1JhKWf7/oibmI98cKfUwmAFd4SXnpJonJrHy
	xce6D75JOUYws2uQ7o99cHrPOFocUQrCReNQBuSi4bg4sHWBoIV+txrujRAxH5XhkRiPrfTr4Cb
	oU4Ma4Ela0DHtAH/TxM6pEgJ7vv8AP7tC2Jd7VjVnw4aJZFuxMk4QoTuidjrZ5dbZHZ/sLUjxXM
	T9moMI3G0JgzheTX/9hK/v+7K87F8Hky+c1euCFBUZ0pn1MWSG7tmbaNWnuFb6v10=
X-Google-Smtp-Source: AGHT+IFpMrzCIsXvLTd5b8XuFo0wIfmZVyUx0mnZsXXbHF9m50QWrTTxklhGAl+l4IINovmoHJhrEw==
X-Received: by 2002:a05:600c:5252:b0:475:dd9d:297b with SMTP id 5b1f17b1804b1-4775cdf46f0mr639525e9.33.1762276520536;
        Tue, 04 Nov 2025 09:15:20 -0800 (PST)
Received: from localhost (p200300f65f19f50455bf0a672b3091a5.dip0.t-ipconnect.de. [2003:f6:5f19:f504:55bf:a67:2b30:91a5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4775cdc341bsm786535e9.3.2025.11.04.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:15:19 -0800 (PST)
Date: Tue, 4 Nov 2025 18:15:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Julia Lawall <julia.lawall@inria.fr>, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pwm: mediatek: Make use of struct_size macro
Message-ID: <dvpvyk5zravy6e36pykntlnakdoolpszehxdnicccgvihcrqsn@j5m6u4ua3bl3>
References: <20251030222528.632836-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7rl6pu7vlvbu2rl"
Content-Disposition: inline
In-Reply-To: <20251030222528.632836-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_091523_543072_80E65E29 
X-CRM114-Status: GOOD (  13.46  )
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


--r7rl6pu7vlvbu2rl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mediatek: Make use of struct_size macro
MIME-Version: 1.0

Hello,

On Thu, Oct 30, 2025 at 11:25:27PM +0100, Uwe Kleine-K=F6nig wrote:
> struct_size provides the size of a struct with a flexible array member.
> Use that instead of open-coding it (with less checks than the global
> macro).
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202510301753.iqGmTwae-lkp@intel.com/
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks to Julia for reporting the issue.

BR
Uwe

--r7rl6pu7vlvbu2rl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkKNKMACgkQj4D7WH0S
/k74UAf9HU98YiS3UFfrhwdGdgRt5/Dn7zjzTxHcsT2z+/Qs8mXkBp6qqze0euW3
FFd+RE8S9d4D0TQyUKo2N9xO++lzRazRVdbt0uLo0x2P2m+d2WsWT/sirKjYHXN1
zWL0LT6ZCYBEP7kBVkpNAqmjYgu0rXCSnsqw8NhVqWVe5uiazoZwemLZdHXMu9rH
gMThXn4BW80o8CSMTEddBH3VWuKbmMF3RJIIKFKi5oHhYkxPzr4V8rAL6T0tQw6D
vIDpOdzI5vzwZYqzF8ELE86k4VDCZsrgWE+s0x3rO0MCkmFzuY7DLlpiWGifeqca
myF70WwZC2nHjxnlKpOq4vA4BL7FYQ==
=/igG
-----END PGP SIGNATURE-----

--r7rl6pu7vlvbu2rl--

