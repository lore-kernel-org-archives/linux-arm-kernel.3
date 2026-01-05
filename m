Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668D0C79FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gtqFFWFbmnYqsdra7V6E0H/IysyN/79mV6ZrXnL61U=; b=Y0/N8clCTC1TfPkbswALgZcuFU
	54mWn9ZVxfISFuYEHi8SAgQOgUQ4iswjcn8MECDo3brOITHD9Na2/nCFC6xsIZsNbK8jwZfxB6TWR
	Two95quF0EOZqF1y5eyN42T124WDo1NrAtPy5yvLMG0HkUabP+dVlSmm+DBozooeyOM/A08wji7Cq
	XfP+LOYU5vURkS70jsHQL6m1pb5vT57FAdAQNA1loK12RJilzJrPVyGdZYw4ApfHIgrAqgHAeWy26
	epVjZkQvRoF9B5J3NwJma6FGzAMxM1hb7+452hzGWIVzJA6VclVrmoaqYhA064uW0/Vs9KvbDsoLF
	RGKbQ07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcp03-0000000BuSu-1lJN;
	Mon, 05 Jan 2026 18:08:15 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcp00-0000000BuRk-3YEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:08:14 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-888310b91c5so17297636d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767636491; x=1768241291; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1gtqFFWFbmnYqsdra7V6E0H/IysyN/79mV6ZrXnL61U=;
        b=eDcOqqDfv73nb7WEUxLiDnhdC2y5wcKvTmynj+v6RtYgchfytGzP57AhBASMA0FjdR
         3SNdZH9BsEVRe8xnCykCTWus400F9vPgjkY2lep4L+Xb0svEBOXLqdn+TjzR7zpACHmf
         D3I92aEwqs+CF3UtAHq8S18ZGmMH+QIqGtsbEymYYJrjg71AmyX7j4pd0vql+xbf0LKE
         rIP4MF75tSm8YE+lafZZe4dZw37IHnOoGI7LjXA6wkEJPkoJiEQPF0wy37hsdiiPPVG1
         e+wjHL4A2GqHuhc0KcrkVaT/piVS0werDmF80AoASlcOOxbAzhTtM+lSDmdu35gsEUKB
         1n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636491; x=1768241291;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gtqFFWFbmnYqsdra7V6E0H/IysyN/79mV6ZrXnL61U=;
        b=X6juIKqK3s3er+5MwsNIfHpIlX1mMfozkGdCkfMYfYxtmQmCvaa9Xg9GG/eyaF7bpA
         KZq2qtomIBwiqulXccTzgDsFmJpWQL+eW2qbF34L/A6HjWSQmr4sY8P84WKNiH37Us+c
         FlO8qzyTIC036NqU1FKWMfvm7nai8F1Dh5Mq4NdKo1yLgVpMOOxZg37SDvwzJQZPsAoA
         wtvrB6O/ZU914nzR/OwNU2mz9AnO3D3F7gxyRdbHKw7lLLlk8vkTD5lHq82E/vCcXSGz
         SjUYaOoW3T32QGGw9y6fBNaXX5wJh3Xzy5+TzdBz6hwYFtVYbWu45WYHOJvMQx0lh0bY
         uoEw==
X-Forwarded-Encrypted: i=1; AJvYcCU62vflaDKJ1mFt5f6VokKvs8oREBLiRlOSp9l8dSUv9+Xck47r/CUKktYVPhio9/wjsJ+5s2aDPwOYr5mKw3NJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwPuT13umjpm5PYp94q3165CLcMv7crZmXH9UkLzc6WxRC5sNY/
	4SFTCS8rIoDKU81N8QFT5nbUDOBr1UU2NHrcT1YYk4t3ODNWuv/JK03HeqirHZyBtIE=
X-Gm-Gg: AY/fxX5Ax3oY7rtD38+h1RWTgZ5KXJrXa3exIKvI5BbrgUtv9OkT1/wUWe/NSpzcUnt
	/MJAB8+5T4N/9KQNQpTMwzu2Xy8ikeFfB7ArVhVlRf1un07rrQynAZrtSMLMb+ERrkp6b4J/wS9
	PD8oFwckFY9hyjTJVlZet5EY9azvq2pdKxHe3vscJWyLV5F2BrB/Hm3Pj5DfAud249B32ezlLsP
	UptrWHt7BjVWKJN/6kPtMkOK74BC1KFZPND+Q5s3HZ6XGIJzHP7VFlGX0QdGb48PGo41o1yQZub
	Oynd6QFXF96VYY1x1tnOxO40j+kXacOCiyVR3Ej7RpgDRNehuJxr31QGHehmAivYQuyO+6d+oES
	3CJ6stzi4wwzGTn7v200EHAWwAV8SIhn3WNgtNCOBVHvjZUlVzdFlB2ZCz90MvjEqvk4YQ2OrtY
	8R1CdTpYX8Y1snFjUz
X-Google-Smtp-Source: AGHT+IENhU1Bd6KYqPomQwkI/vDljW6F2Sf1y49E1gWNuGUePlUTcFMG+iVNXpq2O9aWulA+yUJXTw==
X-Received: by 2002:a05:6214:224e:b0:88a:525a:8dbf with SMTP id 6a1803df08f44-890769ababcmr850536d6.15.1767636491324;
        Mon, 05 Jan 2026 10:08:11 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890753ef51csm3947706d6.16.2026.01.05.10.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:08:10 -0800 (PST)
