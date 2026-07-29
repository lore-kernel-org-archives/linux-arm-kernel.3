Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D268C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj9zUQeAnHt3kbxhKKqsrB/Vw/2J1kCjeLL3HysJ+OQ=; b=PT92PFvw/k0phMnaWVSusnLC/v
	I0tRx0QRHzCuNIi+dbhPbn1hnTj34QbrkHJCaBwExGVPMzZ0KotM7rvPrA9X+t2ox1b0ZBiOIc14o
	XEReS9uXiHJMac+cKZ0ECUuJKVyp343roDKdLxeFZ4TfMX8PSq0ZKzLMUNgERgEnuuohuYj0dB2Gl
	TX7p9ph0tOMvwOTbCRfw6sIhYaFsIEl+xm7ezFnJXvy3WwdeyZfn+amh5DgeNaJ5rYW9CA+tGPU6v
	Sk2eC0K0cqttgbkK4HOj4TH8mDV226IoPJtc09bzgaeJSscn5Fy7yb/pnftwjfAv+W0moXC7w8Ff0
	5vk0j58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3cg-00000007wUB-3rWT;
	Wed, 29 Jul 2026 12:42:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3cf-00000007wTy-2XJn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:42:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBC15408FA;
	Wed, 29 Jul 2026 12:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AFC1F00A3A;
	Wed, 29 Jul 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785328976;
	bh=Bj9zUQeAnHt3kbxhKKqsrB/Vw/2J1kCjeLL3HysJ+OQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fk51lgHOMjZ7UJy7rfHUcnROpoZJbqgvZ+c4OYkSOe9jR6EyxJQLtCRvfMrkzVzx/
	 Rf5/RAEHf7GArTBqQ2VB+DFRw0QyG2ql7V72s/sHnBfMKNLGNkKhrriLiArX2QJ6cx
	 1qjqorspgFLmPUCGw/ASAMk1xr2Hf3oQaNKGeNdpiutzp0s+nYTRSZ/CF0deF+AX7m
	 j+0tciNij7lI/yw9EWy9c9F87NR3fNmwd7IBMyco2FdZOP3CL96MBIgHeLxBgXTGUm
	 RadyiuP8fXfsneErpOdP7H1gRrbUQIP2TUtweQLf125QqSdmlDtS8C9gom80W6A0AG
	 Isf/jYJgsYTQQ==
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
In-Reply-To: <amnRB98ZZIysHuM3@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
 <ami_mpd_1pF4Tmdu@google.com> <yq5a5x1ygo7z.fsf@kernel.org>
 <amnRB98ZZIysHuM3@google.com>
Date: Wed, 29 Jul 2026 18:12:38 +0530
Message-ID: <yq5acxw6dl1d.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

> On Wed, Jul 29, 2026 at 02:35:36PM +0530, Aneesh Kumar K.V wrote:
>> Mostafa Saleh <smostafa@google.com> writes:
>> 
>> > On Fri, Jul 17, 2026 at 11:34:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> >> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
>> >> reference and update the direct callers accordingly.
>> >> 
>> >> This is a preparatory change for a follow-up patch which updates the
>> >> attributes based on the selected swiotlb pool. Keeping the signature change
>> >> separate makes the follow-up patch easier to review.
>> >> 
>> >
>> > I do not understand the point of this, why would
>> > swiotlb_tbl_map_single() force attrs over the caller which should
>> > already know the context (whether DMA is shared or not) which case
>> > would this be useful to force from the SWIOTLB code?
>> >
>> 
>> The mapping request was for private memory, but the device could not use
>> it because the dma_capable() (force_dma_unencrypted() == true) check
>> failed. As a result, dma_direct_map_phys() allocated a swiotlb bounce
>> buffer, which is shared. Since the DMA now targets the shared bounce
>> buffer rather than the original private memory, the attributes must be
>> updated to reflect the new shared mapping.
>> 
>> dma_addr = phys_to_dma(dev, phys);
>> if (unlikely(!dma_capable(dev, dma_addr, size, true)))
>> 	if (is_swiotlb_active(dev))
>> 		return swiotlb_map(dev, phys, size, dir, attrs);
>> 
>> 
>
> But it does not make sense to me to have it in such a low level
> function, and it shouldn't change the attrs that was passed.
>
> dma_direct_map_phys() is the right place to do this it should set
> the correct attrs before calling swiotlb_map().
>

There is a possibility that we may support io_tlb_mem with cc_shared =
false in the future. As a result, only swiotlb_map() knows which type of
bounce buffer was used, making it the only place where the attributes
can be updated correctly.

-aneesh

