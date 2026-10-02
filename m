Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D471DCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUoaeZWBEqi49tG6RXh95F+Nquw14LsgVd4Y+Bv0KE4=; b=saIsYt6kQcfYw1Wr7FDJha5hJ+
	6vqDatkmAfRBmeNsBkxpaNB67d+cSFPGgqXRBJob01PqAbfCvsLoxWUH0DQm/RVo2z5Imfs5yAb/0
	HidUEL/QRVfYoNb/Qs9nvN5BgStTit5gur0eGf200S/6VNN3jlwU5VRuOVSMwYZstD3UdQ7de9LiR
	Mk6wvdv9Eo4Rv0eX/uiQ9pDkzMrh4YI0758Pps88/n5mIUKN+qaN5Lthmdp+SF/OQWQiaUR/oP2IW
	qzwc03blsINongNQRvmO0C6F6KfJDdeQLzyyJBlPTGKc+KhOBFs2ERXeJfnBD2O+N6TlrFTqEZz3E
	2VgpNKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfMh-0000000BxWe-1gi5;
	Fri, 02 Oct 2026 15:40:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfMf-0000000BxVc-2T77
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:40:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B556160AA3;
	Fri,  2 Oct 2026 15:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540021F00893;
	Fri,  2 Oct 2026 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790955600;
	bh=NUoaeZWBEqi49tG6RXh95F+Nquw14LsgVd4Y+Bv0KE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H1cCKfVYe8PTDI2SW8gRcfNHXyc9n3g8UnpjywsE/9yiJiJv5CZDjeftxarPhJxab
	 sedfIedK3D3yNB2QVWxwVrMnKxj89l3K8Jjg/xk0Ok+Pw5mafJmITp4ykxYEQKxDlv
	 zLiIEzDz4QQ1aZ4auMNhMyz3q1mA7K/1rUeXocjFOm0CmRo9uXj6evrFrazXg8EXl7
	 xdYJtU0LOuyqJduEeojgZFp7Sx221s0I4x3lFySnuy66Yka+wD6egtLLt2Ml9lWkMY
	 IMPKdJ4+LGQsGWVZwKng9I6lMcFApUGdqPImCjCsfApsYk2GAXNKCfvnuw+o1daf5c
	 3hDb03E1v7pMg==
Date: Fri, 2 Oct 2026 16:39:53 +0100
From: Will Deacon <will@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Yuanhe Shu <xiangzao@linux.alibaba.com>,
	Kyle McMartin <jkkm@meta.com>, Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] iommu/arm-smmu-v3: Make the queue depths tunable,
 and shrink them in a kdump kernel
Message-ID: <ar_QSdV44YzQQ6Yx@willie-the-truck>
References: <20260925141532.1274962-1-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925141532.1274962-1-kirill@shutemov.name>
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

On Fri, Sep 25, 2026 at 03:15:28PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The queues are sized from the IDR1 maxima and allocated at probe, costing
> megabytes per queue per SMMU instance. A kdump capture kernel pays that out
> of a small crashkernel reservation, for queues it barely uses and two of
> which it switches off anyway.
> 
> Patch 1 adds a cmdq_max_n_shift module parameter, decided in a per-queue
> helper and floored at one page. Patch 2 has a kdump kernel size all three
> queues at one page through the same helper. The parameter does not apply
> there.
> 
> Yuanhe Shu tested v6 on an arm64 server with six SMMUv3 instances, 64K
> pages and a 512 MiB crashkernel reservation. Without the series the queues
> took 192 MiB and the capture kernel OOMed before makedumpfile ran. With it
> they take about 1 MiB and the vmcore is saved.
> 
> Measured per instance under QEMU on -M virt,iommu=smmuv3 with the virtio
> devices behind the SMMU, the capture kernel identified by elfcorehdr= on
> the command line:
> 
>                         4K page          64K page
>       cmdq         1 MB -> 4 KB      8 MB -> 64 KB
>       evtq         1 MB -> 4 KB     16 MB -> 64 KB
> 
> cmdq_max_n_shift moves the command queue alone outside kdump and is
> ignored inside it; zero gives one page. QEMU exposes no PRI queue, which
> takes the same path. No CMD_SYNC timeout, GERROR or context fault in any
> run. Build-tested across 4K/16K/64K, TEGRA241_CMDQV=n, CRASH_DUMP=n and
> ARM_SMMU_V3=m, every commit warning-free.
> 
> v7:
>  - Flatten the depth helper as Jason suggested: floor the limit, then min
>    with the hardware maximum; callers pass their alignment cap as the
>    limit.
>  - Initialise cmdq_max_n_shift to CMDQ_MAX_SZ_SHIFT, so zero is no longer
>    the "default" sentinel; it asks for the smallest queue, one page.
>  - A kdump kernel always gets one page; cmdq_max_n_shift no longer
>    overrides it.
>  - Tags: Breno's and Jason's Reviewed-by on patch 1, Jason's Reviewed-by
>    and Yuanhe's Tested-by on patch 2.

Ah, sorry, I missed that you'd already sent a v7! As I said on v6, I don't
have a particularly strong opinion on the naming, so given that Jason is
happy with the logic, I'll just apply this now as-is.

Cheers,

Will

