Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBFCAC580
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdxDf5zeXQhsksmaMXC9EJWtWbesa8BK9ehvgf0lftg=; b=BAgCIlFpEf0dQd9zNdC5PcsJOx
	sJoRUMRK+f+tPkXazwLUxbZfr7ZPr4P4YnOYcK2BnkXj8rUsBDlcsWIUhnaGQLH2QloeTejC7xT4t
	RNKbH7WmciqbFPZZUbpsmkhc1XhmDq7KscB6RJd4pr84yjg0c7oMYE6cOZl57wVjhdhYjmBPknePQ
	SrMMoqAYgpV37LMCvm66+oNLOze1awGP/r3uKyQJ8NcS7wJQkU+evIFK8kimyLqptJT1iVAMPPoOs
	MPTKFapQHssFij4uEjbb3xDggsAQ3pO+CxdTfRydKHxz7FeIqni/vjNaYqX+uyDmzGF8ikphHtZuB
	lFikbDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturt-00000007dbW-0muk;
	Wed, 03 Sep 2025 21:18:13 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr2e-000000079Rg-2orS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 17:13:06 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7e870689dedso13289085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756919583; x=1757524383; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AdxDf5zeXQhsksmaMXC9EJWtWbesa8BK9ehvgf0lftg=;
        b=KhArBI96/CCTvqopFNRKgso3Nto/5aeQ6pj5wiToEA4KrouYU8tFxbE80ZxzmD+QPv
         VwTbhk8Y2Sh+QopuFVeqCOpXPmGhtZ8lqu7yV4M9ewXAMYVRmWw8Y8oc1jpbYjqYA+c/
         lldEo+bflB+cvQ9/TQlii6zf69L4+wmlfEGXacBLrNY7IHtMQmMHZnNrIFNGwcDOWDgl
         iZyD57LHg9tGQJSxi7MWpwsCw07zAvpLjReJVzGIALJIBK9rZjRTLZyokRJVkqmRkEpA
         NfQY9vGuVdrSJVifN2YgP6iZPdjntMlKQ/9AHZVA2yG/BHS7SmaPcfT9+1dwsKTwSvDC
         eBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756919583; x=1757524383;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdxDf5zeXQhsksmaMXC9EJWtWbesa8BK9ehvgf0lftg=;
        b=VgxdUhE3IhNrAj1XCVketj60geRTZkSxUBhGhsQ2PmNLIj5oxFICKVSrJ+yPtZAi28
         z5aQnnKcPlEF89xghBoxooE28Jsiwbje0spyGfMRX9rFIpUBqes3pAgegBKde/yqANAO
         nlNuNjuIfGjj7pX8nJSgld9sJZqO0reP+QQGo5tV9HK4ZeABpLNQGEVVAozDuSU+asdg
         DvbXewhtbjBwQVE+AEn83j+531tIxuGggcTuLfCTu5euGhqjsxY5MpBrjVW7IekMkToI
         qhLMevGkt6Z2L5hhyF4I6HFrWoo19ZBUsFKDn3YpPGYj5/oqtWIh1Crs8bMkQ9/YWhlA
         ilow==
X-Forwarded-Encrypted: i=1; AJvYcCWllEcD7uY9x69Y6neQBhOmygAzXf/DGxiW1B1ynSbXO+iWa9EERdQlYdBB8q5Oig0ELp9GtSbBJlMGvivWPNQV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzg1Wlm5BpPfG8Yo/501M0VaqZHhJX7DNCyVOG/ZVM7rDp7MCT
	430mq1Qawu+G4KM7+cEgV/+csq/fS5I53QN9PtIlqI5Hv5sTE9bA9WT/3orkjLrELDk=
