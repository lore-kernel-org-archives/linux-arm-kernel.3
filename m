Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch7TyWwa1EZJeBseqB4xaWFqVYs5eXriLyyqsfuTad8=; b=X9WBMV9rlWhfwX0cPN5ays8BQx
	N87M/hzCfFMqdtSBz8KlVpP01geQEtjKD6qoYBUN4IrXVepn3p7pwETzyE1ircoeFO7xsHbxb17Pw
	aWdEVxPmeBawyrO0Jns/wQS86N+lcvjZLpsyMBhEuxI3OzkVxArVt1v4nZrdU78ddaKfshpj/QSDz
	G00sC53tvEs6lWopBNwJrjZ6t/+HIMFklNJ0ph7TWpU0/m5cOYJCp8LuuvoyQXjUwEVHloOhfN6M9
	XKlNva0/WIJSj1WcssFHQkokcMgkNVr7sLz2Sd/YA/EWcXbq6n+twspQMbggCQQiLk06yHG2stdE+
	9jrO8i2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C4m-00000002WuU-0DH8;
	Tue, 07 Oct 2025 18:06:16 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C4h-00000002WtD-0PWZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:06:15 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-854fcb187b2so757995585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759860369; x=1760465169; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ch7TyWwa1EZJeBseqB4xaWFqVYs5eXriLyyqsfuTad8=;
        b=E+9VOS3kfA02hqOAmJfeuppKm8mBII3fasDyr2o4AnbpfprfY46RqM4XWNZNfI2BHz
         3tJSLXVM3AtlvLb9HuKjmdmTEraT6YvowXqkOo8VD9ito16ec1/ywrzyJd3yJZxzs7+q
         Cd6CJrba51Z4TLAQely6rcOsE3Ne2YS0zT/6tW8iQnLJCXHJaeLsZu1sn8pgHH9Fvc3u
         /Vw5z6IKYliV/UoSEgcvkxLBGO4Xll2Uf0Mi7M/7wQOATyGXa/CxZX/YNfcp7jS2+wpz
         22kf6VTP6ghBpWBMNad8gx+U7Ddh3bw4VZ6FJyHDQPZctBuySGg2Pn8sG2c6o/OrgWoV
         00kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860369; x=1760465169;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch7TyWwa1EZJeBseqB4xaWFqVYs5eXriLyyqsfuTad8=;
        b=ThAJwlzcFdqzJ6gXpVLY1uX0F5atW4f16Ec/7PYzKdoupcFJkR3BmkrKYegmbjLjgf
         N1gLlalsLl7TfpvD1YvvRdC52UkbTYmYv2jS3KLvqD9PX+lHXxrTdQfVJnKZRbQbL825
         FKV+KpDeFrcUPojGmWpemBOicE7l6nQHONcrwN37nfLeAA40SYz5WAJNgA+RAw5wdi29
         Ig+qJFxTNBiKZnr9/COeF2hLw/mR0UhUmgnMWCbLg4/xnqEAXV/3wUhVlSRAhVux2+C4
         nKWFgeTCf5VlMTkjzHPbMcnDVDCdbpnAD4r225UtA128MtZRvETfkSiMCfBMInGlf1+Y
         eTZA==
X-Forwarded-Encrypted: i=1; AJvYcCUBsrSrIxryQe3xCqgIOpa0XZb2RLfyBytVz1zN7zuxJqAichCFBuK0klbJ5JcEl+f0yTibsAcoipXjTdAHEs2d@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9nWVt4S6PaCZ1UDNxdH+SedTrofyoYSODO9sDZ25TZqKSd2cj
	eJ2HkuZkUp6Zfq4ecz8CQPqDmsoSGuLH8MyYd7qFK+sg1xPA5mw/Nn4J22xMPmiZXkiOrvoLOTb
	nh4o2
X-Gm-Gg: ASbGncsn9zY+rHgqkDi6vO00zS2BLBLjImvAofRvu+Mi3V1LS+4E+WsVmAb/uDRgqMR
	e7F+N+nv7NyhEs/3AYnTQgHa6hALrKrx1fsovyI/THKBTI3lFhNBb0mlwiIuYJaYSML8hQCuHXm
	hR3ToGntIr1Hq1uz+VP7vQGYbLyJdZkA7v/PD2PQ5xz3xr6bO45uWp4efqNg4Ys5B6e2dfucYg1
	Z9muRjNJo+b76RRiPkmRHQxb+X9sU/rWrT7stqMlObUkJWtDylipvt30MpSIlmUMHIMvIqXFZ8R
	4cN4eNLPG/SZXIrABvk8RgVfE4ZYTOHPu1wWbszf9sa3h+pjfCH44cZYKT3olh4b2QxVwaxEziK
	lh9+gUW73ELSMKxFT3cuBUnovVkIL+iimcftgKbTfrKCqfq6907aAHOrH/fL6824=
X-Google-Smtp-Source: AGHT+IEd8+PaBlkFCf4TWlgW17RetR7onOYSu6eacanLHMSo1S6DckxwyV/Bqe+3v64BuZQrTcO0Vg==
X-Received: by 2002:a05:620a:4891:b0:860:a923:c114 with SMTP id af79cd13be357-8835088d4e8mr120315085a.26.1759860369140;
        Tue, 07 Oct 2025 11:06:09 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877796a1de6sm1488995285a.49.2025.10.07.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:06:08 -0700 (PDT)
