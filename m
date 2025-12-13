Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562FD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpVof7Odug9SAbcKmOJ7g5O7rAAVK/6mGp9tsqPmEDs=; b=YMvpkWQOYx4VsQ6diTUX8/s1xG
	eSLj6t5r0gOCpmNqEyYKP99q6bD0f578yvMivS+o1i2//r5JVW8/JrghZ8zMRDbyd7krb05MHDfgd
	vYmRkGCOTaEk2qFc7OLZJEqlQRog4o994QavKxjij7kXbp2lIIVi2riG99mQMy4GtSbW+RmyZBuLS
	NUwpYAemDVhWCZAOlgi8GkNDtGkYWOP6+5VI04oOA4lfUZGZ1sViB2SomPzjk0rqRJUpF9Ah19H1P
	mwCfZZ121/CcS/zvENFElv/V7245rKyA8uu5xsFfJfzzefdSJOfG95O3V443vL1zU9M1YoqO+/uP5
	4kSik+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUQar-00000001hLi-28ht;
	Sat, 13 Dec 2025 14:27:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUQao-00000001hLC-1UNu;
	Sat, 13 Dec 2025 14:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765636043;
	bh=mpVof7Odug9SAbcKmOJ7g5O7rAAVK/6mGp9tsqPmEDs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=k9GIAFCLi6SOWBkvA5dekLeBmr/k3lpvQaumsL9oXYph17moLnM/X4nzmNBiBJExI
	 K/fJuS90+GpTnal7bjf3dDOmkWx6v1c8+1VSjAtk6M3v1gETVBWKI2ccv1OQc1cyHM
	 xa4jQGsWIdbTQ3N5RvAQ0wnHGgHq++gkMn8RMznsvh1z4lbW5OKZ2d0N6bHa2Ke6VF
	 RCuHnScsqWER7sIfhZmP9K58XOB6BQjFxv7HGPDpXKTJOtQMQgKRbPG9VaR0eT5OI1
	 8kXo0HPrTfnmzd8MMntrtWIuIHxoXNoNmmXq5chgjzdYoc7vCLNR+D17fJj2cWXMas
	 b3bRb+c4gKe8g==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A199617E110D;
	Sat, 13 Dec 2025 15:27:22 +0100 (CET)
Message-ID: <6810b2c54369a7941d4f01d1013a641412743b62.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in
 rkvdec_s_capture_fmt
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: detlev.casanova@collabora.com, ezequiel@vanguardiasur.com.ar, 
	heiko@sntech.de, hverkuil@kernel.org, jonas@kwiboo.se, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	mchehab@kernel.org
Date: Sat, 13 Dec 2025 09:27:20 -0500
In-Reply-To: <20251213055942.3046647-1-liujianfeng1994@gmail.com>
References: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
	 <20251213055942.3046647-1-liujianfeng1994@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-UIrld9YNkFZl6dp2g3nc"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_062730_620163_6C6FBCB4 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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


--=-UIrld9YNkFZl6dp2g3nc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 13 d=C3=A9cembre 2025 =C3=A0 13:59 +0800, Jianfeng Liu a =C3=A9cr=
it=C2=A0:
> Chromium does follow the spec when decoding 10bit videos[1], but that is
> still limited to hevc and vp9. For h264 and 8bit video chromium thinks
> this is unnecessary.

thanks for the pointer, that explains a lot my surprise and slight confusio=
n.
Now that you mention, on relevant chromebooks, 10bit is only supported with
HEVC/VP9 (perhaps AV1 too, not sure).

Nicolas

--=-UIrld9YNkFZl6dp2g3nc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaT13yAAKCRDZQZRRKWBy
9LN6AP9kt3JQwQSKEoywb4Qg0hb+LD5J49Oz477ei/ms73TjPAEAnpO8MiNpguWf
xh3DAL1jT5QsvfC8HyM/OGNutc5hKgM=
=HAJY
-----END PGP SIGNATURE-----

--=-UIrld9YNkFZl6dp2g3nc--

