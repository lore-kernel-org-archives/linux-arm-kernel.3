Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5D6C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woz7pk/+ngx1fAXXik33xpEwcwvHhgnlnzWIambURC4=; b=EqXUAXeOkixXMW7P0WSXPVn2S/
	oO/BGSxNwrOZBQ1VNeHeQAidkVizbKoHuzBtloDbSFT5g+ezJwdFJIRXnr0R9NPbRKDf5Ie0hv8Sr
	VXbpAeV0qUAy+3zKtHXwS3EP2HhA7GWxfU8Ex//SKe1yRxOPS+X7L1SvQxBt6YVf/JfU5nh1GEOti
	oHpQ+YIKXBtBaTBdLC/B+IvaUCuXeZKgENjGvKHMnxYgYjmQ87Q83LfS2jDRTQxZCHPxvMxKgUOyo
	5QJN8DojsBP9T649+zr0WGvMmZyNF2yLWbqfdZUoI46W1QQM7diSZ2e64sZsGFMJhFSnk9bwx+FXv
	zn2pTXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiACS-000000071Rx-0f2m;
	Wed, 12 Feb 2025 10:42:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9YQ-00000006twu-2Zpd;
	Wed, 12 Feb 2025 10:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 764BE5C5DAE;
	Wed, 12 Feb 2025 10:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373AEC4CEDF;
	Wed, 12 Feb 2025 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739354473;
	bh=woz7pk/+ngx1fAXXik33xpEwcwvHhgnlnzWIambURC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFknMvAYCwTyrVf3OxL2gYhdX1gCloKqAmyPXLmtzPDsbcRVkduTdz/DV5ooCn6B8
	 4+t2DpEMJiVVr1HQy/UiPXnSvdRjYZe/W+HkI0ERWJH1/abm0dKszP95sM9O6UTc7F
	 cLOzYQhgS2NJc9exC2em9aL/Mx1QYAwOIbY8AESaYkLTGqh4r4i4tds7+BKUhmiddw
	 rV8PgQzg43sxTHsHorGuUbkQHjEZkYtDbHRc+gM3WRI8ALQ9y2UmKa7xUpmV7xI6eF
	 3dF5FTcTfKWbuXXv91blHqqWPM6YquxAfS0ysnR7v22PRyei45Pal7UpfLtSsX8Q6B
	 eI9d4Ema9btyQ==
Date: Wed, 12 Feb 2025 11:01:11 +0100
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
Message-ID: <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
 <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="uxrfo3idfywaw7zh"
Content-Disposition: inline
In-Reply-To: <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020114_743425_6E773BC2 
X-CRM114-Status: GOOD (  14.01  )
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


--uxrfo3idfywaw7zh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
> Note that the CMA patches were initially shared to help reproduce my
> environment of development, I can isolate them in a separate patch
> series and include a reference or "base-commit:" tag to it in the
> Panthor protected mode RFC, to help progress this review in another
> thread. It will avoid overlapping these two topics:
>=20
> - Multiple standalone CMA heaps support
> - Panthor protected mode handling

You keep insisting on using CMA here, but it's really not clear to me
why you would need CMA in the first place.

By CMA, do you mean the CMA allocator, and thus would provide buffers
through the usual dma_alloc_* API, or would any allocator providing
physically contiguous memory work?

In the latter case, would something like this work:
https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@ker=
nel.org/

Maxime

--uxrfo3idfywaw7zh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6xxYgAKCRAnX84Zoj2+
doOXAYCmJnHBgdesgUZVquuWr6GPMIwXNegsF2kF9WE8cUf8QZREQljZMta1yPl+
Y3KyEfEBf2GAaLjFhJfdk0/CAvLXAP/kO5oVGERfJbRdGvpysS+9JiElAhrVFTWR
1Zzqx2VRSg==
=Jh+j
-----END PGP SIGNATURE-----

--uxrfo3idfywaw7zh--

