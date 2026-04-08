Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272F610F9976
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=; b=g1sV63HZ0lCmxlvfXq52cOXkl1
	08nPRkCcAcxs1otdcqI7kPoHdozsYyJbVKfXUE1lE6ZUMTRHY1JWNBEsVY/txwpYs3yR1bSx7xQMS
	8fgOymG8Jpo/GdBGAzJdYFwIS9qh4FzFcmf3Cw38z7wWj24UBOTeT9KimyZLlNxNtFfyoddd/WhnD
	qYILXyu6GbQUKHHfUFLkqTEZX/iki8LfpPKwmLkGeuYfnd0Q3KqW/4FQxeIsKwqK1kO8OGviWdOio
	nx5ar6RT9e04zK/hhYm4RA08eI9mLFLQE9IEHgsbaxSxYmLsqxU31zwR99Stl+qOPUn72VEqJ9lbg
	q8vabHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZQG-00000009Nga-1pun;
	Wed, 08 Apr 2026 20:22:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZQD-00000009Nft-2A3p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 20:22:46 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50d8da3e656so1886821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775679764; x=1776284564; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
        b=RBlNsejb1MsOC/WsTg9OBzYIYs7rv2025vA3Y7bq+I4bKlJUEYp7vu5nXn0zv80j/d
         e5S5NG4uRDHaF4sHFtfjJxr3uPNB0+oWO2OzTUNeU6VLLo8MdJiVGx2iXMWyO4pGiO3Y
         FR/SoQSaGAHN/uHTlt0SXR7vhje1RZfj5ay57a4XYEc9CNPUfiIGSBDJM/CATqq/x/AA
         NT4HVxqIHf5dJ0CaGBxty0h4wFa6cj8wyWlABti43H/oIVUkW7kzuqPRaF7L3MwJMpp+
         vWIGDrFDNXxZWKyN1L9ZiS+Z8K50+ky6DFvPwnVbXErbd3CmAe7pYmgLrcNr05yAHIOA
         Iq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679764; x=1776284564;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
        b=fSf9asoMmwJATlXJ7096kEmsp2pcKiEbLWhNNCJYGghcJOXeoWFNl5gN7NwGmrxNuM
         Uxo0Drdu5eHbJiSkX7OS5QQYWBHFeQcyCptVi8PF45blKGiRnoH0V8fr3VRSwmdUcFjl
         gh8dUW8qYuKBEKX1YTYUMu5a13UKV8BBcBwZCwi+w8LIJ0Bse1AmkT8ksUpKNvAi4ol8
         R8kS6Z7u19e4m4TCGruHK8kMTlF/TDPnD0/HV9YfyzoRma/3xrs0cmrjy5pC/YoqHrMa
         +Nkh8HQHwzF204g5XIoW3eR+lUG//JhMG4IIPicsgLnITdcMQzKSZj+9eEnEvditgBQ4
         WgVw==
X-Forwarded-Encrypted: i=1; AJvYcCWgaSnc7Ir/QZhdZDU4/Blxshc3NvM3kMIreaPlxYJCVSlC3UmJLN1sq8m2xcAcBpFdybzOZtX2HqJ5yROES35v@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2jNu5UAfvJDLxbwrE9p9Ti20wVgYrdfQhO2axM+II5cxMCkb
	e2mzrlcgwEnzIvgNrSslnN1Sn77uANqI530qAjyUtw1XzKpBObakT+Nn8/x8L8TRpro=
