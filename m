Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A93C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qq3DMgYozYWoVO3Wwu8Kyru3Yi0/X1e36bm9QG1b8KQ=; b=C2crwdwVbyiKIWLbTekbcAqraf
	xKOIuD3kNrm6ZxZ0xj6gS7vqSezXcgFqZ+/W6oXXblcgDBtyJ8eeVgy+N/3U2M/vyOdgse6R+VpfW
	10YOonvizV3hBLf6x8aSFQNJ/qKho8xO/l0OIMkKHE+447ABooPv5n+5QXLemqgjvrRy3qbw84ihy
	e+kz1NzYBL6H/0yaHpoXAK0k/s63z5sm1HqdfQMmKd+3AkTNGKx894pJmHZEDKp+895VzTAEkWjNx
	zpTybaK4ONMQN7uc2EJ0oAF4a4Zm0fmc+lETVc5pmCjGgWrn/EQb8BA9IO9dpMP5czNQD+hIE7C8b
	REjUlaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH50u-0000000GEFs-2ugL;
	Wed, 14 Oct 2026 19:51:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH50s-0000000GEFU-0U33
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 19:51:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48c02782159so2771446f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792007504; x=1792612304; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qq3DMgYozYWoVO3Wwu8Kyru3Yi0/X1e36bm9QG1b8KQ=;
        b=Jvl5mjtc6Sux9WPYi6FfZSr+Hy8DQd63S9i5qrEdZ+pVkdYrG6mL37ZYY/8UmVV2aR
         dXO7jGHbicGx57JpqI9xmWiky4k3a+WaploYdKH3tMhTT37kYpMGnjvrPmzyzNCZsHC+
         5U2YZ+YXGorFrY1lcaJFAS6LhyopijyL0sV5nntGktSOPi/0TLDrq81R/NMyJ+7KGBdU
         MHJckJUBmRL0UifNut4HxLoCBwuNywA4QBmV9KaECPVQ3y+cgJ+bpWDOYqmsEKrN3Wz0
         OrcXXy03PP2HORPpw2jHJHPrhIvNCh3F5LNTFygReZcAwsXwbWwQjljNJ6/Sq2mBPlhq
         5UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007504; x=1792612304;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qq3DMgYozYWoVO3Wwu8Kyru3Yi0/X1e36bm9QG1b8KQ=;
        b=QewwrH1HkT8dCipP+thisXDt5r0cVRWbLCVi+QaNKVX64mkkSrnu586PSHhkRqBtjm
         oJygCW/S9qxQQzr1wCivgr6S20ZtyrBqkNkndoK7+iFfmM+yud98yJR1PclvvD/PuT9b
         mXHfABI7nyzRjxiuTAvGh+cU9Xut5t9yppPxaysZoqDC33m/YajUc8FDRSMysYFzFNDC
         shFKo53dkKznL6F/Fh3QcwIB7IRKmmukersuo1mWj1vxTBY8fNj3z5iZmJKe1/fWDWki
         VKApvVaQplMbcf3zjXIRUtUI0peMc4WzE59/eTN2EOXOg2Y+/1pvYCMjuwNWtayyf7d5
         /fFA==
X-Forwarded-Encrypted: i=1; AKwUvBwPwtghwqM3VauJTHN8CWnqBCdn+sZ9vPRxpP3BnQAWblYkfsUcB9/3jhC6EwBsfwvuynUqdFAlCPFQvFGgxJcT@lists.infradead.org
X-Gm-Message-State: AFq9FYJdmVQxu/XwuSxqCSoC/oJmo/h8q2+TSV4Ujoa9DZ2u/3gp0bC/
	G/9pyOJIgNUM7n10blFXT1Yt73BvJww6dab/6nWGnR/se3kGYykYbbJ0
X-Gm-Gg: AYBFou1hY8+17RhmjzV8G7skF4d2ne80Clv9NgKdhhAhasYnduuR5aoxZ7omG3kzM3x
	EkNnPU7m4LoyVlHj7jwxj7F2VXIkHpUgDj3H0y0lQ29YDDNgIywPYJ5Wyv0OZpfrN9QDKtqv/r9
	fVphixcBoods6MM7ptwUvvQlnfryBdcc1cwm2FZNyYI4/tBFtJ6xVcDGEiVln/KXqA+zR/15cBj
	QVrvzFK983Cbb9Ffdz8ZYgpGjDX7GSZyXXh98swgml3+CFlyedMuqYx1dyoqN5frF58fwWOjnNQ
	lAYVoU6hcv7Pxx9vemNMlyvRpiDTnuv6RIs7eYB5N3xjx7e6bj2S1FX4CzSID2oCd6ah4HC3Rr3
	nM7+hyALuRlqaz1fqD1L2z2q6O7Cyurj0HI/H/MJ7N3cvjCGZQlPtkEUEA4nxv6YW68VWPgUlWf
	xdkQo/vgEh8AhXrAFKUCH6G4hr+3bBbSxMPlyAx+rXpckt8UawgZEzRxFltN1lPVeqeex3Gj/42
	sT0ODwEiR93xj3o0tkfFIuS9ESgfA7J0OvmIy2z2WjF+GiNrZpwy0TKQ7dnJg==
