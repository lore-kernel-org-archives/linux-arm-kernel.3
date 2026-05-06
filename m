Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D290CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVtokff+FgN7c5YjfBm+qv9hmUVsT8Ucvu2C0waL2bE=; b=un240Guc2wMRxug3+4trwaK9Pi
	9EM/N+3OdAC4CYnLio+RYBgm2LKNluwe6yhaskWJ2mDMejQ5BSJDDXOzm0pdlp133O0N9pQbVCcpy
	JM/jR1506ZCKzdX8VmTGXbFfKhtq2J9KJsYi9OkpqX2ZuBCkt0Zqzs/q7SShIPUIM0ZV6ybn0Uh8O
	SGC2nSrJylvmzGLNLslF0ChABy5rY95AsUlQzcMNGSdjU8mIBsfFCQnqrSviekEREYUyt2qYtAqql
	difMJg411KdvZzlBPD/D7wGNfMsP30yqkMKlRhkoFGkA8AJuB5ZNT+NSquDaBEwFvxTl+We/jyTXT
	opry+lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdlm-00000001DpB-00ox;
	Wed, 06 May 2026 15:02:38 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdlk-00000001DoO-3741
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:02:36 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-694932346a1so2528200eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778079755; x=1778684555; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVtokff+FgN7c5YjfBm+qv9hmUVsT8Ucvu2C0waL2bE=;
        b=A/EvMKQ37cRsbsYXngNOrc0aeKV9KjnboR1CTUZWAdEj0e8IsUrN+EV/nwlnh/c5qr
         QMtp2fhrdrBsj49a20S5lCg23/3gPGmbsgizshzIu3cvc9L6zLJI9fO6C/JBEcaCZ6fs
         W46b8VqAXoJ48VJ00efAHbzCJNGR2rwwXyV1yflvXqFqNXWCqd+3HKDnVwUEGUdvI53z
         yqUNqIpf6K3tZ+M74BjdUsAQNqudsrcHBf19+56uG7D4kAeZG40wO+urnm2BoUHswVNv
         A0kg1DnkiyougBDsVRRTuC1hUzyYcKvPag5W5c7MGv2V6DdMhpogusHOf0eja6zzYmuL
         405Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079755; x=1778684555;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVtokff+FgN7c5YjfBm+qv9hmUVsT8Ucvu2C0waL2bE=;
        b=J5njj4dpZu21vH0rfnhsi7a9jEzrCDbmBTLaJb2KWDhsY+qUouBMCQrkqDVG7iUyvv
         GPMYcrlJOCHwv/b9deFMh8z5cxHKqgh4xt6OJIiwLjmHZi9lZbJtlTklB4YTPGCK6W3g
         OzM3+Azh9JUBQezHxzMFrYtPLkadjH+Ny+kOzEoZAdXfSw+Bsq7tchMBH3xtPyb9/Es0
         s+FOGXsA912kWxWLB1xOX8+iMOQGllLlX4+SmbZU3KELocNYEevs3SoQ+qgjDRQhyFuq
         Nq7H+4hteLXhJN+ZiRN9xz5ixq2WVD1x3uro0PzT5oRnHQZVEL5yAlC0EPWkLtwRvI4X
         HqJA==
X-Forwarded-Encrypted: i=1; AFNElJ8Zlk+YonHwZVUnk1pZS0NDh+2uZDxh0CMiPxdhUdTWhQ3ICV2aKLrVwq20/6D65DMRUFN1mzMrguHj+PixbuLN@lists.infradead.org
X-Gm-Message-State: AOJu0YwCpGmBLeU9EM24oYd9WdkwrMjw2b9mNbZ3m7kc74yaI9TFdBEb
	8DWdb6DZrWAptOfeNDuj/xFLmFz2Ej3bw239M0orHedZMJVPxPUqVdnnOoRQ0OvAVXk=
X-Gm-Gg: AeBDietw0X+361L3KvyD5raXwjO3zvbTplUEx/Aq7w7t1UJ+BEX0gefGyvfjnZXzoD6
	0cZB3/pqmkyYcRN9zMBGRh/AQpYibP9c++g/5smHOAp31Evh0GjdpLIlIgLxKzmuIEQSe1JYNg+
	hEpnLLVjRoqb8vPvNHENSFjE9kRZ6Cw3hW7/ziHOMXru5FIYpwDnSX00Rf2YO2Z7JvYwvNTTZkr
	VoZjzXkzWeHRB42aFYKOJi/oOAteyctJON8CoOV4p2O4LaHKj1vjBJydQjkAgNaiN6BuKx/bOgL
	2oCB5CSNjBr3FR9xBzhxDVLtdwuYz/8vBXMFe6SBAsjH8gKNskCzVdfTMOo2gRSHDv9TnKK3503
	lxT9O3hudscdgs0VlmjxWs7XrmfrLpFC9lUGG42CiwrLYAxrDrqzvAGH5lrxEEkvjat7y6BVs3X
	SWk2X13T4iRObFCBYLG0+j2jN9yFWV2OngUol3uSw=
X-Received: by 2002:a05:6820:1529:b0:696:1fae:fb83 with SMTP id 006d021491bc7-69998d175dfmr1837181eaf.34.1778079754570;
        Wed, 06 May 2026 08:02:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-696896e72cfsm10117264eaf.10.2026.05.06.08.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:02:32 -0700 (PDT)
Message-ID: <71e36717853798d292f01d40fc48566456152397.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] media: mediatek: vcodec: VP9 slice setup cleanups
 and fixes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 06 May 2026 11:02:29 -0400
In-Reply-To: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-aCXV78f8vUia3AirisRd"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080236_887026_19DE65FD 
X-CRM114-Status: GOOD (  15.45  )
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


--=-aCXV78f8vUia3AirisRd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 06 mai 2026 =C3=A0 16:41 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Patches 1 and 2 change the signatures of two functions to void, removing
> the now-unnecessary return value and its associated dead error checks.
> Patches 3 and 4 add missing memory release operations in error paths,
> fixing resource leaks.
>=20
> These patches are carried out under the guidance of Nicolas Dufresne.
> Thanks, Nicolas!

Thanks a lot for the patches. Something to improve, as I suppose you are fa=
irly
knew to this, is that when sending a new version of a existing patch, we tr=
y and
make it clear and make version the subjects (e.g. [PATCH v2 ...) and in the
cover letter, we summarize the changes from v1 -> v2. If you use tools like=
 b4,
the process become painless. Meanwhile, this is fresh in my memory, so its =
fine.

cheers,
Nicolas

>=20
> Haoxiang Li (4):
> =C2=A0 media: mediatek: vcodec: remove redundant return value of
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_lat_buffer()
> =C2=A0 media: mediatek: vcodec: remove redundant return value of
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_prob_buffer()
> =C2=A0 media: mediatek: vcodec: free working buf on error path in
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_lat()
> =C2=A0 media: mediatek: vcodec: free working buf in
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_single()
>=20
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 29 +++++++---------=
---
> =C2=A01 file changed, 11 insertions(+), 18 deletions(-)

--=-aCXV78f8vUia3AirisRd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaftYBQAKCRDZQZRRKWBy
9H5uAQD5iErjoa19qX645IZyDFpDOl+SfeQ9tlDuByFz7QhXpQEA1ZamfAAkcf3b
gObBxdlpTm71LJSa0qRUAw4fhwkj2As=
=hUse
-----END PGP SIGNATURE-----

--=-aCXV78f8vUia3AirisRd--

