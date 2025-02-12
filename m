Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD64C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrZ7q3UddXW1p49/GdRvgpUzejtlAUiY6e9x0tcKinE=; b=DO3j5FAZAhablEcb5FePsnD0F3
	p11ibfe2Cthev0FBIAKY5sjGzKcztJXvHJv9loTUFRsd/eWpGJZ5YPVKz8LrKWbV7U9rhLKxEn/ll
	ylX7RSNNjX+8fo3OUeMVupgz15sbw21AHildm1ySmvLkXsn1Ajgk8nGBTzGwHd8AWJfetNys0bGJC
	EUJutCWDqrJ2X0yfEYBNeh2BVCnfdPKBmEoQbhN7VpVg3fBHFaoFVdvIExFK1QexrRNUBIWmk77dR
	Zf9TEEqarTuzqzCtuSr+Cy+RV3+jswwhYNt6GaEahj2zXpxTVJ6SYEgJ+JU35XziSG/+y0r+6QhDE
	j0TdTK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAWE-000000075yl-04HN;
	Wed, 12 Feb 2025 11:03:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAJF-0000000736L-2aVT;
	Wed, 12 Feb 2025 10:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70768A402E4;
	Wed, 12 Feb 2025 10:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01860C4CEDF;
	Wed, 12 Feb 2025 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739357376;
	bh=SrZ7q3UddXW1p49/GdRvgpUzejtlAUiY6e9x0tcKinE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsCk99ecgG1X1H4oCmDUZgnbAUfRIvj8fWtdlwdoQ07gzWE7fmKGgOCFbXT8zxU8z
	 E17uZ/CKSWTiBSsXf6Z6vZWKYpqlNlcKGIyrhcObTMnI1Vs8SOuMqX9285cpyLhl3h
	 i4BACZrSu2IrhvuCBWekSlYRZzO3qid0P9Ajy4xYJi/PyBLZ+A2HVA8MjrFX049Kga
	 aC8profD5qguMrsDfEYi5k14CfG/ZS5ZwDrn1/hjq/RJX6KfdiM3+g5V+nuBxEflNE
	 BuOxNawNPtWooUTQhU4pS84J5mQd1EBbum7ylQPZiEkomLW6MNCo51OZTDyrBZ+Ri7
	 Mh4FqItv9flOg==
Date: Wed, 12 Feb 2025 11:49:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, nd@arm.com, 
	Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Message-ID: <20250212-sweet-nano-penguin-e85e7d@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
 <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
 <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
 <8ee8e684-0164-4e70-b42e-3827c7885685@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hofcel2epznouj7x"
Content-Disposition: inline
In-Reply-To: <8ee8e684-0164-4e70-b42e-3827c7885685@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024937_793692_ED773560 
X-CRM114-Status: GOOD (  24.17  )
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


--hofcel2epznouj7x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 10:29:32AM +0000, Florent Tomasin wrote:
>=20
>=20
> On 12/02/2025 10:01, Maxime Ripard wrote:
> > On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
> >> Note that the CMA patches were initially shared to help reproduce my
> >> environment of development, I can isolate them in a separate patch
> >> series and include a reference or "base-commit:" tag to it in the
> >> Panthor protected mode RFC, to help progress this review in another
> >> thread. It will avoid overlapping these two topics:
> >>
> >> - Multiple standalone CMA heaps support
> >> - Panthor protected mode handling
> >=20
> > You keep insisting on using CMA here, but it's really not clear to me
> > why you would need CMA in the first place.
> >=20
> > By CMA, do you mean the CMA allocator, and thus would provide buffers
> > through the usual dma_alloc_* API, or would any allocator providing
> > physically contiguous memory work?
>=20
> You are correct only the CMA allocator is relevant. I needed a way to
> sub-allocate from a carved-out memory.

I'm still confused, sorry. You're saying that you require CMA but...

> > In the latter case, would something like this work:
> > https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511=
@kernel.org/
>=20
> Thanks for sharing this link, I was not aware previous work was done
> on this aspect. The new carveout heap introduced in the series could
> probably be a good alternative. I will play-around with it and share
> some updates.

=2E.. you seem to be ok with a driver that doesn't use it?

Maxime

--hofcel2epznouj7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6x8uQAKCRAnX84Zoj2+
dhpNAX9dpZ7jCHWS9XEKQqdeu+k8bL1z43DeFaKsONHamJEssyPacY4cU20LNyHZ
dE3EP2gBfigcyv0UGOHYi7iyKQFw7lfvXnKfZ2/xUjJoWzSqoXVjjOm3bVKTr4WT
bTbtf2LYNw==
=IIBH
-----END PGP SIGNATURE-----

--hofcel2epznouj7x--

