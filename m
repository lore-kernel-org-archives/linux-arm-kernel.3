Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D36CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 01:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXZGXkI7uLl3sEbbtCintZrIFHQgmIDguwTLj7wSkWs=; b=iggo8q3pI4Pr3/P0RW81SEsQbn
	/o+vZ2DnUA//MfcSnZiIA5+OelBkUy6bPlhRa4x7avGVW65YqlfNt+jcAr0F1/MzRSxOO7fPznW4u
	W6B8WemDB/2poCXZ5lypEjYbxp/JQuYDojbpdp/KsUEKBWy05HvqT1Orvp/noLQz1cYbtpLSyxqAw
	me7dG9L13FjK9ZCME6k3AqEx+VgAyrh5Fl76HgcsLqDe28M3ckk9JPW/HeSi7uJvB1gTSd4b2VOGd
	5aNV3Rz2+knxeN4+7ivONtIlrDBnAI61IG2hvtDP9WkZ0qePQiKvrwmbUJHIDGxm7rxBN5CH9Irmd
	TZzOvYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrvN-00000006LPA-42gz;
	Thu, 21 May 2026 01:10:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrvL-00000006LNH-07zN;
	Thu, 21 May 2026 01:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779325803;
	bh=vwvK/qSv/aZAl1CPofiDoXpIyBZsN7vdh8/5gMr7JTk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HtzBzzznFfrhb4+KNwEuwqKGzcI//vla6E0jju3dgGSDGkcC1GPQUlofR0fVJrzWk
	 D4/Dtz+yEub6GACCxzxCZZUMH4eeM2e1hZ6+Mx0pjTkrPgRHqmSt28MSD9cqusRNwO
	 GeWMoQjBcjJFH9ScMM0YWyCpqyP7PjGqdJDBxfVVqgXtoBmDAFrY/grsGBRvvBlCcP
	 f0hhSgiJEERSJNvy5ZaRq0CvtN8DeiCsF4JxeEBFIYiuP57D3uKVm3w7ET/3zOP2LV
	 YhybF8NvOxlHpHfAeyubEQdOBlqq6qSgfgRc2uMQijjQrnT2ehEft1rQF6o2ni+Lsi
	 FtRhJB+jNDzLg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E876217E05B5;
	Thu, 21 May 2026 03:10:01 +0200 (CEST)
Message-ID: <9c9857f2dff60d536de6d201cdc9f68afec5be38.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: fix PM runtime teardown ordering in
 remove
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>, jonas@kwiboo.se, 
	detlev.casanova@collabora.com, hverkuil@kernel.org, mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar, heiko@sntech.de, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 20 May 2026 21:10:00 -0400
In-Reply-To: <f9e63fbbd99c11f303ac8e8f5aec6b2bd528cf99.camel@collabora.com>
References: <20260518105413.42147-1-pavone.lawyer@gmail.com>
		 <20260518145414.64514-1-pavone.lawyer@gmail.com>
	 <f9e63fbbd99c11f303ac8e8f5aec6b2bd528cf99.camel@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-a/Niwa1gTf9973ZgRNez"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_181007_229981_6EF098CF 
X-CRM114-Status: GOOD (  24.11  )
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


--=-a/Niwa1gTf9973ZgRNez
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 20 mai 2026 =C3=A0 20:51 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Le lundi 18 mai 2026 =C3=A0 16:54 +0200, Francesco Saverio Pavone a =C3=
=A9crit=C2=A0:
> > From: Jonas Karlman <jonas@kwiboo.se>
> >=20
> > The current remove() path calls rkvdec_v4l2_cleanup() and
> > pm_runtime_disable() before pm_runtime_dont_use_autosuspend(), and
> > frees the empty IOMMU domain after that. With autosuspend still
> > armed when the domain goes away, the VDPU381 can be left in a dirty
> > state across module reload and suspend/resume cycles.
> >=20
> > On RK3588 this surfaces as a VP9 inter-prediction bug: from the
> > second ALTREF frame onward, motion blocks decode with U=3DV=3D0 (BT.709
> > green), while intra and static blocks stay correct. Reordering the
> > teardown to dont_use_autosuspend() -> iommu_domain_free() ->
> > pm_runtime_disable() -> v4l2_cleanup() makes the symptom go away.
> >=20
> > Tested on a Radxa Rock 5B+ (RK3588, 8 GB LPDDR5) with both the
> > libva-v4l2-request mpv pipeline and Chromium's V4L2 stateless
> > decoder. With the fix, 300 random pixel samples on VP9 Profile 0
> > clips at 1080p and 1440p match a libvpx software reference exactly
> > (worst delta 0). Without it, the same 1080p sample at frame 4,
> > pixel (960, 270) reads HW=3D(0,112,0) vs SW=3D(204,147,116). HEVC and
> > H.264 stateless decoding via mpv keep running on hardware with no
> > fallback.
> >=20
> > Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors"=
)
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
>=20
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> cheers,
> Nicolas
>=20
> > ---
> > Changes in v2:
> > =C2=A0- Add Cc: <stable@vger.kernel.org>; media-CI flagged that the
> > =C2=A0=C2=A0 Fixes: target (ff8c5622f9f7) is present in the 6.17, 6.18,=
 6.19
> > =C2=A0=C2=A0 and 7.0 stable branches, so the fix should reach them too.
> > =C2=A0=C2=A0 Link to v1:
> > https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.=
com/
> > =C2=A0=C2=A0 Media-CI report:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/1001=
24849/artifacts/report.htm
> >=20
> > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > index 6f5f0422d317..bb95b090a25b 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -2066,12 +2066,13 @@ static void rkvdec_remove(struct platform_devic=
e
> > *pdev)
> > =C2=A0
> > =C2=A0	cancel_delayed_work_sync(&rkvdec->watchdog_work);
> > =C2=A0
> > -	rkvdec_v4l2_cleanup(rkvdec);
> > -	pm_runtime_disable(&pdev->dev);
> > =C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > =C2=A0
> > =C2=A0	if (rkvdec->empty_domain)
> > =C2=A0		iommu_domain_free(rkvdec->empty_domain);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +	rkvdec_v4l2_cleanup(rkvdec);

After consulting the sashiko.dev report, this made me reconsider the fix. A
problem that pre-existed it seems, but made a little worse. Basically, user=
space
can still open and call into the API until rkvdec_v4l2_cleanup() is called.

Didn't research too much, but may you can extract:

	media_device_unregister(&rkvdec->mdev);
	video_unregister_device(&rkvdec->vdev);

And move this at the top of the remove function. This will prevent further
access by userspace, avoiding races. While at it, remove useless
rkvdec_v4l2_cleanup() helper and merge it in, its only used once.

For the rest of your report, I'm under the impression remove won't be calle=
d
unless all the open devices has been closed, which will call
v4l2_m2m_ctx_release(), which synchronously abort any pending job.

https://sashiko.dev/#/patchset/20260518145414.64514-1-pavone.lawyer%40gmail=
.com

> > =C2=A0}
> > =C2=A0
> > =C2=A0#ifdef CONFIG_PM

--=-a/Niwa1gTf9973ZgRNez
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5baAAKCRDZQZRRKWBy
9PuoAP9gtGPvLxa4W9L5+xumxe/MkgDxKRvK3bcntdSpVRuoywEA9Q2fu/BulsAq
W94NZMxGfEsscd/Nfk469D3oxF6mrQU=
=U/NF
-----END PGP SIGNATURE-----

--=-a/Niwa1gTf9973ZgRNez--

