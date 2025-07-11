Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADEFC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 21:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZi2rCdl13Itq2FYc/am7oHPt2a+dpwp2iEDHnh9MtI=; b=yjJyEHYqK0CQx7F1psrG4sEAnp
	0cKKkor0mBEtrPOLaeQhB21nr2Sv0cKlEHelGMXyfrepodyzXFRWmy5HYseYw0Ks+CQqe5J+ALqI/
	P25NYxfaGK6sfesjrhSZwPRTgB5sMgc4AELy767+Xq9e/vDCSD1iZ7QCUQ9vg7J9rgvt2rXRxuUgD
	wI3veGY/TKqhMmr45yKQzDaXaPaEzGQTdVYH2hKtWffJ1t9amYmUgWt8tF6lPkOsXvXXzlFwn9/zn
	4Nd9ELCdUNERdpc63jNtyBolYujT3WL+t6Fq/G/CC5YQv4WOc2PGqzf76pi3pDLAkdpiGSJZWjaTL
	JODMj8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKuW-0000000Frmt-3jYC;
	Fri, 11 Jul 2025 21:04:00 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJvH-0000000FkYw-2Nvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 20:00:44 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fad8b4c927so22164346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752264042; x=1752868842; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rZi2rCdl13Itq2FYc/am7oHPt2a+dpwp2iEDHnh9MtI=;
        b=qNgzsADUoeY87sfd3/PHynQCKKYcA2SyaeUxdwLp1t+Id8LboEZgUVAkkwKyJKmDfn
         ClklQopvNIpK/obf5fmVKsEswKuD3N17Q2jVLfCPiKz60QA/xGjRbnuakkMNb+jZhMdB
         krdXToKPdJHz0W2l711plxr5H2YSTjNzrnJB9Piqe+TRFyDB41vrhNO2Z9QclV3XVnmL
         JYmxKhR6Zo0YZXiERLeKCcOq3Gh23d1uLXXddNYrR6+3/K+d32VXhGTv2YyrN3cc8Zwi
         WyVJ9mA9YFBEjOIjqjAhn3vC5UsFCl31KYE6epuTC8deLdsI4xTXfk5352jJ8VnghIjX
         93OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752264042; x=1752868842;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZi2rCdl13Itq2FYc/am7oHPt2a+dpwp2iEDHnh9MtI=;
        b=mGYKcElvgjo0Y42aNATmz5Xtkz8doIGQaUjL/+R+yGGml2jmzM2QsaXEnSd/FcilSF
         U4UvGZQvDoM1KnehNOOL4/RwMaL+rxGWMj7MTy7dbAe73wntEGC2jZIXf/qJbmWvUEPp
         IOeLvc8ATJ8NH1rlhnLouZ+jzHBssQwkGsSnk85+aNJUKRYulFfbrzU8iAAjuuCZHx3k
         +9trSLN/SkpMhFnOlj2ekhO8Twk4+dSfKVmhOUKj+WhUUdjLMNygvjCyeGcp7ztWeF8o
         0xlhD6qjq3AD3+XgS4UCrfat6rwFmDjbCZ9KqdnEzi6pI8NhqyIHGnqx6x5xFRQtUUHc
         6nOw==
X-Forwarded-Encrypted: i=1; AJvYcCUMiPrl1ikXPnYHzqPg2/kIB1JYb90y1nAILfw6aWoq0YKgCplnXD6v10fPBtaDOjK5Vn5XNIKmYN5/iUhL4ZjR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfb+W22NZ/BKS+Ui2y+8mSHZx6BXHOJFoyYOYL2vD7MSDCiCWz
	NHYbhUckMloE119mrPH9lJSPVP7m0IX/2cAN6gHhWJPoYPMFry4sSO5SHrmDeBqEOW4=
