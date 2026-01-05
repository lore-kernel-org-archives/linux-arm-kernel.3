Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85511C79FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=; b=nMYzULPpO10M98S/cql1247aMt
	MaFbasFeSEDhVzjNviOk60EXSqirGwSw3CESrlfNvz7GLsA6idFv2mNh80SQZq5OAc8EV2GqKPkpZ
	7a1fDc6Ii1VsHTERu3i8fDxrB7noPUd+8UXlNMDhv5Buzvc8CFlbqwTIvkZAygvI/XP4Rfw/Xx7z0
	KpxZna1N+sfoZ2WlKDVZHQI4ObLsrQopVaFi1eOcf8B8gLmlx7B9MIGGMha+Ht0hxXoNy4XpoCc3F
	kvAZP2CIVulbqE2cICvTc9k5m/49pq0BlyQFUe80adrGc0vA0ebj9JKJgnK2KUPsWYSKwrB7L1t6X
	k984OKnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcp1v-0000000BujB-1jGA;
	Mon, 05 Jan 2026 18:10:11 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcp1q-0000000Buil-0EvY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:10:09 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b2d32b9777so21717485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767636605; x=1768241405; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
        b=DqrkR3JRv12cFihi15/QcyJyKXsLISm0DdcyGq8RPlhuAv5ge5M9dh/D4+HXehwJ3p
         j31pgiCUtrbqjaGPG+iNoXLl03ErQr1u00bDGTFtaEx07qhvUC2EPvfFrYBny+YL8cWE
         Yza96yDzlZmRkPa4Yu+ptJN0LpnspyTzY9doWlOsdFF6tnuLU6v6mvF2F9eF2ft4gyfv
         ZWAmlrwtmbnWbghgaiBwkoad5zA95Q0Pwj+lPk0b0O6BMRhYYzSXXFeOe3WGuaRB/Et6
         00ZABhtLr1r5Vzx04BJ5VMmsVNQB4b/O6NFYbgEguIRqShoUqL9GUpSNOl6q/9MvnCJU
         4V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636605; x=1768241405;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
        b=fbbjoCN5CM3CFeyQVgJASnRhcvubKGdE8380utT9jgqpABY6+PNTi2ajc0PcIIr23I
         iURHvNa7JmVO+sJuFQQZBaRcs9u64q5VLMjSXQFtc15Njf6zPuUO4Wl+L9IxVoGRnARl
         cnb8HwKst9NtG058a6ZfdI/NPv9RB9Stzr5d2hDLz8pI7XE/ta1Vlxg0+NxhkHHlUgtj
         kw6i5WuCNtIuh0kPyAYWzeDLSWGGNYAfhgZ3NAI8auez0yGnY2kcUfjSgloduSbuQbDc
         sM9+9LpsWldRiV5Y1uLaFCPMnjlpkbZiT0ZmXtS7YMeNifuXbkzgaFu8pdxuvCBw76Cv
         JREA==
X-Forwarded-Encrypted: i=1; AJvYcCVxlqQKZdGvbIK+tnThHHrWCSLsvlUry6oNpoR8Npzc5JLDwGLTFCSAdkbhM54m4PuYjSZrZH/CN2eBgh9SVWQ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx7tQklSpwzyKPNDaTinR3PKHwzF3/8TSGSszTyCuNprdS56Ze
	UYjR3ntNaQ9vsPXTRjjCza/bEigIJSOf8P0LGDzQ2S0qfJf88y4l1Sl2QHGoh44YlI8=
X-Gm-Gg: AY/fxX5PRhFFJkm2DW4KpBVcG+UW3vOa+yqDA0SXIuVycO/Mg+OzJeN+XG4GAdWZKkF
	xtaZMO0b1a8NyQbAsixijwkZXXtO3WijV5NQPqq32o/xe2fvCUWKvCdcfT6qLbXHbc+Vwdcc5xi
	/p3hj1D5rXiFlZZreKLc+o/1B3gEC/mD3KoZ2vYCiS3KT2Od8xM4i8ivlrDj53KNsEr6P/olx4O
	ckt+h3FYTgNIU84ghDUnk05vde0O2GVC7kWQ4K8KdgDefxeqCbXq0fzc6ItnGtCfL40Uo4Aw7IY
	5dH2AsJ1mVOD7mwo1k/Z7+ytKdrO9n3QJxOf0jlnUYfHEdWm+Dimy5jCJCMJssw0Vdv890IIB0v
	5w5hhDiyP2j7ue9oCSu9zJNxmhcxydth4alvWvcS9LgY5gHrdWSX8a9GDFRHRgJjdiWtqIx7X+r
	FALGE3JbktN9A1XP4hnti8d/YYMKA=
X-Google-Smtp-Source: AGHT+IFR3DFd9jpe0oN2x6M/8bWNFU8mAiEEjbZ9LTTfuDxwfvW0bq8zMCRJmYOp1ZK5Jd4YL/mM9g==
X-Received: by 2002:a05:620a:46a0:b0:85b:8a42:eff9 with SMTP id af79cd13be357-8c37ebbb452mr64060085a.53.1767636604517;
        Mon, 05 Jan 2026 10:10:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a9a19sm3638685a.1.2026.01.05.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:10:03 -0800 (PST)
Message-ID: <4d885ca36bef3e8227f8e0ee80bf5bcc3959e9ce.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/3] Fix concurrency issues between G1 and G2 on
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
Date: Mon, 05 Jan 2026 13:10:02 -0500
In-Reply-To: <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
	 <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-zvFzPoy3A7lV+wocoxlB"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_101006_817132_117F8A97 
X-CRM114-Status: GOOD (  17.42  )
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


--=-zvFzPoy3A7lV+wocoxlB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:42 +0100, Ulf Hansson a =C3=A9crit=
=C2=A0:
> On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> >=20
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > On the i.MX8MQ, we encountered some concurrency issues with H264 and HE=
VC
> > decoding.
> >=20
> > There are two main reasons:
> > 1. The vpu blk-ctrl don't have separate reset and clock enable bits.
> > 2. The g1 VPU and g2 VPU cannot decode simultaneously.
> >=20
> > We attempted to make corresponding fix to address these two issues.
> >=20
> > Ming Qian (2):
> > =C2=A0 pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8=
mq vpu
> > =C2=A0 media: verisilicon: Avoid G2 bus error while decoding H.264 and =
HEVC
> >=20
> > Nicolas Dufresne (1):
> > =C2=A0 media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
> >=20
> > =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0 2=
 +
> > =C2=A0.../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 42 ++++=
+++++++++++++--
> > =C2=A0.../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 8 ++++
> > =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 23 ++++++++++
> > =C2=A0drivers/pmdomain/imx/imx8m-blk-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 +++--
> > =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++=
+++++++
> > =C2=A06 files changed, 100 insertions(+), 7 deletions(-)
> >=20
>=20
> Can I pick the pmdomain patch separately from the others? Or does this
> need to go together?

I believe you did already, and its perfect, we have picked the rest in the =
media
tree now.

regards,
Nicolas

--=-zvFzPoy3A7lV+wocoxlB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVv+egAKCRDZQZRRKWBy
9FfKAPwIfuzu0Oju3HLojCHI9FM9JdnnqW5c8KFbwAK37MdTNgD/erN0pVhummc6
5FGqJ5UvmnrrAGczimw1n6SlMWulQQk=
=CTsW
-----END PGP SIGNATURE-----

--=-zvFzPoy3A7lV+wocoxlB--

