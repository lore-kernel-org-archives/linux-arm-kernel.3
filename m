Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2697CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdRArgXhGEk4i+GZe+h4MUY32Lfiq4WFd9PhB4MWWT4=; b=tkB8nKX7SnIsJ+AR5UJma22YgF
	WTTLHfb856AN0Ys/7YCMTmvnoqPy9qLu2AABEUym6f0aUcxVW4mUPHg4DcLzgQCoV27PBQNWFFI2U
	j7OqvZ164fJqezh0YOBMaIUksGkNdJ68EtmDYR/MEvDDSG3wmo57G0aqdxe/eYxrXHDw2Fy1gfhpp
	CN7Ifqss4AV+Gmijj3pRsqc3O/hhuWnLKseuOU7vkLfCBCFfVEPSM0H33wSQE/ZHaS8FvzabE65bR
	RixjoLxw4nkbeUM26EKpGWKt5u499f8LVBYAwnzB05FBFKAyxuGrkIFfoJ5tW7E4NUEcv42iz/oQu
	y56E89Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgyS-00000004fs0-2bt7;
	Wed, 20 May 2026 13:28:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgyO-00000004fqr-483N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:28:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso27525245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779283711; x=1779888511; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdRArgXhGEk4i+GZe+h4MUY32Lfiq4WFd9PhB4MWWT4=;
        b=MeJkaDT5qz3NhA6wdMtTdA8vqPxiDzrBBknhgQJOFbkkmsEtAWn8MdMynlHPrcGuxm
         yA6XcoRP93Ck0pAx3997q8T5Whus2rlx7BJt6HDbZzDAWeKzjLBfXDKk3iVH2bI2yjcq
         n2Dx9wALHN2MkAR8yWrbGNyWODaiSJmELyFjHEZWMWysnkbDsc1w7cOmgRCft9DkTjYr
         yTRfBNQiUrp59PsQLGR//3RN/uX7ySOMaqwvmSM/57JXpyS1Fi4haShMklZwGx585bXd
         QvzgrGoQ19fAeDw8HpcHJB5gIuSSXiYLw9aUq9ib6ZlnWDIDSt2rSQBuHPeUSsWrivWZ
         N4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283711; x=1779888511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdRArgXhGEk4i+GZe+h4MUY32Lfiq4WFd9PhB4MWWT4=;
        b=YpkrJ0ogFnJa2QtWh34eSRKKORMVwVKQLOheI74599d72Ynh65RmwJ1iYMUs1Q5gon
         6KAbIkBB0yqAXO21Qs/q8WIr5b8wqnm283pWFQ9TwWoZGSuwpT1uwoDKv/hHFStCQ8tV
         hlIcCOxvSfHc+6N87ZP/IHldNadhpPuHt/lSbgfKzj6P+rRcemhbj75K75m1HJ8GuL/P
         Lvvpf445w8IA1FO/qIsGksjlsEnHD2V2ui9cbVPOh0IhpVvCVWEZ/4rP6R5Ner9Y1JQZ
         H5uwr2vLz/lmyKATnw35ni+iG/0ICtIC1SGsBv5/FmJYGiLEbT0olXDet1VxDEwC36X+
         vx+A==
X-Forwarded-Encrypted: i=1; AFNElJ8/uvQowzVHIKv1BeESjvVO+QfMemycZU3F8fSQ8e1jX1xz+AI9ht3xAixuB7Q32EAERdJAyEHkgOaSI5UhqoQj@lists.infradead.org
X-Gm-Message-State: AOJu0YxUJ1wVUiAE+dCNIAtPvJIq7oc6VZZ0bzQcY3jqGhXX4qOIB49Z
	I8Swpm93danQI0rSOUHjtumFvWq62n9cbj1bMcdRxZgCPn/dATmDrrAAbWcvdgWXMA8=
