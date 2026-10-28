Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00662606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yO8MqZrK;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=O4TqPvgs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ltjvUYj58XRYoUUDqDDbmB6ViXKYaAFieLJE8FLBXVc=; b=yO8MqZrKKjgvaSPEf3JyiJPjqT
	H0G7O+zbbQqAp28UMwkZly5aD3QoMdCaK91UHXAYpDLvvCZjouOp5/VO684GCLUeZuUaVkY8XzvCX
	6boivejCRlZiLouWTplmXrsMVJeMbZO7jt+cH7rgEt+vK9aK/5pbZPzwS22UPP6Mpo2NjeC8mLCGl
	uCaEheCttQj9HsFmLVb9WLg2ZvgeO/QFkI27CkntatNK7/M/NUDkO1qqrOStLDNZJ+hytGVX7UlSt
	vaohvxjFeSLsfwlXvSQlSxAiLw+/NQv7ig9bBQIX2um0EZF4p+YqfpxyXRyg3Ke4+P/fHVLS/Lqm+
	2n5TaVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAEo-00000007vPf-1C9V;
	Wed, 28 Oct 2026 20:27:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAEk-00000007vPF-3lQV;
	Wed, 28 Oct 2026 20:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793219223;
	bh=p1IE/DlZrAqu5FN95lXdgFSXQVz+G7vqZ67fMoLW+vQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O4TqPvgsoxvDDpBs0O3rj3nK0nVYaHIqJd8W1c59A7tk95o5lUcx83zZTJRm8zSJV
	 VYyODDH1udtlwCPzuxc6UZUZTUQWypocd7iR7eUjV7M1heWP5bbyX9ijxWZxVXSLam
	 PXvGP1cqGLFZiGlPhrgyYKbMWgqIUN/xm8JR5FjTHvz/P8hbgYrC1OiP7XqAYm/1Fs
	 I2dChoV31xjfhuvapgOpdhCXOGJlHC9ztiQUiDYbh1CDCxpzrYKWxlcVcpMrWVVn3H
	 9n4b/l6uA90wSf8cpJBy9X4NTF8cWf8QorcX8ftRqMDz3SarNKWRuXb6bxi9zZqovv
	 uIANKLvREUzAw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71EE117E03FF;
	Wed, 28 Oct 2026 21:27:01 +0100 (CET)
Message-ID: <b3e4f381bd1d4b921703f7b9e7452a49842d1176.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Handle interrupts without a current
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Date: Wed, 28 Oct 2026 16:26:59 -0400
In-Reply-To: <20261026124808.642373-1-a.kazinsky@ideco.ru>
References: <20261026124808.642373-1-a.kazinsky@ideco.ru>
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
	protocol="application/pgp-signature"; boundary="=-U62r30hsm7WM+5WWV9F0"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_132707_149551_50760E7A 
