Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2F2C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 00:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO4kd2nXO2QdHkKiDejC5X3NZc9Qc7HzeojL3KpieTk=; b=Qi9XWPsjYYZviMcZGCflfDBxLw
	Ym6YxkkUDw3yOBvwq8KO+zJ7MiItivfGzryruqceeqRPYeozeKceT6D4wwtGUA6j0lXGuEfoOU/YI
	5YjlQyHkNbJOXvvyXcdPwCLuEaHbXWRN1pgPxGNiJXT9ez7zhsRHRMdAEOkzdODxSRMNjZjFHFs9c
	ydrfQ3byqOMwxXXW3zpGKVFyy42kcmkBvg30WrMge2ooqJqVkYmfwEvgq3XFDA5fS6NOfLPO+agg8
	ZcIHJUUTzBf3SnF8V5eNTpG+vnT9md6usxUVZLd93GiBgaPZH5evjHdzEKLORax3B8uyQASMcW3Sl
	Nwkw2mjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa9y-000000013fL-0CWQ;
	Mon, 07 Jul 2025 00:56:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa6q-000000013Kj-0I8A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 00:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C72D61127;
	Mon,  7 Jul 2025 00:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E581AC4CEED;
	Mon,  7 Jul 2025 00:52:51 +0000 (UTC)
Date: Sun, 6 Jul 2025 19:52:50 -0500
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
Subject: Re: [PATCH v10 2/6] KVM: arm64: Update the check to detect device
 memory
Message-ID: <aGsaYlZXvpU0Cngg@arm.com>
References: <20250705071717.5062-1-ankita@nvidia.com>
 <20250705071717.5062-3-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705071717.5062-3-ankita@nvidia.com>
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

On Sat, Jul 05, 2025 at 07:17:13AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Currently, the kvm_is_device_pfn() detects if the memory is kernel
> mapped through pfn_is_map_memory. It thus implies whether KVM can
> use Cache Maintenance Operations (CMOs) on that PFN. It is a bit
> of a misnomer as it does not necessarily detect whether a PFN
> is for a device memory. Moreover, the function is only used at
> one place.
> 
> It would be better to directly call pfn_is_map_memory. Moreover
> we should restrict this call to VM_PFNMAP or VM_MIXEDMAP. Non PFMAP
> or MIXEDMAP VMA's must always contain normal pages which are
> struct page backed, have KVA's and are cachable. So we should always
> be able to go from phys to KVA to do a CMO.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Tested-by: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

