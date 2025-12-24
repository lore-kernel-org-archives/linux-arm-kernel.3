Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E9BE7545F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sj1HHExKGWlQ/Xby6VMx9FFovM/8nIk9CS7FFzB9X8=; b=cBWAPHdliTbKxZKlKqKPTZZOXG
	MGZw1P35xsQ08Mgoi1aMUb0go3zURCBAhPoLZkBjS9XZ3k3SJxdAolxBApXgBxKnln+Usd8MbFvvd
	Zh1TTL7t6RqO1aOpujrqwkhya9OfL5LJSiqINRl4cmJK3UE7dimUu1xNzu2UD1Rc/iA/8OqZI8rRd
	L+uRYiSaATHwqXjq9HtNJ/Y1djo2tyvNxmfmK9QSZu3zjma+S7xKdwshHm9gEssjUoWIxw/o8I6Xx
	0I+u7tZJiVaTYoNf9ZZrYITJ7yLWofbfFS3tWAUy3/6o2u+6cY1ulCwuzm9B2W8LObiIvwr2ndJyw
	1MpTunvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQRD-0000000H3rc-0hiO;
	Wed, 24 Dec 2025 15:06:08 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQR6-0000000H3qH-10NN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:06:05 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8c0f15e8247so518508985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766588759; x=1767193559; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/sj1HHExKGWlQ/Xby6VMx9FFovM/8nIk9CS7FFzB9X8=;
        b=y+sBdDK8jnDQySwXwhjLTkmkDlXg2NXeNsJtDqr4aCW78MfJBA5y0ZnzOQfmiWA3Dq
         EtdjCmxf+nTOiOSPY0eB15wWBGRwqL683Ljp0rA2xwKJycdF7DsslKIWpSgh7S+VKTUM
         Q+YpG5M++hZjop+lKj/ak5T99kCX5V+IT/kNGXKUUQ5Ai/4zM4wKAFOUTBANqW9tPH8M
         NgsaXF7UVsBUtabC+akKdHH/8S+YUW8mn5tD+kq3eKoasS3X4+lhRnxkVM0ukm6BlSli
         1qL6midcEJizChJC/opkwj84weS3NxAtKPSTremtEjUP8lJcMVy3F5owro32PqugAfOc
         +qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588759; x=1767193559;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sj1HHExKGWlQ/Xby6VMx9FFovM/8nIk9CS7FFzB9X8=;
        b=iZAuHJQ7B8083ulmrRl0vjhRxgZ/nSegDJDFlzmcO6uTaLLnJ6Svu3ElWtR1I7fMTA
         DLKcdFJ6izJl8r2e9c1yIb1yHgy9mk3S4+8fHt0vfWdC36LLDgpd4mwsr9xKSW8kSSOU
         dBquzdwHw8u9VI9Y7R4io72jFHJ2Paf6SQ1qGl1A5H5EcE6GNxYRbIPZKfafKeBsw/0E
         Z96+OLaIM+zjYPAEIQNbEZ4+SLlEvozPeh8t9sjgvYd0tLOBdCZXYpeevip6Ucb67CWF
         2bURBfnje1XgA8KaV7wjfJpiF3uoQKy2lDNHnSuVjtNUrm/yEDXblLi3IoDHn9pAj6oR
         yJZw==
X-Forwarded-Encrypted: i=1; AJvYcCVuad8GA5mS1nH9Y/C+6dQ8z3kLfZzwwcoZDv+jVhQPso65UK9+FqSMwHwjmNRSltw/dk9uA8opVAKCrEFi8+2g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6jbK5n90U6JKs0ScD0Qxph+1V7kNqewkVeLtU+DrM2N1NQef+
	sywJ3guDx3FzvYvcVy/yEFSIwLVjSsm4wqWVWMcyenqJTn2G0abYKxp62q+ds1wSGTc=
