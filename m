Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA3BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00AtnTFlOjg772nPZMamjWO4ohHiTS+GbA6l0F4f6G4=; b=EWoepCb5bPL/s5DePcrOakXasp
	su7uBL++YrY9LSzf+fHKLtpE9m4aI14QhtqwXazZG9ztWAK8JRosZrbqNyryTWIZpWX61jI0LRCQ2
	abOogUgn6f/5lQrhKpSi35s92ghn/KQt6v60CgJZXi3pmwBc74MQs/PCE5oA1jwYEoLT0MKGKCbmf
	puFLO0aE7XjkPdjxea09QYq47PVxHx3a91lnjvcPNvYs+4eTWL/yRzj2v/j3CG7KLvtTzi1LpgrT5
	nAsd2sbPsDtJ+gsraFbhqyIrmi+RZ1/BYZcuEct1amXzycdZdVza6l47Q5Ai9uz5tg/srCjchCPR6
	WwPTchhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6or6-00000009B7A-3dEc;
	Wed, 16 Sep 2026 12:35:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6or4-00000009B6k-4ASG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:35:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9389A152B;
	Wed, 16 Sep 2026 05:35:09 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38CA3F7B4;
	Wed, 16 Sep 2026 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789562113; bh=Op1NyF8N8G6gt5qdhV5aOHeCjZNmST0Aq6Tq9dA/a5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNlDyhNIEisaCgDhSdHO7WiOYNl/Y63Jc+5Helh/6XuIeSWv9m1IlE19liB5WB74P
	 rIucpaZ/17XnM5mevYWlHl2XylaZi7Rl1QSUX147RTq8MzibUucMKYvekGu9oOem1i
	 /4k/2OUi+BGxjQ1Ja7x+RCow9gQM9cpaxe+8E6aM=
Date: Wed, 16 Sep 2026 13:35:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: anshuman.khandual@arm.com, gshan@redhat.com, will@kernel.org,
	suzuki.poulose@arm.com, zengheng4@huawei.com,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in
 ioremap_prot()
Message-ID: <aqqM_NoRRePxXzOO@arm.com>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911015859.71164-1-zengheng@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_053515_072675_F39C00FD 
X-CRM114-Status: GOOD (  12.37  )
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
>  
>  	prot = __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK,

Looks alright to me:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

It would be good to get Sashiko's finding sorted out as well
(pre-existing issue). I reckon that should go in the core code.

-- 
Catalin

