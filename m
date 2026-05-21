Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9057CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+P0QoHoTHxpMs7EjsNIrR5Oc0zPqR8/3ahzhGgBQjY=; b=gsaOh6m5B+XxPSt0IfL0aFl2QO
	CPY4HhSOJLwmyex+bLOe7pyVFPL/fgGgm4g/eBYVQPTPNY+DDRM2sJ6j3HraOKqQJ5KOkpMmJ+ej7
	Cu40JvskN5EyMQBV4ibaKAFIijPTPOVsvk2682E3I99wOO4KfqL4V6quqoHTeijagtdIrCui267xO
	a45ex7Cz7bK981lP45OdJqPteJZQlptIlubwwQa7ghvZxWIKrAjbsky8y+eh6gzf1HtXA+LwMI4Yh
	j2LjBHbAOvB9BTLM5XNIgE5NhxkS/NZKvHxRyXqfV6i0wpaNpDXizPo743jj6yJyOgakHNjVJUJL1
	K23plSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ757-00000008cXV-1kmq;
	Thu, 21 May 2026 17:21:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ755-00000008cX0-3KEQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:21:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC693601F4;
	Thu, 21 May 2026 17:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344331F000E9;
	Thu, 21 May 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779384070;
	bh=8+P0QoHoTHxpMs7EjsNIrR5Oc0zPqR8/3ahzhGgBQjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n8TPsNT5xWOQ0ZbzyEP21CLY9l5MWJNGlKthwGOPoIGjoa5e48zuFBt+nL3maSNnj
	 rNBVzfwTX1hh5zz9WEHGee/P5K+Y56Pp7SaNk6uICSM9/VPiT6pGp2lEfjvNjD/34T
	 F/SoSbSYaiskuTt6m3QfIvA7actDo68ku+uQjU/bGEic7MasVfMV2AqB26qA3cV0oM
	 iVcQz/OGOGRqMzzS2RJvnFirBiauNMW9kIyeW2XdqyYANYsuH63fKYd9+Pu50LkGzN
	 6lxL+vreHASBDePhXYndBIEWFeq6v//OLfF0VFvKMPQQmCXb0JWSMeXnWOfqerLCtd
	 jxf7Pc2APU6tA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
In-Reply-To: <CAFgf54o4ZnvnJ3369bHb10tvJJVP+5YWq=ec4Jh5K6S6U9uNEA@mail.gmail.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <CAFgf54o4ZnvnJ3369bHb10tvJJVP+5YWq=ec4Jh5K6S6U9uNEA@mail.gmail.com>
Date: Thu, 21 May 2026 22:50:51 +0530
Message-ID: <yq5atss065n0.fsf@kernel.org>
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

Mostafa Saleh <smostafa@google.com> writes:

> On Tue, May 12, 2026 at 10:05=E2=80=AFAM Aneesh Kumar K.V (Arm)
> <aneesh.kumar@kernel.org> wrote:
>> @@ -1411,6 +1436,16 @@ phys_addr_t swiotlb_tbl_map_single(struct device =
*dev, phys_addr_t orig_addr,
>>         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>>                 pr_warn_once("Memory encryption is active and system is =
using DMA bounce buffers\n");
>>
>> +       /*
>> +        * if we are trying to swiotlb map a decrypted paddr or the padd=
r is encrypted
>> +        * but the device is forcing decryption, use decrypted io_tlb_mem
>> +        */
>> +       if ((attrs & DMA_ATTR_CC_SHARED) || force_dma_unencrypted(dev))
>
> I don't think swiotlb needs to know about force_dma_unencrypted(), the
> dma/direct caller should have all the information to pass the
> appropriate flags.
>
> Thanks.
> Mostafa
>
>> +               require_decrypted =3D true;
>> +
>> +       if (require_decrypted !=3D mem->unencrypted)
>> +               return (phys_addr_t)DMA_MAPPING_ERROR;
>> +

Based on other email threads, this is now updated to

@@ -1372,9 +1417,19 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
  *			any pre- or post-padding for alignment
  * @alloc_align_mask:	Required start and end alignment of the allocated bu=
ffer
  * @dir:		DMA direction
- * @attrs:		Optional DMA attributes for the map operation
+ * @attrs:		Optional DMA attributes for the map operation, updated
+ *			to match the selected SWIOTLB pool
  *
  * Find and allocate a suitable sequence of IO TLB slots for the request.
+ * The device's SWIOTLB pool must match the device's current DMA encryption
+ * requirements. If the device requires decrypted DMA, bouncing is done th=
rough
+ * an unencrypted pool and the mapping is marked shared. If the device can=
 DMA
+ * to encrypted memory, bouncing is done through an encrypted pool even wh=
en the
+ * original DMA address was unencrypted. Enabling encrypted DMA for a devi=
ce is
+ * therefore expected to update its default io_tlb_mem to an encrypted poo=
l, so
+ * later bounce mappings for both encrypted and decrypted original memory =
use
+ * that encrypted pool.
+ *
  * The allocated space starts at an alignment specified by alloc_align_mas=
k,
  * and the size of the allocated space is rounded up so that the total amo=
unt
  * of allocated space is a multiple of (alloc_align_mask + 1). If
@@ -1411,6 +1466,16 @@ phys_addr_t swiotlb_tbl_map_single(struct device *de=
v, phys_addr_t orig_addr,
 	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		pr_warn_once("Memory encryption is active and system is using DMA bounce=
 buffers\n");
=20
+	/* swiotlb pool is incorrect for this device */
+	if (unlikely(mem->unencrypted !=3D force_dma_unencrypted(dev)))
+		return (phys_addr_t)DMA_MAPPING_ERROR;
+
+	/* Force attrs to match the kind of memory in the pool */
+	if (mem->unencrypted)
+		*attrs |=3D DMA_ATTR_CC_SHARED;
+	else
+		*attrs &=3D ~DMA_ATTR_CC_SHARED;
+
 	/*
 	 * The default swiotlb memory pool is allocated with PAGE_SIZE
 	 * alignment. If a mapping is requested with larger alignment,
@@ -1608,8 +1673,11 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr=
_t paddr, size_t size,
 	if (swiotlb_addr =3D=3D (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
=20
-	/* Ensure that the address returned is DMA'ble */
-	dma_addr =3D phys_to_dma_unencrypted(dev, swiotlb_addr);
+	if (attrs & DMA_ATTR_CC_SHARED)
+		dma_addr =3D phys_to_dma_unencrypted(dev, swiotlb_addr);
+	else
+		dma_addr =3D phys_to_dma_encrypted(dev, swiotlb_addr);
+
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
 		__swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, dir,
 			attrs | DMA_ATTR_SKIP_CPU_SYNC,
@@ -1773,7 +1841,7 @@ static inline void swiotlb_create_debugfs_files(struc=
t io_tlb_mem *mem,

