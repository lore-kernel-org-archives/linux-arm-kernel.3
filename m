Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnoRRDhtGSOPAPWiKhq8LlJyfNIEUB0lnKlvZ+LO7jU=; b=gmbC6BOQea0MTQlb5HEXY4LX5b
	FYffQZxmlp3o/hFLeh7C+PqwEtBiRVzYoK/xRm6UZ9YsKhRletmlZFkC/X0+w+mPDq3daJPdZTCPw
	iADGKq3tXyEoxUjaJ4OIgvNHDvFUg5ZaNEb7QMTOdS2dA0mCYr95dHS4ZDC2CJQdkBukCqlHxMu8t
	eNP2bhEArP5tV61dQiX5MT+tNofivzjr2YnnXB8TwjpmiFBV/kTgad5w2MapaxUY3QZryHPPkycZ5
	LANiu87TRCnL3DJoNGzwuHgyncGpf03H3eBrPfFT1Y0/4OoUJwT0WUy/pIuf+pY0FnYihmNsvTsNZ
	w4KCRFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLm2-0000000FvPO-2S3J;
	Fri, 11 Jul 2025 21:59:18 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJwm-0000000FkoW-15td
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 20:02:17 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4a58d95ea53so31203121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752264135; x=1752868935; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CnoRRDhtGSOPAPWiKhq8LlJyfNIEUB0lnKlvZ+LO7jU=;
        b=1HYUFcO16dth0IYdoFQ61IO7+BEWhGud5e7/W3vyoCUsxh/L3L+3Vizi1DbzdMR9BE
         9DlDEeMIO19205E8ymSkH231iICmq85mqKqFlvPAyfIRa50s9J/+kH9kYS9Spm6ohU0F
         WYc44Vq83j/JyTKvsDLh9W/ZTlCHM/AhGam1KTLAxd39yHp5cFVICIRSAqFxOoTrPSGG
         vaSBY/tGRus+rSAUccZUHIWgzsjcVRcSOPqWdlupkLAeRTqgvZntY/Q+ayscCG+Vu+AK
         2rvCszXTJOVpKtdlbqdXpA2Q1uWdqFGOyFGsbW4/GqPR3viH8xk7LCN+8zfqstYkAmZQ
         DRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752264135; x=1752868935;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnoRRDhtGSOPAPWiKhq8LlJyfNIEUB0lnKlvZ+LO7jU=;
        b=ilxxRFBZkOethjCPEi37CkLy1KwP2PPEstsggqUHDq/Fv1MGEF6ugdo3bkxYiJ0kPj
         C+yeRJMgVJjXXdL1v/kA9evDaOSQ52GDNtPuOhQNH/2Laj+rZ6PK5LENx2CIF6ANhLFt
         kt4joHSSsU8J4BUEKrma41nxfHMXNDjnNRq6xH9J32IQEpWfwKSKoDhNhPXIv+K8ijRF
         wIBtwSTSwAHUTAHrs6t729LZSlX2IFFr1a6Hv1mZutMWKePF8vU0LqP9dkZahKOTRAbe
         UQR8aFv7px7MzOyx8JkITJ7I+vfywhIY5rFiNWY9Ouj//bHHjCsdVBpAe347PV8CIFKu
         ibdA==
X-Forwarded-Encrypted: i=1; AJvYcCWZUDuALWw/kd9fUEOAz8RdmnDO8QyqA6Gf04f4pNGi/MpZ6//mdK+RvRwSb8WXoIkuM2KiaaCRpBhR3Zg5aVN+@lists.infradead.org
X-Gm-Message-State: AOJu0YzXETFV0nQIf2+jEzD8i+uOqntpMhT+IbTZbo63OwzPiDQA1MYK
	GXkLceGdDr5yzTfJ1wB/FSZmg+hVjV6ARIQb1PcSHXkjXqCBWgY/2MO9rnaW4yoiRao=
X-Gm-Gg: ASbGncsg4lVORp4lP0HYbh3uoR5WB0ZvrxHsJvHMuztp7FDdyUH9SCE7uQAwwdURtvB
	sn6jrccjpYHIAyxRYRI0ejAM0cxRMwZekKyJxw43O4yaDM26ehcMVHLQHGSuAdaaskKrx6N5tQz
	NLRC7bDjGMDXvJxRiL4KwTnj8X45UdRfcJoEvCM7WQMHGSxTPzGoAVpH5z625OMEmXnxWqavuyU
	1B+HHz4HEiTwyq3Yio1Lj6EwPpp3esQnV6EZ0ZxKnGuExLTJmj504iczynC5R6owdANieM68psE
	Uj1Fs2ylCAQlWKy8phjj2PpvY9Qqbe/dJn3/8KQn6biomt7cDuVzj+VMgb8T04UBa19MqzR3L+z
	v4e8oaaYRXsaK5Wp/qZOBE8vPbpqSRSALY55X5A==
X-Google-Smtp-Source: AGHT+IEuLOxF/UAqwKLexQXJclEkYrpc7aYrRvWVeUsA+st+Tdi3sBUDzBI9yFbWLfbip40hyoxWTg==
X-Received: by 2002:a05:622a:a38c:b0:4ab:37d7:c3c2 with SMTP id d75a77b69052e-4ab37d7c5b1mr34888811cf.14.1752264135009;
        Fri, 11 Jul 2025 13:02:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edefb923sm24313601cf.75.2025.07.11.13.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 13:02:13 -0700 (PDT)
