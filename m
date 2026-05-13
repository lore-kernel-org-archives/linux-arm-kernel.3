Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44420CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=; b=zk+6fmSvNnXBDQJxwGTfLdvOZb
	We248dqOwbeFCE28TINbnuESdiDayPQO5LJeb7xtXcsJyiqGiWn3xt3MwMi7WApGjSB9ifOZV4kEm
	pCcdyo77nj8+iA7JjsYOwT5mwH5XxhbkbFacxHBytEZXszt9ebj1s8/bZzVT4V4K/jUik+M8fy8L/
	QLtnX2pYQgeMRzfUf8IEMBBiKZhvzaOQyRESWlVUZFCEpJ5vw3Bo/gXbTJIQjDzUtQYg8usP4E3O6
	t4w4j707E5flHa2q9utDZYdYjO1lJvldw3vT1Yi7pE/ui8xgtrh0YfxKbU9C820e2oWWk/Y9PbEdn
	69cl4Emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCqs-00000003H8V-2Pc9;
	Wed, 13 May 2026 16:54:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCqq-00000003H7E-2NVC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 16:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=; b=Hz7il5kZvIdnDY5ZcFzWLs9RW3
	HIrbMAr6XeQbzeU1Mz3+Dvs17yEo9D/OO/CCvJx8/N0kVFST06PqMwckODDKkaag/FGxJssaGmMyR
	pX3wFyaHAZOf4SSalZPm2nfPIzDIMxyeiX+iDjCWqfbOWcsEP8Nd+1E0/apdukRZg4A8frnRkYVjz
	mb6uoobxWtUrQz48gR8fnoh041MoeEjB2t0oSH0bUMidaVevlt36RmgHpNA04cEl1BNbsrl6iFeIR
	Y8MdQXvJEhKT+npFjDOCj1tekJyN9foVt7IltdVugEBZJx4J4rHOV25nAxrFbn3vWBRe2XiSwjd5L
	Ly8saRpg==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCqn-00000000Xqe-1bBh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:54:27 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50fb8e9a4edso75888861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778691263; x=1779296063; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=;
        b=QrHUIgYNmbQtzcbyWGjK2n/5L/XYTcJ5cTmKOsCwWodnjSuZX0wZSR3o3ly/stutQW
         RG011MWGXmDP+uU4+XoX0qiOeO2lqe94fRu8pqmrYNf7dLJuAZGcOX5rMW05/PMCVGTk
         WU+HU87AFnzMGhCp6HhiHpocrFpq1YysUOjwWo3fSwlFDHZ5VPN3N0FhJ4G1JuCQHoiL
         4BxcRX0XxP1rTfCzA8jIGgjOOvJ8tO5bjt2Thm24e8Q3DZZYG4jjlpULrS3HgW+2+XKR
         Nm5CBtASvL4qLcrxP+3drmGbm3qB25PIPqM3eENDMWLAMS6JwIK7aHvcscRwExoZnguH
         EPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691263; x=1779296063;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=;
        b=ZXE7dn36h3DT1mHaMWl34l8ovRsLYz6wzuiwpvIzaoeqrXo15TJHc2mrjqU/fc9qQa
         /kgSKh/ooxr8iLGGs6ZNe4oIxQJHgVodPOrFxk85na05j3ZqnWt3ebZt1nhBU2DlODXY
         PV/53WejwmTmsjI3BatG6AC9aDPtKXBu7L+PKchusqVbs23vB1XFxVCSLHBi568rkfzD
         vwUf5Xx2Gm7HMK9PZ7nBGE3n7l+EmyMGbZGkEh4blTM9/4N6phlHManOiEr8jZSqpVBq
         r2dgLKRhyeMd76yF9Uw/Op6K+i8QrLqH7bHkQUxkyUQ7y8ZL+kHj2XEUNEdeSIdXmEUN
         CL0A==
