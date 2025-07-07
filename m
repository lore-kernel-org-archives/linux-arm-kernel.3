Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B032AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJmrm4T+ctlZCAdZsH2mv/hAR5WhP0dAMHbEJfvJRlM=; b=PRg1tBFF7Q5HfI4GZoy08unLzn
	XuwpONy1dEN74VpcVdx8O9CyH9Z45Ty0DsW4UhuLnP3o9ZUTDZhdOdqgA1o6n9Q+YD6bTNj7t2K1t
	cXY1GwES6deMYZjrlGqlBHYfpqCbITGajOhCAiTUcZtbjoqi+OLc2GOcComSLvkG1flLwYckrAeva
	lM1qcn8rvGfbABwkpUgj4pGfgYvZiLcExtmmeuIdmZpIuOmYA00DDsaSW0Ox13MHIcrB1enL72etf
	YniQVPavvKWb4XqNEdUHQlU6uDHa70rFt8Lkz5UmkgkKnjJpqVRctTq9hVURutel53WehwR8qpsg/
	+z2mb23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYaIl-000000014Wg-1RxB;
	Mon, 07 Jul 2025 01:05:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYaGI-000000014BT-48tG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 01:03:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B38DA4AD97;
	Mon,  7 Jul 2025 01:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DCEC4CEED;
	Mon,  7 Jul 2025 01:02:36 +0000 (UTC)
Date: Sun, 6 Jul 2025 20:02:35 -0500
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, david@redhat.com, ddutile@redhat.com,
	seanjc@google.com, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com,
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com,
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
	alex.williamson@redhat.com, sebastianene@google.com,
	coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
	ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
	linux-mm@kvack.org, tabba@google.com, qperret@google.com,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Subject: Re: [PATCH v10 6/6] KVM: arm64: Expose new KVM cap for cacheable
 PFNMAP
Message-ID: <aGscq_R69UpMXpGX@arm.com>
References: <20250705071717.5062-1-ankita@nvidia.com>
 <20250705071717.5062-7-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705071717.5062-7-ankita@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_180315_218125_60598EF7 
X-CRM114-Status: GOOD (  12.90  )
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

On Sat, Jul 05, 2025 at 07:17:17AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Introduce a new KVM capability to expose to the userspace whether
> cacheable mapping of PFNMAP is supported.
> 
> The ability to safely do the cacheable mapping of PFNMAP is contingent
> on S2FWB and ARM64_HAS_CACHE_DIC. S2FWB allows KVM to avoid flushing
> the D cache, ARM64_HAS_CACHE_DIC allows KVM to avoid flushing the icache
> and turns icache_inval_pou() into a NOP. The cap would be false if
> those requirements are missing and is checked by making use of
> kvm_arch_supports_cacheable_pfnmap.
> 
> This capability would allow userspace to discover the support.
> It could for instance be used by userspace to prevent live-migration
> across FWB and non-FWB hosts.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Jason Gunthorpe <jgg@nvidia.com>
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: David Hildenbrand <david@redhat.com>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

