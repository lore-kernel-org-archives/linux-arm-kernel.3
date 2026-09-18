Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B476C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSN/3RICUGwBIu5VwI98GdvFqpcrp4blbXSy58qpsRU=; b=2ih+uZeU4YKQFgqDY1nMI1yOuX
	QesHZJJqAW1eaEvSM3CPJupL/OL0CIuHtIcRj1i3L6/Ul48lQKFDQR4IuZ86zEGEt9tzzJ9VEi9ME
	CCXB5TrV+DocmhjYHWF+wd5sSwzaidNoyUsxW0yjF45NFSXTUne8AQ6jRCcFHciCWxOnZzSRWoI1Q
	fEoWKO4VqBiaB3mLVkfnxj/b3oDTTo2roPr4a72DJ3HxebRrtvC9YA4KVPlYbXmfBEuCkamKNn5r5
	kIVSzYClpa1MxVnTOCnxX6dNWiWU9sn/vgsNUZkNirnoLJb68o0CKApNZctPp6tMBXSjmhAIlP1om
	L6zt32BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SnZ-0000000DfL1-0BVP;
	Fri, 18 Sep 2026 07:14:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SnV-0000000DfKe-1txJ;
	Fri, 18 Sep 2026 07:14:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4BA643309;
	Fri, 18 Sep 2026 07:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D737D1F000FF;
	Fri, 18 Sep 2026 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789715652;
	bh=JSN/3RICUGwBIu5VwI98GdvFqpcrp4blbXSy58qpsRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ko5U5HydpSiCUC607T3WB/2e0AHn/OAQOLnxt0skGjaJ6dlvhiveUPAe5HA2uE/PT
	 /hc+DeZpWm/sd4F8F5oAdb0eLJNrmiRC+bntUlPg4EDlGiIcfENFfIbBGiIxZDGJK+
	 wUq6IdZ/oaxCSHRvKEaIWY6++Qi6+D40+DXu4AW9PP3xG3yH/xeFAfC9eAUQ8BglQC
	 k3mFx4QcVIodeIsTG2wP5wzvEjPZ+f94XFWjmYH+IIE1de1/4uniXYM9JgPIaPqejU
	 MOnV3VtS8mgbZEoQ/cKvMnpocjve8EM2tRtFBwQoUzlU/nCjp62BkJGkb9lbetw+5s
	 qREbZFA6/p+FA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
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
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 3/5] dma: swiotlb: Centralize memory-encryption pool
 sizing
In-Reply-To: <aqwPKO80ZEn0cqa7@arm.com>
References: <20260914070135.313337-1-aneesh.kumar@kernel.org>
 <20260914070135.313337-4-aneesh.kumar@kernel.org>
 <aqwPKO80ZEn0cqa7@arm.com>
Date: Fri, 18 Sep 2026 12:43:59 +0530
Message-ID: <yq5a1par116w.fsf@kernel.org>
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 14, 2026 at 12:31:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> +/**
>> + * swiotlb_adjusted_size() - get the prospective adjusted SWIOTLB size
>> + *
>> + * Return the size that confidential-computing guest sizing would select for
>> + * the default pool, without changing the configured SWIOTLB size. An
>> + * explicit swiotlb= size is always preserved. An explicit area count is
>> + * included in the size calculation. Automatic area sizing is initialized
>> + * later from the running kernel's possible CPU map and any resulting size
>> + * adjustment is therefore not reflected in the returned size.
>> + */
>> +unsigned long __init swiotlb_adjusted_size(void)
>> +{
>> +	unsigned long nslabs, size = swiotlb_size_or_default();
>> +
>> +	if (swiotlb_default_size_changed() ||
>> +	    !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>> +		return size;
>> +	/*
>> +	 * For SEV and TDX and CCA, all DMA has to occur via
>> +	 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
>> +	 * happen without changing device drivers. However, depending on
>> +	 * the workload being run, the default 64MB of SWIOTLB may not be
>> +	 * enough and SWIOTLB may run out of buffers for DMA, resulting in
>> +	 * I/O errors and/or performance degradation especially with high
>> +	 * I/O workloads.
>> +	 *
>> +	 * Adjust the default size of SWIOTLB using a percentage of guest
>> +	 * memory for SWIOTLB buffers. Also, as the SWIOTLB bounce buffer
>> +	 * memory is allocated from low memory, ensure that the adjusted
>> +	 * size is within the limits of low available memory.
>
> Nit: if SWIOTLB_ANY is passed, do we still allocate only from low
> memory? I think this comment made sense on x86 but it's not valid for
> s390, pseries with the changes so far.
>

I'll remove that part of the comment, as the code does not check the
adjusted size against the low-memory limit.

>
> Otherwise:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

-aneesh

