Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5034FE9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RQK6wleeSiFtomFa1oTuZsVyJ/FFcfJBlUqdZEuq9g=; b=4zYu5+N+G1JlEgUMStzamT3u7w
	bAN2t9X82GGHVQvOKnEH0om+sPQMHOtc2S+Dgt+dYNXiqPRcAXOPeTzar70yB81UMIXSA7O5KhPL6
	SLaWJ0UEQOjgR5j1S4HdFKgx4X3IMuec+I9UvFP4a9C9Um6TdqWgaigSVdU5yFnBM/R7atZCfReuQ
	vHguqKqImKNnHMtTj+EbWA70Af4+jKQdXzpIZXjtMCzsShzcysoUz19HETuJGjqhDA9svdZoLcBjM
	blCBuMjA1emUhQaOtMnoV8ub90XZUFau9IgiOwuYV/mZ9soeclsae4WTwXzBd8PVEzGkNWZklJs3B
	Ca8qtYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZabe-00000002BXE-2UNV;
	Sat, 27 Dec 2025 20:09:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZabc-00000002BWs-2rBv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 20:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B71D743AB9;
	Sat, 27 Dec 2025 20:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A38C4CEF1;
	Sat, 27 Dec 2025 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866177;
	bh=y+u6yKllr0W68e3y8Qfj41GWvPDO6M/CKO30+K0JRSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkotPNQvY3OS7Z6GK5eJREW5U1iKBosJXAf3OKZhq4w1e63KJ/6n6aLGdvhL0t9RI
	 qsawET5wu8X69005mh6s57Pu51m8COX9B90PGXro409saWdjcvqp/bYQzEVY5S5NG2
	 YIts3LU54RlZXyyGEde8YS5GTaAYv9wggXZREwV5m3akH9NKC8/HO8gZWCEiKuWSvd
	 vxDKsTSMCxwmQr8YlKHrU+GoWa5OP8vubgWVXShl/Qvt0n+FJVsO8VUBJuNf8n4FxZ
	 6khccCuOWwhueLLZ7+uDADNwuxl58ICHfO+AW4UZkA+oc+CY31hC1XeOqeTi+XkKA2
	 5iOODsc1HE7rQ==
Date: Sat, 27 Dec 2025 22:09:33 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
Message-ID: <20251227200933.GO11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-6-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_120940_760922_4BAAD003 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Instead of performing a flush per SG entry, issue all cache
> operations first and then flush once. This ultimately benefits
> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  kernel/dma/direct.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

<...>

> -		if (!dev_is_dma_coherent(dev)) {
> +		if (!dev_is_dma_coherent(dev))
>  			arch_sync_dma_for_device(paddr, sg->length,
>  					dir);
> -			arch_sync_dma_flush();
> -		}
>  	}
> +	if (!dev_is_dma_coherent(dev))
> +		arch_sync_dma_flush();

This patch should be squashed into the previous one. You introduced
arch_sync_dma_flush() there, and now you are placing it elsewhere.

Thanks

