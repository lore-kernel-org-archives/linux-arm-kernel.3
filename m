Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B3CFD646
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNFVme+dR9u7zl7Ngrlb7Wgf4zjZ10+VPmUyii4JMEM=; b=f1KVKdmGJJ4HXS+EOkPDU1CUwo
	Bhov3PbSpCPE81JHJUYSQWTNS2cdjKnDCvrg4NMNTYAWIAcFjtHctLjHuUO5x+e2l7E0LzS5d8nm9
	RnWTro5OTIaWzjTPe0lnn6P8MsHEM1/Tj3pkcoeKoPJj21jWTyE1D1vTTUVbhZd/I+0FlmNIrxb5+
	Rfid+UlDwP/wDCy4ZNa9k7/5HU9/om07kdaPdvckGotLwaLeCdYdl9rEjDqC0UXv2sLskeFPclpxo
	4KhGitjMUF5pORc/NdoaK9nIID8ZB9GzWDkODsYG1MQiMsAKMg5Mr+pDSB9NgYLF/XfbQAZ59gCTI
	QSNTTnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUSe-0000000F5YH-1NqK;
	Wed, 07 Jan 2026 14:24:32 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUSa-0000000F5X5-3pdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:24:31 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4eddfb8c7f5so20702141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767795868; x=1768400668; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fNFVme+dR9u7zl7Ngrlb7Wgf4zjZ10+VPmUyii4JMEM=;
        b=QkonWttvww08BO5tKLsT8/9SdlXUQts7HkI3ZR5A6l7xOr37CoyOhIw4K79up5hRLg
         c9vuXYzOohtPSxqc7Elm47eoUlYF9c0pNBXyENm/BYgyraPDBbs+xD56PL1kboylfeN0
         UyBQMWGgqq9naMyPlScKajqL88O8YLANGNnam0e1511uUm5allUtBz2bKb4Qy8dK8o8I
         I+4588uYb4Xx8CR27+klfCnkz5pZizIYjmcElHupPomNzpOYFf0WtOR9oursFKQbKtBi
         X4NyPQufMNfm8+ZvKo8ZB9/vaA+jkelgsYf/ia/DWeEgu8ZqlGfkiPE8OBiKT45BezCP
         TjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795868; x=1768400668;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNFVme+dR9u7zl7Ngrlb7Wgf4zjZ10+VPmUyii4JMEM=;
        b=mY3b39upAviSKM9f6rxcEGUan0JlsWBUke5mgablwZ3/guRr6RkYvq2+Fr2H6N5rJz
         PbEDnQApsSZj7LFp0ko1ZwIe1DtC3PBbuhzVatrzSntPH47hpXvOU7jbuNuhpzhjOmJD
         YlHPyGfl8ROEd6NC3vE9PuB6w3nK1P00gS1+PRt0XXOxrxAnBGhSI4fSWXwP6peYe+6u
         xuqtgdPEz8adA1nkWTfVGH+TgE1PL1Zqp64Er1iJ8ZiOibsJVuG1c9ct3Olyvhqkkhvq
         ljO67xhr7ThxzDzKJOoIQfcLMd54/0U0HoiW8YuXwhi1w3QBsDJNKMwTHCRRjZKEDbMe
         EnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmu55BcEIHzPqtcIcH4fbX6iW5iRHXMA6LWH9YN9AXyXKkjCTKyCA8BDlQEGRuKTMZMSNL61vb5ltVmnFhUlt8@lists.infradead.org
X-Gm-Message-State: AOJu0YzeZiWwD9fpZ29q/aeuAr75TuKhSbwbRjILK7ETCCGcIkBQCSOu
	KW2LNZgaiCI2HNlvnjd0TQtv5K2BKRY8PqSs0dFFXMT+5fUvQhUo0bECJyxvJJuNMwk=
