Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99758D12672
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4H3VN3zAefmBh18Hhy5cG5wKA7ItOiC6cT8cRe/+Fbc=; b=fE1YSSYh+oAocC3kuSLH3pWZe8
	pcRCQ6SYpKHRMS7SNNf6W38kHEjAXhpp/ydB0hLxKLfZIBk03gKvBpwj0pTBG+4lHH6Vfb10Wyjkc
	fbRUTeUKQFKhNjhmj94lstYpXdVCdbjgV8nGtcWFatyR2TfKafnlKVYynXQR9p+GjV9GrFcSmdLcP
	+SQ2FBggHCFo937+ygjaX/ZNojlr5AivhWhDaecxCPCnmnp4L9DuRzEWjLV+W64hXJYXV1MEav2uA
	k/90IIW8IKBryeyIhI201hsKUNLvvAyLTZkeB+/bpIV04Qdt36lp8ZPVYyujHAKBMZ7gvulX3zgaq
	JKDisyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXRX-00000005ouk-01xz;
	Tue, 02 Dec 2025 20:57:51 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXRT-00000005ouF-2Fgq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 20:57:48 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so48199506d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 12:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764709066; x=1765313866; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4H3VN3zAefmBh18Hhy5cG5wKA7ItOiC6cT8cRe/+Fbc=;
        b=LQrEw7BdDEH03n5hNADHe8jdaFmTaONSz03urpO9pF+z/NXF0aey+ByYaV0aXDdkEd
         2X6IuWS5Yl9/QPGKcWXkT4t6HIO6zG4b0r4LyPlXCMshw9qH9W1Z9rg2bvyPxmZLr9b5
         SKvWGRCcI+rVRgw+TKIhHBOnJ4xGqWqC8leQ8hUYwHHoKCinB33Is9jUpfRujajWbL7T
         kWZDqTJ1SxIqMqyQssdOqMfZKV4+6MhAGX2V6Q4czuPnNhFY7XWiUSxxuCfdiybiW0Yk
         HPV9IesfVFTwl8/y0pbnCV2yTELv/ipQQfSrniq6qOOPB6hQdAQwDZVhQK9tv4b6P0SB
         1R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764709066; x=1765313866;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4H3VN3zAefmBh18Hhy5cG5wKA7ItOiC6cT8cRe/+Fbc=;
        b=rduUubTj4J3K2q2MONhPuqkCIf0nuOSMxieqAn3dEZdoOJQ8tCw2B62UOsLWPbSAJ6
         1Orkp73pv07LqPOEQ5jbZfZpS+Q1p+Y6yiLRlqcEv/Mz6F6woPxze7nFcBp5J1Xt3GWN
         0gRc+bCq80WwJHL8B4aroihQimA8H6hYM3fgw7UMffB3oqRJPRwndV8BWpqMfO8Wa61R
         tAYYTEjdB8KHQGtYwudAGZkRoZtnuMp6xxX+NG3ndjGPdB5sGecF6L7B8y/37LqtpCOq
         2i50jpspBE+hgXvaLOO6u5z9bc7pOfQ8/dD1t8ycRznsAv2/e3WvGnEA055SLGN0nA34
         fqVg==
X-Forwarded-Encrypted: i=1; AJvYcCUy9jnq4vfErDv+mvzv6dWlgGLPXTgpocnqHoUHaB3+YMYlRRWEZiHMYENMPsrPmHqEY48rAx7VvadxLuvn8nP8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5cHZh6JlQHPHQ5BjkXGLcR/fX36MFM5vlh5vn2Mgh2059n1kE
	WRgqqa3MGjFPK7DZqXyhTYCUqwdDwBuDnddw1lzgcTwH3erDWR10OKK4n4/WlnOwqeM=
