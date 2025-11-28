Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AF6D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6w8QrfrOXi6sp9Fe0hRWKIBPis0Rvyzh9m6dBqHPME=; b=deIuZgtH/TezQI7Y94A9lm2Hh+
	PyEzcK5BJqPsXx63TTjyFLnzEpKR6G2Kl//x6Op4ETaVV3KHD+XlLzcogofGcXs9E2D7l7xDCaGvR
	4Qn2XGvczDd72CnOaLE9DZw5kRf+d2H7q3dgak1X2iJcSzOwX+5Od3kJ1+LhmzOcl53AejVdZ8OSQ
	VPjpWssaOMQ4xmkH48FLpV8Ho8atPPHDO/KkjjeSQ0WRRfRUe8g6OuXsPxBEEHv1swXlLocdRImkQ
	9l6DgkzlQWGWY1CxzU1Duzr10JEMy8zC4zGRhp0Eb/ME0F4BjkveYnVEMG0bGqk05urLzqbcFuh8L
	Kyz2WoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP61H-00000000yAO-27es;
	Fri, 28 Nov 2025 21:28:47 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP61E-00000000y9y-2SP2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 21:28:46 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-882399d60baso17884756d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 13:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764365323; x=1764970123; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g6w8QrfrOXi6sp9Fe0hRWKIBPis0Rvyzh9m6dBqHPME=;
        b=z3JbcDde2N9vGp4MdST6W3l9ZMJ7837pqT/0dIXubw31lCiU17WmW6VZcmEvg2OxNO
         wHDbo5yox96y7/nuiNTbJqOW3MBwZ/HrfrICTk5AG2uNa10i8YbXMCD59QGx6lFUpo+t
         pnBRiSlwD0OERwcVr8dguDt11rO+OZBKDDfa7AS+JXH49y1kIeqEVDaD3/mZpK4IwTXm
         Xx+Uuu6X5eMe0tBl7x9qDFI83nEYGXMroKGm3SRB4yb+4RN9lve5LEKRrD89tn8YJbPH
         6HX294nSatfn+GnlvzeApDSfKWu9LgPGOJKPbPn7Ms0jGniYcUubldY72X/3YezoIVTI
         vljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764365323; x=1764970123;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g6w8QrfrOXi6sp9Fe0hRWKIBPis0Rvyzh9m6dBqHPME=;
        b=qfytEoB39zUcaCtpX45SSSyyzKdFsJevPhovPvmJogEgNJBTY/I7og+8eOui6saI+i
         WdEgVjaQchG5BUbyXcXMx2XQ21wo9UiMCWaEeTTQaJ2oVkyWyPurG5sClcqlDYM45AMw
         srlJnijRv5/H6Ly4igy8TPtlji19/SfsRTPsVX3k7CNolpOAtn1AJFhQRbaAQQK9A3f7
         oZsvs6jF7NtK9TZF3yKAu9B99/5zjCD8/fref9MUVSut9K/PU7FbK4G0luqJbOz88TfB
         7wUj293ZdwhSgsOD1IagEdSqiRxoewzYbkWkoVU7OFWZbl0d12ZG9aNqMhdGSaXmVZ8M
         P91g==
X-Forwarded-Encrypted: i=1; AJvYcCVA2x7pMfucmYZ9ubxFRDB2V0Kpf0t5AjZcrOBuMjV+qaX+G0mNttkf30gq3AuMhPAV8n+zGEjpzWUKdch8oju1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgl8A+l3fM5t+JzwA+UdPDJsmhfMtxUmZk3Dy2VaF1Yssway0C
	1RJyZ7PY5rhjRicF8xM5yG7TubWmXeeyyHUQFfiK6jQcxQf1b+VcbsonG/o+xKW6UbGJ++21nel
	ZDHDp9I3d2Q==
X-Gm-Gg: ASbGncvk+7SgPI3Bd+JA0EpdBRXk1kAaqUs0a3774oh8gmvHptMLmmpwRZkz/JE8+aD
	dlz/P3WIt5Gx6WCdJg/hHYo69MIuhWWP9fAxcENmVPMPLSlK6WXalUKAHMRuSaLBWl894GE886f
	Trv17/dlHsFlsp23Il68SYxb6cHzwCWEJQYiqJH0x+/HzTxIeAmqVgSW8LSwiMmaCF8kURt/z5V
	ZmNqItS34iJmHyUKZhFWhlfNaycAMx1oVyAWQX3ofd2wRc5fEXbTgWh7CDsUCnnHl4qdLVJ7EIw
	z9ynB4+IwF3eDr4S+wS1+Wo0oV3u8WVUX9q3ls6e7nf+6VED7PvMevfQXJGiqMGtyecwN0ph9Zq
	uoCgpslPwbpSXrDWOdv8ECEHt76mETZ+ox6edy5VpD5e7+vZyRheGUT5U5spmokPLHBpaViPjh9
	B+NqMLSxBHVEguxwL+