X-Gm-Gg: AY/fxX7yaJvIQ7K0g0DZljDgrmRCMyYkpOQqp6L3zOybqfXxMcFbwBwVzVj+/TD4wbu
	r4o8rFkLRTVmZsKKrabnHs0LJEmdWNw0Y6MihcoGv2MDOnNtwl/ycM+w+yBldDRx7gT9JSsI0Y0
	39rGAWgFwWPPcKUXvGZ7ZAmNmfn3XTsN0r7i4XSXfJjiif8cXbyBdyW5F8nJFaDGIiM9JRAj2Yg
	t/O2SpyvWGR+RRa9hBYa9R5yCjfwojwA6zKfbHlP+SH2qnN+qQ7BsOQulmGRD4ZVMqiP43QbVTd
	RLWG8dadRttQOFLZO4tL3kLuAUpvt8u+5LNg17CFZRgkLo7vBvgsLIyiaOpPO86Zk4WXE2Ic9N+
	SM/uozL5j0HSZvrgjrcJONNspMyhe+YWQZ29MEZDyQphorFvOi2OxbFqTFCn1rQcq/gCLSCsyb3
	qhgByJIYeXyo7pONeZjTiBEtKVxQI=
X-Google-Smtp-Source: AGHT+IErN6Om+JnV7pt2OrE10wjhOwwk29EHITTsHyDdmu04Aosymy91WagJFYJDt0O/0Sn51dCh5w==
X-Received: by 2002:a05:622a:1189:b0:4ee:1dd0:5a53 with SMTP id d75a77b69052e-4ffb4a657aemr30278291cf.78.1767795867495;
        Wed, 07 Jan 2026 06:24:27 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726f1f1sm33493346d6.52.2026.01.07.06.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:24:26 -0800 (PST)
Message-ID: <11c7e1c0f9e71978d9dea6b1af067e38d9a2509a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 14/22] media: rockchip: rga: support external iommus
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
Date: Wed, 07 Jan 2026 09:24:25 -0500
In-Reply-To: <b4b1a113-a8dc-4ed7-b395-eaa0deb6a957@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-14-989a67947f71@pengutronix.de>
	 <c5b6707e3e6748bf923aaf34db1ae231c7e121ad.camel@ndufresne.ca>
	 <b4b1a113-a8dc-4ed7-b395-eaa0deb6a957@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-5UuRc+BcCZ/5WnhbhpYA"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_062429_201013_3D2E0341 
X-CRM114-Status: GOOD (  17.47  )
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


--=-5UuRc+BcCZ/5WnhbhpYA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 07 janvier 2026 =C3=A0 15:19 +0100, Sven P=C3=BCschel a =C3=A9c=
rit=C2=A0:
> > > @@ -95,13 +96,16 @@ queue_init(void *priv, struct vb2_queue *src_vq,
> > > struct vb2_queue *dst_vq)
> > > =C2=A0 =C2=A0	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > > =C2=A0 =C2=A0	src_vq->drv_priv =3D ctx;
> > > =C2=A0 =C2=A0	src_vq->ops =3D &rga_qops;
> > > -	src_vq->mem_ops =3D &vb2_dma_sg_memops;
> > > +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > That's a bit I'm less knowledgeable here, since I never used the sg_mem=
ops
> > in
> > any of my work, but what is the consequence ? (appart from gaining exte=
rnal
> > iommu support)
>=20
> This is only for the external iommu support, which uses the=20
> vb2_dma_contig_plane_dma_addr function to get a single linear address=20
> (instead of vb2_dma_sg_plane_desc used for the manual iommu mapping).
>=20
> Without an external iommu the value is overridden afterwards to=20
> vb2_dma_sg_memops. I probably should move the if up to make clear that=
=20
> this is only set for the external iommu case.
>=20
> Or did I misunderstand your question?

That was it, I read quickly thinking it was always vb2_dma_contig_memops no=
w,
regardless which iommu implementation is used. If you can make it clearer t=
hat
the ops depends on the context, that would be great.

Nicolas

--=-5UuRc+BcCZ/5WnhbhpYA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV5smQAKCRDZQZRRKWBy
9PM4AQCBafMXk9xMtDHVflNbiu2lwVtsblKMfDzInz3cl5dvOwEA0FMg25ztMD+h
KzEXKxEk4Tw15/oxoq0BpUevHamk4w4=
=81M/
-----END PGP SIGNATURE-----

--=-5UuRc+BcCZ/5WnhbhpYA--

