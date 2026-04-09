Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56644F31E24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kaRYoFjLo7AEw6PbnUZ95P/VxWHGW0//ZO+8vvmnpQ=; b=vkVvRPHOIlyG2C/0ysLndEwfU7
	Mfa/KH9+f/wp6HE8gffnV4KJCs3AAuNCtmndtrCIL6BJ2DGIApuQSFPzExZ6XEZSHN6dNXeN2ECMm
	XIxA6kXx2EBWuL0JwAIpKCf/lobLus/bRVJbflc/FBZDzFmu0d5WXvJ9DKJIFFOTJ3aSx/fpMUWBl
	Rhc5s8cUG/KvaXw5TQsdZcYPdF5Jk1RmfGwC+kC6QWzRGDPNkgLSk0uAoO97ZitvNtIh3kX8fHg6i
	M8FfntOyLKcehXHVwg2mn54gitPjbDe91nNWNxSLCB6JSbCpuEEhZMATcqTc0bKgVQKk4lVLWeQqK
	saXoQSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqXw-0000000Aid4-16Nx;
	Thu, 09 Apr 2026 14:39:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqXu-0000000Aick-0KFg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775745587;
	bh=tvuRwRkxn8yyqW5u+9Ug+mi7EY2+Rrh1Yf0vc/rBDTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SuZRrpruZNs2VoZYP5hr/VVy5mKu7bEpZwUEGg5Y7aonyk19S2w2ijPcGgV671zeR
	 FyDYZ/099+Ofx5kf0owGBQy2WTJCULuELgHhWFaMNDZ7F0fZ8yelx2biG9dRRpjej2
	 bkMrdPp6CvC+cHWJDj+dAG+k+4yQPwP2ehVW6hK6FyKLPRZFwgyt19LfbVZxAhj1tz
	 55s+ZWiEmaDR3tGnt4Xty5vhjbaxjZZ4s2P6idRMQUttGAr64jbKMIaxFmWvArLpQi
	 388vvKVMJa0isD7sGNIA18i0bXvy4qO+m+0r/WjuMeUUvu9KIE/wgoa5Ui4g0ULBjv
	 ZOswuCd5VWqqg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9392417E135D;
	Thu,  9 Apr 2026 16:39:45 +0200 (CEST)
Message-ID: <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org,
 mchehab@kernel.org, 	gregkh@linuxfoundation.org, wens@kernel.org,
 jernej.skrabec@gmail.com, 	samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 10:39:43 -0400
In-Reply-To: <ade4Qe4OS04au2Ba@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <adeqkmA9VhaPkSAk@shepard>
	 <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
	 <ade4Qe4OS04au2Ba@shepard>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jkYxU3/N85lPIzmvy2j7"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_073950_324437_42A1C8B6 
X-CRM114-Status: GOOD (  10.07  )
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


--=-jkYxU3/N85lPIzmvy2j7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 09 avril 2026 =C3=A0 16:31 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> I think it make sense yes, but it would be good to document it in the uAP=
I
> document too.

Basically, extend in the M2M decoder spec(s) on the existing documentation:
  =20
   V4L2_BUF_FLAG_ERROR:
   -
   When this flag is set, the buffer has been dequeued successfully, althou=
gh
   the data might **have been corrupted**. This is recoverable, streaming m=
ay
   continue as normal and the buffer may be reused normally. Drivers set th=
is
   flag when the VIDIOC_DQBUF ioctl is called.
  =20
  =20
cheers,
Nicolas

--=-jkYxU3/N85lPIzmvy2j7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCade6LwAKCRDZQZRRKWBy
9DvpAQC6ecbg43McOvC02BU2O9ovdwzht+CzRVOQLfnF16QH4gEAkE+bOFKHp00X
0OnIN+nfr6wWDh512LITs4OMudJbqQU=
=8WuQ
-----END PGP SIGNATURE-----

--=-jkYxU3/N85lPIzmvy2j7--