X-Gm-Gg: Acq92OF2mZP6t7ucWtcZiRbgqghSyiHZmjPnsja9saf8agkRqpk/klJyTISRumUHyfW
	V0rrMnf11Hy5twS38VhXZHdvCGcEumdsiTPcx8VCgylLXAOHh4o8MCNa9Grk1BL1CeTb/TgdRzA
	M1goUQQ5gqJwNzpZxPw5+vjMzRIIXG1hTpo7XehAcKNAPMWcMKwyuAD11wV4RJ6H0NOLEmLdnAw
	2y/NtImB+gEDy/d28KNwC6g1YWZ39l6v3FHpaDjgwzuiIxqPg5QnFir0NXPnGowEHI+AvreaYSN
	mgSWdZQA3tuXl3uY9/TzHMhHMxVXaLN0P/0iWbWlQsboQfeuaYoIRl5GXMjveukRODcS+osUdBI
	kC+wmlfGgH5yt7Vs13YPBiTVeFFWXT1H39ugilzVoxIvQWhbmAFlLT1FdsJL/BrsTGxSRFfzJ7h
	lOBGX086thHS7E4oN/T7hf+EGzKMfFuZU297ytzrtcxVEXyVXs/MIrbCb0GsgWo3Cojvxsg+mGp
	dkttQ==
X-Received: by 2002:a05:600c:5296:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48fe60ed846mr375342815e9.13.1779283710913;
        Wed, 20 May 2026 06:28:30 -0700 (PDT)
Received: from localhost (p200300f65f47db00000000000000081d.dip0.t-ipconnect.de. [2003:f6:5f47:db00::81d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe4c8344asm671573025e9.1.2026.05.20.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:28:30 -0700 (PDT)
Date: Wed, 20 May 2026 15:28:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>, 
	Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] fbdev: Consistently define pci_device_ids using named
 initializers
Message-ID: <ag22VfyB51APLhQL@monoceros>
References: <20260430111637.211336-2-u.kleine-koenig@baylibre.com>
 <ag1xQVCCzXkc_Ucu@monoceros>
 <6f1e1da5-a086-4261-aacb-f1117e22146b@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ur6redof34jxgqs"
Content-Disposition: inline
In-Reply-To: <6f1e1da5-a086-4261-aacb-f1117e22146b@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062833_582926_C965E28D 
X-CRM114-Status: GOOD (  18.58  )
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


--2ur6redof34jxgqs
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fbdev: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

On Wed, May 20, 2026 at 12:11:16PM +0200, Helge Deller wrote:
> On 5/20/26 10:46, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > Would you mind squashing that into the patch you already applied, maybe
> > adding:
> >=20
> > 	While touching all these arrays, unify usage of whitespace and
> > 	comma in a few drivers.
> >=20
> > to the commit log? I can also send a v2 of the patch with these changes
> > included if that's easier for you.
> >=20
> > Otherwise I will put sending these modifications separately on my todo
> > list.
>=20
> No need to resend anything. I'll clean it up manually during the next few=
 hours....

Looking at commit bca0e1973086919ae2dcd7b72e4ef5ee48858df5 in your
branch, the result looks fine. Thanks for cleaning up after me, very
appreciated.

Best regards
Uwe

--2ur6redof34jxgqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoNtvoACgkQj4D7WH0S
/k6hDQf/QmYRiZj4xogmbV9WDEP+x/E2ECzORIkyZD+45qdJTmD/Blz8kOhzvJz0
/EkAqyoqAlLkC772ihHZUjPshnDK3USSHcNOIxLqUoSOA9jN8NA9NfadZVMPllqC
Hvu7al1cPZOEt9hMTsqK1udc8XPdKkVsyfoStLkG56POcb+uKORAcrRsGjHoWxhR
x/6/r27m1hhMM1FdD+eHuN1lDOCB/tGLO1mTIqMxKiJBboBiOFrumDEz90TEpLMv
akJ6g/RxEAsQsJFGu5sj0H+FtLWoawj4QLxljR32XLO6Sn5ZUn4qcLJyr3+fXHF4
oBKqDxZM6lVNp2fpiG4EFeEQ+rISLw==
=dV9W
-----END PGP SIGNATURE-----

--2ur6redof34jxgqs--

