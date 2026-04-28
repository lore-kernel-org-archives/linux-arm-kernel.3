Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B121FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYJCSm6wgowAgZmiwKu6C8VRixo00bh0TnRm/Wy4w0I=; b=uamrFrbe5ra3TW3tOyDbYsOqAk
	82GdlUJLHqfY+0E7OcKI3GST6PBqDYbs+eGyG1oicGKIjx+CF0xgiPRgQnSWktTFEj7u8k5GMCeb6
	yCt3csv9uXYUb6hJdw61dBiEOERr3ocDFBZGTqJh/yDVfHtxhvSLHXAmaC1svdAIXTqWpdHfWIPe0
	RHcmAoVvUJ+ivfkcQUBPBRYBbvIso/g7KzO49B1f4YYDCI78YKILH8MXXs2weeQvt+xIxuAy8su27
	O9xvrdifcSJaBmV+OhJ5uojJ+mjgl1zzpA8uvIx0ErHRlY+4uzReCa8edbhnpeJQQpDob74fLXWNV
	zx27vDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhT3-00000001Qdv-2cwj;
	Tue, 28 Apr 2026 12:23:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhT1-00000001QdF-1soA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 728014183F;
	Tue, 28 Apr 2026 12:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828ACC2BCAF;
	Tue, 28 Apr 2026 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777378986;
	bh=/cgTwP4dVrqVBYCu9mCqvRCLnKQIAeJP2R2JZuStN2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B+hNiy22GhFE6eJOuKC9QIAS1am5uKKbd/1fcLFLp7M7vJW4OeBwBe+/v1Knk2u/Y
	 e7NVY9OtKjSYyY3cxE9Dl0JrHrYwDCDfhRy2CBTOpAszVKppl5kLqq95I2O0NE8fA8
	 OII0jIjsGcjmojZrjB/bW3tPC61JMyL8NWxWor/uYyBJVWEEvxJTeQInt/76wL8hOH
	 yvCJJX8Mo3/5Ky6QmakrSMcY/4NFniNptOF8l0TTcGjzP6H/KXdK3FQSeByK4Tr6+B
	 io4XPoRYM5CeWlg4eeGkYthsSD3grgKRg6PcRbpqK+/7+K+ZtN7eubOG6BZGNvKBGe
	 v04Fc1wFmvIFw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 2/3] swiotlb: dma: its: Enforce host page-size
 alignment for shared buffers
In-Reply-To: <20260427134903.GA740385@ziepe.ca>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
 <20260427063108.909019-3-aneesh.kumar@kernel.org>
 <20260427134903.GA740385@ziepe.ca>
Date: Tue, 28 Apr 2026 17:52:59 +0530
Message-ID: <yq5a7bpr1dgc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_052307_537552_4CFDD617 
X-CRM114-Status: GOOD (  26.01  )
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Mon, Apr 27, 2026 at 12:01:07PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> When running private-memory guests, the guest kernel must apply addition=
al
>> constraints when allocating buffers that are shared with the hypervisor.
>
> This patch has way too much stuff in it.
>
> I think your patch structure should be changed around
>
> 1) Patch to add mem_decrypt_granule_size(), and explain it as
>    the alignment & size of what can be passed to
>    set_memory_encrypted/decrypted()
>
> 2) Add support for mem_decrypt_granule_size() to ARM
>
> Then patches going caller by caller of set_memory_decrypted() to make
> them follow the new rule:
>
> 3) its
>
> 4) swiotlb=20
>
> 3) dma_alloc_coherent
>
> etc.
>
> don't forget about the new dma buf heaps too:
>
> drivers/dma-buf/heaps/system_heap.c:    ret =3D set_memory_decrypted(addr=
, nr_pages);
>
> It is worth calling out in the cover letter that all the ARM CCA
> relevant places are fixed but drivers/hv/ is left for future.
>
>> @@ -33,18 +32,30 @@ int arm64_mem_crypt_ops_register(const struct arm64_=
mem_crypt_ops *ops)
>>=20=20
>>  int set_memory_encrypted(unsigned long addr, int numpages)
>>  {
>> -	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
>> +	if (likely(!crypt_ops))
>>  		return 0;
>>=20=20
>> +	if (WARN_ON(!IS_ALIGNED(addr, mem_decrypt_granule_size())))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(!IS_ALIGNED(numpages << PAGE_SHIFT, mem_decrypt_granule_si=
ze())))
>> +		return -EINVAL;
>> +
>>  	return crypt_ops->encrypt(addr, numpages);
>>  }
>>  EXPORT_SYMBOL_GPL(set_memory_encrypted);
>>=20=20
>>  int set_memory_decrypted(unsigned long addr, int numpages)
>>  {
>> -	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
>> +	if (likely(!crypt_ops))
>>  		return 0;
>>=20=20
>> +	if (WARN_ON(!IS_ALIGNED(addr, mem_decrypt_granule_size())))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(!IS_ALIGNED(numpages << PAGE_SHIFT, mem_decrypt_granule_si=
ze())))
>> +		return -EINVAL;
>> +
>>  	return crypt_ops->decrypt(addr, numpages);
>>  }
>>  EXPORT_SYMBOL_GPL(set_memory_decrypted);
>
> This should go in the ARM patch adding mem_decrypt_granule_size() to CCA
>
>> diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
>> index 07584c5e36fb..1e01c9ac697f 100644
>> --- a/include/linux/mem_encrypt.h
>> +++ b/include/linux/mem_encrypt.h
>> @@ -11,6 +11,8 @@
>>  #define __MEM_ENCRYPT_H__
>>=20=20
>>  #ifndef __ASSEMBLY__
>> +#include <linux/align.h>
>> +#include <vdso/page.h>
>>=20=20
>>  #ifdef CONFIG_ARCH_HAS_MEM_ENCRYPT
>>=20=20
>> @@ -54,6 +56,18 @@
>>  #define dma_addr_canonical(x)		(x)
>>  #endif
>>=20=20
>> +#ifndef mem_decrypt_granule_size
>> +static inline size_t mem_decrypt_granule_size(void)
>> +{
>> +	return PAGE_SIZE;
>> +}
>> +#endif
>> +
>> +static inline size_t mem_decrypt_align(size_t size)
>> +{
>> +	return ALIGN(size, mem_decrypt_granule_size());
>> +}
>> +
>>  #endif	/* __ASSEMBLY__ */
>>=20=20
>>  #endif	/* __MEM_ENCRYPT_H__ */
>
> I know it seems a bit small, but put this in its own patch and explain
> how it works. I'd also like to see a kdoc here, and add a kdoc to
> set_memory_decrypted() that links back so people have a better chance
> to know about this.
>

Okay, I=E2=80=99ll update all the above in the next revision.

-aneesh

