Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CF5CF2560
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFQZUxBOjvpN2rXMt+VsAICjmakTuGYTNFocpo1qIoI=; b=DDgN8OsRevb8r+2bAwRsew6GKp
	PFblGZCO3QVVZ7Y2bfPvhLXr/YCJkMBFdM8ERsl8qMfpA2N91Qm0U0+pFIS+1ZXvXgu+3DeQsxccB
	TCp+cCLWcS8MGgYeCAPDd+jk/Vrxn1GfDkRZX5RfU27N9739dw3R6CeHtw8SUNlMonYl1wMHZ1Uc5
	wMk/H7ylhfatGZ3HYTkz2jLCFSANm5jflqOK9GWCzSln9BisR8TG0+THqacnW49lv44zIBjwX7Wos
	nOMZaI8Moobtb0MdW+7rzdXuYLSDmnMBOfX8FzeLKG9lZEhe2/a7dYJdEuVuZ5vzY6bdTOEEh367A
	d4liwIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUnp-00000001DXQ-0jHv;
	Tue, 18 Nov 2025 23:08:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUnn-00000001DWu-0D6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5871B43CD6;
	Tue, 18 Nov 2025 23:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EB9C16AAE;
	Tue, 18 Nov 2025 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763507275;
	bh=UV4kfXClE+xCHv+QlyU8g76Mw1tlU5ihIVPqXS0j4A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxM4LUBYMVuVEl85dHmHayfeE8Tj11o6ZffP9iZM9dH3Ys/dEjhY5Q8MqvYylGDxm
	 pAtFV4coD8MsuFuYGGxQi0nA5sRXiNFhrKfwuIIEE1khhRSZ4qXY+abnoNQ3+XI5gJ
	 IrskPXg+5ND612QxJtqIGDTUq+0SC2UBt0gakHal9+1VXPIFIiGlWdWZXmZmei/6WA
	 HD4d+K9OHVX9pRSOymy4GuzudPLunVIDpaBycb7tQjRk7YbSvVajuh44MplV9ZCZpJ
	 n3yHxXlv3bU5MO1JQQL9zyLIQyBuUmtPrfettVLh/F+nWatbO3j++hPfhAVYGIiodN
	 Ee0ffRj1vnMGw==
Date: Tue, 18 Nov 2025 16:07:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, cl@gentwo.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: mm: make linear mapping permission update more
 robust for patial range
Message-ID: <20251118230750.GA1451312@ax162>
References: <20251023204428.477531-1-yang@os.amperecomputing.com>
 <20251118164115.GA3977565@ax162>
 <7147bd7c-f4b2-4757-96f5-d9b61405ec91@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7147bd7c-f4b2-4757-96f5-d9b61405ec91@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_150759_130741_C7D68AA5 
X-CRM114-Status: GOOD (  14.56  )
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

On Tue, Nov 18, 2025 at 09:35:08AM -0800, Yang Shi wrote:
> Thanks for reporting this problem. It looks like I forgot to use untagged
> address when calculating idx.
> 
> Can you please try the below patch?
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 08ac96b9f846..0f6417e3f9f1 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -183,7 +183,7 @@ static int change_memory_common(unsigned long addr, int
> numpages,
>          */
>         if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>                             pgprot_val(clear_mask) == PTE_RDONLY)) {
> -               unsigned long idx = (start - (unsigned long)area->addr) >>
> PAGE_SHIFT;
> +               unsigned long idx = (start - (unsigned
> long)kasan_reset_tag(area->addr)) >> PAGE_SHIFT;
>                 for (; numpages; idx++, numpages--) {
> __change_memory_common((u64)page_address(area->pages[idx]),
>                                                PAGE_SIZE, set_mask,
> clear_mask);

Yes, that appears to resolve the issue for me, thanks for the quick fix!

If a formal tag helps:

Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

