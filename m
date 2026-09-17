Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BBFC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuBtV4+7ALBPAyy2nomafqxqzWcbcsqKb3dSOrzTp7c=; b=riAb1e+K7XHGrILjeLd8PgJG20
	xSpB63rXyYj+Mm3pbh+tD+/DgZnRQyMAZGJdF9sUepNq+la4tk5H0uKBrEmhd9+sGzNpn9YT53dIC
	deh0ao46GbOjkxVfBxuxEkNhi/aPHeR/XQlS6e2krAcbuSIUCPmcHTAh94fu9/wWsCegZ0PHI2PKl
	t38Ud3NSRJ2wgs9zNQX/xjU6gmlP+1p7GC4Dp3WS3Z9TAuGsVfRC8hX09PSVgFWZvjqu0ux4W7zrd
	d/pdyDqbCNwkU0sReWy9wILBdQ3ImsEtKc643oy/R5SSlZAbbwUq4IVe2ku5vaJVmcotZ+6a2eLZZ
	I0Q8HbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K6E-0000000Cc82-0Ioj;
	Thu, 17 Sep 2026 21:56:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K6C-0000000Cc74-3xHO;
	Thu, 17 Sep 2026 21:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 016B060202;
	Thu, 17 Sep 2026 21:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681611F000FF;
	Thu, 17 Sep 2026 21:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789682215;
	bh=kuBtV4+7ALBPAyy2nomafqxqzWcbcsqKb3dSOrzTp7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bE+Lz4BpzH5TSV1jWou2OBtlqHsC//L3WyTj9bXi6va6c8nZfLJ4ol68JuU+o3r2M
	 TAu2icEvroIVO5OuYcPgJYCAhNQXTzOAIclO3FED1OglGnXQvoVgXQi9NkcPaNCm7C
	 NxCHhu8wntvOtj4LO509qvBQvss+eZM34/jEYGD2HXc7uGKovRY4ujMtUk30a4EgKF
	 zPD0eqlpLObbbLfAP2BCbHPLwLZz0rgjBIedFlBVM78LXQPEzVbz5SKMMk3kZSKLLI
	 Ww16aNzudepZDNF3jG6O0DxZCUHUXGJHhXcE+1AZc6MCWnHl/xvccdOs6+sET6/9Sd
	 Dca8d8QUwinxQ==
Date: Thu, 17 Sep 2026 16:56:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: m.szyprowski@samsung.com, hpa@zytor.com, chenhuacai@kernel.org,
	pasha.tatashin@soleen.com, devicetree@vger.kernel.org,
	linux-mm@kvack.org, tglx@kernel.org, robin.murphy@arm.com,
	kernel@xen0n.name, mingo@redhat.com, saravanak@kernel.org,
	loongarch@lists.linux.dev, dave.hansen@linux.intel.com,
	will@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	iommu@lists.linux.dev, mark.rutland@arm.com, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, pjw@kernel.org,
	linux-kernel@vger.kernel.org, baoquan.he@linux.dev,
	aou@eecs.berkeley.edu, kexec@lists.infradead.org,
	pratyush@kernel.org, linux-arm-kernel@lists.infradead.org,
	ruirui.yang@linux.dev, catalin.marinas@arm.com, bp@alien8.de,
	palmer@dabbelt.com, x86@kernel.org
Subject: Re: [PATCH v6 08/10] of: reserved_mem: mark /reserved-memory entries
 with MEMBLOCK_NODUMP
Message-ID: <178968221332.3991643.14928206071521736133.robh@kernel.org>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-9-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-9-chenwandun1@gmail.com>
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


On Wed, 02 Sep 2026 15:31:14 +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
> kdump can omit them from the vmcore.
> 
> The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
> pay the cost of splitting memblock.memory entries at NODUMP boundaries.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> ---
>  drivers/of/fdt.c             |  1 +
>  drivers/of/of_private.h      |  1 +
>  drivers/of/of_reserved_mem.c | 15 +++++++++++++++
>  3 files changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


