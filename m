Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3C9CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUk1/UmVnWvhwmrf0Lk4eIP2Bpk+u1NScD5K8ujsx3Q=; b=ZSUSfUdMJ9AKoF4FWkjC2qo61h
	6vHbMlWwKSW0UhENZrXAzeTVh5H9a8DYy05VWCCVZRzurPRpkcqskL5rS2w3c2oJ5Y4kpAUk/PtwQ
	k07ZPbZ06h0gZU3dS1w24gtaXRPL5pHybTvEoR6hfh/VjWIL3PgMdmsUJr/TS/WQkWs93H3wRedIE
	XAKQbymRi9soj3b63SUJiOWxO7lnZ3jYu5s/r+legoCL+SToFfmKJQlYN8Kxi6Cb+NdThwoSmwm5a
	Z8Bew2DDTAM09q2kh0JdfdJnVj10Rda3/0LlzJgNQT+uC+/gDNX9FeKeB8e0C28vcQkeDXB0R5aY6
	MxWUDZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbQJ-00000008tlJ-37f9;
	Mon, 25 Aug 2025 17:56:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbKp-00000008s8V-0PCZ;
	Mon, 25 Aug 2025 17:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756144220;
	bh=99QxpOa1hWDVJMREI3P/OOtPeeZsrilD0hyvIUZj/ko=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TGjglqHAVky/nLbV8g0zk5XTTg0334cJVMNNqKelf9STnzVr5RRzk0kzX72wVe1q+
	 8NBE4L1+kXsrKFexwTkVMZo0sjlWZhDnvKQPPDJCQDdYb7E8T7HBLs3zhAI0QWWFvu
	 ZekyZ3vZINoyjUmX9CkLvTfVDwDYPqlzHimodlaVH1P5BubJA+kAjuge3LeaYx7hMg
	 tj2gikWglVHr3moG7ZWEFN7P17Wga0mAn1gZbFdnUfGF5FPvB1+LDjcVBNVjs7vD+m
	 jN/I0dTZINYAIKgYtVFghuBcGvlgV/BriJcaw5xm/a2TGgx723Dljz6ZztjVWbRBQ6
	 FsU90aE2NNQ6A==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8942017E05F0;
	Mon, 25 Aug 2025 19:50:18 +0200 (CEST)
Message-ID: <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 p.zabel@pengutronix.de, 	mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 kernel@collabora.com, 	linux-media@vger.kernel.org
Date: Mon, 25 Aug 2025 13:50:16 -0400
In-Reply-To: <20250825170531.GA1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
	 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
	 <20250825170531.GA1899851@ziepe.ca>
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
	protocol="application/pgp-signature"; boundary="=-wovO2wwoxNj2XCpfZEwH"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_105023_301055_C0F62E9E 
X-CRM114-Status: GOOD (  25.18  )
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


--=-wovO2wwoxNj2XCpfZEwH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjmain, Jason,

Le lundi 25 ao=C3=BBt 2025 =C3=A0 14:05 -0300, Jason Gunthorpe a =C3=A9crit=
=C2=A0:
> On Mon, Aug 25, 2025 at 05:34:43PM +0200, Benjamin Gaignard wrote:
> > diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/medi=
a/platform/verisilicon/hantro.h
> > index 81328c63b796..a28a181013b9 100644
> > --- a/drivers/media/platform/verisilicon/hantro.h
> > +++ b/drivers/media/platform/verisilicon/hantro.h
> > @@ -12,6 +12,9 @@
> > =C2=A0#ifndef HANTRO_H_
> > =C2=A0#define HANTRO_H_
> > =C2=A0
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/iommu.h>
> > +#include <linux/iommu-dma.h>
>=20
> This is an internal header it should not be included in drivers.
>=20
> > +static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
> > +{
> > +	if (ctx->iommu_domain) {
> > +		iommu_attach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
> > +		iommu_detach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
> > +	}
> > +}
>=20
> What is this supposed to do? Put it back to the default domain? Who
> changed it away from the default domain?

If you rename the iommu_domain into empty_domain it adds a bit of sense. Wh=
en
you attach another domain (this one is empty, but it does not matter) and d=
etach
it, the default domain get restored. That effectively forces the reprogramm=
ing
(in the VSI case flushing) of the iommu configuration.

>=20
> Did some other driver change the attached domain (if so that's wild
> and wrong)? The commit message hints at that but it should be
> explained alot more.
>=20
> This just seems wrong and goofy. Driver shouldn't be changing their
> iommu domains if they are using the default domain at all. We now have
> APIs to allow you to allocate wide chunks of IOVA space and manage
> them directly. Maybe these 'multiple stream's should be doing that
> instead of mucking with iommu domains?

This is seeking inspiration of what we do in rkvdec [0], the iommu-dma.h sh=
ould
not be needed.

Jason, the point is that the iommu and the VPU are not separate devices, wh=
ich
comes with side effects. On RKVDec side, the iommu configuration get resets
whenever a decoding error leads to a VPU "self reset". I can't remember who=
 from
the iommu subsystem suggested that, but the empty domain method was agreed =
to be
the least invasive way to workaround that issue. I believe Detlev tried mul=
tiple
time to add APIs for that before the discussion lead to this path.

Benjamin, please improve the naming, comment and description, I agree with =
Jason
its not completely clear. I'm also surprised that you do that every frame, =
seems
excessive.

regards,
Nicolas

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dff8c5622f9f7c644e995d013af320b59e4d61b93

--=-wovO2wwoxNj2XCpfZEwH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaKyiWAAKCRDZQZRRKWBy
9JL7AP9R1VeW8rNgnuoZz8urKJxxEG6gWu6/kM7ge/SIZxuBcAD/SiNzSms3Po30
iybuQvLYIS4MMJlWAyYz5eVQbcpO6AU=
=XYWc
-----END PGP SIGNATURE-----

--=-wovO2wwoxNj2XCpfZEwH--

