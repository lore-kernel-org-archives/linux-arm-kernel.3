Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C0F436A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP43LVUbNS6gGNJtlMHBKpP7X3d/8IsFX56UHBlJ47E=; b=gym4oY/Yo8VxPgvED5I4xLpi3L
	+MV+sXOAc4e7x9+t6WnlE5Rn6cRhM4P3NfBxUVvq1dJbO05t3qnpe96V36Mho7poia5srJzmR3376
	4ysEHUq1ZJ35H+JOaf7SDTIOXkJ6zccxGNi5dn0xLndGb2XfywzpqGyFy/0IVnKX/1BPSqdI87Tb0
	8uinQJJnicYhOHYwgpK5iLLuOYWlkDI0s5n2PxvEHIrF7zxgOHX9xf9A6EDrF64nYHRurX+YPUsy9
	KHNO7ArIdXrscWvV+QFuWtqMa1SvgOtGOMTGic2ga9UNotF1q2YhA31PXGn1D7dpQMDpwF950AhUX
	4M234svQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjHh-000000045TN-3jvf;
	Fri, 17 Apr 2026 13:31:01 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjHe-000000045SQ-2Sg4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 13:31:00 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-651cfaa21e6so696474d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776432657; x=1777037457; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yP43LVUbNS6gGNJtlMHBKpP7X3d/8IsFX56UHBlJ47E=;
        b=rTIC4xNCS+DVijxew4smn4kfLuLAyEWN3ok6my1jaAWNBjbnIjNoALxXTbRApzGF97
         lk1yoj7d6w/uMhptLPonTP5FcQjkZpqJKS7Wiy+KBz23qRvs5le4Zr5yH78gfNLit5sT
         RKijCa5zeCT0gZrIBCxmk2mOuKp4+f7boB0E6uuZTXa/ZHHVc2SCGt7oVYMwCIsqF00A
         QpIZ0v92y8M5mpy2g7mRUXxcNHL3CTdb8MPkSqLswVrze7MZbaqhh/7WMMnrn4U17ROS
         fJrU9azVzx6T9gmxZJI6xLrGswiYdY4tstAKExOvQRWlUEZOxpyK0GsvAFnYBR+SG2Dv
         6icQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432657; x=1777037457;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yP43LVUbNS6gGNJtlMHBKpP7X3d/8IsFX56UHBlJ47E=;
        b=MZKSX7bxebAE5d/lC+l/ZYijHKGz+mVaUHjPHeiiCecl/2fyYHtm7YWiL38up/Y38U
         gnExhY9I6GMlRusK2McWfgdOiweDL0CLrYIeN12PTDjANjESPyzcyi5l2eAfaamYBpVE
         jrAwjOVxM2dRDycAqV2S10/+HT1YkUEiccfZ9VUWcVKfrIy83ooXBAXtE8PeILF+lPq9
         E/5fhY3BtKld/f4jzAlroV4jrt3hAiYQBqnBNbBoxCDn8q++DqqyxPK4XagZdD+/wQ/G
         2LwhZ76YskEaWDxCgepws2MijIJcnHD2ukI3JpW7ex2wkH9JMOMYO8yE6xbYyWJ7yjEX
         5rWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n86M8N7OkKAw5Ltbs50T2PkjEeCqLEg71Zz+mC0Z+D+N2OkyXb59o2aMozLidShetEaiCkFLXsLNQmlGbwACb@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFZu3kyJjHvXUqwJcOQAg9bpf7PHL98Id9wevXWv+/mDy/5IU
	mgDVfJw1IK8SOk27i3e82Bd88yZBlquX7qQxb6aVJh6p0v1gnEJ7H0CiMmVm29eWnAM=
X-Gm-Gg: AeBDieu5DM4v3cip5i07HKqqq3PYbAKtV93Z6bhpRCYCeKzYAMRecDab/wMwoYmUlmK
	nV18ovZSS/YybVrkD5kAOvR+Ty3Rbu1K+Sb4x9Y2o3+8ITNUBXLBKl+aSPs8ur+21nDfOvptLE9
	3cHOYEH24lATYaNQGkXQKdXxVAgZr8lUI71SnUBmsfYWD877hAplAe2hVu8FQaqQL+JRWOh7JC6
	8+vD3lok65uT5beuoz6oWkRvQf/DYGTBEHHwQOrRIxdZYqvOmtDJDB5Bj8zh+PxBSQn17e1nEMs
	B4UwN7UBoSqtjxME8oGeVAve4lNFtgElMxSSXW2QepeawkW0x44DgF1EBB0yvL0L+4jFI8+Fow1
	F454TEP/4C7gWA1G8vXXzqGh2Zko9+iC9GxQq0ScHsF1AcOHE2qhmpt1BtOzRc7hZnEZCJlKwyA
	3Bvl/dtU+xHG41e8g1OZoux/oTgGKfE6lToCF/gmc=
X-Received: by 2002:a05:690e:4850:b0:64c:ec30:9dd8 with SMTP id 956f58d0204a3-65311c8b52fmr1160833d50.47.1776432656675;
        Fri, 17 Apr 2026 06:30:56 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac77546sm10334746d6.17.2026.04.17.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:30:55 -0700 (PDT)
Message-ID: <5b4cf8f7951cc2766901b09f2e886ef73d48671b.camel@ndufresne.ca>
Subject: Re: [PATCH v7 0/3] Mediatek MT8189 JPEG support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Fri, 17 Apr 2026 09:30:53 -0400
In-Reply-To: <20260417100519.1043-1-jianhua.lin@mediatek.com>
References: <20260417100519.1043-1-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Ge/8Q+z1/L/Ug2FhDTGi"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_063058_783991_5A694689 
X-CRM114-Status: GOOD (  15.92  )
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


