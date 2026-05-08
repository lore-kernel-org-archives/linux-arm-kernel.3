Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00DDCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/zTtdaa1YwQ9yyHYoxpW5OZucW0IdF0NOBd+0VGB5E=; b=wvIy2hlIJMlXd97aeE31VMpZKx
	9Cvgg/AwXJvD5z+5HZ39RKcsG7jjRDaClI5G8ACoKJVaDBnn8gCt/QcnAtKYRhLNq71klSCJSSwuX
	agDiOuWOrub0ky6b505EdQoqlak6Nmr3aFq75cvxb8c0K5i68QpPKIAzOp9Rbj/ezg5hLn38zwAFs
	z/1pYNs77rNYzHEV+z2YSmVHRT89F1MgJHKaJL0OQyj1AdNUYnrnzY7TtEsWjZKQ6C1g7Jgx20jSQ
	sHgYdG1uw+2q3bF3w5JTpzT2M8MRpPr6ry3zJ2x+Aa5f3VG6xqwazpXDh/u6oF0y8CtNBoichVGRE
	NSuzrusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSTn-00000007WNP-3C3K;
	Fri, 08 May 2026 21:11:27 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSTk-00000007WMa-2MB0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:11:26 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51306c9f2e1so23469931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778274683; x=1778879483; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/zTtdaa1YwQ9yyHYoxpW5OZucW0IdF0NOBd+0VGB5E=;
        b=keuO9/KkAfdBNIXm2RJdOFzrWkMlFR2cY2EuE4gtUCROoaIEykKz4WCPuSqBVd+i3t
         I2B0R4teEc8U+h0bShHvp3Rdtlm/rKxnlth0T/BUbCdALrrcLD2xgMvaSsCd3kgpMWHJ
         tXOrr9Mh0OTrNjeq/wVdbP4y/mqsC+6FgZ7vBcu3E69p300UHLWVmsTtlVkqXbxZRBqk
         7Rt7teTqFISUsLjHFjIvg3vEtTQYrcNERCk8/YhNO7CqWoDr2ta+U4vUMFD2X1l6K+zu
         wAFl8IRf1HEc/CAb0m2v5oG6YH1K2lmZU85cZUX0E5uHXnZUTHjhPHobUZ6lzDJdHveA
         W+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274683; x=1778879483;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/zTtdaa1YwQ9yyHYoxpW5OZucW0IdF0NOBd+0VGB5E=;
        b=jPGK2ss8nxS8rTRWv0Tj+gg35ke9r+WWFMHhxm2XkKdm0jS0Cw9oGIZhmIiSo05gQb
         6H6crHUy6e/rhTOA7Ua56lL+r5WeT97kJR5/UBdgmKofCeNtPrlC8c4V6Z+uCshFaj8T
         t4ceeHCOf6glGyYpMSlxnK7TTnsiTxtcDbPgiLzAXNP6ofz12xWVg5cm4ClaEyf6YRvG
         gmiAtIZd4Ir/q0rkqBdB/PU9R/2fGCJUkH25GOiUsetyUiyoLjwsP1mq41AtJI457Ixu
         +Ogohk0MGKNdqNua1569yc0BOx9yZ+3RvGOh9Hn+fvknP9J37gMGzKap/HbEwh1Na7/X
         Ipuw==
X-Forwarded-Encrypted: i=1; AFNElJ9dHr6WsXPkG/szUpmv0M6bPVAcl5i7KuxwHFXN9oc3kvkLIL50DTJjvzaomyCbdfFXQJ22OyJ39ZCv5aoNc+0w@lists.infradead.org
X-Gm-Message-State: AOJu0YzsQRU3ZbvLC2LGvTSED1XvQXPQ5AC8N70xmjTnHtXgyLULQgKG
	XuJwR6TWH94rh8jbcrASvG4b/0mOCpZN8IyI1d1dnNL08Uln+U5bX4+LqCQe9FC3YIU=
X-Gm-Gg: AeBDievqTlW3RyCi1szZViG9R+3g+Lr2TlCnasdstH8R7XYsLZqos7AumoLPbPdgcYh
	ZibT3vjqdP59jA337GBHQHtOCYOcwVhSKCAKaEMsdcnvdZuuF0jRhcVyhH/qgMqGx1UH35OjAK4
	n3I2Q3CYwdTGZcIraKMkJ81mbViStGUVh+eO1bmPRe5QGYbTsmuJhwz8VYrjWbyG4qrDHErBPXR
	gTvwnotKIF1cfXsJXO4vbXNAAocz+0GpApYNm7BjvK+I1eM7ucjgsJAhHjU2WD1+bU9SWrI9EBd
	kgddkfPfBuDch0IQkB9vGFFqVUrZ2L2RKIXm5+LInAKFC/ERG84PgZuvaTuNhslpzsM3GAP9gpv
	PExxOyNLmoUXwEY3Dxw78HMrfW14Jqfe1vejSTl9lJFRJ2DaCtjx/Ht7EwqFY2mXitRayXxoshn
	JSv5q7pAl+RJFVirmq8R/TxUPyLY+t
X-Received: by 2002:ac8:5fc1:0:b0:50e:6135:f27d with SMTP id d75a77b69052e-514a0baf33dmr1645561cf.53.1778274683142;
        Fri, 08 May 2026 14:11:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm244356866d6.36.2026.05.08.14.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:11:21 -0700 (PDT)
Message-ID: <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Subject: Re: [PATCH v5 06/29] media: rockchip: rga: fix too small buffer size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Fri, 08 May 2026 17:11:20 -0400
In-Reply-To: <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-yGQaQDvjZPV8X9fpmFdy"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_141124_616857_E74EDB1D 
X-CRM114-Status: GOOD (  18.89  )
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


--=-yGQaQDvjZPV8X9fpmFdy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Fix the command buffer size being only a quarter of the actual size.
> The RGA_CMDBUF_SIZE macro was potentially intended to specify the length
> of the cmdbuf u32 array pointer. But as it's used to specify the size of
> the allocation, which is counted in bytes. Therefore adjust the macro
> size to bytes as it better matches the variable name and adjust it's
> users accordingly.
>=20
> As the command buffer is relatively small, it probably didn't caused
> an issue due to being smaller than a single page.
>=20
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne  <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 43ed742a16492..d1618bb247501 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -414,7 +414,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);

So we had a buffer overrun ?

Nicolas

> =C2=A0
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index cc6bd7f5b0300..2b8537a5fd0d7 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -6,7 +6,7 @@
> =C2=A0#ifndef __RGA_HW_H__
> =C2=A0#define __RGA_HW_H__
> =C2=A0
> -#define RGA_CMDBUF_SIZE 0x20
> +#define RGA_CMDBUF_SIZE 0x80
> =C2=A0
> =C2=A0/* Hardware limits */
> =C2=A0#define MAX_WIDTH 8192

--=-yGQaQDvjZPV8X9fpmFdy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf5ReAAKCRDZQZRRKWBy
9JNcAQCO//sirngbNKm+JSYllfp2YXA0CvUHAWHjIfrCnXDPMgD9EZuVo9p0mPM8
jnoazaTvgdmsrGiaruiL+n7sgxk6owk=
=T4/x
-----END PGP SIGNATURE-----

--=-yGQaQDvjZPV8X9fpmFdy--