Message-ID: <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ulf Hansson <ulf.hansson@linaro.org>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 05 Jan 2026 13:08:08 -0500
In-Reply-To: <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com>
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
	 <20251205015428.643-2-ming.qian@oss.nxp.com>
	 <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-4H25zADnHXlwNymaecNy"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_100813_514933_6F6AC10B 
X-CRM114-Status: GOOD (  33.40  )
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


--=-4H25zADnHXlwNymaecNy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:39 +0100, Ulf Hansson a =C3=A9crit=
=C2=A0:
> On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> >=20
> > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > Adding a reference count to the v4l2_m2m_dev structure allow safely
> > sharing it across multiple hardware nodes. This can be used to prevent
> > running jobs concurrently on m2m cores that have some internal resource
> > sharing.
> >=20
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>=20
> I certainly don't have the complete picture for how this needs to work.
>=20
> However, I was thinking that rather than using a kref and having to
> share two specific functions to update it (v4l2_m2m_get|put), couldn't
> we just use a device-link instead?

The device link seems to be intended for power management, I'm effectively =
not
familiar with it, so thanks for the information. However, my impression is =
that
this is indented to describe power management dependencies on siblings, but=
 this
was done differently on this SoC (way before my time here), the DT seems to
describe a block controller which is common to the two (defective) cores. S=
o
power management wise, its already handled.

Be aware that my intent is to rename v4l2_m2m_dev into v4l2_m2m_sched. Its =
not a
dev wrapper, but a helper object that will schedule work coming from N
v4l2_m2m_ctx (per open() calls). Making this helper object ref counted make=
s the
live-time management a lot simpler, and since its not a dev wrapper, this p=
atch
is not creating a second refcount for the same object.

regards,
Nicolas


>=20
> Kind regards
> Uffe
>=20
> > ---
> > v4
> > - Add my Signed-off-by
> >=20
> > =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c | 23 +++++++++++++++++++++=
++
> > =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++++
> > =C2=A02 files changed, 44 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l=
2-
> > core/v4l2-mem2mem.c
> > index fec93c1a9231..ae0de54d4c3e 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -90,6 +90,7 @@ static const char * const m2m_entity_name[] =3D {
> > =C2=A0 * @job_work:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 worker to run queued jobs.
> > =C2=A0 * @job_queue_flags:=C2=A0=C2=A0 flags of the queue status, %QUEU=
E_PAUSED.
> > =C2=A0 * @m2m_ops:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 driver callbacks
> > + * @kref:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 device reference count
> > =C2=A0 */
> > =C2=A0struct v4l2_m2m_dev {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_m2m_ctx=C2=A0=C2=
=A0=C2=A0=C2=A0 *curr_ctx;
> > @@ -109,6 +110,8 @@ struct v4l2_m2m_dev {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job_queue_flags;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_m2m_ops *m=
2m_ops;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kref kref;
> > =C2=A0};
> >=20
> > =C2=A0static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_c=
tx
> > *m2m_ctx,
> > @@ -1200,6 +1203,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct
> > v4l2_m2m_ops *m2m_ops)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&m2m_dev->job=
_queue);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_init(&m2m_dev->job=
_spinlock);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_WORK(&m2m_dev->job_work=
, v4l2_m2m_device_run_work);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kref_init(&m2m_dev->kref);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return m2m_dev;
> > =C2=A0}
> > @@ -1211,6 +1215,25 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_d=
ev)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(v4l2_m2m_release);
> >=20
> > +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kref_get(&m2m_dev->kref);
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_m2m_get);
> > +
> > +static void v4l2_m2m_release_from_kref(struct kref *kref)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_m2m_dev *m2m_dev =3D =
container_of(kref, struct
> > v4l2_m2m_dev, kref);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_release(m2m_dev);
> > +}
> > +
> > +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kref_put(&m2m_dev->kref, v4l2_m2m=
_release_from_kref);
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_m2m_put);
> > +
> > =C2=A0struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_d=
ev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 void *drv_priv,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int (*queue_init)(void *priv, struct vb2_queue *src_v=
q,
> > struct vb2_queue *dst_vq))
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.=
h
> > index bf6a09a04dcf..ca295c660c7f 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -547,6 +547,27 @@ v4l2_m2m_register_media_controller(struct v4l2_m2m=
_dev
> > *m2m_dev,
> > =C2=A0 */
> > =C2=A0void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
> >=20
> > +/**
> > + * v4l2_m2m_get() - take a reference to the m2m_dev structure
> > + *
> > + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> > + *
> > + * This is used to share the M2M device across multiple devices. This
> > + * can be used to avoid scheduling two hardware nodes concurrently.
> > + */
> > +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev);
> > +
> > +/**
> > + * v4l2_m2m_put() - remove a reference to the m2m_dev structure
> > + *
> > + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> > + *
> > + * Once the M2M device have no more references, v4l2_m2m_realse() will=
 be
> > + * called automatically. Users of this method should never call
> > + * v4l2_m2m_release() directly. See v4l2_m2m_get() for more details.
> > + */
> > +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev);
> > +
> > =C2=A0/**
> > =C2=A0 * v4l2_m2m_ctx_init() - allocate and initialize a m2m context
> > =C2=A0 *
> > --
> > 2.52.0
> >=20

--=-4H25zADnHXlwNymaecNy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVv+CAAKCRDZQZRRKWBy
9GnBAP9YVI4l3nVSoW8LuEWowJqpYHQplV4632VpWVcZXPWxgQD/VvEAJf8OJJu4
siPIvlpEB/ftrpXiSKkVbExl1UWd6AI=
=a96A
-----END PGP SIGNATURE-----

--=-4H25zADnHXlwNymaecNy--

