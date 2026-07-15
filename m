Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7350C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVIF/EVfgZRuLP2uDuLbmiiZlQAtiovpRtZGImmG/o0=; b=RPy6uMEC905bUIifEPRyKPppZw
	dNF/1v4joEmgEGKRrJNxVYqo+/m/JpyI96kYY1m5IBh2ciEp4Gxb/AV654HCDpDdHUSO9ddiNB/+F
	lFT/NDrPgvqld2Zu1Gth5HnWIVv4EY+MFOTxkPTO9mRI5zs5JyYN/jUdxzYDJPivKkzJ5v9zSDmaj
	Gnn52jWt67y1VVUO0yqyTr78BzmzXExt4tQhLltn64JHQrXgphH5eDebBZKLM9P2ZDnHw2oBhR6cH
	JlFBJU3w0spjyCszsiSUbI12snMFawRARPWAxiiNcd4m8Bu7VljPZeP7T57cnV9wXTK3ZHMg1hvrd
	xRTf2iag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Qt-0000000FzCg-2fKx;
	Wed, 15 Jul 2026 21:46:23 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Qr-0000000FzBt-0jhn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:46:22 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-92f03daaa97so373455185a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151980; x=1784756780; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVIF/EVfgZRuLP2uDuLbmiiZlQAtiovpRtZGImmG/o0=;
        b=aQ4ye3HPIb4kApBSJUwai1dMTtQ9m93knBhSsMXPV6+r46/XRBQ85fpIKf2WZRv2ZL
         TSNBI48s0RQnKMsNzZheo0Z6oYdP3PECRnh/lVF9DlOd33nx+hq7PUUNGfePlwi2MZEM
         zpuuUhMa6avUcoYtmiFHNzaCGTQ94WGbruh2Lf92ihfgU2JLnkg7HUtoWOF9pD/cGnIW
         Z+JJQzV+lDIxJg8g2+/CCgcvXJ9xC7EBR+XPtii6t4j8TtMqcwsg1xhIsjnjMkU0Mmh6
         N+Klko0UupSgFWvq8JWBGKVmXLllxVsUOvbv79Wk1G5Dx3Ja3O0+6IDPsnO2uCMVI+Iz
         0zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151980; x=1784756780;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVIF/EVfgZRuLP2uDuLbmiiZlQAtiovpRtZGImmG/o0=;
        b=G/lW1iXafUItKD8rmMZh3JFvSpjNuKkCsNlAUPTl+bMH/jKTSQKL5raeQKZ1jbWhEE
         q1m2WAqhmSL064J9/DdKJa+xCKd5T+XolUk8gG7fnPOZ02oqUSvQeGEYzMWVnSdkjkUT
         EyGC3OaBxuOC8QCm/L2As0D2QdLiy6uGAGYewhY4IDu42pqqq0Ng743VELRXcN1e34Xq
         xZqXp1XcmDQJju3c1wXgXcRKrMcYLFBFWWg1IClWxp55Ay/aSb4SB8dvbtVg76UWeYf7
         m48lcifD/klNtt166A2Q2lpJ8Gikee+0KoWHj9yjkSBfzQzfAO6Ojd6uzueoHxbsT/li
         Po4g==
X-Forwarded-Encrypted: i=1; AHgh+Rq24vxQwnX1BqQDqKy/T5dEXs9iItUMxmjaE2NthaROJUrffibL3sujeN2mpflos/gz3eabHOgJ7emlJzt7lH/8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw34ALqV+GbUekMm6n9pTCC30c6ol5WjAkMw9cD5p0VRU8ZTc3
	UfCNU0IEdOKbdUlRp17ii6dDpMLXRN+i3rgUCGVZbuDHCSGxpTpBVgRN4rsX4s25ofE=
X-Gm-Gg: AfdE7clFQ/py+i2xSxtcNl7QujkYsSdvcNlY8ubmp10NMszxC7Q58i9HMMQxFgPZ6Z6
	PexY9iX1FNs6yn2uQSI0sPq/y1PZmpFTyzL1oBJ+6qy1aCTFN1wuSLrLKMQCUPaV/ouJcDiKqgr
	oJTHliYE8/PB3YNRtIW4t27XSSGO95S3ooWj1PYwJXRnNNMUJRMZWhPpqGUF9MCd9ugEqsBRNGz
	xgl4x6een1ITRAyDkFlOfhJU3zVglkEcOUVq15qeD6HKUj0C5nto1u6I51QZ+3mTYuxFCKK1TmB
	9VIEvqr+7HFgzbHeO5+AJr5UKpqExvLgpzXAT6MPK4RRtFp0WqB64zr6An8FAwSCBjZHvAfMu+G
	DMxlmlZYmPRWiRuro26j7qPnrBH/7XZaUYMbmNW2e5V3Xt4YEI/xhvEOZxGlZfIQZ7wIs/DDdO9
	QlmYIrfIw=
X-Received: by 2002:a05:622a:1391:b0:51c:7b12:6002 with SMTP id d75a77b69052e-51e4f22e410mr44796391cf.78.1784151979625;
        Wed, 15 Jul 2026 14:46:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae24d04sm140744181cf.18.2026.07.15.14.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:46:18 -0700 (PDT)
Message-ID: <99cac4207e627acca350b9ddb5d309755a243c07.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: free working buf on error
 path in vdec_vp9_slice_setup_lat()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 17:46:17 -0400
In-Reply-To: <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
		 <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
	 <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-ppTn3qsVv2dDuNzXyobN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_144621_238555_C4849D14 
X-CRM114-Status: GOOD (  18.16  )
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


--=-ppTn3qsVv2dDuNzXyobN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 15 juillet 2026 =C3=A0 17:35 -0400, Nicolas Dufresne a =C3=A9cr=
it=C2=A0:
> Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=
=A0:
> > Add an error path label in vdec_vp9_slice_setup_lat()
> > and call vdec_vp9_slice_free_working_buffer() to free
> > working buffer to prevent potential memory leak.
> >=20
> > Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9
> > decoding")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

After consideration, I will drop path 3 and 4. The working buffer is
implementing a re-alloc scheme. Even when the alloc fails, some buffer rema=
ins,
which you didn't cleanup. In the end, its not very useful to clean them up =
as
closing the driver FD will do that (calling IF deinit). I'll pick the two f=
irst,
as its fair cleanup.

Nicolas

>=20
> > ---
> > =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > index 0f47b2671353..673b17d0dd8d 100644
> > ---
> > a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > +++
> > b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > @@ -1172,10 +1172,12 @@ static int vdec_vp9_slice_setup_lat(struct
> > vdec_vp9_slice_instance *instance,
> > =C2=A0
> > =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> > =C2=A0	if (ret)
> > -		goto err;
> > +		goto alloc_err;
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0
> > +alloc_err:
> > +	vdec_vp9_slice_free_working_buffer(instance);
> > =C2=A0err:
> > =C2=A0	return ret;
> > =C2=A0}

--=-ppTn3qsVv2dDuNzXyobN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf/qQAKCRDZQZRRKWBy
9EzQAQDiVoRUElKz/0sSs5MKXnDN1ovXGYsSQ8nfQ9eu4Ww48gD/WlCA10wlGxfJ
wbiBdJUn/z/YeSOAt9q9KUFJ8Orc2Aw=
=bZm8
-----END PGP SIGNATURE-----

--=-ppTn3qsVv2dDuNzXyobN--