X-Gm-Gg: AY/fxX6c29IR3XQGJLMe0mVS3w/1jKHELQrvgf4HTOMtVvJsxfp1m7h/NV/69RuZWvW
	n8Gd/aQcce09ONvTfPJVC1cRk5zZg12GRRQbjHVntFkWDS976MN0JD5ZZJiptm18s/m2dRAb6Lc
	JefhlpJ2TCDhX7upMh30w7sol3E6xftNN9wtwdxl5qLnIx7JivuCq1FvONBnpldJXfBaZLwNoeC
	Lu4qNW6R6MXpeP3vkwjf0Qt+u9h+3DpUxSHCet6W85E2Blvrw7mJ+PW/Wy6xfxYpMSz7tEJ2WX8
	673Wwj+2yjUZYZ+4t7mPOFPQAXyB7IUFWRkgtuVWdB60SoJywL31a+732nHkLAOUhXyus2Pwi1j
	TuoYuaDQRMUkuLFHkyuscKjOaLhRZVuDzBZCqpJKNk2KPy/nJjFf5yRtAYxLlEd53AcxsFp3w3K
	uuv0HOwwbmy/jXjzpf
X-Google-Smtp-Source: AGHT+IETvBu+Guk12OJYgN5ssBD4uU83lBcS6wq53EZP7h8ORV81/fvJfk/oT/mQb3cIMhQp0AxXLg==
X-Received: by 2002:a05:622a:1345:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-4f4abcd8b3fmr302509791cf.20.1766588758799;
        Wed, 24 Dec 2025 07:05:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm126478521cf.19.2025.12.24.07.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:05:58 -0800 (PST)
Message-ID: <be6c72090cdbf79d86dab5cc75a05db81cd1585c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 07/22] media: rockchip: rga: move hw specific parts
 to a dedicated struct
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
Date: Wed, 24 Dec 2025 10:05:57 -0500
In-Reply-To: <20251203-spu-rga3-v2-7-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-7-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-awLPo3pA3zArYr6dvmmF"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_070604_707385_07A35CE7 
X-CRM114-Status: GOOD (  20.25  )
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


