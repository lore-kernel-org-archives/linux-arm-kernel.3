Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C133FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leCwg1gI5JOnAHMGY1jqYZ7sTKfBzVMBZ6hs7gkSVts=; b=gV9eWMlOsDEXht49Ra/piYho/u
	9vYEydhX7d/kyhUGSevYj96eh/bVPA+NE0s+XO4LjhIq1Pbl8RFqYzwJP/WNyMD/6pRiLkNVJ5rjx
	nb/c7JoGl9BbHZLddDwIFe2wZTNYvofOz+sYNwh1usfgbLjSUqV2xFgronlZI+Ab9I1DOIYETE2I0
	GeyvxjwWSUt8oJl8vFS1EnU3dd5ciA7v8Jg0EhZzB5LnsyI57tBmXyDgPIe/Oxwea9ZGlL4eKAC6p
	QVI+6KXynewD+wWcdev0ECrldOuoX0t0TwFxVNeDYq+nL2N1xPH3susBbKAyBWiAygx3oW7KIv3Xx
	N1DTGzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulubt-0000000Bonc-2Kt6;
	Tue, 12 Aug 2025 19:24:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrsK-0000000BPpv-1xeo;
	Tue, 12 Aug 2025 16:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A1DD45861;
	Tue, 12 Aug 2025 16:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43F5C4CEF6;
	Tue, 12 Aug 2025 16:29:21 +0000 (UTC)
Date: Tue, 12 Aug 2025 17:29:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm: Remove pud_user() from asm-generic/pgtable-nopmd.h
Message-ID: <aJtr38x3A1o1Q7dH@arm.com>
References: <c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_092924_525785_43AA8370 
X-CRM114-Status: GOOD (  18.19  )
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

On Tue, Aug 12, 2025 at 01:14:19PM +0200, Christophe Leroy wrote:
> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_user() in include/asm-generic/pgtable-nopmd.h
> 
> But pud_user() only exists on ARM64 and RISCV and is not expected
> by any part of MM.
> 
> Add the missing definition in arch/riscv/include/asm/pgtable-32.h
> and remove it from asm-generic/pgtable-nopmd.h
> 
> A stub pud_user() is also required for ARM64 after
> commit ed928a3402d8 ("arm64/mm: fix page table check compile
> error for CONFIG_PGTABLE_LEVELS=2")
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> ---
>  arch/arm64/include/asm/pgtable.h    | 1 +
>  arch/riscv/include/asm/pgtable-32.h | 5 +++++
>  include/asm-generic/pgtable-nopmd.h | 1 -
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index abd2dee416b3b..fef7cc7a340d8 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -955,6 +955,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>  
>  #define pud_valid(pud)		false
>  #define pud_page_paddr(pud)	({ BUILD_BUG(); 0; })
> +#define pud_user		false /* Always 0 with folding */

Doesn't pud_user take an argument? With that fixed:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

(strangely I couldn't get the build to fail without a pud_user
definition, even with the PGTABLE_LEVELS=2 and PAGE_TABLE_CHECK=y
configuration)

