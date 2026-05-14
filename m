Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C80CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 07:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gd1QdciNqJLabQe9V6UbfKLhjsyQkS+rfP3lZ3ns1AA=; b=yntt+dry8em1/72eQaLGcGGA5a
	AsZo2RHP/oN+CWXDqCCksS61OcHtiuLP6ZsEdax6+KOdtMG0s/7mVWhevewG744K0on1JTnwfYA2h
	YlC8p2PV7FPf6pWQx3QdVYR0nxvK+r8P6e1ORxpKlWnhDZahu/WopvbC9WL/D0d0nS92WUV4hky/d
	WW5nFEugSUWhPrp47GbvK5W+pGt+svw0uA8HcMPcThG1AHc9nm6+eFStOEKrNWmj4HNKR7cEYYAmq
	m13wTUmyN4K5MKb2AmCR+8+sW2/N9ozqyrvbwDxfLekYPzohwU+DzYmolrNLvDjS5N/iVYr2NmtWZ
	2VnvkiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ4G-00000004m7c-2LmF;
	Thu, 14 May 2026 07:01:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ4E-00000004m7F-2TuP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 07:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0979B40332;
	Thu, 14 May 2026 07:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96842C2BCB7;
	Thu, 14 May 2026 07:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742068;
	bh=f66lgQPtTtd9CODAjOd3YiCN6f2o8c7PL46CffwEH+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HNCUigYpQNIMO+LxVL5xbaa1ZBiZuV2vfRVdsc+y1HHuPEq+l5D5j/DC+iPE2kiIq
	 NpDsRHaoFXm34+ZqBocK830wWh70Kw2uZ7kNeJCIkV7COgnNUBdPHRKGHc1Irr6eqT
	 RzIdbuXwoG5RlINNMckfHkUIlsEBm8Q+6X6fbrNS2E7E458DcXOOWvUh3a7kWJKjHX
	 3EMGurhVhG6iArtsZj1jNDGSW6qS4EdUJUwdCenJ/uVYvP608IEFPORinOqSL2kojN
	 dZmmuskcWBS0eH8pFr7ZoMjQsMpu0LZsmkHF6dDbrjpt0d1kopfEpVNDU3hdnSFdSi
	 Ck4CbLAhd2How==
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
Subject: Re: [PATCH v4 03/13] dma-pool: track decrypted atomic pools and
 select them via attrs
In-Reply-To: <agSED6BdSXBhbDYI@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-4-aneesh.kumar@kernel.org>
 <agSED6BdSXBhbDYI@google.com>
Date: Thu, 14 May 2026 12:30:54 +0530
Message-ID: <yq5abjeia315.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_000110_654675_31FC5C46 
X-CRM114-Status: GOOD (  10.22  )
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

...

>>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
>> -		void **cpu_addr, gfp_t gfp,
>> +		void **cpu_addr, gfp_t gfp, unsigned long attrs,
>>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>>  {
>> -	struct gen_pool *pool =3D NULL;
>> +	struct dma_gen_pool *dma_pool =3D NULL;
>>  	struct page *page;
>>  	bool pool_found =3D false;
>>=20=20
>> -	while ((pool =3D dma_guess_pool(pool, gfp))) {
>> +	while ((dma_pool =3D dma_guess_pool(dma_pool, gfp))) {
>> +
>> +		if (dma_pool->unencrypted !=3D !!(attrs & DMA_ATTR_CC_SHARED))
>> +			continue;
>> +
>
> nit: If we fail to find a matching pool, a slightly misleading message
> is printed as pool_found =3D false
>

The message printed is

	WARN(1, "Failed to get suitable pool for %s\n", dev_name(dev));

That is correct, isn=E2=80=99t it? The kernel failed to find a pool with the
correct encryption attribute. For example, the request was for an
encrypted allocation from the pool, but no encrypted pool was available.

>
>>  		pool_found =3D true;
>> -		page =3D __dma_alloc_from_pool(dev, size, pool, cpu_addr,
>> +		page =3D __dma_alloc_from_pool(dev, size, dma_pool->pool, cpu_addr,
>>  					     phys_addr_ok);
>>  		if (page)
>>  			return page;
>> @@ -296,12 +345,14 @@ struct page *dma_alloc_from_pool(struct device *de=
v, size_t size,

-aneesh

