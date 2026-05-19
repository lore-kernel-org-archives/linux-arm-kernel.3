Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2AFCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RapJmIm33RCWpt2jGkwySkStxOP5ayW5s+SF7qpxfO0=; b=ZAzGUb0Lu37oLYXBqs4PG3H9Oc
	+cJH2KoEj2JitlPbGb8CY/BLqk7PIae2IP+3juAq9DCpQFYPGWDYV/RbTE60UebUEYcW02qMvrtSu
	5SSZZCD5TPecm1sglJsyDbC5Mw1Jexubrqqr06zRdyU22Ngxv/5Rp0vACisWqWgFFoHqTulf59NO0
	1XNwwPYNO8/OaQM+M1gmmIdnIma+ttq1I/TmwgAwm2Zl+CiHfpXR1XFb1Kv9+/xYQzq+r9P3fhPEP
	aDwCguJgig93PlI8g3BTcTLklR7bLpQd/CrSMQ/zYiH7imvd34/mS6Asgu/oeTVFfw5fMEOaB39VZ
	/STvwjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLGp-00000001nNG-37JZ;
	Tue, 19 May 2026 14:18:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLGj-00000001nKz-0j8d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B109445E0;
	Tue, 19 May 2026 14:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3CDC2BCB3;
	Tue, 19 May 2026 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779200279;
	bh=omX4jWGqSc4euJhfKZDzYDEyAA00xkxKBKP+MlYpCw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lTYt6sua65tkoXlE6Q2BlS8sWIBZa2T8L6x1+ychuvbjhIgKDes/YlNtctIs5MurS
	 wD2Sl12rive3qkbqzpkk+tCLwkjQs/DxCrfGdUoXLC02uYIc1JCFEdy86S52d2uc9y
	 g9FC2LhMSJtxI6g9uj7rH6gjLQpb0NEpM4k1SN6H2g7ngPyox//4uss4/gZtV+Ifkr
	 HJA7XMc52oT9bXh/mEx/JXlwnYV1qcuMWkMR9VA/wBbF3wBtAG826RnNSvIIDkS5uY
	 AZew3Mf53E71+ceTl7ybvn6GgsZDq0hT4sHTpN4L72FhePHSUiBlWNlbwgUDVM05nW
	 MgRHtOceOiSng==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
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
In-Reply-To: <agxt7SFGT7OLMIah@google.com>
References: <agSKQrSIhizCXKwx@google.com> <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com> <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com> <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com> <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com> <yq5ah5o3sdn3.fsf@kernel.org>
 <agxt7SFGT7OLMIah@google.com>
Date: Tue, 19 May 2026 19:47:48 +0530
Message-ID: <yq5aecj7sctv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_071801_256708_FEE6914A 
X-CRM114-Status: GOOD (  19.47  )
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

> On Tue, May 19, 2026 at 07:30:16PM +0530, Aneesh Kumar K.V wrote:
>> Mostafa Saleh <smostafa@google.com> writes:
>>=20
>> >> >=20
>> >> > I am still running more tests, but looking more into it. Setting
>> >> > force_dma_unencrypted() to true for pKVM guests is wrong, as the
>> >> > guest shouldn=E2=80=99t try to decrypt arbitrary memory as it can i=
nclude
>> >> > sensitive information (for example in case of virtio sub-page
>> >> > allocation) and should strictly rely on the restricted-dma-pool
>> >> > for that.
>> >>=20
>> >> ??
>> >>=20
>> >> Where does force_dma_unencrypted() cause arbitary memory passed into
>> >> the DMA API to be decrypted? That should never happen???
>> >
>> > Sorry, maybe arbitrary is not the right expression again :)
>> > I mean that, with emulated devices that use the DMA-API under pKVM,
>> > they will map memory coming from other layers (VFS, net) through
>> > vitrio-block, virtio-net... These can be smaller than a page, and
>> >
>>=20
>> Don't we PAGE_ALIGN these requests?
>>=20
>> dma_direct_alloc
>> 	size =3D PAGE_ALIGN(size);
>>=20
>> iommu_dma_alloc_pages
>> 	size_t alloc_size =3D PAGE_ALIGN(size);
>>=20
>>=20
>
> For allocation, yes, and that's fine because we bring memory from
> the pool.
> But not for mapping, as dma_direct_map_phys(), where the memory is
> allocated from the driver or other parts in the kernel and the page
> may be shared with other kernel components.
>

But if we are using restricted-dma-pool, we also have:

mem->force_bounce =3D true;
mem->for_alloc =3D true;

So, will we use the swiotlb buffers for mapping and copy only the shared
content into those swiotlb buffers?

-aneesh

