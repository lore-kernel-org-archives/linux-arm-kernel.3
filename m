Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC74CFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=; b=Or5WCDdcJgjKTZSLVVdO/Yr18u
	BwaOtsSYbKE0K8b1DwL1P2I0y4lZO2W6LgDAYjtpQWbx0o10hCvwQGAaYroe7uAXD0tFspD0EgeWV
	fkQYriQVvNNMTyVtA/FYwdwB7aGwMuv+LUAOclsEoXGvWffratmzKvmwvg8NsjcblL3uZsVVuHSfS
	UvogShBXcHwXEAj5P8ZLzGTYmh0fMysxYi59OqtJorDOijTFMZkPKJ8dZBwek8Dv8SEeVjLJQeXTS
	dfwn5KqUBRrKl/mBEZKGhGa4sT0hfz07yUuOfT5WMava134cGswjFW/7bqC/EJ85f6tXDFlIkl+yU
	9Hf9NW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZbS-0000000C0co-2eTr;
	Mon, 24 Nov 2025 16:39:50 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZbP-0000000C0cB-32Cs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:39:49 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-8b2f2c5ec36so527015485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764002386; x=1764607186; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=;
        b=hzc1RY1E4Xazqg6Q3nlp6WTcHFCMN2tVg6xT/zM54UtrgqqEYknsMV7NDDcvNGT1Vn
         Yi6PevTRVTOLFS8ey7KR6DwP9a5ivVp9C1MHY51kepOSUGWiFn/CpAdfl63d6U/S0gZY
         4Bjx0wOdf1pc/Undhl3n/BBTUWusUaCPguUrvf83hvhJamu+273aO8NXOdH5uaSrEycK
         Ue/3OiaofpvXrhAKEUWC9aw9lWB5rKFSI6z6wKOwPScDtE9fuia32XeMeMN9mS6ztpR0
         yUmoZtIyyX/nAV9X3PuDrW4LO2gZ9LIQL/oXsM5CVV9qtP3/xfdfIvSFGIYxahlWn/yX
         yLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764002386; x=1764607186;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=;
        b=YAy54h4mpOBollc/kR4YxY/zVzd4DjIte9DBZu8s0715eByXuPN+IUBj3zV1iVfucs
         56Dysimc0pWUgNUV6/DL39PhD35dCqW5riuhPqPVdTqXBhtxbA1rjldHBRO9daZ+SUdn
         wSEsTcAJUNb6azwmlcVjKWGnKTW0glpyEaXsNQRjPtKvhkl8rXt6U4HrzuHwTAgfVKUo
         sCtw8MkBTCjNs1YIQ21tcnqrp+LaZODh5EbbP/csaSixwMbyCs7E5kJHgqa/Ue5/2VBp
         qbhpgle7Wg6lokuv692XiSxj+PfKYpAruIW2cZRWWoGe010Y24bJOIvDNrh8TK+jpYVQ
         mDug==
X-Forwarded-Encrypted: i=1; AJvYcCXeE5gJ59b5Sble5syuL3tvHOeCf3zfqHQZl0WI8PDC3sPUdX9cI1sfGqUurBgLItHUM+tnERcCoXiN7AovaV4y@lists.infradead.org
X-Gm-Message-State: AOJu0YzxZJJEFGA+X+WAEnx1w828EH1zBV7ApQtsA7yd6GufRhmF42PN
	5xmG4r/6/taYDQVusIROnn/u+eNnuw08VA3750Qaa89D1tI6hrMrhmFS1HHpmS9iTtc=
X-Gm-Gg: ASbGncuaTY2cGQwUhFdu7dK96ZxAs1TCVp1rqytQYkW2gIZI+vZbkaAh6lzDtWhuwF5
	kaUfW4AHTyQ+qMSq/i8X1+Or+fvaKE+piyLa5Mk5XrxQ3af5OuDj2GuHzNaIBcTcoYSTpFY8k4n
	QFZdkTuOuNrMbgbINsvsYMBI6KBZFnEtJs/dbGm2vkfm828usjBonFCT3J0pd1CPKd9HrqOeh/+
	juIehxS+3A+E+pBKdcFxqFVrUlgwn8ImODyG84lq0vXo+x5uBY4MXR5e6PXIgAPP5rlnGrYgwk1
	ksqmWNw/AWizvytFVD0ifLsv+jX3NHHsMwdux7xvIhe88MldgNG0xN6+Mg23CSTHjMWWBN91iNZ
	t4JhTFC76T1jR4Zc5t2zKXSv29/LbFy4FZ9G0We8yonu6ujF7POPuZwA+HCX3bhkHAu2j3Ilm7I
	LRqNcbyn9zpEBay02u
X-Google-Smtp-Source: AGHT+IEhf7zBXg2obuM0Wvyx3W1baR9UChFOPX2BoB/TIpveKMriV0p5s5SimoGLInp8YO2+ZvsNlQ==
X-Received: by 2002:a05:620a:701a:b0:8b2:1568:82ce with SMTP id af79cd13be357-8b33d4680b0mr1458433285a.37.1764002385770;
        Mon, 24 Nov 2025 08:39:45 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db58fsm979338885a.37.2025.11.24.08.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:39:45 -0800 (PST)