Message-ID: <447205bfe4089eb6231fa17a1fff3d58806ec7d3.camel@ndufresne.ca>
Subject: Re: [PATCH 8/8] media: rkvdec: Unstage the driver
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
Date: Fri, 11 Jul 2025 16:02:11 -0400
In-Reply-To: <20250623160722.55938-9-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
	 <20250623160722.55938-9-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-TRLqz3hiMlUTgCc1wc3h"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_130216_305676_E5C42236 
X-CRM114-Status: GOOD (  16.27  )
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


--=-TRLqz3hiMlUTgCc1wc3h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 12:07 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> The TODO list for unstaging being empty, the driver can now be moved to t=
he
> main media folder.
>=20
> Also add myself as maintainer.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
8 ++++++++
> =C2=A0drivers/media/platform/rockchip/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 +
> =C2=A0drivers/media/platform/rockchip/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/Kconfig=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/Makefile=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0.../platform/rockchip}/rkvdec/rkvdec-h264.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../platform/rockchip}/rkvdec/rkvdec-regs.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/rkvdec-vp9.c | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/rkvdec.c=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0.../media =3D> media/platform/rockchip}/rkvdec/rkvdec.h=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
> =C2=A0drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
> =C2=A012 files changed, 10 insertions(+), 3 deletions(-)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
Kconfig
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
Makefile
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec-
> h264.c (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec-
> regs.h (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec-vp9.c
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec.c
> (100%)
> =C2=A0rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/=
rkvdec.h
> (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3f7fbd0d67af..d05a153c21526 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21466,6 +21466,14 @@ S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
> =C2=A0F:	drivers/media/platform/rockchip/rga/
> =C2=A0
> +ROCKCHIP RKVDEC VIDEO DECODER DRIVER
> +M:	Detlev Casanova <detlev.casanova@collabora.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +F:	drivers/media/platform/rockchip/rkvdec/
> +
> =C2=A0ROCKCHIP RK3308 INTERNAL AUDIO CODEC
> =C2=A0M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> =C2=A0S:	Maintained
> diff --git a/drivers/media/platform/rockchip/Kconfig
> b/drivers/media/platform/rockchip/Kconfig
> index b41d3960c1b41..9bbeec4996aa2 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -4,3 +4,4 @@ comment "Rockchip media platform drivers"
> =C2=A0
> =C2=A0source "drivers/media/platform/rockchip/rga/Kconfig"
> =C2=A0source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> +source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile
> b/drivers/media/platform/rockchip/Makefile
> index 4f782b876ac9b..286dc5c53f7e1 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,3 +1,4 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0obj-y +=3D rga/
> =C2=A0obj-y +=3D rkisp1/
> +obj-y +=3D rkvdec/
> diff --git a/drivers/staging/media/rkvdec/Kconfig
> b/drivers/media/platform/rockchip/rkvdec/Kconfig
> similarity index 100%
> rename from drivers/staging/media/rkvdec/Kconfig
> rename to drivers/media/platform/rockchip/rkvdec/Kconfig
> diff --git a/drivers/staging/media/rkvdec/Makefile
> b/drivers/media/platform/rockchip/rkvdec/Makefile
> similarity index 100%
> rename from drivers/staging/media/rkvdec/Makefile
> rename to drivers/media/platform/rockchip/rkvdec/Makefile
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec-h264.c
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> diff --git a/drivers/staging/media/rkvdec/rkvdec-regs.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec-regs.h
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec-vp9.c
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec.c
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec.c
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> similarity index 100%
> rename from drivers/staging/media/rkvdec/rkvdec.h
> rename to drivers/media/platform/rockchip/rkvdec/rkvdec.h
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfi=
g
> index b442148543995..b9d52a51841b5 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -32,8 +32,6 @@ source "drivers/staging/media/max96712/Kconfig"
> =C2=A0
> =C2=A0source "drivers/staging/media/meson/vdec/Kconfig"
> =C2=A0
> -source "drivers/staging/media/rkvdec/Kconfig"
> -
> =C2=A0source "drivers/staging/media/starfive/Kconfig"
> =C2=A0
> =C2=A0source "drivers/staging/media/sunxi/Kconfig"
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makef=
ile
> index ad4e9619a9e07..102ca632ddf5c 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -4,7 +4,6 @@ obj-$(CONFIG_INTEL_ATOMISP)=C2=A0=C2=A0=C2=A0=C2=A0 +=3D =
atomisp/
> =C2=A0obj-$(CONFIG_VIDEO_IMX_MEDIA)	+=3D imx/
> =C2=A0obj-$(CONFIG_VIDEO_MAX96712)	+=3D max96712/
> =C2=A0obj-$(CONFIG_VIDEO_MESON_VDEC)	+=3D meson/vdec/
> -obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+=3D rkvdec/
> =C2=A0obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+=3D starfive/
> =C2=A0obj-$(CONFIG_VIDEO_SUNXI)	+=3D sunxi/
> =C2=A0obj-$(CONFIG_VIDEO_TEGRA)	+=3D tegra-video/

--=-TRLqz3hiMlUTgCc1wc3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaHFtwwAKCRDZQZRRKWBy
9D0OAQDCzPQPG7xg4OYY8o6mQuA7YYMPvLnXfsqOsELbI81nggEAn4NKzS6Zv5SL
gInU8ELc0LBcICoE9Vc3ZGnrhMUvzQo=
=TPsc
-----END PGP SIGNATURE-----

--=-TRLqz3hiMlUTgCc1wc3h--

