Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39714C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yREH1JHbpA4Pc+dF2sRYRmhDFSm/U6gj6czteq239g8=; b=MgNWKejajr6u9G9Snb2YSzeRn5
	97RbTMbOtYIAH5ge4yS4JcSF9ItpOdeRvgN0ciGJZpwxPpFCZPOSiQCyvWLJO26CAkP2t9fDFRbcT
	O6duwo0+M86frOoumIBYH/7Q/S4tQo4SAoxK7iK73+5nsbLaLhi2JlXsaYB4b5mfsSyMEAL6BzVEY
	97Wk6da/3S8XOlJO5o8NPfRPhu4awEggjtxtpADNmryxv4fREAuSgBWYYQmhiWjgW3FHQ9X4cUonS
	2wD/HWcE9MpN+EcOuAfrW3h9gqoAFxKUbVIu1XsE0Ha01zBWVoFfiFYfhZdWWT0Fryok5q1vxfZTr
	Wz5rNVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5bN-0000000EBfx-17Xt;
	Sat, 19 Jul 2025 11:19:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5Ys-0000000EBUf-2T5m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 11:17:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-456108bf94bso19924095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752923821; x=1753528621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yREH1JHbpA4Pc+dF2sRYRmhDFSm/U6gj6czteq239g8=;
        b=MMZ367jGa5DUnojJGHesiDbYNA3UZElnBFjS75kZFPppc353YFQD3+KLUs9CTAkFcV
         G6bgdWvLdPJrBql0+Q/63bQmlIQdS7tadwck7vt1PrbADnkInSLzQx5DYGyQUEqwXeDJ
         LY2JhcSzpYakki7/o9eF2rD3nw8w/tpZbfavjEkrn0aLoJCbSWc3vj7vd16YOI4vz1Vb
         F5i1LObt98SgDXEWS2Wg4koSmEDGykqMbJ3Z7sXZ2H2sHt8hss/2Vn+n2crA4zEbepX2
         vqqsvlGZ1AmEe/+k1ccHqYfjIHmGnQyEk1dIGh2aVKPMzFCYawDIFAiR89g1XHZj0xQv
         ZrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752923821; x=1753528621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yREH1JHbpA4Pc+dF2sRYRmhDFSm/U6gj6czteq239g8=;
        b=fURwOdXuTyJLHL5I/xDwWcd7WxnMyDwaY0u6LjdLUgbiDiStUpXy3LWcfhKdL0h+YX
         VJXBCVbba0c1qe+OqhZalX03C4gx/ivUCemk1DqPQZh6VVaXrYw0Qtwo0LovcS7/lj5a
         SDOOVwKE7362AyP1+SXxkG3PrimIZaALOciq141Twi0sAYODzOcvcjIwV1gguVntuu7J
         sBzojgQLMCi8/TvuCCB5wi3W1tzV6tVvJmxrIXe6QBOSHfuoLEFmdNqQx2dD4oOiMy9e
         z97NCBlfkqLoG8/Z+3D564QIKhvNdHzR+8+vXh2D0bnrZJK7LpUJw+Q/dYipotODRSGB
         FqZw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHaCY4yYAMp4t5ljCn0A5VaCAFsxlHHxW+SXPvBpqElkW0IdAA05WYMlqhsZUd+9yp2z9PErLDZEQnzziXm4s@lists.infradead.org
X-Gm-Message-State: AOJu0YwdkGsB89ZNRghaiCvJc74Z56zzx6kaFSsUwzmgTdAlO37v88/M
	l/pzcm41+lPLdzDffbhzwSKtzoauhqlzCzEiZIZK+3XqOVYBT4ougQla
