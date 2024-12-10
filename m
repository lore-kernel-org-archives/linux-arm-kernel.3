Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87358E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhGwtCZQPUWo8JC928lQsGKK4ZTYsXyCnf30A3VDezM=; b=o4wQn+E5hOW8tmmRbFNYgRX6sI
	aI2Ni+G9HlX1y4JzQkT7r5rYsfBWopp0vzEUnHw4lTI5LYj5iNEFSZJtwo2TEVlyphe2X4ADHKOly
	4vNJ9RfD3RPCkYyIn0a47FiaVzqtN6GsD+/WaUFx43JR+ydOC80GiTzFzAi7clx1Pxq8+YUxm+1mp
	Bg7rYPQH8nnftw5gY5+iE3x2creybg3ByVKO+DxuShPcsxjTY4gcklZjAy9eadxCVVMs/RnwvDl1A
	FXXORtYIeOeKWgiNTRS6JSwjoQGhqg5Mz3r+pMmI9RuDgCLkClKae2vH6/V5f8hH0heWxpjgVKwMS
	51FLY3Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2rR-0000000C37t-3bsE;
	Tue, 10 Dec 2024 16:13:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2mX-0000000C2IV-0mkE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 060F95C481A;
	Tue, 10 Dec 2024 16:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2401C4CED6;
	Tue, 10 Dec 2024 16:08:09 +0000 (UTC)
Date: Tue, 10 Dec 2024 16:08:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Donald Dutile <ddutile@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>,
	ankita@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org,
	aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com,
	zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
	dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/1] KVM: arm64: Map GPU memory with no struct pages
Message-ID: <Z1hnZ0H13Pst5sKF@arm.com>
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241210140739.GC15607@willie-the-truck>
 <20241210141806.GI2347147@nvidia.com>
 <0723d890-1f90-463b-a814-9f7bb7e2200b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0723d890-1f90-463b-a814-9f7bb7e2200b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_080817_266553_BCDB9FD8 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, Dec 10, 2024 at 10:56:43AM -0500, Donald Dutile wrote:
> So, I'm not sure I read what is needed to resolve this patch. I read
> Will's reply to split it further and basically along what logical
> lines of functionality; is there still an MTE complexity that has to
> be resolved/included in the series?

Since MTE is still around, the complexity did not go away. But I need to
properly read the patch and Will's comment and page in the whole
discussion from last year.

There's now FEAT_MTE_PERM as well but we don't have those patches in
yet:

https://lore.kernel.org/r/20241028094014.2596619-1-aneesh.kumar@kernel.org/

-- 
Catalin

