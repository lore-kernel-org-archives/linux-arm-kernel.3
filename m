Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F92CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyqYBk39edhoU3hvwcDq4RniKRvu8ih3vY+jGbKyhzg=; b=Zo88vumemVfBHO7lBGtaFb/1rF
	xWQGZR71Cx5d7VySNu1pBxVFvQ7OBw7CrOorH9KqVN3xvJl4fWQ5kifVRniVpHVMGwTt7qi7kDMEE
	kXkktcwO8eOJ26xtO6id3GiWDi4xfLi4GtrzWxFWucyeQET99l3t4kVApuN2YgtXrL9x9QtTcIJJG
	CBI/dxFVMQNQmOt2LxOIn5vRT1HVMJak06WMjB7Mh0NXBIOJKHG27Qk2bHxvOUhO4uY/XrSQ+q1Ct
	VKEN15d1PUmRJINSCWS+lVr+FQeRHUWviFTKVi4b0fBoTX1uXYehnLVGl6u/HB2rSsjKfnME5jwdW
	yOXsoggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CpS-00000002d2o-2ANP;
	Tue, 07 Oct 2025 18:54:30 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CpP-00000002d26-3PQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:54:28 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-7957e2f6ba8so64839726d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759863266; x=1760468066; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fyqYBk39edhoU3hvwcDq4RniKRvu8ih3vY+jGbKyhzg=;
        b=kSYs1Dnd9r0N7pVfYEk9l8YgccXb8XWaK4L7+zOJXG6pN2qCinqy7q4K47+YXcpDuW
         gIAaWlUMFvUSkTgMn6moRN+ecGrjizGK/hH0tQ+aZYDkyVlFD5dVy8huG8zB4tbA4rQI
         pI0+h06pZvffmnfmUO0yk/Bk68GU3aJtxsi9PakOxBGoLjJaNGr9W2PuqSRukCYVd4is
         d4ejt/ayART3Ir3aso01O/qTp3gR3rsPGeGEfZ/annEp5Sbbla6UQrZovFy3BM4aw9WE
         qcwR5fVhVkc6thMquaYLuAgcRZ+DXaPyOJqwLYBsB+BYsXv6+CWgCd24rYG1DRfwPo6h
         gHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863266; x=1760468066;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyqYBk39edhoU3hvwcDq4RniKRvu8ih3vY+jGbKyhzg=;
        b=a8+FmkXy8XC+eqW5X7Cayxju9lOnN7zXUExA9exaFO4mbNq2t+Bu9jn/bMbq2TsANW
         XJpzChTQpdUucOZaEuC0yWjk89IQHBYfIgXG8aPu/mK7TAY1GTP7zuybuSMmWCEMi4wp
         AZjTmVeI4PZLkr3dcakwZSTLhVUAaPvilKz86C3ZRj6FmEJjzsRjCklqGiOfdWIK3tU4
         BYeFADqWRxDofZ58TIV7GcttAIAMCLXHHVmckwxAkW4/Jvubb7gB2t+ymjniVytb0Md4
         NJgDYznvRlGV6P8ZCXSPfW6OFtyrp1f5AsocLj03szLE9JJyciz1QxQfZwtUUmdRiy1h
         UODA==
X-Forwarded-Encrypted: i=1; AJvYcCVQbbKADHtuZcZ3cOIcQaHsDVLXkfvX6GXH1V3A3CMwbol/CSpEr/RteaDY7Qdh7A0kiVJFfPrIlS3CGwxSbIeQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwAogIJ1NTgctnw9jxYRObB/DShtf7b8yjL3NkrQk4lVmh8y+Pe
	DVOQVHYMdX1k4bK9sWYM4mDmPAExTZicVyLYCKULUjTKvvyhSwOcUP82R/Y3sv1hPwU=
X-Gm-Gg: ASbGncvMUowB7xLLdqcxAFYqAlC/aP32WqXptiGkHrxjf5RoRB2emGZiD1mbtaDu2pP
	Qy0M4VrlvoUQq+b7u+JmKV2hcwmAPPepfHlwc+qWc3Tg10URhgTu6oSZmxA9D3bjTd0w3LYHQw+
	FSZN64C2dXUETUCFrYaWP44TRVu93byUfhj2HlMCQQVnFNqj9csp/JZujHDqRk4FOG+zkbJTAjk
	rYsymyjRE5nRD63WTJWMS9IdwuZQewCuV3v2cPo1woHNPoqtX5Bh/q1wkQSNp/HToFwihL1LTg+
	wkDbS64G9b4RRq8tuzSRju+GsDt9/swynckNjXJyIN1kAoe9iOLgZvGJZq8np3LANMSs3KmFzH8
	er94yUM1xjbzJPQArJ/BUgpms0wytomaHFZQrFvT927AEt2QB2oJJ
X-Google-Smtp-Source: AGHT+IEixUIOgl0MCHeaJ3U9YoVpppcjNIJi8FhlBiYJXzIZViLBMX0i5qQwH5C+bK/YoahAmV9Giw==
X-Received: by 2002:a05:6214:5012:b0:879:db53:df0 with SMTP id 6a1803df08f44-87b2efe7106mr6252686d6.46.1759863266399;
        Tue, 07 Oct 2025 11:54:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61f6bcsm146805896d6.65.2025.10.07.11.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:54:25 -0700 (PDT)
Message-ID: <46a1915e81b027d1c344eed0477683dd3a68d810.camel@ndufresne.ca>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sven =?ISO-8859-1?Q?P=FCschel?=	
 <s.pueschel@pengutronix.de>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:54:24 -0400
In-Reply-To: <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
	 <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-I9QXmLgSnsRRCh9PPEnb"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_115427_850474_3DC78DB5 
X-CRM114-Status: GOOD (  22.32  )
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


--=-I9QXmLgSnsRRCh9PPEnb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Le mardi 07 octobre 2025 =C3=A0 17:39 +0900, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 07/10/2025 17:32, Sven P=C3=BCschel wrote:
> > Add support for the RGA3 unit contained in the RK3588.
> >=20
> > Only a basic feature set consisting of scaling and color conversion is
> > implemented. Advanced features like rotation and cropping will just be
> > ignored. Also the BT601F color space conversion is currently hard coded=
.
> >=20
> > The register address defines were copied from the
> > vendor Rockchip kernel sources and slightly adjusted to not start at 0
> > again for the cmd registers.
> >=20
> > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > ---
> > =C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0 |=C2=A0=C2=A0 =
2 +-
> > =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 4 +
> > =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c | 490
> > ++++++++++++++++++++++++++
> > =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h | 186 ++++++++++
> > =C2=A05 files changed, 682 insertions(+), 2 deletions(-)
>=20
> Your order of patches is a mess. DTS cannot be in the middle. In fact,
> DTS should not be even in this patchset, because you are targeting media.

Indeed, order is broken, though I do appreciate having the DTS as part of t=
he
submission, this way I don't have to chase for them when testing. That bein=
g
said, a link or message ID in the cover later would be as good.

Nicolas

>=20
> Best regards,
> Krzysztof

--=-I9QXmLgSnsRRCh9PPEnb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVh4AAKCRDZQZRRKWBy
9O1JAQCgbiRyx2yEWIDJARh2LE+kwcz/R5TwyiD48kcAsBRc3gEAj9DcD7rTLpzu
68L0DpQYyIRrsE94HVozLhgCExOv9gk=
=P0io
-----END PGP SIGNATURE-----

--=-I9QXmLgSnsRRCh9PPEnb--

