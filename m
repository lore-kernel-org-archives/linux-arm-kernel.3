Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5325BC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoKeOk0v0E+lrs5eZG2JMMltTlaNFbdGi9KSvcSzDqE=; b=N3krvTV7qwmqjYTK4EzNLg8cCh
	Jdp1acsSLdyg4KxrzkVvk2EtMeIjSCcsEKnRlEPJXCBSl0gaRxrJOZ4B3VuFR936DJsPnowJ0b+F2
	QMYgcouB9y6SlHTiYoHu/w7yxWk5zTrMoLQ+dtRmnw8pkAyhpcYfTznVDi14WYnVYHQ+zClkL0f/r
	rrycQiH1984BTBhEtBfdLUkg/3cHsE4PRhsbuht1izY0/BJgjEBP/eRKTWma91GrClVQfiwMjxsTb
	NDeh0nThyzT3JRN9lt8xjPj6I4i/+61MHANYav7x2ZoUWKTRtGhmXYumbQakC5qkx5Um9CMsIg8GH
	8jatHvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Saf-0000000DdE1-42tj;
	Fri, 18 Sep 2026 07:00:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sae-0000000DdDe-0IUS;
	Fri, 18 Sep 2026 07:00:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 353A66053E;
	Fri, 18 Sep 2026 07:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881A21F000FF;
	Fri, 18 Sep 2026 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789714854;
	bh=xoKeOk0v0E+lrs5eZG2JMMltTlaNFbdGi9KSvcSzDqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ddEaqhLhDpDSoBo7I/HnGD6o5TYNSCCk1vbkXYkLf2/bYgvnrydMc+ZR6x61gKESK
	 UGKv/IbSNvNPBR1vOqX+r9JgWXrjvDTCFcOrJvX6CibAfDXYyk6MiteN00P/s7B3u+
	 4zD3d4ENXshV5oFAYsQ0wtE3JwGN5yRx90fDESoEzj0+9cqfqRYDfdP6RS+BNKREuT
	 If8/BphX6k0RBR5SE1XpB9ELckQp2CWM3mcQAwcOTD/Cv/a+7A17/8AghwaLxNVQ0B
	 eUvYhxRKtRV4PGfHxJCp8USPFFWEE1cSPHIbDRVKPWKtzqf+hzV40iuv2VjMTh+sI1
	 CPFp1z3iL/qqw==
Date: Fri, 18 Sep 2026 10:00:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org,
	baoquan.he@linux.dev, pasha.tatashin@soleen.com,
	pratyush@kernel.org, m.szyprowski@samsung.com, mark.rutland@arm.com,
	kernel@xen0n.name, alex@ghiti.fr, hpa@zytor.com,
	ruirui.yang@linux.dev, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-mm@kvack.org, iommu@lists.linux.dev
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
Message-ID: <aqzhnOKOq5m4klFU@kernel.org>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-7-chenwandun1@gmail.com>
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

On Wed, Sep 02, 2026 at 03:31:12PM +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Add MEMBLOCK_NODUMP to mark regions that should be excluded from
> kdump vmcores.
> 
> The flag is meant for reserved memory that carries no data useful for
> crash analysis. Reusable reserved regions such as CMA may hold useful
> data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
> patches wire this up for /reserved-memory and /memreserve/ entries.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/memblock.h |  9 +++++++++
>  mm/memblock.c            | 16 ++++++++++++++++
>  2 files changed, 25 insertions(+)

-- 
Sincerely yours,
Mike.