X-Gm-Gg: AeBDietdUsY4jBrzXIhwgN81eKHb937Vd6RSY+3VjgocJIwNWhZeOOWdHFLF15mtX07
	OLLKA8uBsYq+GcGG1Cn89rnR7DtaKW7j9ZUKmyJ3M50upwYtYxLehU/nZYnXIxhnu6d9SxLhFlc
	nv4Mb2BkJOozb0Sho2j4LqHxNiIFwgKi2WF0yZAltOdOiArscj9gTmaD/xi3jBk9ykBCv8KsFDi
	995Tq1Wcacd8KmMMzAvL+I3jFNORJ6TXIkO9wui1pZhJg4ohNY1WMeYY6J7t8pD+LHJT0lWA0jG
	9KllYzTuIXkzjC0QJSD4URmdElDG0lCYqYgL6CpckB7/mYXfAdaEHGZAoE6qsA4FuqEpDqI57bD
	ROv/LGb/bfiokCWzOxxLPzq+kxtLRwvZ3cWW1tOD7DnDWlmDM7Zui3e7BISOzZ1L/+jhuq/HMHT
	YIMoI/pJV5dPBidzMMM3gCmnxkW5PD
X-Received: by 2002:a05:622a:1984:b0:50b:4ba4:9add with SMTP id d75a77b69052e-50d62a9ca10mr334496991cf.34.1775679763542;
        Wed, 08 Apr 2026 13:22:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4aed181asm192301041cf.0.2026.04.08.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:22:42 -0700 (PDT)
Message-ID: <cd1de04076917d65ccd7dd91d9392af7977a4906.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs
 (series 2/4)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Jassi Brar	
 <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin	
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang	 <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao	 <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, 	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Date: Wed, 08 Apr 2026 16:22:41 -0400
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-RDSjhy/5yQt09mvK/09B"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_132245_571627_C660E0B4 
X-CRM114-Status: GOOD (  15.71  )
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


--=-RDSjhy/5yQt09mvK/09B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 25 mars 2026 =C3=A0 11:57 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
> CMDQ APIs introduced for MT8196.
>=20
> Series application order:
> =C2=A0 1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this serie=
s)
> =C2=A0 2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
> =C2=A0 3. [Series V2 4/4] Remove deprecated CMDQ APIs
>=20
> Please apply this series after the MT8196 GCE support series,
> and before the following series.
>=20
> ---
>=20
> Change in v2:
> 1. Rebase on linux-next
> 2. Fix build error of -EINVAL in patch2.
>=20
> ---
>=20
> Jason-JH Lin (5):
> =C2=A0 soc: mediatek: Use pkt_write function pointer for subsys ID
> =C2=A0=C2=A0=C2=A0 compatibility
> =C2=A0 soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
> =C2=A0=C2=A0=C2=A0 shift_pa
> =C2=A0 drm/mediatek:Use reg_write function pointer for subsys ID
> =C2=A0=C2=A0=C2=A0 compatibility
> =C2=A0 media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API chang=
e
> =C2=A0 media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
> =C2=A0=C2=A0=C2=A0 cmdq_pkt_jump_rel_temp()

Can the two last be applied to the media tree alone without breaking anythi=
ng ?
Otherwise I will need to wait for the soc: patches to have landed.

Nicolas

>=20
> =C2=A0drivers/gpu/drm/mediatek/mtk_ddp_comp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 +++++-----
> =C2=A0.../platform/mediatek/mdp3/mtk-mdp3-cmdq.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++---
> =C2=A0.../platform/mediatek/mdp3/mtk-mdp3-comp.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++---
> =C2=A0drivers/soc/mediatek/mtk-mmsys.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++---
> =C2=A0drivers/soc/mediatek/mtk-mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++--
> =C2=A0include/linux/soc/mediatek/mtk-cmdq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 24 +++++++++++++++++++
> =C2=A06 files changed, 44 insertions(+), 17 deletions(-)

--=-RDSjhy/5yQt09mvK/09B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCada5EQAKCRDZQZRRKWBy
9BvDAQDiGnxs8IuI1dVJpXUEYd4nLqhHu0mrYWUd+Xo+VGU9BQD+M4bHsQCcq4KC
eU/cm+cZeMh1990/2+dj1+RYXPBBewk=
=HqBw
-----END PGP SIGNATURE-----

--=-RDSjhy/5yQt09mvK/09B--