X-Gm-Gg: ASbGncvruKOJRj6EiUCJTnFJSlBUTXQyekQfIz91iAU6hXj4G8n3KGROwiNvlj+0Im7
	n4Z5yIneExUf9+mIGXTHn22O2aTOBgvGce3P4oR1PvXnjGsy8OKTGJSfnDtfmGByIkXJEW5a/Cg
	0Km/bY0sqBsCbaUDC/++laBPJ0mz3KWiKhRpjFMUs0F96hN/+O/0KvC3+kEZyRQnIYtG31b0ov0
	7f//5DjECkRA1BQhkkYz1GbBPz8A1vP3BNFHHyBfV8Lk3LXRF8dHISZishox+ENHfFsCJFroJTM
	ehFEdNeGwwR4FKrg9F4t0QXAkTp7aVqLhoqb2/zgTML8W4MCG2vFJu+vCN6QvlY4WNE0ux13aUG
	H0Z/VCKNwSJFhPy7R58LxYaJMdU8tL1oOWrsteCydb3iTcKSFnLC63oR25TCUtsF9fv8F6NZGgw
	FuYGXAlQ9s7tj9HLM4
X-Google-Smtp-Source: AGHT+IFH+ikokn56F8WtdIGm9omeFEnq21hwhYaklenSkqU+X/Ecfgee/D4+CUubViLT6t9CW8waOQ==
X-Received: by 2002:ad4:5bc8:0:b0:880:47de:c998 with SMTP id 6a1803df08f44-8863b0030b0mr487284446d6.38.1764709066104;
        Tue, 02 Dec 2025 12:57:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b90ebasm111262986d6.55.2025.12.02.12.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:57:45 -0800 (PST)
Message-ID: <99f3a6d843afb1c5c47b14e414b917920c3a5041.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 02 Dec 2025 15:57:43 -0500
In-Reply-To: <570d444a92b0e49a11379cabc8f7f838e5228f7a.camel@ndufresne.ca>
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
		 <20251128025117.535-2-ming.qian@oss.nxp.com>
		 <46e9a5a881946d879d1b2af3421d574b26256ae3.camel@ndufresne.ca>
		 <64ad3d66-4edf-4a0b-8992-0db0e90a32b0@oss.nxp.com>
	 <570d444a92b0e49a11379cabc8f7f838e5228f7a.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-oeGhnW9f2dXU8J1rQfXU"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_125747_606546_37496D8E 
X-CRM114-Status: GOOD (  36.54  )
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


--=-oeGhnW9f2dXU8J1rQfXU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:21 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi Ming,
>=20
> Le lundi 01 d=C3=A9cembre 2025 =C3=A0 09:52 +0800, Ming Qian(OSS) a =C3=
=A9crit=C2=A0:
> > > Then instead of this, I would like to add a kref to v4l2_m2m_dec, I c=
hecked
> > > already and this is both safe and backward compatible.
> > >=20
> > > Then in the get function, you will walk over the compatible that are
> > > different
> > > from the currently probe node. If you find one that is initialized, y=
ou will
> > > call v4l2_m2m_get() to obtained a shared reference. In _remove() you =
will
> > > simply
> > > do v4l2_m2m_put() instead of v4l2_m2m_release().
> > >=20
> > > Hope the others are happy with this. For Hantro drivers, this will ma=
ke it a
> > > much more powerfull mechanism.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > For v4l2_m2m_get() and v4l2_m2m_put(), do you mean defining these two
> > functions in v4l2 m2m, instead of just adding them in the hantro driver=
?
>=20
> my idea was to add a kref to be able to share v4l2_m2m_dev. One thing I n=
otice
> is that its the v4l2_m2m dev that creates the media controller on all oth=
er
> drivers. Note sure why Hantro does it own still, maybe it predates, maybe=
 its
> something else.
>=20
> Its quite weirdly glued together, since the v4l2_m2m_release() function j=
ust
> happily free the m2m_dev without even trying to cleanup the media control=
ler. It
> totally orthogonal to the job queue, maybe it shouldn't be there.
>=20
> I'll make an RFC for the kref anyway, if that has a change, I'll try and =
split
> out the v4l2_m2m_mc_dev on it own, so driver can share a m2m and use the
> helpers.
>=20
> Nicolas

Here's down below what I had in mind, this is for illustration. I can send =
a
proper RFC, while at it I will move the media controller part out and port
Hantro to use the helper.

The idea is that instead of using global, you can have a list of devices th=
at
must be combined in the Hantro variant. You then walk the nodes, and if you=
 find
