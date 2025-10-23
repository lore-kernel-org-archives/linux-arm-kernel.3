Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E308CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DTN4f9sYvKKbqzH4zMTtt+lW5xHHb7Uewe/2Me0Lwc=; b=s2qaBAIlLt8+7PydctBg9pnQpR
	HSnG5SLNFWA4ibtMIfwJlGunM3BEvloYNMiCRB8mzbV7G6o5Nlz/Sc1MDfHl8/vojYYoLjDOQAEWP
	RV09EhPWxVidODWkqeWApT6vSxm9ph10mSVFIiRVof4dPhNmGZQveHihCyGzqJQnJPB9vatI2MZgz
	tGRmFUhxZ9xjJx/fLYC4z6DAVqtPEVXuGid/IparY+7QGjyrAcKCA4FT6zAiu1lRGmLilPEQxrUSk
	csI9GUDjGCHfhBTljuZr2tKRpPjbRGh0L78mJlh5g2Kf8rvvx+zAAkIsDVKovwZf1mvIsz7Zh8C/p
	ZVaaHtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByv8-000000073EZ-2I3f;
	Thu, 23 Oct 2025 17:16:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByv7-000000073E4-0Vzf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/DTN4f9sYvKKbqzH4zMTtt+lW5xHHb7Uewe/2Me0Lwc=; b=P8lxfE+B5ywSdHY6OBepU7JE+j
	kcOdL9VPuao6y6Oooc2Mhymo1mm2FJ8d9CBZSfpTH22I2YNOBeAjhXuLKppQtTHu9gKiMJV0dAXQb
	HIKrlIXm6fOAAxyhfl9lPZF35ZbHBerM/DNyaVVil+EtSFP4pQd5tpJRRzT/EamW2sjUB8RuKXiC9
	6nlUcj2cqoBDZfADOSJz+FuZp+W1aWjotV+/mnkowsoVQ2O+dZGxBMe3yIa2ro1nZoEHCEmVaFGcX
	Lq78mPCop+P6Ge/i1VwCRSTadrjL2oemSjz0A9clfDnyyH4xIbuc2vfo+0Sg7LA8bTwD1+3CV7nht
	GjtX+0kQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBy3P-00000001X4S-1UDd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 16:20:45 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2930e2e8e7fso9202705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761239767; x=1761844567; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DTN4f9sYvKKbqzH4zMTtt+lW5xHHb7Uewe/2Me0Lwc=;
        b=h7siqR+E8qZGqBv+y675jMMXL+P0CbTSP7ZT55gfvO+CibABdXrZPBu+1ExIgIjyVI
         Q4lct+JBAKr9r74fl0vtkd/6h/+kxO/2T9Y3MlUIDJoKRx+NJz57MJ2bYEMyuPAsh0Nn
         LAEgU3zxR9a26daJTEn2ffpQvOBBCFobZBVw74sBOnsgL2MCQLhcjOhfY+Z7oJwly172
         DWXf/Hp4lzD+OhryNOARX868HVDVSq9ZG9ZuQREDJMOMPgMq5PZ5TDlei0qlrryvdHLw
         owRyWZh0pbbJp+1941hfccQPYDhknuCwlhL2hsYinVkq82rHlYwY9f2JMxi3Q7uhs24I
         7YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761239767; x=1761844567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DTN4f9sYvKKbqzH4zMTtt+lW5xHHb7Uewe/2Me0Lwc=;
        b=wfWlZ9Xl8gbBNzGyHRtc47T3TAkEEMsW3H4jP/Wsm6IBADNWcKdTm1ruFTE1o9O/Rq
         dLWpolhlcGJ/s5tFOvmXbs9BaNcFuASXFL8newUVeDIEsWsKnZK3C74Uw09HIAV/arwG
         VtqMk3IhCNDabh9glxV7GXq8E7pEY50Fo4cAIYyV63OZByq+aEki0BXCPAVDojG4NgTp
         x3zEn4Wi1iyS9glt7NVaRS/ryQILd6gtnL7Mtnl3aizADFMvkj/OsNi4atTPanl+8+B5
         WBqmgFVFI6+YDvEUY/0HvKcWC17c1zp3yuBTw1y8Gklf6uA1iD30mgpCVPxPEOwEOlwt
         CXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWPsG21p9snsYsvbqp87EMVFm1l4mCm2hZsAWfox8fwJBvhf3XbJtARI5CwwQ+NK3rgPD4zAns9oXy4DE4YYhJ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy+nQwF3VV/+3xuNxV/Bm9CGtU8LbhYIJmHCTaCK7ggFgv2EjZ
	oPvKMVKIHTa9BnQX3qbM8NTOy88hA+/0bW2JD09iCRgz2ALr25q52ARa14bUOGNGaGzUx41rBP+
	uBhDEQg==
