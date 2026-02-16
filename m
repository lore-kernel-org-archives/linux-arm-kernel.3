Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DEDE81A40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=; b=lW7VjyptJ9FH0XcElLrAb19fX4
	Ifwed0SEAiIKEev3D1b19CCxiBKxvSZTcDq1SiYshOOnjo+jmSIuatT4xPuv1nla0rF3kHQN2HCgk
	jE9zvwcEmqjI0JQ4shFt2Y3Ojecgrls9vWNYTjEig4mrYZoLanlfbhuvK+aXPc5TpVKuYXCxf1LKT
	hnjhRe57K5W8atc9L+E5yxNFrIDiL0Ratlu54juDeYRFK35MWmy8tolcKr88yGbZqTgNb0XWj1aLs
	YwYqtsQkPRSS+zmhH02rbEaaZeEUNvAzCoa1QMR6U/vm/DJ8QToTAoV7NWbUtMzFQNwtzRFG88aVE
	6vZPEqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1I2-00000006zRw-36Wx;
	Mon, 16 Feb 2026 16:17:38 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Hz-00000006zR0-2wXH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:17:37 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8cb39f64348so286889385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1771258654; x=1771863454; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=;
        b=mMTteU2Ewpuw7RLnCU9QGkRU3K1EzI75oTIHseK2nbMsxyptI2bd7ZJhJ1qMdyHo5W
         T73gsoxEHeby/EIKj7cyQfwFjYKJJDTAGj+hOHzshhhsCLQNvLxDZXcve8fp5v8pNtAR
         94VYnAagO5/5yhHsngpYvL/nwwDVfdxszMIvFCYx5SSbWx9Q+h941Gq/H4feTni6jmDV
         T+exB2XQUJofKClZO3CwyOE795R7i3FnYooZ+2+QHuguOrvbNcGYchNiXrhrXCRSjXqw
         yTCnK4wAwdh7F+kyhR9ePsYkfqn6JwXefrBuzDyxLHCoVkqaEKK5UrkEAqXyJiLHhiSY
         sDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258654; x=1771863454;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=;
        b=wd+BWDTp64IlzZHVc4WXKv7p8HS/q38fIcvlEe96TnIJps6OLHpisghZlH+NRTmc03
         3LPMxldxvJrobRUKJuLnBCMUl17I9Be64KY+V3U3VkIyuv9SLk5XVfxKaePEGJy+JzRL
         V/PMINEW0gkjI5HRajxKs9qHR9WelSGkg0qW+gSGhi6CGn1d+ZwpVrKcuzdyjen5FkPm
         WYsGfDskIGfVFrg9KegO16IjLbz0TXbkCtSMEi6AOXrWKi6MN7h4If3KzJTxc8Oory9D
         t85IiVSsEnkhFjSmP1duuO30bkdg7XpcF3/arZwHFt84NMYmuJsO8YfUTjGnCDXM1v6Z
         sRhw==
X-Forwarded-Encrypted: i=1; AJvYcCVq11Dz5WjVkZAzIk/SdzJ/av/AEFNnIwHYKmZvpn8lAQPW01+Q4Uurd1udPTBhCk5GE+EBbGiycI8vBMgaR21o@lists.infradead.org
X-Gm-Message-State: AOJu0YzP1s9wvoaYS6Wvi+q9jvN//BRLF0MOQOU5XJbHnPEbSWopTo8E
	gN8/7vMSWZGwmNL46UDt4waI4jnQ0VL9l1Pgjdo5x7lhqFGOd0sAEnUBuRyw+c2lxEk=
X-Gm-Gg: AZuq6aKNTWWCGJ8RzYRNjEGPkgu+73da+2MjetlaQFIrKpRjLW7L5FM8NS/0v54nQ5c
	kMGbC3zMvyeb0cUj0gRO13nswCtV6FXoOkxMYrmYTFy+2uSpusPoDQMqLrhnDpoRuWiT/Oh2/ZG
	MMH8FOmZKsbkOaIngRi68bZ1CORefC/oQrsXGjALoDTSi6px967ywtKj7XgvBAdHIwG6J1xkH5s
	2tqMjPRMckQk92a1GEkVkDGauLpXgZrTxYoWrG9efDvdUIOBjbkHYPwC77UfH7nGKvZti0QMH7q
	VSeyHt0vp0d61oxiqNX4JA/CAhP+Mi44exqHCo6KKI6mEbwVW13WCC+L/p+L1e9138NvW+td3Xv
	Y8IWTOouikegMciNDkrHyau9A+cPS9AnicUUVXwArQnItrxhOKPrxB7xt76pFrfKtXn6/LYBcib
	VFHcVk8ZbaGzb2mLvw+8GfwQ4yxsc4
X-Received: by 2002:a05:620a:40c9:b0:8ca:105b:86b6 with SMTP id af79cd13be357-8cb409219e2mr1421526385a.88.1771258653567;
        Mon, 16 Feb 2026 08:17:33 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb4120f939sm883143485a.44.2026.02.16.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:17:32 -0800 (PST)
Message-ID: <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when
 compile testing for Hexagon
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Brian Cain <bcain@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	llvm@lists.linux.dev
Date: Mon, 16 Feb 2026 11:17:30 -0500
In-Reply-To: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
References: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-g0IOH3/wXifty34RwVB5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_081735_993357_06F9F150 
X-CRM114-Status: GOOD (  16.10  )
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


--=-g0IOH3/wXifty34RwVB5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 15:10 -0500, Nathan Chancellor a =
=C3=A9crit=C2=A0:
> Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> is further investigated and understood on the LLVM side [1], disable
> CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
>=20
> Link: https://github.com/llvm/llvm-project/issues/178535=C2=A0[1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/med=
ia/platform/rockchip/rkvdec/Kconfig
> index 5f3bdd848a2c..d03689464206 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> @@ -1,7 +1,8 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0config VIDEO_ROCKCHIP_VDEC
> =C2=A0	tristate "Rockchip Video Decoder driver"
> -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)

This is clearly not a pleasing change to make. As this specific data struct=
ure
and usage of bitfield has been discussed (along with the numerous issues in
clang/llvm around these). We also agreed to move away from bitfield for thi=
s
data structure and use a bitwriter. I would favour delaying this change to =
give
devs the time to port instead. Ping again if nothing moves within few weeks=
.

best regards,
Nicolas

> =C2=A0	depends on VIDEO_DEV
> =C2=A0	select MEDIA_CONTROLLER
> =C2=A0	select VIDEOBUF2_DMA_CONTIG
>=20
> ---
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
>=20
> Best regards,
> --=C2=A0=20
> Nathan Chancellor <nathan@kernel.org>
>=20

--=-g0IOH3/wXifty34RwVB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZNDGwAKCRDZQZRRKWBy
9PhBAPwMxt2qHIuuv8Re3nGYyjxclF1akWrq8joXpNiryhAGZQD8DZ31iVeXv3Jn
qIdzhD88lbsc2tAt4dDx0Aynb0/hEQw=
=AYDo
-----END PGP SIGNATURE-----

--=-g0IOH3/wXifty34RwVB5--