Message-ID: <3c62e3c837d534ef5bc21a95ec1dc408c38cb8a0.camel@ndufresne.ca>
Subject: Re: [PATCH 00/16] media: platform: rga: Add RGA3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:06:06 -0400
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-IcsCjmyMK96ZjT/TchVY"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_110611_410410_9EB6EA4E 
X-CRM114-Status: GOOD (  29.29  )
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


--=-IcsCjmyMK96ZjT/TchVY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 10:31 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> peripheral, which is included in the RK3588 SoC. Unlike the RGA2 it
> can use the existing rockchip-iommu-v2 driver to handle iommu mappings.
> Also the RK3588 contains two independent RGA3 cores.

Thanks for working on this.

>=20
> Only scaling and format conversions between common 8bit RGB/YUV formats
> are implemented. Also the color space conversion is fixed to BT601F.
> This already allows a practical usage of the RGA3.

This seems quite limiting, can we expect an update on this, can't be that h=
ard
to fully implement.

>=20
> This was tested on a Radxa Rock 5T. With the increased clock speeds in
> the devicetree around 160 fps were measured when scaling and converting

This is quite vague, I've checked the patch and you didn't extend either th=
ere.
Is that an overclock or was it miss-configured ? Does RK implement a devfre=
q ?
Should that be moved with a voltage adjustement ? Is there any thermal near=
by we
should monitor ?

> from RGBA 480x360 to NV12 3840x2160. Without the clock speed scaling a
> default clock division factor of 2 is used and only around 80 fps are
> reached with one core. The v4l2-compliance tests only complain about
> the already failing colorspace propagation:


Did you do any more format testing to validation all supported combinations=
 ?
This is a tool [0] you can use to test this using GStreamer and how to use =
it
[1].


[0] https://gitlab.collabora.com/mediatek/aiot/lava-test-definitions/-/tree=
/main/avvideocompare?ref_type=3Dheads
[1] https://gitlab.collabora.com/mediatek/aiot/linux/-/blob/mediatek-next/.=
gitlab-ci.yml?ref_type=3Dheads#L282
>=20
> =C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> =C2=A0 ...
> =C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
=3D
> col
> =C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> =C2=A0 ...
> =C2=A0 Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Fail=
ed: 1,
> Warnings: 0
>=20
> =C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> =C2=A0 ...
> =C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
=3D
> col
> =C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> =C2=A0 ...
> =C2=A0 Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Fail=
ed: 1,
> Warnings: 0
>=20
> =C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> =C2=A0 ...
> =C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
=3D
> col
> =C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> =C2=A0 ...
> =C2=A0 Total for rockchip-rga device /dev/video2: 47, Succeeded: 46, Fail=
ed: 1,
> Warnings: 0
>=20
> Each RGA core is a separate /dev/video device. To distinguish the RGA2
> core from the RGA3 cores the Card type is set accordingly. Combining all
> cores into a single device and scheduling tasks to the best core might
> be a future improvement, if it is desired by upstream to handle the
> scheduling and selection in kernel space.

It took me some time to understand why you spoke about multicore here. You
forgot to say here that you add RGA3 into RGA2 driver. Some information on =
why
you went that path instead of a separate driver.

=46rom high level view, I don't think its a good idea to multi-plex over
heterogeneous core. They may not even produce the exact same pixels for the=
 same
operation. They also don't share the same MMU, and at first glance, the use=
 of
rkiommu in RGA3 means it can no longer handle CPU cache (though I don't kno=
w if
this is implemented/supported in upstream RGA2 driver).

>=20
> Patch 1-2 are general cleanups
> Patch 3-12 prepare the rga driver for the RGA3
> Patch 13 documments the RGA3 compatible value
> Patch 14 adds the RGA3 cores to the rk3588 dtsi
> Patch 15 increases the RGA3 core clock speeds
> Patch 16 adds RGA3 support to the rga driver
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> Sven P=C3=BCschel (16):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use clk_bulk api
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use stride for offse=
t calculation
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: align stride to 16 b=
ytes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: move hw specific par=
ts to a dedicated struct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use card type to spe=
cify rga type
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: change offset to dma=
_addresses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: support external iom=
mus
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: remove size from rga=
_frame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: remove stride from r=
ga_frame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: move rga_fmt to rga-=
hw.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: add iommu restore fu=
nction
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: handle error interru=
pt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: dt-bindings: media: rockchip-rga: a=
dd rockchip,rk3588-rga3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: rockchip: add rga3 dt nodes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: rockchip: increase rga3 clock =
speed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: add rga3 support
>=20
> =C2=A0.../devicetree/bindings/media/rockchip-rga.yaml=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A0arch/arm64/boot/dts/rockchip/rk3588-base.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 50 +++
> =C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 78 ++--
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 356 ++++++++++++---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 404 ++++++-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++--
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 490
> +++++++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 186 ++++++++
> =C2=A010 files changed, 1246 insertions(+), 410 deletions(-)
> ---
> base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
> change-id: 20251001-spu-rga3-8a00e018b120
>=20
> Best regards,

--=-IcsCjmyMK96ZjT/TchVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVWjgAKCRDZQZRRKWBy
9MYwAQDAFCIsXy2vnCz1b/y+9mKp3XI/R9oRTPcTXia35pLGywD/SLpU/azQOYuj
Eq4VTAEBMAbKxVFBtmRPL+5Gb/F4cAg=
=pSPZ
-----END PGP SIGNATURE-----

--=-IcsCjmyMK96ZjT/TchVY--

