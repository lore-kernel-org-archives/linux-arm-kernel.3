Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A09CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=; b=eSzrvTXILypj7i6DE1csc0xFZU
	gkx+nJ2lrI0/cnbYBFv88pARo7gzW3+kuUU3jruNc4svv3LjM2ROlyJQz3KW5z7w7IuGlMz62BY9S
	JN1GdVFUBjdHmMcUUQWOwv/mzrW6VVQotTQD+mDbbMq5fdrvtzl2BL+pQyDQ4Ts/STyhXkKfH6hs1
	Z/cKusJAVHB5A/a80Ntn06ZFWx6SJ2f/b0GHm7ihbzz5FIkOBVNZXtHsKtuDJ+q1/sr60yzHQNtGM
	+b2ByfXE0tAkMH1XkJFTf3F1n8f/7hNQ6MaWlebfoJ45JfBeqO6zLIg1uMZzo3x9+p2pcfbQqU37a
	/zLX8O4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZqq-0000000C3S3-1yZJ;
	Mon, 24 Nov 2025 16:55:44 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZqn-0000000C3RU-2ujn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:55:43 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8804650ca32so41668076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764003340; x=1764608140; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=;
        b=nH2+d+s4LZ3FKss7yUpXyiEz+M0hlXFZooIgAhN2OF8Jwom1Jf8ny5n3+/vpRo0lL+
         XIoP0aYJYincHrkhBISRoluWJEYoVLTnBES+/pu8TrmdCPGKu3elILXdQ9GMS6J6C7m5
         CrFZLIgm30P3VhBoEaU/4zDqSsvhHTk4s1LMkCp3Q9gglso/k5kRHIt86fdyrLI+YMpH
         BPrWg8dINu5u5H8RmHnosbwDHf7k5m9Rcg1NLs7d76qBtwYPAVWs2MYZlVaXAY9JgjGL
         az2f1eNO5QDIVPD2Dq/jfrv7uatBsFvbnvms89Ke1HHvT0bK6cZvf1400uTPsHLdnK8I
         FXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003340; x=1764608140;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=;
        b=wFCBjuDvgnX+35Jx3KI1Z6AJQxPZsQoSTSAefLmJV5LeW/38Wbp78MN78ZdE3EAB8D
         2LYbmXpp3Iin01Is7++bfc9rQmwgCygrizeiiBj4T+gXtEcZ3GY7OiDwwO1PSS/zP6m6
         5FA5zwPJqeaYaWWD5PTbWAV/QxFPKqlX9vLJeL2Hv+IkeJ7t19/tmKst17NufgnSSDth
         YIGnzq81LvfO6f+BcdT7sVNDxmJRgGgejlAE4/D3+yJZGmWW+5FTfzgIJht+kyDqkdMO
         bEvSC25S6lx6FjEnVP9uiHKwbTnIQgqYiGzKJRrOxCPWitIlG/Xmrmj0/T9f1gOu9lcY
         5g5g==
X-Forwarded-Encrypted: i=1; AJvYcCVW3Dj7rdsTb2e4H9A7Z6Wr9hazjFoEuCBUVrclWatElQ5PkgPWNB5C1aeVNO1JwFt+yYtPusGiFV36Q8S65c1m@lists.infradead.org
X-Gm-Message-State: AOJu0YyJJxMqy7IBwG4DzhBf+WLegqgzqLEJmFCNYOZtKk1pm+6Pv5at
	yE2OXyA5PQ7zJRmjTz414ltsmzlXICcw29wCGHSCZ1UA+5FRW86+/8ChLWZqtVyjmz4=
X-Gm-Gg: ASbGncsnviTHnxpfnvjTyq2MQdOCAKe+KxO+gCjwd/uXVNeDS9lwL1/QUUv4w0TYVUh
	uUrOA65byqnGAudBsnFHXZctPf+8v5+67VLbsP+ABGQGNN6NS3qTHygMw5PM+ltOQ8aEDHGNVw+
	HA9uvsxQNfGZmmUswA5IQujBZZsrZ0/OfApHbniv7mX03QsLifLqzq6axtxjEkwZHmx25+C9cho
	qcfOb1G1vHi096ImgIGXNY8lQLUsJjvLHvt6Qc1Y1wX6uVTEKsgtZZVh9iJ5BMh0Qkt/kBUXe1X
	1jul2GdqHgToA+mIRG2bl+lDDmw9+CpFnes+3kExPu+EUzbqtOFfQqaE7g4oHOJ4TwzDyBYamhj
	TWIXVN+sDbVguwQC2/exKLwQNtTDTjCBRnB5LIAL5fUbZ51dGIWpMS87T04sM/2C88WoJF7CbDI
	GWiV90L5FvXbs55HjC
X-Google-Smtp-Source: AGHT+IGvb6OSfhjD96Tta1mqwKgxzHProLkPjajJethJLmJaGb1/+UkSU3wc6V+DVMtcPYYdbjPJmQ==
X-Received: by 2002:ad4:5b8f:0:b0:882:4be6:9ad2 with SMTP id 6a1803df08f44-8847c511566mr194501866d6.33.1764003339847;
        Mon, 24 Nov 2025 08:55:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54c84esm100992886d6.30.2025.11.24.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:55:39 -0800 (PST)
Message-ID: <020d1263315b8a5ff3fdfb46d61d0108cdfa5bb3.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	linux-imx@nxp.com,
 l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 24 Nov 2025 11:55:37 -0500
In-Reply-To: <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
		 <20251121081911.1682-2-ming.qian@oss.nxp.com>
		 <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
		 <d282811a-866d-4ca8-b9f6-fc1da3a7565e@oss.nxp.com>
		 <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
	 <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ljeP6A7MDSCCnSfU19m1"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_085541_777663_B23E8294 
