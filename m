Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CFBFED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3HtcnbyeXinVUhBE6w26rrSbGFbyvlstEKa0nTmcj0=; b=xOyWz24RkqO9pRorBYkBKye6Do
	Ifj+aZcQ0BxmEXErEcwK4Pmeyh0ZsxbN6g9lr2K4arlvEONil8oyDR+Y9ll+pIdHzW5jOEtDRNcaG
	z557gd4GLPA0KTYERfqPlz5mGh3hkWvmiB/WMuAnF1UPBYkI8kIlf0eEjEJWNprbgYr+96aGWMbMQ
	A1dXkkyak33fwRzQyEutPMaP0D+kPuHwezyI3arOle/RdWckumC43DkBLKuh/CGDWEXMqgSfijjc8
	i8YH4qJ1MtKc/JzEW/H0XFvdcVmEC3NRQJL9pGKD+ZwnVemJKDj6Z2+Vho961Ih4ECEJtlq7Pa6AL
	iRrytSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YTB-00000006xcZ-2DQe;
	Tue, 17 Mar 2026 17:44:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YT7-00000006xcD-215z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:44:40 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fZzpJ5xtRzJ46C6;
	Wed, 18 Mar 2026 01:43:36 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 42B8C4056A;
	Wed, 18 Mar 2026 01:44:33 +0800 (CST)
Received: from localhost (10.48.149.62) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Mar
 2026 17:44:31 +0000
Date: Tue, 17 Mar 2026 17:44:30 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fuad Tabba <tabba@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, "KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64"
	<linux-arm-kernel@lists.infradead.org>, KERNEL VIRTUAL MACHINE FOR ARM64
 KVM/arm64 <kvmarm@lists.linux.dev>, "open list"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] KVM: arm64: Use guard(hyp_spinlock) in mm.c
Message-ID: <20260317174430.00001742@huawei.com>
In-Reply-To: <20260316-tabba-el2_guard-v1-4-456875a2c6db@google.com>
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
	<20260316-tabba-el2_guard-v1-4-456875a2c6db@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.149.62]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_104439_013473_1E147FC5 
X-CRM114-Status: GOOD (  11.74  )
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

On Mon, 16 Mar 2026 17:35:25 +0000
Fuad Tabba <tabba@google.com> wrote:

> Migrate manual hyp_spin_lock() and hyp_spin_unlock() calls managing
> pkvm_pgd_lock to use the guard(hyp_spinlock) macro.
> 
> This eliminates manual unlock calls on return paths and simplifies
> error handling by replacing goto labels with direct returns.
> Note: hyp_fixblock_lock spans across hyp_fixblock_map/unmap functions,
> so it retains explicit lock/unlock semantics to avoid RAII violations.
> 
> Change-Id: I6bb3f4105e95480269e5bf8289d084c8f9981730
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/mm.c | 37 ++++++++++---------------------------
>  1 file changed, 10 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> index 218976287d3f..7a15c9fc15e5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> @@ -35,13 +35,8 @@ static DEFINE_PER_CPU(struct hyp_fixmap_slot, fixmap_slots);

>  
>  static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
> @@ -80,10 +75,9 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
>  	unsigned long addr;
>  	int ret;
>  
> -	hyp_spin_lock(&pkvm_pgd_lock);
> +	guard(hyp_spinlock)(&pkvm_pgd_lock);
>  	addr = __io_map_base;
>  	ret = __pkvm_alloc_private_va_range(addr, size);
> -	hyp_spin_unlock(&pkvm_pgd_lock);
>  
>  	*haddr = addr;
Maybe it looses meaning but given this sets *haddr on error or not
can reorder and save a few lines.

	addr = __iomap_base;
	*haddr = addr;
	return __pkvm_alloc_private_va_range(addr, size);

	