X-Google-Smtp-Source: AGHT+IF5rpKVWKhhH5X99ZzJRg/cYQ5xHYiK2flb6+MOxSeRJ2HbYvrgV+3FUbcl1ZVy3O+iyDvm2Q==
X-Received: by 2002:a05:6214:2a89:b0:798:acd7:2bb with SMTP id 6a1803df08f44-8863af9edcfmr276981516d6.51.1764365322897;
        Fri, 28 Nov 2025 13:28:42 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b4afe8sm35038726d6.29.2025.11.28.13.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 13:28:42 -0800 (PST)
Message-ID: <46e9a5a881946d879d1b2af3421d574b26256ae3.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Nov 2025 16:28:39 -0500
In-Reply-To: <20251128025117.535-2-ming.qian@oss.nxp.com>
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
	 <20251128025117.535-2-ming.qian@oss.nxp.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Wt1eyF/4iRLYXSmGIIpE"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_132844_895152_CA1460CF 
X-CRM114-Status: GOOD (  26.49  )
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


--=-Wt1eyF/4iRLYXSmGIIpE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 28 novembre 2025 =C3=A0 10:51 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For the i.MX8MQ platform, there is a hardware limitation: the g1 VPU and
> g2 VPU cannot decode simultaneously; otherwise, it will cause below bus
> error and produce corrupted pictures, even led to system hang.
>=20
> [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode timed o=
ut.
> [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error detected.
>=20
> Therefore, it is necessary to ensure that g1 and g2 operate alternately.
> Then this allows for successful multi-instance decoding of H.264 and HEVC=
.
>=20
> To achieve this, we can have g1 and g2 share the same v4l2_m2m_dev, and
> then the v4l2_m2m_dev can handle the scheduling.
>=20
> Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

I like where this is going.
> ---
> v2
> - Abandon the waiting approach.
> - Switch to a shared v4l2_m2m_dev solution.
>=20
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0.../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 41 ++++++=
+++++++++++--
> =C2=A0.../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 2 +
> =C2=A03 files changed, 42 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index e0fdc4535b2d..8a0583f95417 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -77,6 +77,7 @@ struct hantro_irq {
> =C2=A0 * @double_buffer:		core needs double buffering
> =C2=A0 * @legacy_regs:		core uses legacy register set
> =C2=A0 * @late_postproc:		postproc must be set up at the end of the job
> + * @shared_resource:		flag of shared resource
> =C2=A0 */
> =C2=A0struct hantro_variant {
> =C2=A0	unsigned int enc_offset;
> @@ -101,6 +102,7 @@ struct hantro_variant {
> =C2=A0	unsigned int double_buffer : 1;
> =C2=A0	unsigned int legacy_regs : 1;
> =C2=A0	unsigned int late_postproc : 1;
> +	unsigned int shared_resource : 1;

Instead of that, I'd make an array of compatible node we are going to share=
 the
with.

> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 60b95b5d8565..f42b2df86806 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -35,6 +35,10 @@ module_param_named(debug, hantro_debug, int, 0644);
> =C2=A0MODULE_PARM_DESC(debug,
> =C2=A0		 "Debug level - higher value produces more verbose messages");
> =C2=A0
> +static DEFINE_MUTEX(shared_dev_lock);
> +static atomic_t shared_dev_ref_cnt =3D ATOMIC_INIT(0);
> +static struct v4l2_m2m_dev *shared_m2m_dev;
> +
> =C2=A0void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id)
> =C2=A0{
> =C2=A0	struct v4l2_ctrl *ctrl;
> @@ -1035,6 +1039,37 @@ static int hantro_disable_multicore(struct hantro_=
dev *vpu)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev *v=
pu)
> +{
> +	if (!vpu->variant || !vpu->variant->shared_resource)
> +		return v4l2_m2m_init(&vpu_m2m_ops);
> +
> +	scoped_guard(mutex, &shared_dev_lock) {
> +		if (atomic_inc_return(&shared_dev_ref_cnt) =3D=3D 1) {
> +			shared_m2m_dev =3D v4l2_m2m_init(&vpu_m2m_ops);
> +			if (IS_ERR(shared_m2m_dev))
> +				atomic_dec(&shared_dev_ref_cnt);
> +		}
> +	}
> +
> +	return shared_m2m_dev;
> +}
> +
> +static void hantro_put_v4l2_m2m_dev(struct hantro_dev *vpu)
> +{
> +	if (!vpu->variant || !vpu->variant->shared_resource)
> +		v4l2_m2m_release(vpu->m2m_dev);
> +
> +	scoped_guard(mutex, &shared_dev_lock) {
> +		if (!atomic_dec_return(&shared_dev_ref_cnt)) {
> +			if (!IS_ERR(shared_m2m_dev)) {
> +				v4l2_m2m_release(shared_m2m_dev);
> +				shared_m2m_dev =3D NULL;
> +			}
> +		}
> +	}
> +}

Then instead of this, I would like to add a kref to v4l2_m2m_dec, I checked
already and this is both safe and backward compatible.

Then in the get function, you will walk over the compatible that are differ=
ent
from the currently probe node. If you find one that is initialized, you wil=
l
call v4l2_m2m_get() to obtained a shared reference. In _remove() you will s=
imply
do v4l2_m2m_put() instead of v4l2_m2m_release().

Hope the others are happy with this. For Hantro drivers, this will make it =
a
much more powerfull mechanism.

Nicolas

> +
> =C2=A0static int hantro_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	const struct of_device_id *match;
> @@ -1186,7 +1221,7 @@ static int hantro_probe(struct platform_device *pde=
v)
> =C2=A0	}
> =C2=A0	platform_set_drvdata(pdev, vpu);
> =C2=A0
> -	vpu->m2m_dev =3D v4l2_m2m_init(&vpu_m2m_ops);
> +	vpu->m2m_dev =3D hantro_get_v4l2_m2m_dev(vpu);
> =C2=A0	if (IS_ERR(vpu->m2m_dev)) {
> =C2=A0		v4l2_err(&vpu->v4l2_dev, "Failed to init mem2mem device\n");
> =C2=A0		ret =3D PTR_ERR(vpu->m2m_dev);
> @@ -1225,7 +1260,7 @@ static int hantro_probe(struct platform_device *pde=
v)
> =C2=A0	hantro_remove_enc_func(vpu);
> =C2=A0err_m2m_rel:
> =C2=A0	media_device_cleanup(&vpu->mdev);
> -	v4l2_m2m_release(vpu->m2m_dev);
> +	hantro_put_v4l2_m2m_dev(vpu)

> =C2=A0err_v4l2_unreg:
> =C2=A0	v4l2_device_unregister(&vpu->v4l2_dev);
> =C2=A0err_clk_unprepare:
> @@ -1248,7 +1283,7 @@ static void hantro_remove(struct platform_device *p=
dev)
> =C2=A0	hantro_remove_dec_func(vpu);
> =C2=A0	hantro_remove_enc_func(vpu);
> =C2=A0	media_device_cleanup(&vpu->mdev);
> -	v4l2_m2m_release(vpu->m2m_dev);
> +	hantro_put_v4l2_m2m_dev(vpu);
> =C2=A0	v4l2_device_unregister(&vpu->v4l2_dev);
> =C2=A0	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> =C2=A0	reset_control_assert(vpu->resets);
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index 5be0e2e76882..5111ce5c36f3 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -356,6 +356,7 @@ const struct hantro_variant imx8mq_vpu_g1_variant =3D=
 {
> =C2=A0	.num_irqs =3D ARRAY_SIZE(imx8mq_irqs),
> =C2=A0	.clk_names =3D imx8mq_g1_clk_names,
> =C2=A0	.num_clocks =3D ARRAY_SIZE(imx8mq_g1_clk_names),
> +	.shared_resource =3D 1,
> =C2=A0};
> =C2=A0
> =C2=A0const struct hantro_variant imx8mq_vpu_g2_variant =3D {
> @@ -371,6 +372,7 @@ const struct hantro_variant imx8mq_vpu_g2_variant =3D=
 {
> =C2=A0	.num_irqs =3D ARRAY_SIZE(imx8mq_g2_irqs),
> =C2=A0	.clk_names =3D imx8mq_g2_clk_names,
> =C2=A0	.num_clocks =3D ARRAY_SIZE(imx8mq_g2_clk_names),
> +	.shared_resource =3D 1,
> =C2=A0};
> =C2=A0
> =C2=A0const struct hantro_variant imx8mm_vpu_g1_variant =3D {

--=-Wt1eyF/4iRLYXSmGIIpE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoUCAAKCRDZQZRRKWBy
9H6pAP9Yhdngbwt8OH8RGhvCSHfsb/fie3vizZPWTzJzx3viGAEAsoVoim+8k68z
i06SAHMjZlxmNSWFIYqN873wNoWfWAs=
=xBWz
-----END PGP SIGNATURE-----

--=-Wt1eyF/4iRLYXSmGIIpE--