X-Gm-Gg: ASbGncuUMcaK4thJWxiz9T9PhaU2lRMPXH9aNQdasxW1xEVa0DJylCe8w2f3EZw7BWY
	aOxE0JrJwobbxPLP2+ipCGvvIWwB3vGG9Ovnj4XJi9RyHtwR55L1ZHBD91JRA0iJxowsYOsx7Vu
	SHV3TbKMc2BA87oYcMTf+dxS2a3m/TX3tyhGeUR7c2BAkmKDaOgUSo8KiL8/KGTnTMg7eF2et9g
	gYcvWmcPNO3W9ukHXHtjEKVteolAoSwN7j0YAPe6PgSoigiLt0+vVm5CaGkBTOOw+KcQ4GhvZ+O
	reCzNSgN7D+R9ujLAvyIAWbw76aRHJKExCEYXzcNPGbLS1Dy0TKPFgyQJ0uG8aUHs1E8qGS83iI
	XHuTStLyUqgAC9gDrO396+WMJ2Q+9018AncEQqQ==
X-Google-Smtp-Source: AGHT+IE2gk2cAMApAiK5YzQI79QMXJKlXiHeFQVTEq67x8yVV85XXX2+3+BrCnQSOq7OZa/8/eFoDw==
X-Received: by 2002:a05:620a:6919:b0:7e8:902c:7f90 with SMTP id af79cd13be357-7ff26f9fdc9mr1708337085a.15.1756919582911;
        Wed, 03 Sep 2025 10:13:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aac237b51sm135862385a.61.2025.09.03.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 10:13:02 -0700 (PDT)
Message-ID: <699dae8715b77f20f075452ecbaf03c2e0876186.camel@ndufresne.ca>
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
	 <andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Date: Wed, 03 Sep 2025 13:13:00 -0400
In-Reply-To: <20250730005212.GB2984390@ax162>
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
	 <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
	 <20250730005212.GB2984390@ax162>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-pzsAHyLPvNQykWC7D2G9"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_101304_813136_4CF82DFB 
X-CRM114-Status: GOOD (  22.36  )
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


--=-pzsAHyLPvNQykWC7D2G9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 29 juillet 2025 =C3=A0 17:52 -0700, Nathan Chancellor a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On Tue, Jul 29, 2025 at 10:24:22AM -0400, Nicolas Dufresne wrote:
> > Le mardi 15 juillet 2025 =C3=A0 15:13 -0700, Nathan Chancellor a =C3=A9=
crit=C2=A0:
> > > From what I can tell, it seems like ->cmd_host2risc() is only ever
> > > called from v6 code, which always passes NULL? It seems like it shoul=
d
> > > be possible to just drop .cmd_host2risc on the v5 side, then update
> > > .cmd_host2risc to only take two parameters? If so, I can send a follo=
w
> > > up as a clean up, so that this can go back relatively conflict free.
> >=20
> > It seems so yes. For this specific patch, I would probably rename "args=
" to
> > "__unused" to make the reading faster. But does not matter so much if y=
ou
> > later
> > remove it.
>=20
> Yes, after this change is picked up in a maintainer's tree, I do plan to
> send a patch to remove the "args" parameter altogether. If you really
> care, I can certainly rename the parameter in this change to "__unused"
> as suggested but if you don't, I will just leave it as is to make
> backporting this a little easier.
>=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> Thanks a lot for taking a look!

While applying your patch, I realized the Hans merged another version of th=
is
fix, but made by Arnd. It covers the remaining too, so I will mark yours as
superseded now.

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/7fa37b=
a25a1dfc084e24ea9acc14bf1fad8af14c

thanks for your work,
Nicolas

>=20
> Cheers,
> Nathan

--=-pzsAHyLPvNQykWC7D2G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLh3HAAKCRDZQZRRKWBy
9En1AQD1tAsHKQWAylP0KeFD1yHx0HsU6uwqceGeGAr1Nc5pkwEAgs/En9h0xvlo
EVQVqh/acb6D4sGssLO0+X1Rreu8sAM=
=sQoA
-----END PGP SIGNATURE-----

--=-pzsAHyLPvNQykWC7D2G9--