X-Forwarded-Encrypted: i=1; AFNElJ+2dgOz4PYzGO2uFCWaKUDWCRWlt6l0omU0SItcSE9y5EpnGUsRp/CBnRL+8nSK2MSy0VnUFdY/+yHGTgbzEApZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYE7yNS3qu7tqrreXRNhLP04GuZj9yhrtV+YxJ9cXm9Ou+iYj1
	7eKsITjaGJZRiUv71f6ZXXa4pqZsRJ4aSAvge8KVg+NEGIsUBc6hkQ0qI2x29bhZDaM=
X-Gm-Gg: Acq92OF8+mZYx7IHnxToKqAFWtY33HbN15/FJ5skvxhHaoeb1qKC+4AUmX9IddlYx1x
	YAK6qeG3JU5xcLoB7a+pTrYoFh4RyYM0QVUnc64ILtaenX9DB8gwO16NOJKqlVYio5bUixgtOrI
	rB+0NSvZnhtjv3TL8dwkxIckXc6a3UFXQ2iQgTh+4/jdhZLzdIPx8Grv6vigoJ4UxRZ9QWRZ0EY
	CSPiyYNW0oxduqe2w6H6LuWcG9tHYc0zE2oFwbUVPRX4oIQDGkaLw+KfPWKc91/bZ2Sr30YWGVp
	l/WSSPtu44rbUHfUrGIhjdyfNrt8RCWedUSkTZXk65tiOvghYPaTIvQq1y4eSz1tLRmgQaKe3KQ
	vG+njuGBYTd4r6tpR4hgBal4jQ4Vmhp63NHFl/yWb4e2y2J3KntRYMKLQEmxlcdmxziwpo6JktV
	93puy/3WwpeZ6fuibxPa7eQz8fsdlrv4yWfvG9ls/1gJLMj/nZlOrMa94wsWTjik72nin1
X-Received: by 2002:ac8:57ce:0:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-5162ff0791cmr48491321cf.30.1778691263060;
        Wed, 13 May 2026 09:54:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90874e5e4sm813106d6.6.2026.05.13.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:54:22 -0700 (PDT)
Message-ID: <4efb85a777683e8eba1e19501c4bf6de3494d2f9.camel@ndufresne.ca>
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate
 into separate function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Philipp Zabel
	 <pza@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Wed, 13 May 2026 12:54:20 -0400
In-Reply-To: <aeff9412-1c69-469d-bee3-7b9efa9b3947@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
	 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
	 <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
	 <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
	 <aeff9412-1c69-469d-bee3-7b9efa9b3947@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-aSiFsAE5dKCPdAUlYUtL"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_175425_825317_867A20E6 
X-CRM114-Status: GOOD (  16.64  )
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


--=-aSiFsAE5dKCPdAUlYUtL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 13 mai 2026 =C3=A0 16:29 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Philipp Zabel just mentioned that a 90 degree rotation would just cause=
=20
> the RGA to scale it to the output format (deforming if it isn't=20
> quadratic). The existing code already considers the rotation to set the=
=20
> scaling factor accordingly (which I've also missed in this commit. But=
=20
> the commit is dropped anyways in v6 due to the various footguns).
>=20
> While I see that the V4L2_CID_ROTATE docs mention the need to set the=20
> format according to the chosen rotation, it feels like it's intended for=
=20
> non-scaling converters. So I don't see a problem to just allow the=20
> current state, as the user has to adjust the format anyways if he isn't=
=20
> interested in a deformed image (instead of blocking this potential rare=
=20
> use-case).
>=20
> But I'd add a check in my scaling commit to also check in the streaming=
=20
> state that we don't set a 90 degree rotation causing the scaling factor=
=20
> to be exceeded (e.g. 1x2 -> 1x32 scales by 16, whereas 90 degree=20
> rotation causes a scaling factor of 32).

Ok, didn't think it would just break aspect ratio to make it fit, but it me=
ans
its valid for this HW.

Nicolas

--=-aSiFsAE5dKCPdAUlYUtL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagSsvAAKCRDZQZRRKWBy
9DGsAQDFF4AUa8rwW+g79CDHXNSmFRT9T7gidDUKZhGYQYsr2wEA65cExpikwkg2
lV7COvcRf9/k95Nx5NJ2kLXO9C4PsAs=
=fHbK
-----END PGP SIGNATURE-----

--=-aSiFsAE5dKCPdAUlYUtL--