X-Google-Smtp-Source: AGHT+IHWPgGmZKfo+3ImlZCUG7AewIscdCvWipQB1xDHXcjZQxceHYcdCY71wfIfELDOVuODkQ3p+Aq3kE8=
X-Received: from pjkm11.prod.google.com ([2002:a17:90a:730b:b0:33b:e0b5:6112])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:267:da75:e0f
 with SMTP id d9443c01a7336-290c9c897bbmr312407025ad.11.1761239766935; Thu, 23
 Oct 2025 10:16:06 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:16:05 -0700
In-Reply-To: <20251013151502.6679-3-jackabt.amazon@gmail.com>
Mime-Version: 1.0
References: <20251013151502.6679-1-jackabt.amazon@gmail.com> <20251013151502.6679-3-jackabt.amazon@gmail.com>
Message-ID: <aPpi1c-8EpWuo87B@google.com>
Subject: Re: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
From: Sean Christopherson <seanjc@google.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	isaku.yamahata@intel.com, roypat@amazon.co.uk, kalyazin@amazon.co.uk, 
	jackabt@amazon.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_172043_513416_BD702DE7 
X-CRM114-Status: GOOD (  22.18  )
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

On Mon, Oct 13, 2025, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> When creating a VM using mmap with huge pages, and the memory amount does
> not align with the underlying page size. The stored mmap_size value does
> not account for the fact that mmap will automatically align the length
> to a multiple of the underlying page size. During the teardown of the
> test, munmap is used. However, munmap requires the length to be a
> multiple of the underlying page size.

What happens when selftests use the wrong map_size?  E.g. is munmap() silently
failing?  If so, then I should probably take this particular patch through
kvm-x86/gmem, otherwise it means we'll start getting asserts due to:

  3223560c93eb ("KVM: selftests: Define wrappers for common syscalls to assert success")

If munmap() isn't failing, then that begs the question of what this patch is
actually doing :-)

> Update the vm_mem_add method to ensure the mmap_size is aligned to the
> underlying page size.
> 
> Signed-off-by: Jack Thomson <jackabt@amazon.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index c3f5142b0a54..b106fbed999c 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1051,7 +1051,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  	/* Allocate and initialize new mem region structure. */
>  	region = calloc(1, sizeof(*region));
>  	TEST_ASSERT(region != NULL, "Insufficient Memory");
> -	region->mmap_size = mem_size;
>  
>  #ifdef __s390x__
>  	/* On s390x, the host address must be aligned to 1M (due to PGSTEs) */
> @@ -1060,6 +1059,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  	alignment = 1;
>  #endif
>  
> +	alignment = max(backing_src_pagesz, alignment);
> +	region->mmap_size = align_up(mem_size, alignment);
> +
> +	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
> +
>  	/*
>  	 * When using THP mmap is not guaranteed to returned a hugepage aligned
>  	 * address so we have to pad the mmap. Padding is not needed for HugeTLB
> @@ -1067,12 +1071,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  	 * page size.
>  	 */
>  	if (src_type == VM_MEM_SRC_ANONYMOUS_THP)
> -		alignment = max(backing_src_pagesz, alignment);
> -
> -	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
> -
> -	/* Add enough memory to align up if necessary */
> -	if (alignment > 1)
>  		region->mmap_size += alignment;
>  
>  	region->fd = -1;
> -- 
> 2.43.0
> 