Message-ID: <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
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
Date: Mon, 24 Nov 2025 11:39:43 -0500
In-Reply-To: <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
	 <20251121081911.1682-2-ming.qian@oss.nxp.com>
	 <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
	 <d282811a-866d-4ca8-b9f6-fc1da3a7565e@oss.nxp.com>
	 <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9MfzEt4m6odi0eUBy2qY"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_083948_022991_1B21298D 
X-CRM114-Status: GOOD (  31.72  )
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


--=-9MfzEt4m6odi0eUBy2qY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 24 novembre 2025 =C3=A0 10:49 -0500, Frank Li a =C3=A9crit=C2=A0:
> On Mon, Nov 24, 2025 at 09:38:15AM +0800, Ming Qian(OSS) wrote:
> > Hi Frank,
> >=20
> > On 11/22/2025 12:08 AM, Frank Li wrote:
> > > On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com=C2=A0=
wrote:
> > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > >=20
> > > > For the i.MX8MQ platform, there is a hardware limitation: the g1 VP=
U and
> > > > g2 VPU cannot decode simultaneously; otherwise, it will cause below=
 bus
> > > > error and produce corrupted pictures, even led to system hang.
> > > >=20
> > > > [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode t=
imed out.
> > > > [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error dete=
cted.
> > > >=20
> > > > Therefore, it is necessary to ensure that g1 and g2 operate alterna=
tely.
> > > > Then this allows for successful multi-instance decoding of H.264 an=
d
> > > > HEVC.
> > > >=20
> > > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > ---
> > > > =C2=A0 drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=
=A0 1 +
> > > > =C2=A0 .../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 26=
 +++++++++++++++++++
> > > > =C2=A0 .../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 4 +++
> > > > =C2=A0 3 files changed, 31 insertions(+)
> > > >=20
> > > ...
> > > > =C2=A0 #include <linux/workqueue.h>
> > > > +#include <linux/iopoll.h>
> > > > =C2=A0 #include <media/v4l2-event.h>
> > > > =C2=A0 #include <media/v4l2-mem2mem.h>
> > > > =C2=A0 #include <media/videobuf2-core.h>
> > > > @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev *=
vpu,
> > > >=20
> > > > =C2=A0=C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks=
);
> > > >=20
> > > > +	if (vpu->variant->shared_resource)
> > > > +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> > > > +
> > > > =C2=A0=C2=A0	hantro_job_finish_no_pm(vpu, ctx, result);
> > > > =C2=A0 }
> > > >=20
> > > > @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx
> > > > *ctx)
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(2000=
));
> > > > =C2=A0 }
> > > >=20
> > > > +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> > > > +{
> > > > +	u32 data;
> > > > +	int ret;
> > > > +
> > > > +	if (!vpu->variant->shared_resource)
> > > > +		return 0;
> > > > +
> > > > +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 *
> > > > NSEC_PER_MSEC, false,
> > > > +				vpu->variant->shared_resource, 1, 0);
> > > > +	if (ret) {
> > > > +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> > > > +		return -EINVAL;
> > > > +	}
> > >=20
> > > why not use a mutex?
> > >=20
> > > mutex() lock here, unlock at hantro_job_finish(), if second instance
> > > run to here, mutex() will block thread, until previous hantro_job_fin=
ish()
> > > finish.
> > >=20
> > > Frank
> >=20
> > G1 and G2 are two different devices. If I were to use a mutex, I would
> > need to define a global mutex. Therefore, to avoid using a global mutex=
,
> > I only define a static atomic variable.
>=20
> static atomic varible also is global.=C2=A0 Global mutex is allowed if it=
 is
> really needed.
>=20
> >=20
> > If a static mutex is acceptable, I think I can change it to a mutex.
>=20
> ref to
> https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/base/core.c#L43

My main concern with either of these approaches is that it kills the abilit=
y to
rmmod the driver forever. The only working approach would be that both driv=
ers
depends on a third driver that provide the synchronization services.

Nicolas

>=20
> Frank
> >=20
> > Regards,
> > Ming
> >=20
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > =C2=A0 static void device_run(void *priv)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0	struct hantro_ctx *ctx =3D priv;
> > > > =C2=A0=C2=A0	struct vb2_v4l2_buffer *src, *dst;
> > > > =C2=A0=C2=A0	int ret;
> > > >=20
> > > > +	ret =3D hantro_wait_shared_resource(ctx->dev);
> > > > +	if (ret < 0)
> > > > +		goto err_cancel_job;
> > > > +
> > > > =C2=A0=C2=A0	src =3D hantro_get_src_buf(ctx);
> > > > =C2=A0=C2=A0	dst =3D hantro_get_dst_buf(ctx);
> > > ...
> > >=20
> > > >=20
> > > > --
> > > > 2.34.1
> > > >=20

--=-9MfzEt4m6odi0eUBy2qY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSSKTwAKCRDZQZRRKWBy
9I6lAQChTt9rXsTyp+alYyrA7Oe8CReteB0yVGS6rHYuqIhe1wEAiasfKosen86t
jj/9bnBTj+RVfWUI5e4CEn7uH8QRMQM=
=aSTR
-----END PGP SIGNATURE-----

--=-9MfzEt4m6odi0eUBy2qY--