X-Gm-Gg: ASbGncuJ+7KQVQxm8EkLB9K9Nm99r6Xi36HDnbejl9hkvH6v4CLuV+u8/w6ClXqbwVy
	6GUOx4ThOmpRzSM0jn37BW71dqEwZyj70YxH7keRNEhcZLDiq2vMKhHWrQDAB85fXi4bisdOcdw
	WamWtwtPOfdtHv+1yC2oRJSjtU4sqh0FFVtpH6dyW0hXuKa077Ginw5tsUbY47nEHfLSbS6fAZh
	0F6VVjbt4eHwD/z+YVM68HVqGjgHED6q7+Vv/Bn6xsfFsnbK8XjVPRx1n3N7AstIBaOH6VZUQ0H
	yCHas7B1U86zvYc0HapldCiAlr3aBU8Go28xQZYQ6vD6kCh5IyEPV8iVqzydK0/HYexkJftt4Ox
	u0NYx6RcnJs02zjb/csYXIpGFvWs=
X-Google-Smtp-Source: AGHT+IGM+1hSBakMhrLaq9WY4U9uml++QAtwf0AFvIykTUocyfI+3+molPmoYEJFzOkqT6FmQrqWMw==
X-Received: by 2002:a05:6214:2e92:b0:704:a592:490b with SMTP id 6a1803df08f44-704a592491emr63860896d6.37.1752264042280;
        Fri, 11 Jul 2025 13:00:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e874sm23334306d6.18.2025.07.11.13.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 13:00:41 -0700 (PDT)
Message-ID: <1f36e0e642a1554f4661f122f7d525d5677ce1df.camel@ndufresne.ca>
Subject: Re: [PATCH 7/8] media: rkvdec: Remove TODO file
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel	 <sebastian.reichel@collabora.com>, Cristian Ciocaltea	
 <cristian.ciocaltea@collabora.com>, Alexey Charkov <alchark@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu
 <liujianfeng1994@gmail.com>, Nicolas Frattaroli	
 <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>,
  Andy Yan <andy.yan@rock-chips.com>, Frank Wang
 <frank.wang@rock-chips.com>, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,  Yunke Cao
 <yunkec@google.com>, linux-media@vger.kernel.org, kernel@collabora.com
Date: Fri, 11 Jul 2025 16:00:39 -0400
In-Reply-To: <20250623160722.55938-8-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
	 <20250623160722.55938-8-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KQw6nRLQn0EVg5xyIuZ/"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_130043_609139_8D6C5F82 
X-CRM114-Status: GOOD (  21.39  )
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


--=-KQw6nRLQn0EVg5xyIuZ/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 12:07 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> 2 items are present in the TODO file:
> =C2=A0- HEVC support
> =C2=A0- Evaluate adding helper for rkvdec_request_validate
>=20
> Missing HEVC support is not a reason for a driver to be in staging,
> support for different features of the hardware can be added in drivers
> in the main tree.
>=20
> The rkvdec_request_validate function was simplified in
> commit 54676d5f5630 ("media: rkvdec: Do not require all controls to be pr=
esent
> in every request")
> by not setting controls that have not changed.
> As it now basically just calls vb2_request_validate(), there is no need
> for a helper.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/staging/media/rkvdec/TODO | 11 -----------
> =C2=A01 file changed, 11 deletions(-)
> =C2=A0delete mode 100644 drivers/staging/media/rkvdec/TODO
>=20
> diff --git a/drivers/staging/media/rkvdec/TODO
> b/drivers/staging/media/rkvdec/TODO
> deleted file mode 100644
> index 2c0779383276e..0000000000000
> --- a/drivers/staging/media/rkvdec/TODO
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -* Support for HEVC is planned for this driver.
> -
> -=C2=A0 Given the V4L controls for that CODEC will be part of
> -=C2=A0 the uABI, it will be required to have the driver in staging.
> -
> -=C2=A0 For this reason, we are keeping this driver in staging for now.
> -
> -* Evaluate introducing a helper to consolidate duplicated
> -=C2=A0 code in rkvdec_request_validate and cedrus_request_validate.
> -=C2=A0 The helper needs to the driver private data associated with
> -=C2=A0 the videobuf2 queue, from a media request.

--=-KQw6nRLQn0EVg5xyIuZ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaHFtaAAKCRDZQZRRKWBy
9F41AP99Ssroc2Ugv8H1VwcSMEFKHPQNBb3wYyF+ksoPrbKbdAD/RUUvTpWPsDfz
ldKo4ficYUoAy5UZisMdhE0ngURfwg4=
=tW+S
-----END PGP SIGNATURE-----

--=-KQw6nRLQn0EVg5xyIuZ/--

