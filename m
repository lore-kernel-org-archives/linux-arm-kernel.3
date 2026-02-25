Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FFFFD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4eMnlk159rc+pn8tPeNwlSEScn9DtiHuFZwPn08Y9E=; b=Ambg3etzZWNCUmW+FkONKX3qXp
	a1/c6YCaj+Ui5VVbTd8E+maAb4hk06lf34m8mqQqxUeUe821rgXZwq93NGPYp5EM5iGIq0emYXf1p
	lTLFjp0fgfPDrI7AT29ddgXMqTxttuYsoB9SIYqq3O9T5dsOweHaD68VZhdtZvEhyIOrsq/+6KQ5u
	jWldEkqu5BrugKwLRXTzAB0UUYAcLfLLyOrk28QjqzC2w0G28PrmUOOxeE2+Z3kLVWarjp8UGdujB
	jNTQqFiKRIO6NJmYCFOAWiHw6AqLGBTyO3Pdmai3Aou2zlUIZ1fqyAuPEzP3umlf9FozNbIlWOMjs
	1fkNFuhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvF0Q-000000046Cw-3NiH;
	Wed, 25 Feb 2026 13:32:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvF0P-000000046Cj-1S7p;
	Wed, 25 Feb 2026 13:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6479860097;
	Wed, 25 Feb 2026 13:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A4EC116D0;
	Wed, 25 Feb 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772026364;
	bh=93Mh71NbG5+oh8SLMr+D80K3rtiPszgWs+oYcu1c38s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lowN1fXaUvgh5wPI9HCoKY61vts/SWKwO5aaYnlNh146Rw6q7d1D74Mt3+DD5NF71
	 mGg1Pp4VsVHnrGiDO6U2JLibIp68k2I8Y1n+OlevEow7KeFLe9C+TuEilx0mRtDuAG
	 YwTXeT5dCEjM0WmIgeV8Qo8FrOQKsMzRUf4+BlyC+5e9tLDgDGrrKXlGRFQNUCzXuY
	 cTpoWSkwo6g6R1MG8BC/xY0sOm5N3DFQMlvcktTKLqikygNbu0BxNs9TGwkUHMlVwh
	 HcVvNn16aypGbGOboWEKm8UpLgKKYVU27r3tIHAuDbTDRagRVKmSA9ZbCV671ZD6s4
	 3eY0JRRpNXcUg==
Message-ID: <d77a11e7-0c33-49a9-8de6-efcf751842bd@kernel.org>
Date: Wed, 25 Feb 2026 14:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm: Introduce vm_mmap_shadow_stack() as a helper for
 VM_SHADOW_STACK mappings
To: Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Deepak Gupta <debug@rivosinc.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-2-catalin.marinas@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260224175800.2500729-2-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2/24/26 18:57, Catalin Marinas wrote:
> arm64, riscv and x86 use a similar pattern for mapping the user shadow
> stack (cloned from x86). Extract this into a helper to facilitate code
> reuse.
> 
> The call to do_mmap() from the new helper uses PROT_READ|PROT_WRITE prot
> bits instead of the PROT_READ with an explicit VM_WRITE vm_flag. The
> x86 intent was to avoid PROT_WRITE implying normal write since the
> shadow stack is not writable by normal stores. However, from a kernel
> perspective, the vma is writeable. Functionally there is no difference.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> ---
>  include/linux/mm.h |  4 ++++
>  mm/util.c          | 25 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5be3d8a8f806..1f28be975f86 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3908,6 +3908,10 @@ extern int vm_munmap(unsigned long, size_t);
>  extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
>          unsigned long, unsigned long,
>          unsigned long, unsigned long);
> +#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
> +extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
> +	unsigned long len, unsigned long flags);

MM nowadays tends to use two tabs here.

> +#endif
>  
>  struct vm_unmapped_area_info {
>  #define VM_UNMAPPED_AREA_TOPDOWN 1
> diff --git a/mm/util.c b/mm/util.c
> index b05ab6f97e11..2592291948f0 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -618,6 +618,31 @@ unsigned long vm_mmap(struct file *file, unsigned long addr,
>  }
>  EXPORT_SYMBOL(vm_mmap);
>  
> +#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
> +/*
> + * Perform a userland memory mapping for a shadow stack into the current
> + * process address space. This is intended to be used by architectures that
> + * support user shadow stacks.
> + */
> +unsigned long vm_mmap_shadow_stack(unsigned long addr, unsigned long len,
> +				   unsigned long flags)

And here as well.

Agreed that the ifdef for the function declaration is not required.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

