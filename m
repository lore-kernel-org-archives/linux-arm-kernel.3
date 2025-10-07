Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD13CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58+grWU1+fLQ3iYvFx1p0RHwupl8wNBxalqFpZYiDLA=; b=qSQG1SMh6W9vSXLjzVvl+/9oxp
	u93u93Fdr1vvEOoJKLQ+6AfEuAmm+uqLDMUV9jtl7EpiG8XWI8l0Er+vbxGtd7dA2fwGMf9jEnvVY
	6jewCtE8gqcYDN1dmqNl2mIyE0+HOEmKQ8YS7Y0YtKeAhwGL4forviw5s52aYpa9gstgKNlfgRN9U
	K7HgE18I9Ki7nzp118Tgo35Kjv6GSc0DX7xCSgNqriLIAjEmdR8YlCNNaCMSG77bja0EStNlBBH06
	1jK+eAnCwyB/rBtagZqSdjg3tL7rXxzEgGy684zWN4T+OxnCW1exMtHlu6UNRTjz64D4skBxFSjdh
	SQan+VnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ciu-00000002cIk-2Xu9;
	Tue, 07 Oct 2025 18:47:44 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Cis-00000002cHr-18Ir
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:47:43 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-855d525cd00so822816585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759862861; x=1760467661; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=58+grWU1+fLQ3iYvFx1p0RHwupl8wNBxalqFpZYiDLA=;
        b=ReEe/tnC5wbJMMBV+ZmcfOnOTv69SV8AG7WhIEHqoan7eOWxr3pSE81wZbQxo0EjNZ
         5nTefb9SaHV7nf+MxuPG6nMpGgUKw7GRDgEU0IWZbBFOEXt9U6tekFzUXTl7YGnaXSyK
         /sI1U39+U+m2PeImnrdCCCQUqf6kAk4UcMEI8mqlhMF0ehoat72WTl2yYUXCdmgqDt7a
         sQQz7o0NGyZdwQg97ItfS41c3zNN6e3s9mBYSqKkf/B1hX0H2XAuir7R4VCQQrSt2APd
         3PV21knYN8/xqDFVa8DK4kE+WgTIlJDOW7IBZUlBydIl+n7AYnj5d7xY/vMoVy49ckAT
         W80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759862861; x=1760467661;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58+grWU1+fLQ3iYvFx1p0RHwupl8wNBxalqFpZYiDLA=;
        b=exy/3U9D+JaIEohtyHmRw045H7Y6lKzuFoCjxQp3fMLk76XgJHNKdQZFkjt0U8Z8gn
         3i3mCE5vTIFs8CmJJ56fJl7JlbY4DN0TGB1vqvtLJa4JyphdGRNKSCFF5kTOp8LIpSzO
         HTYlrV0+jWVH3YTVIZfziWYptEAaa2PrvITw0Oj2YaCOAuJ1fqXcBY4qwCPaIbOSHMwI
         TyzBH/otzmpoItjEiGvLqJgnIt4sd5x07XzvcK0NcRInJYam1QQDfV80/3J1hLz98JCH
         ruv5EioSLdvNMCjfmwd4LPkYCSLMbiapvjJDbQAx8H5ADMeb48GTed0Je60cVmECPxOH
         eIuw==
X-Forwarded-Encrypted: i=1; AJvYcCUpOT1jYEE9SjhybO4/+UEZS0UfreJGmYmG2nOYf4J13gKxwCX9ZzbbHbxr0KJ+zHp2qIDQuQhzi3ti7APx05gM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0MXBndEN/IpJITILxrP99L/SNAwS5uR6UAcIkyycrJCHnxBvR
	wJ79TT9egJsdpUlTJlSxAX3fRlgJgxozRlOltkqJXQCr9aLFEWc7p40Dahr4XYsJP78=
X-Gm-Gg: ASbGnct9o8Vxvvu6IWhg1k6meBq9kEC/QCLeUaIkuGpBvOgxLCZk+qQFpjWwxUk+mla
	35j6m0EXI8h8eWvZdWiB/Mmmk9AUePTVjYRl7ITTcpVhrJKdDEwTkEQn8QnTeDZvjDVEOhS3tF3
	fmse0k6436+9BIyWzSxdMy1ryxIKAPOmsRLH1d/uMKVdmmZxlJ8LivzWIKAFWOU3USD5Z7g0K+K
	VuTdjdDalwsqiGF7ApdZCQg901KtBZ0Kd83UHlEKgNvrO0tJZxoUOvlu1UWNf04U8alsNN4d5aO
	oVOuNJlKqTN+wpkgIsImvTAyZse2+I092J58woDMwizB1NrePABAYDNA8xb7tjxHMw+jjJVAv+y
	jjEDUpFMuabQ4vIb8oEcEwEKeCxtSgOco6wVeFN/jS/VMVNzxg3fC
X-Google-Smtp-Source: AGHT+IGM6WgG6OTQoMVXMZbYSPPE54NLk24Y0L7yLT6AonwvB7ilumFcgtdxb3bcVhP4gw7WgQL0Xw==
X-Received: by 2002:a05:620a:ac0b:b0:883:7309:c0eb with SMTP id af79cd13be357-8837309d08bmr41017885a.41.1759862860945;
        Tue, 07 Oct 2025 11:47:40 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87772278098sm1596357385a.16.2025.10.07.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:47:40 -0700 (PDT)
