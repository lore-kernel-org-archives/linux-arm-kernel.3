Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99679C44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlmkIlI/0ZYha/er7EZ84MmkZCiwZXbwdDI7LTwrjs0=; b=mAPIN3Xd5KQjqXYKADLCfvLVA/
	nHWsOh+JO9mY48kDBhv4u7GzxsIe+sumxTY5odDmkMgNnmuhFd+sujzDinwn1QXLwxNUCMrrOjGX4
	vf3Ed76h6b+jh4KIpHeurrz/6hCfqv0ypuPeEzIhbPRJd5qLyFaxGrRg2PGTu4c4vK14WihVMUsrp
	FahltQ3yExqqVliauPK2GJojajS/6Xe3rL9PKBmYwmxgmghBkPZY2AP1ZOO8oGGZtvSjlNyzb74xp
	zKbXggkOj3Uv4eyNfMbBMRn87sMGijRwbGtVYQoKyKy+oKMo8MhKDRl9iPVbt1QI/EnmGLTjsEOVL
	aToS6SNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC88-00000009kwq-2oT7;
	Tue, 21 Jul 2026 15:11:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC87-00000009kwG-1Inj;
	Tue, 21 Jul 2026 15:11:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5DBA43C9E;
	Tue, 21 Jul 2026 15:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CE71F00A3A;
	Tue, 21 Jul 2026 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784646694;
	bh=XlmkIlI/0ZYha/er7EZ84MmkZCiwZXbwdDI7LTwrjs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AWfmGqL8yS617Go8Z6km8FnvSkHiDdc6L8CbGJA/0U32k1eIHPo85iPNL9i12xBm5
	 4wq2AZPUqXiMLOxwrB8KGKCXdEqpzhKlFVjcQ3wXfzRHo9XGf8PlFC22DRPfM7k3ip
	 VSUm/7GKjSTaCjzjjdPT5Z/Gpj/PvWGiCxtghkQVquZBmd1UpXGEuqpj89QcOGhq9b
	 GmqHdPF204W3n+31wTaWe6nvELLtr6BwxheTu+PWc6vMg2j/ojrPzNqE+Vf2I/xXaO
	 qqixl6f79FqbDMJ0RWqzDIMD5ghInp5QfOA6ZTmGWd9mNgg8W868UCqeDa8WKoqcfe
	 FjEIqWNE/AnSg==
Date: Tue, 21 Jul 2026 16:11:28 +0100
From: Will Deacon <will@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: akpm@linux-foundation.org, Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-mm@kvack.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: remove early_ioremap_reset() call and
 __late_* macros
Message-ID: <al-MIFXhVs2Yol4c@willie-the-truck>
References: <20260708170647.362562-1-ekffu200098@gmail.com>
 <20260708170647.362562-4-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708170647.362562-4-ekffu200098@gmail.com>
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

On Thu, Jul 09, 2026 at 02:06:47AM +0900, Sang-Heon Jeon wrote:
> On arm64, __early_set_fixmap(), __late_set_fixmap() and
> __late_clear_fixmap() are all __set_fixmap(). Calling
> early_ioremap_reset() changes nothing. So remove the call and the
> macros.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  arch/arm64/include/asm/fixmap.h | 3 ---
>  arch/arm64/kernel/setup.c       | 2 --
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index 65555284446e..abd9800aabf7 100644
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -110,9 +110,6 @@ void __init early_fixmap_init(void);
>  
>  #define __early_set_fixmap __set_fixmap
>  
> -#define __late_set_fixmap __set_fixmap
> -#define __late_clear_fixmap(idx) __set_fixmap((idx), 0, FIXMAP_PAGE_CLEAR)
> -
>  extern void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot);
>  
>  #include <asm-generic/fixmap.h>
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 23c05dc7a8f2..29c6100f0c50 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -347,8 +347,6 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>  
>  	request_standard_resources();
>  
> -	early_ioremap_reset();
> -

Acked-by: Will Deacon <will@kernel.org>

I'm assuming that Andrew will sweep up all three, but please holler if
I should take this one via arm64 instead.

Will

