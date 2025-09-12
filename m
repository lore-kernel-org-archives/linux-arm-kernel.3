Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A228CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjcSWmW/FLtaPaOYE0AhF4l+cmvCOfsmYIv1Yl4wLeY=; b=ciXVO1Hu8GeQ1xuga2GeEyRxcw
	LbmC4OiwDo+Vfq1gJz5ayUSE84E6FceGWIe2YTfez9xtGUzqkVijqL2ZPsvAhp7jgS7v3Cyd14keM
	U41tEMn/+umHDfjZ6jWyvRj4ueXxZs9mk/KC1qrJDMCWQa5Rc5U54qYm7RUX1nk7edo+TpS3ls1r+
	wV/2W26LBcK4EUS9RD6xc9zs4faploL01JLXMPefOhz7Y4yUR4DwW0Jo0Bwx9snh0gMy9YFwcvzvD
	HbbUKIVNz2whJ8xHSK8bFh99UHuOZx9fY8O0H4MBPRWCOdh0LqBjolrXaoaMH8/13zjCZcsT/slAn
	U2RTEMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7i5-0000000AngX-34eJ;
	Fri, 12 Sep 2025 17:37:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7i2-0000000AnfE-2ym6;
	Fri, 12 Sep 2025 17:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757698635;
	bh=tjcSWmW/FLtaPaOYE0AhF4l+cmvCOfsmYIv1Yl4wLeY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hLnKdCg9IdpFTqd2bFHEW1X+2Bhorp0+ygrq5pomVadKqxKOeX67keW1iyRbRUHvm
	 OCJ+5huJFG2c5OjbHw2ZZiy8NkABepAwBwSg8ljvWXSbmzIGMaqrNIJ+T3BVqKfH21
	 B7TX9T0SZRTBGro1QN5d+ljCGvunDtV/yW3ww+mLWU+CCPovlXL09Sg3KLSEleZGJ9
	 ix+Vv+GWB0xpz4KH8GTtxt5BgieAiaGmsdv+ol6uBkBSxbQxUP22zhppspVR70z/fp
	 QAAVgjhRzwdXgMcRlGlpdNTU0KdsnUFP1PGvt4FcdrXjLtCpEGviBA7Iu2jBOpEM9m
	 jmrs69oNcJb0w==
Received: from [IPv6:2606:6d00:10:aee0::c41] (unknown [IPv6:2606:6d00:10:aee0::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3052217E0F88;
	Fri, 12 Sep 2025 19:37:14 +0200 (CEST)
Message-ID: <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, jgg@ziepe.ca, p.zabel@pengutronix.de,
 	mchehab@kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org
Date: Fri, 12 Sep 2025 13:37:11 -0400
In-Reply-To: <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
	 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
	 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
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
	protocol="application/pgp-signature"; boundary="=-kb9W2TmWeCI0uNYqiKHV"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_103718_921590_A3AC2F7C 
X-CRM114-Status: GOOD (  20.04  )
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


--=-kb9W2TmWeCI0uNYqiKHV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 septembre 2025 =C3=A0 13:47 +0200, J=C3=B6rg R=C3=B6del a =
=C3=A9crit=C2=A0:
> On Thu, Sep 11, 2025 at 05:57:13PM +0200, Benjamin Gaignard wrote:
> > The Verisilicon IOMMU hardware block can be found in combination
> > with Verisilicon hardware video codecs (encoders or decoders) on
> > different SoCs.
> > Enable it will allow us to use non contiguous memory allocators
> > for Verisilicon video codecs.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> > =C2=A0drivers/iommu/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> > =C2=A0drivers/iommu/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/iommu/vsi-iommu.c | 808 +++++++++++++++++++++++++++++++++=
+++++
> > =C2=A0include/linux/vsi-iommu.h |=C2=A0 21 +
> > =C2=A04 files changed, 841 insertions(+)
> > =C2=A0create mode 100644 drivers/iommu/vsi-iommu.c
> > =C2=A0create mode 100644 include/linux/vsi-iommu.h
>=20
> This will not go in before Will Deacons comment about code duplication wi=
th the
> Rockchip driver is addressed.

So you'd like a new layer of ops to abstract the common parts of two driver=
s ? I
mean, I can see this happening for VSI/RK, but it seems rather pointless if=
 in a
year from now Jason get his new framework ready. Re-doing the ops if they c=
ause
too much duplicate seems like a better direction.

Benjamin already stated he'd be happy to port once there is enough example =
and
acceptability of the new code to do so. Why do mainline users have to suffe=
r
this ?

To me this rejection isn't about Benjamin's driver, all iommu seems to look
alike, so anyone else that would have sent new driver would have face the s=
ame
issue.

Nicolas

--=-kb9W2TmWeCI0uNYqiKHV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMRaSAAKCRDZQZRRKWBy
9EjcAP9YQJHmhlXLbfNRAJNUDL3s+p3W5755kVTPrP+lUWAdDwD9GcfJeicvbrcm
s0c4dwtEZdUQ2fXV0uGPXMCOR+CRWQ4=
=RKhK
-----END PGP SIGNATURE-----

--=-kb9W2TmWeCI0uNYqiKHV--