Message-ID: <a57669be1d58e71229dedcf4acbe6eda201e45ea.camel@ndufresne.ca>
Subject: Re: [PATCH 12/16] media: rockchip: rga: handle error interrupt
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
Date: Tue, 07 Oct 2025 14:47:38 -0400
In-Reply-To: <20251007-spu-rga3-v1-12-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-12-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9ssd6DUBbBvl6JPlwbl3"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_114742_325570_13D072E5 
X-CRM114-Status: GOOD (  24.88  )
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


--=-9ssd6DUBbBvl6JPlwbl3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Handle the error interrupt status in preparation of the RGA3 addition.
> This allows the buffer to be marked as done, as it would otherwise
> be stuck in the queue.
>=20
> The RGA3 needs a soft reset to properly work after an error occurred,
> as it would otherwise cease to deliver new interrupts. Also the soft
> reset avoids additional error interrupts to be triggered, which are
> currently not supported by the rga_isr function.
> As it is unknown how the RGA2 behaves in the error case, no
> error interrupt was enabled and handled.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 6 ++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 32 ++=
+++++++++++++++----------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 8 ++++++-
> =C2=A03 files changed, 31 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index
> d54183d224b3e9c42d5503acf172257f2e736f7b..93822b5b8b15e76862bd022759eaa5c=
b9552
> dd76 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -459,7 +459,7 @@ static void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0	rga_write(rga, RGA_CMD_CTRL, 0x1);
> =C2=A0}
> =C2=A0
> -static bool rga_handle_irq(struct rockchip_rga *rga)
> +static enum rga_irq_result rga_handle_irq(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	int intr;
> =C2=A0
> @@ -467,7 +467,9 @@ static bool rga_handle_irq(struct rockchip_rga *rga)
> =C2=A0
> =C2=A0	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> =C2=A0
> -	return intr & 0x04;
> +	if (intr & 0x04)
> +		return RGA_IRQ_DONE;

Since you reuse an old driver, would be nice to create proper defines for
RGA_INT bit 3 (current command finish interrupt flag).

> +	return RGA_IRQ_IGNORE;
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_get_version(struct rockchip_rga *rga)
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index
> 0a725841b0cfa41bbc5b861b8f5ceac2452fc2b5..3b5d2eb8e109f44af76dd2240a239b1=
fa8a7
> 8cee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -56,30 +56,38 @@ static void device_run(void *prv)
> =C2=A0static irqreturn_t rga_isr(int irq, void *prv)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D prv;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	struct rga_ctx *ctx =3D rga->curr;
> +	enum rga_irq_result result;
> =C2=A0
> -	if (rga->hw->handle_irq(rga)) {
> -		struct vb2_v4l2_buffer *src, *dst;
> -		struct rga_ctx *ctx =3D rga->curr;
> +	result =3D rga->hw->handle_irq(rga);
> +	if (result =3D=3D RGA_IRQ_IGNORE)
> +		return IRQ_HANDLED;
> =C2=A0
> -		WARN_ON(!ctx);
> +	WARN_ON(!ctx);
> =C2=A0
> -		rga->curr =3D NULL;
> +	rga->curr =3D NULL;
> =C2=A0
> -		src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -		dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> -		WARN_ON(!src);
> -		WARN_ON(!dst);
> +	WARN_ON(!src);
> +	WARN_ON(!dst);
> =C2=A0
> -		v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, true);
> =C2=A0
> -		dst->sequence =3D ctx->csequence++;
> +	dst->sequence =3D ctx->csequence++;
> =C2=A0
> +	if (result =3D=3D RGA_IRQ_DONE) {
> =C2=A0		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
> =C2=A0		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
> -		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
> +	} else {
> +		v4l2_m2m_buf_done(src, VB2_BUF_STATE_ERROR);
> +		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_ERROR)

I'm not fan of assumption that its an error on else case. If often lead to
multiple calls. Please use an explicit error return.

> ;
> =C2=A0	}
> =C2=A0
> +	v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);

What if you get an IRQ and none of the flags are raised ? I did see that in=
 the
past, and that least to bad things happening.

> +
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index
> e19c4c82aca5ae2056f52d525138093fbbb81af8..dc4bb85707d12f5378c4891098cd7ea=
4a4d7
> 5e2d 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -143,6 +143,12 @@ static inline void rga_mod(struct rockchip_rga *rga,=
 u32
> reg, u32 val, u32 mask)
> =C2=A0	rga_write(rga, reg, temp);
> =C2=A0};
> =C2=A0
> +enum rga_irq_result {
> +	RGA_IRQ_IGNORE,
> +	RGA_IRQ_DONE,
> +	RGA_IRQ_ERROR,
> +};
> +
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> =C2=A0	bool has_internal_iommu;
> @@ -152,7 +158,7 @@ struct rga_hw {
> =C2=A0
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> -	bool (*handle_irq)(struct rockchip_rga *rga);
> +	enum rga_irq_result (*handle_irq)(struct rockchip_rga *rga);
> =C2=A0	void (*get_version)(struct rockchip_rga *rga);
> =C2=A0	void *(*try_format)(u32 *fourcc, bool is_output);
> =C2=A0	int (*enum_format)(struct v4l2_fmtdesc *f);

--=-9ssd6DUBbBvl6JPlwbl3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVgSgAKCRDZQZRRKWBy
9P5qAP9AQJCTUQL4yGjLYO6fhiRHkYApeYjS3ILIAxwJZRgyoAEAuIsn+1r5gHyo
fE4WQoTjedA/458KE+PcMg5FcVxZZA0=
=4Ait
-----END PGP SIGNATURE-----

--=-9ssd6DUBbBvl6JPlwbl3--