--=-awLPo3pA3zArYr6dvmmF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> In preparation for the RGA3 unit, move RGA2 specific parts from rga.c
> to rga-hw.c and create a struct to reference the RGA2 specific functions
> and formats. This also allows to remove the rga-hw.h reference from the
> include list of the rga driver.
>=20
> Also document the command finish interrupt with a dedicated define.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 183 ++++++++++++++++=
++++-
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 228 +=
++++----------------------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 ++-
> =C2=A04 files changed, 245 insertions(+), 194 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index f1d5237472941..7419784efc693 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -437,8 +437,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0		PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> -void rga_hw_start(struct rockchip_rga *rga,
> -		=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +static void rga_hw_start(struct rockchip_rga *rga,
> +			 struct rga_vb_buffer *src,=C2=A0 struct rga_vb_buffer *dst)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D rga->curr;
> =C2=A0
> @@ -452,3 +452,182 @@ void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_CTRL, 0x1);
> =C2=A0}
> +
> +static bool rga_handle_irq(struct rockchip_rga *rga)
> +{
> +	int intr;
> +
> +	intr =3D rga_read(rga, RGA_INT) & 0xf;
> +
> +	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> +
> +	return intr & RGA_INT_COMMAND_FINISHED;
> +}
> +
> +static void rga_get_version(struct rockchip_rga *rga)
> +{
> +	rga->version.major =3D (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
> +	rga->version.minor =3D (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
> +}
> +
> +static struct rga_fmt formats[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB32,
> +		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> +		.depth =3D 32,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ABGR32,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> +		.depth =3D 32,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_XBGR32,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> +		.depth =3D 32,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGB24,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_RGB888,
> +		.depth =3D 24,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_BGR24,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_RGB888,
> +		.depth =3D 24,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB444,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> +		.depth =3D 16,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB555,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> +		.depth =3D 16,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGB565,
> +		.color_swap =3D RGA_COLOR_RB_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_BGR565,
> +		.depth =3D 16,
> +		.uv_factor =3D 1,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV21,
> +		.color_swap =3D RGA_COLOR_UV_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV61,
> +		.color_swap =3D RGA_COLOR_UV_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> +		.depth =3D 16,
> +		.uv_factor =3D 2,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12M,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV16,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> +		.depth =3D 16,
> +		.uv_factor =3D 2,
> +		.y_div =3D 1,
> +		.x_div =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUV420,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 2,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUV422P,
> +		.color_swap =3D RGA_COLOR_NONE_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> +
> +		.depth =3D 16,
> +		.uv_factor =3D 2,
> +		.y_div =3D 1,
> +		.x_div =3D 2,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YVU420,
> +		.color_swap =3D RGA_COLOR_UV_SWAP,
> +		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> +		.depth =3D 12,
> +		.uv_factor =3D 4,
> +		.y_div =3D 2,
> +		.x_div =3D 2,
> +	},
> +};
> +
> +const struct rga_hw rga2_hw =3D {
> +	.formats =3D formats,
> +	.num_formats =3D ARRAY_SIZE(formats),
> +	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> +	.min_width =3D MIN_WIDTH,
> +	.max_width =3D MAX_WIDTH,
> +	.min_height =3D MIN_HEIGHT,
> +	.max_height =3D MAX_HEIGHT,
> +
> +	.start =3D rga_hw_start,
> +	.handle_irq =3D rga_handle_irq,
> +	.get_version =3D rga_get_version,
> +};
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index cc6bd7f5b0300..f4752aa823051 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -15,9 +15,6 @@
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> =C2=A0
> -#define DEFAULT_WIDTH 100
> -#define DEFAULT_HEIGHT 100
> -
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> =C2=A0/* Registers address */
> @@ -178,6 +175,8 @@
> =C2=A0#define RGA_ALPHA_COLOR_NORMAL 0
> =C2=A0#define RGA_ALPHA_COLOR_MULTIPLY_CAL 1
> =C2=A0
> +#define RGA_INT_COMMAND_FINISHED 4
> +
> =C2=A0/* Registers union */
> =C2=A0union rga_mode_ctrl {
> =C2=A0	unsigned int val;
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index f50fbbab0645e..d8b14c2d9f6a4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -25,7 +25,6 @@
> =C2=A0#include <media/videobuf2-dma-sg.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> -#include "rga-hw.h"
> =C2=A0#include "rga.h"
> =C2=A0
> =C2=A0static int debug;
> @@ -47,7 +46,7 @@ static void device_run(void *prv)
> =C2=A0
> =C2=A0	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> -	rga_hw_start(rga, vb_to_rga(src), vb_to_rga(dst));
> +	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
> =C2=A0
> =C2=A0	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =C2=A0}
> @@ -55,13 +54,8 @@ static void device_run(void *prv)
> =C2=A0static irqreturn_t rga_isr(int irq, void *prv)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D prv;
> -	int intr;
> =C2=A0
> -	intr =3D rga_read(rga, RGA_INT) & 0xf;
> -
> -	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> -
> -	if (intr & 0x04) {
> +	if (rga->hw->handle_irq(rga)) {
> =C2=A0		struct vb2_v4l2_buffer *src, *dst;
> =C2=A0		struct rga_ctx *ctx =3D rga->curr;
> =C2=A0
> @@ -184,174 +178,17 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static struct rga_fmt formats[] =3D {
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ARGB32,
> -		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> -		.depth =3D 32,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ABGR32,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> -		.depth =3D 32,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_XBGR32,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> -		.depth =3D 32,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_RGB24,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_RGB888,
> -		.depth =3D 24,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_BGR24,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_RGB888,
> -		.depth =3D 24,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ARGB444,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> -		.depth =3D 16,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_ARGB555,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> -		.depth =3D 16,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_RGB565,
> -		.color_swap =3D RGA_COLOR_RB_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_BGR565,
> -		.depth =3D 16,
> -		.uv_factor =3D 1,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV21,
> -		.color_swap =3D RGA_COLOR_UV_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV61,
> -		.color_swap =3D RGA_COLOR_UV_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> -		.depth =3D 16,
> -		.uv_factor =3D 2,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV12,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV12M,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_NV16,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> -		.depth =3D 16,
> -		.uv_factor =3D 2,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_YUV420,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 2,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_YUV422P,
> -		.color_swap =3D RGA_COLOR_NONE_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> -		.depth =3D 16,
> -		.uv_factor =3D 2,
> -		.y_div =3D 1,
> -		.x_div =3D 2,
> -	},
> -	{
> -		.fourcc =3D V4L2_PIX_FMT_YVU420,
> -		.color_swap =3D RGA_COLOR_UV_SWAP,
> -		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> -		.depth =3D 12,
> -		.uv_factor =3D 4,
> -		.y_div =3D 2,
> -		.x_div =3D 2,
> -	},
> -};
> -
> -#define NUM_FORMATS ARRAY_SIZE(formats)
> -
> -static struct rga_fmt *rga_fmt_find(u32 pixelformat)
> +static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelf=
ormat)
> =C2=A0{
> =C2=A0	unsigned int i;
> =C2=A0
> -	for (i =3D 0; i < NUM_FORMATS; i++) {
> -		if (formats[i].fourcc =3D=3D pixelformat)
> -			return &formats[i];
> +	for (i =3D 0; i < rga->hw->num_formats; i++) {
> +		if (rga->hw->formats[i].fourcc =3D=3D pixelformat)
> +			return &rga->hw->formats[i];
> =C2=A0	}
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> -static struct rga_frame def_frame =3D {
> -	.crop.left =3D 0,
> -	.crop.top =3D 0,
> -	.crop.width =3D DEFAULT_WIDTH,
> -	.crop.height =3D DEFAULT_HEIGHT,
> -	.fmt =3D &formats[0],
> -};
> -
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type type)
> =C2=A0{
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(type))
> @@ -366,6 +203,18 @@ static int rga_open(struct file *file)
> =C2=A0	struct rockchip_rga *rga =3D video_drvdata(file);
> =C2=A0	struct rga_ctx *ctx =3D NULL;
> =C2=A0	int ret =3D 0;
> +	u32 def_width =3D clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max=
_width);
> +	u32 def_height =3D clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->=
max_height);
> +	struct rga_frame def_frame =3D {
> +		.crop.left =3D 0,
> +		.crop.top =3D 0,
> +		.crop.width =3D def_width,
> +		.crop.height =3D def_height,
> +		.fmt =3D &rga->hw->formats[0],
> +	};
> +
> +	def_frame.stride =3D (def_width * def_frame.fmt->depth) >> 3;
> +	def_frame.size =3D def_frame.stride * def_height;
> =C2=A0
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> @@ -376,9 +225,9 @@ static int rga_open(struct file *file)
> =C2=A0	ctx->out =3D def_frame;
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT=
);
> +			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, def_width, def_height);
> =C2=A0	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGH=
T);
> +			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, def_width, def_height);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> =C2=A0		kfree(ctx);
> @@ -445,12 +294,13 @@ vidioc_querycap(struct file *file, void *priv, stru=
ct v4l2_capability *cap)
> =C2=A0
> =C2=A0static int vidioc_enum_fmt(struct file *file, void *priv, struct v4=
l2_fmtdesc *f)
> =C2=A0{
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0
> -	if (f->index >=3D NUM_FORMATS)
> +	if (f->index >=3D rga->hw->num_formats)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	fmt =3D &formats[f->index];
> +	fmt =3D &rga->hw->formats[f->index];
> =C2=A0	f->pixelformat =3D fmt->fourcc;
> =C2=A0
> =C2=A0	return 0;
> @@ -475,16 +325,18 @@ static int vidioc_g_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0static int vidioc_try_fmt(struct file *file, void *priv, struct v4l=
2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> +	const struct rga_hw *hw =3D rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0
> -	fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> +	fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	if (!fmt)
> -		fmt =3D &formats[0];
> +		fmt =3D &hw->formats[0];
> =C2=A0
> =C2=A0	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u32)MIN_WIDTH, (u32)MAX_WIDTH);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> =C2=A0	pix_fmt->height =3D clamp(pix_fmt->height,
> -				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
> +				hw->min_height, hw->max_height);
> =C2=A0
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-=
>height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> @@ -519,7 +371,7 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm->size =3D 0;
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++)
> =C2=A0		frm->size +=3D pix_fmt->plane_fmt[i].sizeimage;
> -	frm->fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> +	frm->fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> =C2=A0	/* Reset crop settings */
> @@ -639,7 +491,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0
> =C2=A0	if (s->r.left + s->r.width > f->pix.width ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 s->r.top + s->r.height > f->pix.height ||
> -	=C2=A0=C2=A0=C2=A0 s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) =
{
> +	=C2=A0=C2=A0=C2=A0 s->r.width < rga->hw->min_width || s->r.height < rga=
->hw->min_height) {
> =C2=A0		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> @@ -748,6 +600,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (!rga)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	rga->hw =3D of_device_get_match_data(&pdev->dev);
> +	if (!rga->hw)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n"=
);
> +
> =C2=A0	rga->dev =3D &pdev->dev;
> =C2=A0	spin_lock_init(&rga->ctrl_lock);
> =C2=A0	mutex_init(&rga->mutex);
> @@ -811,8 +667,7 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (ret < 0)
> =C2=A0		goto rel_m2m;
> =C2=A0
> -	rga->version.major =3D (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
> -	rga->version.minor =3D (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
> +	rga->hw->get_version(rga);
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
> =C2=A0		=C2=A0 rga->version.major, rga->version.minor);
> @@ -820,7 +675,7 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	pm_runtime_put(rga->dev);
> =C2=A0
> =C2=A0	/* Create CMD buffer */
> -	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
> +	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> =C2=A0					=C2=A0=C2=A0 &rga->cmdbuf_phy, GFP_KERNEL,
> =C2=A0					=C2=A0=C2=A0 DMA_ATTR_WRITE_COMBINE);
> =C2=A0	if (!rga->cmdbuf_virt) {
> @@ -828,9 +683,6 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto rel_m2m;
> =C2=A0	}
> =C2=A0
> -	def_frame.stride =3D (DEFAULT_WIDTH * def_frame.fmt->depth) >> 3;
> -	def_frame.size =3D def_frame.stride * DEFAULT_HEIGHT;
> -
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> @@ -843,7 +695,7 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0free_dma:
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WR=
ITE_COMBINE);
> =C2=A0rel_m2m:
> =C2=A0	v4l2_m2m_release(rga->m2m_dev);
> @@ -861,7 +713,7 @@ static void rga_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =C2=A0
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WR=
ITE_COMBINE);
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Removing\n");
> @@ -897,9 +749,11 @@ static const struct dev_pm_ops rga_pm =3D {
> =C2=A0static const struct of_device_id rockchip_rga_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3288-rga",
> +		.data =3D &rga2_hw,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3399-rga",
> +		.data =3D &rga2_hw,
> =C2=A0	},
> =C2=A0	{},
> =C2=A0};
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 7ec1fcc03ed32..98635ddd50d7c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -14,6 +14,9 @@
> =C2=A0
> =C2=A0#define RGA_NAME "rockchip-rga"
> =C2=A0
> +#define DEFAULT_WIDTH 100
> +#define DEFAULT_HEIGHT 100
> +
> =C2=A0struct rga_fmt {
> =C2=A0	u32 fourcc;
> =C2=A0	int depth;
> @@ -69,6 +72,8 @@ static inline struct rga_ctx *file_to_rga_ctx(struct fi=
le *filp)
> =C2=A0	return container_of(file_to_v4l2_fh(filp), struct rga_ctx, fh);
> =C2=A0}
> =C2=A0
> +struct rga_hw;
> +
> =C2=A0struct rockchip_rga {
> =C2=A0	struct v4l2_device v4l2_dev;
> =C2=A0	struct v4l2_m2m_dev *m2m_dev;
> @@ -88,6 +93,8 @@ struct rockchip_rga {
> =C2=A0	struct rga_ctx *curr;
> =C2=A0	dma_addr_t cmdbuf_phy;
> =C2=A0	void *cmdbuf_virt;
> +
> +	const struct rga_hw *hw;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_addr_offset {
> @@ -138,7 +145,19 @@ static inline void rga_mod(struct rockchip_rga *rga,=
 u32 reg, u32 val, u32 mask)
> =C2=A0	rga_write(rga, reg, temp);
> =C2=A0};
> =C2=A0
> -void rga_hw_start(struct rockchip_rga *rga,
> -		=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
> +struct rga_hw {
> +	struct rga_fmt *formats;
> +	u32 num_formats;
> +	size_t cmdbuf_size;
> +	u32 min_width, min_height;
> +	u32 max_width, max_height;
> +
> +	void (*start)(struct rockchip_rga *rga,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct rga_v=
b_buffer *dst);
> +	bool (*handle_irq)(struct rockchip_rga *rga);
> +	void (*get_version)(struct rockchip_rga *rga);
> +};
> +
> +extern const struct rga_hw rga2_hw;
> =C2=A0
> =C2=A0#endif

--=-awLPo3pA3zArYr6dvmmF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwBVQAKCRDZQZRRKWBy
9EhfAP9NFN5Gi9iSlGoayoestjhwQjvne6kf9ylqAav2YZMMZAEA1vK9QTuK0wzf
+eOOLadRyOphXELA/ZHF8GxcJghZbAM=
=ru5T
-----END PGP SIGNATURE-----

--=-awLPo3pA3zArYr6dvmmF--

