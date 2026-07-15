Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CC3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=; b=uKhhumsxPh7NlbXsVVfSrXMr5V
	x+ASAaD0nkW72B12TP4zEIb4fDRZAifUgPjG1gLuLshLFdWnvXDxgriTnXyzAyCtny8InMZ61yDqW
	niBaUm+wSmRAm4v6LFpsvZgJ280WxviLmWbbEl9I4j0btsqHkJWsk2LD+ki7G6In0NTGyOoiIUfk/
	FaLXU27PwhjcaBuCZ8l4mf9iEN94XCv6eb6BgYKb/VW+90GzOWIO3oMKW4xvDD18xSL4tPBm+LTK/
	oVaCMRT6BdPEcGPsB22LrzS05G3kdj8wBMGVW69j5a6x+hg2JEYATlXfLSfZFou7oZsnxbI2GdUu3
	6LHu0zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7G6-0000000Fy3V-1e0o;
	Wed, 15 Jul 2026 21:35:14 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7G2-0000000Fy2I-1VBu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:35:11 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-738cdd667ceso723800137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151309; x=1784756109; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=;
        b=lck8WKDi3McquTnEAFej18T4oTIFDKNgCnUyHnn5qnBzDQwNxyrWGHcBI+EusixnUY
         RRwyF/LsccD1+ysfaunhEYJERp8KTF4EPOmqfqpdSFcXptn7E+VjnG8rTS15podY2nCD
         XUehftS//F8+aBiPgrVxdNSmyQK6sn5Uh27pUoWOGbmSXSCIbrwbL92Pb+iPOqxWDqaL
         NQ2+frBKlPVteITxoTf12DuVE8dePXtN3lFHv/E/nkYYs4HjA0mcZrCo2oAgRzxZlQOD
         hl6ccMQ53Jagx3sgfpiSBqsaAb48EVVVHCM6ghLHGHaLlhSJOOMub0OZS8pyA5J8JYjF
         3vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151309; x=1784756109;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=;
        b=Z4Eqtibwe0qGx2B9vh/arwKY6hLjWcrBLu8kwa7HvqGTOQHQfGcyLo3rVGTZlARf69
         rBWpOMHeelzJ8A/mVkMLvOFvhtYhPz6/OpF+cCsThAy1saoOH0FUTyMJiBgws8OvCFcV
         zi0j0CmsPWhWiKdy3gX5UOpxHd682gy8NLVXUlr1EYpwxaJRDzwwceHqGVONgom032ZF
         o7Ajjkreyp+6yrr7aY3S7qMM1UhjD1m7Eo9jEAGoX/AfDc9FuqL3Nc3WM4WZq/RARTJI
         Z3hihX+K7hTfCq5abMI/OKS6LkliV8YUhnFzXYI6cl52bL7yXkrpjt2tGEjBnsIAYEol
         D16g==
X-Forwarded-Encrypted: i=1; AHgh+RqhW+H8we4jfGWYbc0Px/KwwnT5LdMzZUc7jD34sXZh05oJNKNvE7WE3+upqM6Tt4/BQYU7CXgfU/84m9AYAvlb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/ArjFPFfBV4yET/7N3s2Dit08+KU/Hvfw4qJS0mt8GglRAl1G
	aMUXjCNda1l77hoIEk4vTe6vsu6Cwu2qSuOC2c9t0kmnMq4qkgJuVkdgDp+vc5FIrOw=
X-Gm-Gg: AfdE7ckF4QrV6/2cd0AXyINznO/kDtKSZOX33mTDddNuMeFkHq/goIKvcafUN2Vmg79
	kW0YIyirYJYZH+tI6+Q/G4Aj9niLHQAzZE2lbmJRauORwOSMCQ1cRpOidISmxLQUpuoL21FnUHt
	eWyt6QyO3Wr464ccvQOHHOzMrjwMMAiubstYeDrFJZJrdF8sxLYasvbN4MZoSndMeDmO4uLzk43
	bZ6X/w9olMTKyx6JZoIxcKU6qRn8L69ou76LIpTrtnidfzmrY0kpp4pbH9MVRu371xjhdQrTszz
	SlwFSdd/hjkbR6IhC1avAy2J50byHd142ABBFjZnxzWW/8INqoRrDLqAvqQeMDb5Eev4G4vT9Nk
	HK5/LHG8iLLUNCu15J3OBhuY8qe8r1eFDntiA6hKIDMWCHAeiAk1L61WmWEnCKcPu7piWygZAoI
	/+C/lzprk=
X-Received: by 2002:a67:e119:0:10b0:745:7f23:a876 with SMTP id ada2fe7eead31-7457f23a8b8mr4213170137.1.1784151308881;
        Wed, 15 Jul 2026 14:35:08 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3184b2asm10838154241.5.2026.07.15.14.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:08 -0700 (PDT)
Message-ID: <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
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
Date: Wed, 15 Jul 2026 17:35:06 -0400
In-Reply-To: <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-BPGkvXWrEAcE1IG1kYVb"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143510_412255_4ED7E8EF 
X-CRM114-Status: GOOD (  14.66  )
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


--=-BPGkvXWrEAcE1IG1kYVb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9
> decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index 0f47b2671353..673b17d0dd8d 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1172,10 +1172,12 @@ static int vdec_vp9_slice_setup_lat(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}

--=-BPGkvXWrEAcE1IG1kYVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf9CgAKCRDZQZRRKWBy
9GUlAQCiIYGKuOGYT5TanEl67O39XYvu/biLdLS48sx4lqa2UwEAq720eTrXwm+3
GboJu4m0lDSSaP4OwRGYTcVkIJSRGAY=
=bkfy
-----END PGP SIGNATURE-----

--=-BPGkvXWrEAcE1IG1kYVb--