X-CRM114-Status: GOOD (  29.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-U62r30hsm7WM+5WWV9F0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 26 octobre 2026 =C3=A0 16:48 +0400, Alex Kazinsky a =C3=A9crit=C2=
=A0:
> The watchdog can finish the current job before the threaded IRQ handler
> retrieves its context. In that case, v4l2_m2m_get_curr_priv() returns NUL=
L,
> but the variant IRQ handlers unconditionally dereference ctx->dev.
>=20
> Pass the device pointer to the variant IRQ handlers independently of the
> context. Clear the interrupt status and, for VDPU383, disable interrupts
> before returning if no current context exists. This avoids dereferencing
> NULL while still acknowledging the interrupt.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handle=
r")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
> ---
> Link to v1: https://lore.kernel.org/all/20261023131124.94116-1-a.kazinsky=
@ideco.ru/
>=20
> This issue has not been reproduced on hardware. The watchdog/IRQ race
> described above is based on code analysis.
>=20
> A possible test would be to submit a single decoding job and temporarily
> delay the IRQ thread before v4l2_m2m_get_curr_priv() for longer than the
> watchdog timeout. This would artificially widen the suspected race window=
.
> This experiment has not been performed.

Ack. I've studied Hantro and why it does not need all your suggested defens=
ive
coding, details delow.

>=20
> Changes in v2:
> - Fix continuation-line alignment in the IRQ handler declarations.
> - Clarify that the issue has not been reproduced on hardware and
>   describe a possible test.
>=20
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 23 +++++++++++++------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  4 +++-
>  2 files changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..da4ed7bde05c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1434,15 +1434,18 @@ static void rkvdec_iommu_restore(struct rkvdec_de=
v *rkvdec)
>  	}
>  }
> =20
> -static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec,
> +				      struct rkvdec_ctx *ctx)
>  {
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
>  	enum vb2_buffer_state state;
>  	u32 status;
> =20
>  	status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
>  	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> =20
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +

The IRQ lifetime is bound to the dev, so it fine to continue further.

>  	if (status & RKVDEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {

What is not in the patch context here is:

	if (cancel_delayed_work(&rkvdec->watchdog_work))
		rkvdec_job_finish(ctx, state);

ctx will exist if the watchdog was cancelled, this is pretty much guarantie=
d, so
the null-check-return is not needed. It does not invalidate your report tho=
ugh,
since we get the dev from the ctx, which can be dead. More instructions bel=
ow
....

> @@ -1457,9 +1460,9 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec=
_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
> =20
> -static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec,
> +				       struct rkvdec_ctx *ctx)
>  {
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
>  	enum vb2_buffer_state state;
>  	bool need_reset =3D 0;
>  	u32 status;
> @@ -1467,6 +1470,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkvde=
c_ctx *ctx)
>  	status =3D readl(rkvdec->regs + VDPU381_REG_STA_INT);
>  	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> =20
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
>  	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {
> @@ -1486,9 +1492,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkvde=
c_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
> =20
> -static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec,
> +				       struct rkvdec_ctx *ctx)
>  {
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
>  	enum vb2_buffer_state state;
>  	bool need_reset =3D 0;
>  	u32 status;
> @@ -1499,6 +1505,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkvde=
c_ctx *ctx)
>  	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0)=
,
>  	       rkvdec->link + VDPU383_LINK_INT_EN);
> =20
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
>  	if (status & VDPU383_STA_INT_DEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {
> @@ -1521,7 +1530,7 @@ static irqreturn_t rkvdec_irq_handler(int irq, void=
 *priv)
>  	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
>  	const struct rkvdec_variant *variant =3D rkvdec->variant;
> =20
> -	return variant->ops->irq_handler(ctx);
> +	return variant->ops->irq_handler(rkvdec, ctx);
>  }
> =20
>  /*
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index a24be6638b6b..8bcb51db5105 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -30,6 +30,7 @@
>  #define RKVDEC_8K_PIXELS		(7680 * 4320)
> =20
>  struct rkvdec_ctx;
> +struct rkvdec_dev;
>  struct rkvdec_rcb_config;
> =20
>  struct rkvdec_ctrl_desc {
> @@ -72,7 +73,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  }
> =20
>  struct rkvdec_variant_ops {
> -	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> +	irqreturn_t (*irq_handler)(struct rkvdec_dev *rkvdec,
> +				   struct rkvdec_ctx *ctx);

What I'd do is only pass rkvdec_dev, which has a lifetime bound to the IRQ
handler. Then inside rkvdec_job_finish(), retrieve the CTX with:

	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);

This will match what we do in Hantro driver, and should be safe, with less
defensive coding. In short, the ctx lifetime is bound to the m2m job, at le=
ast
it should, if not, we have another bug to fix.

Nicolas

>  	u32 (*colmv_size)(u16 width, u16 height);
>  	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int=
 row_length);
>  };

--=-U62r30hsm7WM+5WWV9F0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauJakwAKCRDZQZRRKWBy
9EjoAP41bNowZoEb/VnojODYDTIsxzEfvrOltzzab1mB9My5NwD/eeBBPWjY8orA
PYnTpI7TaC9alCzPsSiV0l1Ss0hF2gY=
=FyAF
-----END PGP SIGNATURE-----

--=-U62r30hsm7WM+5WWV9F0--