X-CRM114-Status: GOOD (  36.51  )
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


--=-ljeP6A7MDSCCnSfU19m1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 24 novembre 2025 =C3=A0 11:39 -0500, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le lundi 24 novembre 2025 =C3=A0 10:49 -0500, Frank Li a =C3=A9crit=C2=A0=
:
> > On Mon, Nov 24, 2025 at 09:38:15AM +0800, Ming Qian(OSS) wrote:
> > > Hi Frank,
> > >=20
> > > On 11/22/2025 12:08 AM, Frank Li wrote:
> > > > On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com=C2=
=A0wrote:
> > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > >=20
> > > > > For the i.MX8MQ platform, there is a hardware limitation: the g1 =
VPU and
> > > > > g2 VPU cannot decode simultaneously; otherwise, it will cause bel=
ow bus
> > > > > error and produce corrupted pictures, even led to system hang.
> > > > >=20
> > > > > [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode=
 timed out.
> > > > > [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error de=
tected.
> > > > >=20
> > > > > Therefore, it is necessary to ensure that g1 and g2 operate alter=
nately.
> > > > > Then this allows for successful multi-instance decoding of H.264 =
and
> > > > > HEVC.
> > > > >=20
> > > > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > ---
> > > > > =C2=A0 drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > > > =C2=A0 .../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | =
26 +++++++++++++++++++
> > > > > =C2=A0 .../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 4 ++=
+
> > > > > =C2=A0 3 files changed, 31 insertions(+)
> > > > >=20
> > > > ...
> > > > > =C2=A0 #include <linux/workqueue.h>
> > > > > +#include <linux/iopoll.h>
> > > > > =C2=A0 #include <media/v4l2-event.h>
> > > > > =C2=A0 #include <media/v4l2-mem2mem.h>
> > > > > =C2=A0 #include <media/videobuf2-core.h>
> > > > > @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev=
 *vpu,
> > > > >=20
> > > > > =C2=A0=C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->cloc=
ks);
> > > > >=20
> > > > > +	if (vpu->variant->shared_resource)
> > > > > +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> > > > > +
> > > > > =C2=A0=C2=A0	hantro_job_finish_no_pm(vpu, ctx, result);
> > > > > =C2=A0 }
> > > > >=20
> > > > > @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_c=
tx
> > > > > *ctx)
> > > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(20=
00));
> > > > > =C2=A0 }
> > > > >=20
> > > > > +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> > > > > +{
> > > > > +	u32 data;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!vpu->variant->shared_resource)
> > > > > +		return 0;
> > > > > +
> > > > > +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 *
> > > > > NSEC_PER_MSEC, false,
> > > > > +				vpu->variant->shared_resource, 1, 0);
> > > > > +	if (ret) {
> > > > > +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > >=20
> > > > why not use a mutex?
> > > >=20
> > > > mutex() lock here, unlock at hantro_job_finish(), if second instanc=
e
> > > > run to here, mutex() will block thread, until previous hantro_job_f=
inish()
> > > > finish.
> > > >=20
> > > > Frank
> > >=20
> > > G1 and G2 are two different devices. If I were to use a mutex, I woul=
d
> > > need to define a global mutex. Therefore, to avoid using a global mut=
ex,
> > > I only define a static atomic variable.
> >=20
> > static atomic varible also is global.=C2=A0 Global mutex is allowed if =
it is
> > really needed.
> >=20
> > >=20
> > > If a static mutex is acceptable, I think I can change it to a mutex.
> >=20
> > ref to
> > https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/base/core.c#L=
43
>=20
> My main concern with either of these approaches is that it kills the abil=
ity to
> rmmod the driver forever. The only working approach would be that both dr=
ivers
> depends on a third driver that provide the synchronization services.

I do realize after the fact that my answer is a little off considering its =
a
drivers against itself (not cross-driver, that would be a huge pain if it w=
as
the case).

Checking further, the ref to the counter (or mutex) should cleanly be gone =
by
the time the driver is removed, so perhaps its fine, though best to test it=
.
Though, in both cases, I'm not happy to see code that will wait for multipl=
e
milliseconds on either home made mutex or a real mutex. Adding another arbi=
trary
timeout is also not very nice either. The current software watchdog already=
 get
in the way when testing simulated IP.

I know its work, but what about a recounted singleton, with a notifier so w=
e can
schedule work when the resource is free ?

Nicolas

>=20
> Nicolas
>=20
> >=20
> > Frank
> > >=20
> > > Regards,
> > > Ming
> > >=20
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > =C2=A0 static void device_run(void *priv)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0	struct hantro_ctx *ctx =3D priv;
> > > > > =C2=A0=C2=A0	struct vb2_v4l2_buffer *src, *dst;
> > > > > =C2=A0=C2=A0	int ret;
> > > > >=20
> > > > > +	ret =3D hantro_wait_shared_resource(ctx->dev);
> > > > > +	if (ret < 0)
> > > > > +		goto err_cancel_job;
> > > > > +
> > > > > =C2=A0=C2=A0	src =3D hantro_get_src_buf(ctx);
> > > > > =C2=A0=C2=A0	dst =3D hantro_get_dst_buf(ctx);
> > > > ...
> > > >=20
> > > > >=20
> > > > > --
> > > > > 2.34.1
> > > > >=20

--=-ljeP6A7MDSCCnSfU19m1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSSOCQAKCRDZQZRRKWBy
9HqhAQCHP5ZntFVjhc+JmmT18XRzd/2qvwhx74x5R7o/qW0ZEAEAvh2YL6yFIWqk
/QfAZZ+Z2oYT9qGwQPIYvYmogZK8tQ8=
=gS+Q
-----END PGP SIGNATURE-----

--=-ljeP6A7MDSCCnSfU19m1--