X-Received: by 2002:a05:6000:e4f:b0:48c:6f3a:fe30 with SMTP id ffacd0b85a97d-48dbaade0bemr26170237f8f.15.1792007504101;
        Wed, 14 Oct 2026 12:51:44 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm14136667f8f.33.2026.10.14.12.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:51:43 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Wed, 14 Oct 2026 21:51:32 +0200
Message-ID: <3NVM7FsJRHKTH-nxfdo1GQ@gmail.com>
In-Reply-To: <20261014071955.1755637-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
 <20261014071955.1755637-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartfSPKJ_shS-2TMLqX1rTMYQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_125146_176061_0DB0469B 
X-CRM114-Status: GOOD (  16.32  )
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

--nextPartfSPKJ_shS-2TMLqX1rTMYQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Date: Wed, 14 Oct 2026 21:51:32 +0200
Message-ID: <3NVM7FsJRHKTH-nxfdo1GQ@gmail.com>
In-Reply-To: <20261014071955.1755637-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:19:55 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> Hi Stefan,
>=20
> Thank you for the candid feedback, and I completely understand your
> concern.
>=20
> To be completely honest, I am returning to low-level C and kernel systems
> work after being on the software/application side for quite a few years.

I second what Andrew Lunn said in his email. I hope you didn't perceive my=
=20
concern as discouraging.

What matters to me is that I am giving feedback to a human who learns and=20
grows and not just into a Claude AI prompt :-)

> Regarding your observations on patch 07 (PLL reuse with pll-zx.c, the
> 32 kHz clock origin, and a dedicated pinmux driver): you are spot on.
> For this v2 baseline, I kept the clock driver scoped to the working
> peripherals needed for solid platform boot and retained pinctrl-single
> for the initial muxing. As I get more time on weekends, I would be very
> glad to work with you on unifying the PLL code with pll-zx.c and
> expanding pinmux coverage once this clean foundation is in place.

Sounds good! As I said, I am traveling for a few weeks, so I can't promise=
=20
prompt replies, but I'll try to reply on time - actual patch submissions fr=
om=20
my end will have to wait until I am back home.
--nextPartfSPKJ_shS-2TMLqX1rTMYQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP3UQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiwwAP/09cjr7ZQtgxXXw8az+X
AqwaNS3zfGjy6rKf977hgZ0rXeEML5k60UfGhsw/CkMceJUN+8urSu404uQysc66
W4OEw6IzDqX1z+34sm/69zmhSNKVQYf+6VPlRkCyyIR743zsQaozFfmnvYszghM2
8BWiAymbVkjBNEvjxAc5TMAbhAK6lf9XDfDjUhbqagINsxlrpKlp50YQovpxlQ5A
crI7b7eIKeAuCEcsrwf7oSuz6x0uoGej07Ed3niWKinTdkalVg/CqspDuOHJiuLj
hmgDc4zJV+Jc5ApnUeXPwfmtTBgUIyA2O5EgZdc/lB2576L+SMXzV26obq+mYd41
cK/yx591FMdRlET3pw/MNDrUPDqZ7KbWlDgjeqXe53vVx7hQsFy/waFx/4pDx1xA
OFIL7rSWHB3z6f/FRpYhA3q90SktEikMFiUle49DLDUFJZm/ybt/A2ZasjswIdlc
lv8OoryGX9rtunQ7j9zhY+3O0KDM+F28jVBUF2T3o3b49nLpMcGDunfLHRxfoURU
8BPjNnjO3W7riGt++nhqWrHrBB1eW2iU30u7ixUdRr+bCz4bhxVrQd8wIJqEeJWH
zM3chiIRWBjY6eAyrcGcuWz+KeZ0c+L5RpgQ8XiK7OFZlcWfuoNQY/yEq6yY/4Zb
iBVWRlyhRqFA1GJDZP7YPSCt
=PQ2q
-----END PGP SIGNATURE-----

--nextPartfSPKJ_shS-2TMLqX1rTMYQ--




