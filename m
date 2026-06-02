Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80D9CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFMH5l5MTUaf6Xe98VNs76Ti6mPZN2RO0Y2Ijj9ZpVQ=; b=Uxuq7gGEak5G6EMj8D0tQtKWKO
	aW/seRUTPSBNkWZ2EB20rYqvcB2MoxkOsQJD+u11x01dWZU1RTcDqrvwFH45DkeGGpBa3iiy+rHiL
	jbQ40WX7IJXfBo3ji6L0AGNMXskPOn1/85wK12GDlHO/dR3QIGl0XVjsl8f/6t77vxPFMELnVgs2H
	1hAMaaFuwB9qahhaGofFju30WgZQXK+PuOcHnYkw7l1sI+BGn5XU2tRm5aOYvTb54GPwxE39WdXvM
	sebCqQ34B69+X/5Sf4S2plaQtWuSvg/UI5XzYyrXk0ksdm4qL3LJ4IH86empt1AerChjdHIuckwn9
	GBZtBhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIKP-0000000CMvC-48VY;
	Tue, 02 Jun 2026 06:10:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIKN-0000000CMuu-40oO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:10:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EDFC6001A;
	Tue,  2 Jun 2026 06:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4341F00893;
	Tue,  2 Jun 2026 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780380614;
	bh=tFMH5l5MTUaf6Xe98VNs76Ti6mPZN2RO0Y2Ijj9ZpVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fZHJyOBoEGHiD16yVMLzAjbsRhIR7CFE9cGa8xrtaW1fYnxZpDeAP0dlt+35R/Mt6
	 lwiApCD3vWaU5f/ov1UftsC46EHnWWu9gVCnryDWlTRVbG8/Awo2j7YCs1kkoKzFUW
	 CLiouOcaFGFR32sW24z1VM1bmsWZYup1WOlxsoyfafKWKAqaMUDNcPp6rSaZlrOose
	 2+KdIT0Et7q2lWeCijk6GKIW77oJ2/Hmw08YSLGVBKiEFhtlIH4Duf/oWZrG7NccM7
	 XJbsbh+yK33nHz1p9/ZqYXK8Iv1em79IHjEcPrS+wx+QrhI/G32wo36vWwfGqLIiXr
	 rc4x3UNOXfQIA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Jiri Pirko <jiri@nvidia.com>
Subject: RE: [PATCH v5 10/20] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
In-Reply-To: <SN6PR02MB41574064D14D4A2734222C51D40B2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-11-aneesh.kumar@kernel.org>
 <SN6PR02MB41574064D14D4A2734222C51D40B2@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Tue, 02 Jun 2026 11:40:00 +0530
Message-ID: <yq5acxy9scav.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Michael Kelley <mhklinux@outlook.com> writes:

> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org> Sent: Thursday, Ma=
y 21, 2026 9:28 PM
>>=20
>> Teach dma_direct_map_phys() to select the DMA address encoding based on
>> DMA_ATTR_CC_SHARED.
>>=20
>> Use phys_to_dma_unencrypted() for decrypted mappings and
>> phys_to_dma_encrypted() otherwise. If a device requires unencrypted DMA
>> but the source physical address is still encrypted, force the mapping
>> through swiotlb so the DMA address and backing memory attributes remain
>> consistent.
>>=20
>> Update the arm64, x86, s390 and powerpc secure-guest setup to not use
>> swiotlb force option
>>=20
>> Tested-by: Jiri Pirko <jiri@nvidia.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

...

> With this patch removing SWIOTLB_FORCE from four places in
> kernel code, there are no remaining places where it is set.
> The test of SWIOTLB_FORCE could be removed from
> swiotlb_init_remap(), and its definition could be deleted
> from include/linux/swiotlb.h.
>

Sure, I=E2=80=99ll add that as a separate patch in the series.

-aneesh