--=-Ge/8Q+z1/L/Ug2FhDTGi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 17 avril 2026 =C3=A0 18:05 +0800, Jianhua Lin a =C3=A9crit=C2=
=A0:
> This series is based on tag: next-20260410, linux-next/master

What dependencies justify not submitting based on media-committers/next as =
usual
? Its fine to say you tested against linux-next of course, and if its only
working there, its really nice to explain why.

Nicolas

>=20
> Changes compared with v6:
> - Patches 1/3 (dt-bindings: decoder):
> =C2=A0 update the existing `allOf` condition for mediatek,mt8189-jpgdec t=
o
> =C2=A0 make the 'mediatek,larb' property strictly required for MT8189 SoC=
.
> - Patches 2/3 (dt-bindings: encoder):
> =C2=A0 Add an `allOf` condition to enforce that the `mediatek,larb` prope=
rty
> =C2=A0 is strictly required when the compatible string contains
> =C2=A0 mediatek,mt8189-jpgenc.
>=20
> Changes compared with v5:
> - Patches 1/3 (dt-bindings: decoder):
> =C2=A0 - Drop top-level minItems/maxItems for clock-names per Krzysztof's
> =C2=A0=C2=A0=C2=A0 review.
> =C2=A0 - Refine allOf block to strictly enforce clock constraints.
>=20
> Changes compared with v4:
> - Refines the device tree bindings for JPEG decoder and encoder.
> =C2=A0 - Patches 1/3 (dt-bindings: decoder):
> =C2=A0=C2=A0=C2=A0 Moved the standalone compatible string mediatek,mt8189=
-jpgdec
> =C2=A0=C2=A0=C2=A0 into the first oneOf entry along with mt2701 and mt817=
3, as
> =C2=A0=C2=A0=C2=A0 suggested by Rob Herring. This correctly groups all in=
dependent
> =C2=A0=C2=A0=C2=A0 ICs and removes the redundant items wrapper.
> =C2=A0 - Patches 2/3 (dt-bindings: encoder):
> =C2=A0=C2=A0=C2=A0 Applied the same logic suggested by Rob Herring to the=
 encoder
> =C2=A0=C2=A0=C2=A0 binding. Restructured the compatible property to clear=
ly
> =C2=A0=C2=A0=C2=A0 distinguish between the standalone IC (mediatek,mt8189=
-jpgenc)
> =C2=A0=C2=A0=C2=A0 and the ICs that must fallback to mediatek,mtk-jpgenc.
>=20
> Changes compared with v3:
> - The v4 is resending the cover-letter, because the v3 cover-letter was
> =C2=A0 not sent successfully.
>=20
> Changes compared with v2:
> - Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
> =C2=A0 compatible) as it belongs to a different tree/series.
> - Patches 1/3 (dt-bindings: decoder):
> =C2=A0 - Changed the MT8189 compatible to be a standalone `const` instead=
 of
> =C2=A0=C2=A0=C2=A0 an `enum`.
> =C2=A0 - Added an `allOf` block with conditional checks to enforce the si=
ngle
> =C2=A0=C2=A0=C2=A0 clock ("jpgdec") requirement for MT8189, while preserv=
ing the
> =C2=A0=C2=A0=C2=A0 two-clock requirement for older SoCs.
> =C2=A0 - Updated commit message to reflect the schema structure changes a=
nd
> =C2=A0=C2=A0=C2=A0 hardware differences.
> - Patches 2/3 (dt-bindings: encoder):
> =C2=A0 - Changed the MT8189 compatible to be a standalone `const` instead=
 of
> =C2=A0=C2=A0=C2=A0 an `enum` inside the `items` list, as it does not fall=
back to
> =C2=A0=C2=A0=C2=A0 "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
> =C2=A0 - Updated commit message to explain the standalone compatible desi=
gn.
> - Patches 3/3 (media: mediatek: jpeg):
> =C2=A0 - Refined commit message for better clarity regarding 34-bit IOVA =
and
> =C2=A0=C2=A0=C2=A0 single clock configuration.
>=20
> Changes compared with v1:
> - Patches 1/4:
> =C2=A0 - Updating commit message
> - Patches 2/4, 3/4:=20
> =C2=A0 - Updating commit message
> =C2=A0 - Adjusted property descriptions acorrding to hardware requirement=
s
> =C2=A0 - Improved formatting for better readability and consistency
> - Patches 4/4:
> =C2=A0 - Updating commit message
>=20
> Jianhua Lin (3):
> =C2=A0 dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
> =C2=A0=C2=A0=C2=A0 string
> =C2=A0 dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
> =C2=A0=C2=A0=C2=A0 string
> =C2=A0 media: mediatek: jpeg: add compatible for MT8189 SoC
>=20
> =C2=A0.../bindings/media/mediatek-jpeg-decoder.yaml | 48 +++++++++++++++-=
---
> =C2=A0.../bindings/media/mediatek-jpeg-encoder.yaml | 29 ++++++++---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 44 +=
++++++++++++++++
> =C2=A03 files changed, 107 insertions(+), 14 deletions(-)

--=-Ge/8Q+z1/L/Ug2FhDTGi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaeI2DQAKCRDZQZRRKWBy
9FAeAP9hNlBMJeDwrd4Q36uw0NTXVgqg2wu5S1txSqHzY2sxkgD/dIedXuzuO0AL
3iduYnYusZ1QaDh8eK2hofWngg9wdAc=
=4Pdh
-----END PGP SIGNATURE-----

--=-Ge/8Q+z1/L/Ug2FhDTGi--