a match, you reference the v4l2_m2m_dev, isntead of creating a new one.

This is slightly more elegant, and can be reused quickly later if we have o=
ther
hantro complications like this. One use case could be for modern integratio=
n of
the Nano decoder/encoder combo (H1/G1 combo). These are known to share the =
same
internal SRAM, and cannot be run concurrently. This was defined as a single
device node on RK3588, but I think this badly describe the hardware, and ha=
ving
two nodes would be more clear.

A bonus would be to describe this dependency in the DT, but since this is
invisible hardware, its pretty hard to design. And in the case of imx8mq, i=
ts
not clear this was by design, but likely more an errata that should be adde=
d to
the pretty long list for this SoC.

cheers,
Nicolas

---
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Tue, 2 Dec 2025 15:40:37 -0500
Subject: [PATCH] media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev struct=
ure

Adding a reference count to the v4l2_m2m_dev structure allow safely sharing=
 it
across multiple hardware nodes. This can be used to prevent running jobs
concurrently on m2m cores that have some internal resource sharing.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 22 ++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-co=
re/v4l2-mem2mem.c
index fec93c1a92317..b6940bab641d3 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -90,6 +90,7 @@ static const char * const m2m_entity_name[] =3D {
  * @job_work:		worker to run queued jobs.
  * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
  * @m2m_ops:		driver callbacks
+ * @kref:		device reference count
  */
 struct v4l2_m2m_dev {
 	struct v4l2_m2m_ctx	*curr_ctx;
@@ -109,6 +110,8 @@ struct v4l2_m2m_dev {
 	unsigned long		job_queue_flags;
=20
 	const struct v4l2_m2m_ops *m2m_ops;
+
+	struct kref kref;
 };
=20
 static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_c=
tx,
@@ -1200,6 +1203,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_=
m2m_ops *m2m_ops)
 	INIT_LIST_HEAD(&m2m_dev->job_queue);
 	spin_lock_init(&m2m_dev->job_spinlock);
 	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
+	kref_init(&m2m_dev->kref);
=20
 	return m2m_dev;
 }
@@ -1211,6 +1215,24 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
=20
+void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev)
+{
+	kref_get(&m2m_dev->kref);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_get);
+
+static void v4l2_m2m_release_from_kref(struct kref *kref)
+{
+	struct v4l2_m2m_dev *m2m_dev =3D container_of(kref, struct v4l2_m2m_dev, =
kref);
+	v4l2_m2m_release(m2m_dev);
+}
+
+void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev)
+{
+	kref_put(&m2m_dev->kref, v4l2_m2m_release_from_kref);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_put);
+
 struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
 		void *drv_priv,
 		int (*queue_init)(void *priv, struct vb2_queue *src_vq, struct vb2_queue=
 *dst_vq))
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index bf6a09a04dcf8..ca295c660c7f9 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -547,6 +547,27 @@ v4l2_m2m_register_media_controller(struct v4l2_m2m_dev=
 *m2m_dev,
  */
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
=20
+/**
+ * v4l2_m2m_get() - take a reference to the m2m_dev structure
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ *
+ * This is used to share the M2M device across multiple devices. This
+ * can be used to avoid scheduling two hardware nodes concurrently.
+ */
+void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev);
+
+/**
+ * v4l2_m2m_put() - remove a reference to the m2m_dev structure
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ *
+ * Once the M2M device have no more references, v4l2_m2m_realse() will be
+ * called automatically. Users of this method should never call
+ * v4l2_m2m_release() directly. See v4l2_m2m_get() for more details.
+ */
+void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev);
+
 /**
  * v4l2_m2m_ctx_init() - allocate and initialize a m2m context
  *
--=20
2.51.0

--=-oeGhnW9f2dXU8J1rQfXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaS9SxwAKCRDZQZRRKWBy
9AnaAP4y7wj7aebAntWZrb2wnCjC7QWlt3m4ogUZ3VlHXqHfIwEA1LmIwtRQrb/4
XdFmnCvtP8Ujqe3jsNXbqxvAjjxZvgY=
=0jOP
-----END PGP SIGNATURE-----

--=-oeGhnW9f2dXU8J1rQfXU--

