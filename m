Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF01C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy0ha+3Wm2i5qSTOnPHKqrhi8KuQRgCXKyT8cpq+e1E=; b=lEQYLMYWTzb24sekE5Sc56g3TV
	OSsC0dcUppD4Piz4paK+xF8kXqwUuAUB98RxVVt3U5jwbNJ7szdPlM4RJBnhfwoPNzLDO/V8WdwVq
	NgFkLELFfhMMh0vRVJ959iAfNBPhnL/bgWji1c3CmM1DrS2t758bxT5T6yCTqL8uvOUey+kwrIzz/
	4cPBjYG05rogGub+v3C2GPBSTMW1LF/1g49U6V7ikE6lnVqCu2J3tcX+Ji+x8JXy4BYKqpCJJt93m
	WSrjqR3D4d0+tYbvSfz6L737G742LqrWZA6P5kUSD1bWCo4hN4/To7ThH7rpT2pJLQDD9fy+EtRlZ
	p92OPo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50K1-0000000Gd9T-1yf3;
	Fri, 11 Sep 2026 12:25:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50K0-0000000Gd9I-0qXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2E8E4090B;
	Fri, 11 Sep 2026 12:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077811F0089B;
	Fri, 11 Sep 2026 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789129535;
	bh=zy0ha+3Wm2i5qSTOnPHKqrhi8KuQRgCXKyT8cpq+e1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l6LDBp4uBNZoClVFT0rfPbTA1cYRDfrw4aUp56uV6Yh61PJFzVx7GLxy3XJO5dtyL
	 xzMyLDj+FLCMM8q+66DwuA7dLb4rIvxU4CicyuKj80mg7NtcLc9zHwyI3aExLirQiB
	 W4sQmxf+gn7GnPcNsN/sE3hr26q5nZF0WrUVGYjQr+l5mXxGawmc379+Z+eGDMGpdF
	 K5+6znpbitxH5aO35rZLl4QadAhg+A7ch7y5Q3HK+GZZRS6vigy74rcLnyvBEbESkh
	 oM5eQrnvu2EZaxGAl3bhW3+wAKTEoQWX/XRBPzaMrksgDzckFec9KSK4bk4t4/79BQ
	 ik1iwxe4aU3Bw==
Date: Fri, 11 Sep 2026 13:25:30 +0100
From: Will Deacon <will@kernel.org>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: anshuman.khandual@arm.com, gshan@redhat.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, zengheng4@huawei.com,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in
 ioremap_prot()
Message-ID: <aqPzOn0ksb_IEJ-Q@willie-the-truck>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911015859.71164-1-zengheng@huaweicloud.com>
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

On Fri, Sep 11, 2026 at 09:58:59AM +0800, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> Mapping a stack-top page via /dev/mem with PROT_NONE and then
> reading that process's /proc/<pid>/cmdline triggers a spurious WARN
> in ioremap_prot() through generic_access_phys():
> 
>   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>   Call trace:
>     generic_access_phys+0x1c8/0x228 (P)
>     __access_remote_vm+0x2b4/0x398
>     access_remote_vm+0x14/0x30
>     get_mm_cmdline+0xf8/0x2a0
>     proc_pid_cmdline_read+0x68/0x120
> 
> generic_access_phys() passes the protection derived from the user PTE
> to ioremap_prot(). On arm64, a PROT_NONE mapping is represented by a
> present-invalid PTE, so pte_present() still returns true and the
> protection reaches ioremap_prot().
> 
> A PROT_NONE mapping does not have PTE_USER, causing the existing
> WARN_ON_ONCE() in ioremap_prot() to fire even though this is a valid
> user mapping. Execute-only mappings have the same issue and must not
> be readable through this path either.
> 
> ioremap_prot() should therefore reject protection values without
> PTE_USER without warning. This makes the access fail cleanly for
> PROT_NONE and execute-only mappings while retaining the existing
> user-protection contract.
> 
> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  arch/arm64/include/asm/io.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 21c8e400107c..31e67f6bd4a7 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -272,7 +272,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>  	pgprot_t prot;
>  	ptval_t user_prot_val = pgprot_val(user_prot);
>  
> -	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
> +	/* Reject PROT_NONE and exec-only */
> +	if (!(user_prot_val & PTE_USER))
>  		return NULL;

I was initially worried about getting an invalid PTE here which happened
to have PTE_USER set (e.g. as part of a swap entry), but it looks like
follow_pfnmap_start() returns -EINVAL if the PTE isn't present.

So I think this is ok, but I'll wait to see what Catalin thinks.

Will

