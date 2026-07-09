Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8670C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJbh9LElbrEI7E/P7mvmoKpzdOlw1yDQ59JtSNULaUQ=; b=Zab+sHf1bohuhnIqElySTBl033
	eNeh0NfEdFONy9PM9w/JX3SbWPYj8YnPMdrkglLwPSrfusGuL5syb+tZlGb/0TkZlJ3VTHgyDZE90
	ycZJqe8fHLV9TpqPeA/3qp1MmcVWiwQDACpX8UQlmOxhfkEyigOF5np2s8N1RlQUMzKu+WQ8USI/W
	Mjjd4RXR2rHJPzxUBxP3XsaKaJ0cukaWJ5wXh4clOVzcgXX88F9oe42w52Xmnnvi/F8yqkbFRH3hu
	h3cWOJ7guKDIQLCx3Ndm03Qw/uUwa+RXH1wqe7zDzUHdoJ4zhdLVsSQR6v+fhh0ui3dp2hO7H/WL4
	KvopgQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr9h-00000002zCx-3mW2;
	Thu, 09 Jul 2026 15:59:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr9g-00000002zCq-2mOx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:59:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53ED943220;
	Thu,  9 Jul 2026 15:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7221E1F000E9;
	Thu,  9 Jul 2026 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783612756;
	bh=aJbh9LElbrEI7E/P7mvmoKpzdOlw1yDQ59JtSNULaUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RC+SN67Wo1bRPHmk2A3aRNqpRIZs1vt054/wDbMqrDQX+h2TC1c2qOU/P+vZpdlhO
	 AGbczQTeBS/xYxBRav4immcCdk9NfNEvFoxtcbuJpR+9S08i4HqzmmxUf2mXM8hMj7
	 lXpkqf096CaOPzHCghkHjTNtD6G/fOZ8q4jHCFjUFlLP5HaCXiv4HJYAS5IZqtiACw
	 SFUrZULwFBv+H+0ToU32sDdtnyqRsHAorRSMSNXr8y2FRWFng0qncigrrOJt/3zqzq
	 3H/Ma20+f66D8Hr1nfijRAegJrkTFT+SYpIfq6Gx4gdnn9Z3ulZD77FcSZxNF6fYJs
	 u62hwfrMdO64Q==
Date: Thu, 9 Jul 2026 17:59:13 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Russell King <linux@armlinux.org.uk>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
Message-ID: <ak_E4UxfnFJywJa7@orome>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <CGME20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c@eucas1p1.samsung.com>
 <20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
 <3f47aeab-33b1-4966-a5ce-5d6d5261e0e2@samsung.com>
 <e212caac-6c30-448a-9e10-32fff8b842f6@kernel.org>
 <83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2boipej3wyu4mib"
Content-Disposition: inline
In-Reply-To: <83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com>
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


--j2boipej3wyu4mib
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 07:56:45AM +0200, Marek Szyprowski wrote:
> On 08.07.2026 10:35, David Hildenbrand (Arm) wrote:
> > On 7/7/26 12:02, Marek Szyprowski wrote:
> >> On 01.07.2026 18:08, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> There is no technical reason why there should be a limited number of =
CMA
> >>> regions, so extract some code into helpers and use them to create ext=
ra
> >>> functions (cma_create() and cma_free()) that allow creating and freei=
ng,
> >>> respectively, CMA regions dynamically at runtime.
> >>
> >> Well, the technical reason for not creating cma regions dynamically at
> >> runtime is that on some architectures (like 32bit ARM) the early fixup
> >> for the region is needed to make it functional for DMA.
> > Can you point me at the code that does that? Thanks!
> Check dma_contiguous_early_fixup() and dma_contiguous_remap() in=C2=A0
> arch/arm/mm/dma-mapping.c. Those functions ensures that the CPU mappings =
for
> the CMA reserved region in linear map are remapped with 4k pages instead
> of the 1M sections, so later, it will be=C2=A0possible to alter the mappi=
ngs and
> change them to coherent when needed (altering 1M sections is not possible,
> because each process has it's own level-1 array even for the kernel linear
> mapping).
>=20
>=20
>=20
> However, in the use case in this patchset the reserved region is only sha=
red
> with buddy allocator by using the CMA infrastructure, not registered to t=
he
> regular DMA-mapping API, so it would work fine. I'm not convinced that th=
is
> is the right API to use for this though.

Are you saying you're not convinced that CMA is the right API to use for
this? Or something else?

I certainly don't think we want to get the DMA-mapping API involved for
this because that always implies that we perform cache operations, which
we specifically don't want for this memory.

Thierry

--j2boipej3wyu4mib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpPxVEACgkQ3SOs138+
s6Eb0Q/+LDCagsX5c/5bbiHk3kITlOkkdqUCHLmicqkfr4LZXyuHnPZlygaoxrFM
pWQKdyKOOfpM0U1Z1cuOHjLwTv5iB98Ne5qANisu+FqK6xFJ4ccA5Y2pXRG+2cEG
YJS9S13i37EoR6iOHndhRxeZyxcx080fd7aAJdY9yKXL4+bAmW9W5/zS5XbLyBbt
9MEA8Ah3pUnnLdjfeEq0SH2diKgT9OHXRpP4MEEFJbBufctOLZKoBOBBYPuURxCJ
UxjR6KKyMObW2G6HP7fdgDzj5XYdbMEyHN+Cvom68auUKijpkjfOt5NUTQvxuuni
YbwzbmHnbB76VYY6E/4i8uUPDxlBxha2COauHTiiJvdhBoJtPWSKLEYRU7BFrqBr
SJY+OpLNROUP+oZLTyr7jmAoaJI0wLnBLxId6GjF0iID6w1BybeRRDX34o5+mkpE
TOQ703x0/ZpECHboXKqJgo9CX0XIWtiD+yEbn7/HnR/wvHjksGNrCGxYaR5mrIAv
N75RHCupJjA918YwITUGC0EtKUWOcwlVvLwS2G8gAUZd6goYWyEd/fV7G4VEj/4+
+GA2L/CzSK0TbN+Ktayav2Ec5EQy4mKHa47hkWmWGe+Lh22DNNiP2CS3LjnPGs2i
II6qTao1jGC6L0sqjSQAw8VxP4TpU/XHRW8zs9HCzUaNg0ZSnGs=
=xmpu
-----END PGP SIGNATURE-----

--j2boipej3wyu4mib--

