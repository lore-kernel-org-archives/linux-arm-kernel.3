Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B782C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cd52PD2UuYoS6In5AKUlLRar7R24lx+Bsu9rFB17SpQ=; b=ZbdYPBVK3b4ZjpTYe7z5fQ1/M2
	ySsgJir7bdVu6ynDTcGg67x9uwGkKaREZP+yXO2FP6Vivp7ux+21axrQhVpjWWQLCLaKyOsbWpRM2
	fWfp3hHFCFLlyKaWUIGiprcsMwRY2ACGgImk28k1iqaMDyea29FBFtwA7K3X+tD6/0kKDYxS8273H
	MPcLZVuQjXJOejQTr0XCxwXukSztIHo2bhR+dd4lhz90XWKB4A1PkX9eD6+RQXsr937oWDUeSC1wa
	3c1yB50cP+v6TilcYIQS9Of2GWSbbM6lpVewcOaA9ex4VtOgLe5+IC3o6aSjgmquohTCCvizQ0MQf
	2n616Pug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hkq-0000000Bhbl-25B1;
	Wed, 09 Sep 2026 12:50:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hkm-0000000Bhap-0fmR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E01C11576;
	Wed,  9 Sep 2026 05:50:08 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6146D3F7B4;
	Wed,  9 Sep 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788958212; bh=2P592ah1QHrGLdfR2K13ZZmvuzgE+vLBRsQx+QWBuZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaKZYbRIoUxjc//OrU3dZPXMX0rs1FbFYRJ+KkU3YUc22K8ElUhMZ7QzQ8sSWSJgp
	 cfi2vHXQh/nyhcJYjnXPELKYbC31J+XjP/I79GUQejXRI5c9sqDjXTykoTXv0Wdj/E
	 DDjelwFrtxQbqwHtWxMNol29T1dIU0lgQOrI/YNM=
Date: Wed, 9 Sep 2026 13:50:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: suzuki.poulose@arm.com, anshuman.khandual@arm.com, gshan@redhat.com,
	david@kernel.org, will@kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Message-ID: <aqFWAWNzYagW2NNH@arm.com>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905033148.3657516-1-zengheng@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_055016_335628_E5160AFE 
X-CRM114-Status: GOOD (  25.08  )
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

On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> that process's /proc/<pid>/cmdline triggers a spurious WARN in
> ioremap_prot() through generic_access_phys():
> 
>   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>   Call trace:
>     generic_access_phys+0x1c8/0x228 (P)
>     __access_remote_vm+0x2b4/0x398
>     access_remote_vm+0x14/0x30
>     get_mm_cmdline+0xf8/0x2a0
>     proc_pid_cmdline_read+0x68/0x120
> 
> generic_access_phys() passes the full pgprot derived from the user PTE
> to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> reports the pfn and generic_access_phys() reaches ioremap_prot().
> The PTE_USER assertion, which is meant to catch kernel prots being
> passed by mistake, then fires for a PROT_NONE user mapping
> that legitimately lacks PTE_USER, producing the spurious WARN.
> 
> Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> front so that generic_access_phys() cleanly fails the access instead
> of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> is only meaningful when PTE_VALID is clear, so both bits must be
> checked together.
> 
> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  arch/arm64/include/asm/io.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 21c8e400107c..bbfbc4682639 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>  	pgprot_t prot;
>  	ptval_t user_prot_val = pgprot_val(user_prot);
>  
> +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> +	     PTE_PRESENT_INVALID)
> +		return NULL;
> +
>  	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
>  		return NULL;

I wonder whether we should just drop the warning and return NULL if
!PTE_USER && PTE_UXN. The latter check would also catch execute-only
mappings (Sashiko pointed out this case still trips the warning). The
PROT_NONE case would be covered automatically as well since PTE_USER is
cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
issue by chance.

Unrelated to your patch, also spotted by Sashiko, we only test a single
pte but the size can span two. The fix should be at the higher level in
generic_access_phys().

-- 
Catalin