X-Gm-Gg: ASbGnct7GWIcKAiF8Ni45sKROvYo5undKSiosZwJm2tcdU3yfdKP0uNCQ8ICozRsEDi
	SbNwpn5Vw3HbIL05X5SCLOa7jciQ9Lyrpp87bJ+dZX6NtpS/7K7g4Yv/1+vQdDinxU2sdGQ2lvQ
	qFoPtbouPtUHlI6DmCKDET7tnz8C6XeDnPTpHDgBrYlUag5+P9JJLfbRSkmnL7yYpDHXtbX3j8y
	I0w6iqJTnKJ+6PQb08anYDaMbyBnvJ+qc1a8ozpUEI/49CYvl8Pu2uekab+ZXEMXuhRgRsRQo3q
	5OMX8xnrVs1oJv0j6QLSFD641TjmI3wpSFfgHl+CRMZczUDavRcplmjCmDmqFHKoC0JgN+alLFy
	1SkjPb5/kkuchQHbI2YYauJfAv+Q7GH6CRhGKCV0nfaSm/asmSP9oCDLhF4kM
X-Google-Smtp-Source: AGHT+IFG5a/EIEtTEgi/facfq5JtWW35JzsMqA9KnJCq8jcsa36lVJQsFoBhwDYnIaAYi1qGi6pY9A==
X-Received: by 2002:a05:6000:2903:b0:3a4:f5f6:b4ab with SMTP id ffacd0b85a97d-3b60e523cc0mr9834573f8f.30.1752923820833;
        Sat, 19 Jul 2025 04:17:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c712sm4567642f8f.79.2025.07.19.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 04:17:00 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:16:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Gleixner
 <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, Christopher Hall
 <christopher.s.hall@intel.com>, Miroslav Lichvar <mlichvar@redhat.com>,
 Werner Abt <werner.abt@meinberg-usa.com>, David Woodhouse
 <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao
 <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
Message-ID: <20250719121659.515c199b@pumpkin>
In-Reply-To: <69499cb9-b13b-4eec-a7c4-c219a77c6260@sirena.org.uk>
References: <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
	<02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
	<CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
	<e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
	<20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
	<eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
	<6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
	<20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
	<3a9504d1-2c6a-459a-a98e-3010d34b546c@sirena.org.uk>
	<20250716152041-189100b1-7f5e-4388-8ada-b79ec09d18f5@linutronix.de>
	<69499cb9-b13b-4eec-a7c4-c219a77c6260@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_041702_629437_E9DA486C 
X-CRM114-Status: GOOD (  21.47  )
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

On Wed, 16 Jul 2025 15:35:09 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Jul 16, 2025 at 03:23:24PM +0200, Thomas Wei=C3=9Fschuh wrote:
>=20
> > Can you try the following?
> > I missed this despite the double-checking after the last reported issue=
. =20
>=20
> I needed to fix that up a bit, it was missing an update of the final ret
> in the function and didn't apply directly to -next for some reason so I
> had to manually apply but it seems to do the trick, thanks!
>=20
> Tested-by: Mark Brown <broonie@kernel.org>
>=20
> with this against -next:
>=20
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 97aa9059a5c97..487e3458e536e 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -365,18 +365,18 @@ __cvdso_clock_gettime32_data(const struct vdso_time=
_data *vd, clockid_t clock,
>  			     struct old_timespec32 *res)
>  {
>  	struct __kernel_timespec ts;
> -	int ret;
> +	bool ok;
> =20
> -	ret =3D __cvdso_clock_gettime_common(vd, clock, &ts);
> +	ok =3D __cvdso_clock_gettime_common(vd, clock, &ts);
> =20
> -	if (unlikely(ret))
> +	if (unlikely(!ok))

Do you even need 'ok' at all, just:
	if (unlikely(!__cvdso_clock_gettime_common(vd, clock, &ts)))

>  		return clock_gettime32_fallback(clock, res);
> =20
> -	/* For ret =3D=3D 0 */
> +	/* For ok =3D=3D true */
>  	res->tv_sec =3D ts.tv_sec;
>  	res->tv_nsec =3D ts.tv_nsec;
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static __maybe_unused int

	David



