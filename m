Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375EDCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQH+kXpKSTymGia/uumXbgT78aV2agpPTvM0izIRqhE=; b=mSVpHdU8MnPqIh1Gat8uySZTDV
	HgSGJMi2rehlO/WIXxy7mgVdJUUuwB60pDfsbS90SRiTiSOmJHqGT5ybqcy3ZeStmb85vuEf7BM5s
	wOl9yitXdQ5+ZkOvPBDIBfcY8XAaPm+7WF0kFePz1M0+CwP9IGN7aSdzaL2iNSNqUi/Kk+6GncQyV
	TVTGmephUJnDAlM06hzXKGwhJgKbkUoMXtM5vZcAIYiWHmQyq3XADNmMHQBZNhLzVnZy12jUUnHy5
	CEhpVmHwf0ol6gjCOskxyNm5kwKMNX0FzYHxGnTT1bgc0rLRtm/TNGQURYqxBSm+vM8mRSd5YRjzZ
	sdza66MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzr-00000002RLN-2cl8;
	Fri, 16 Oct 2026 09:13:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzn-00000002RJp-2KJP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C74B439AD;
	Fri, 16 Oct 2026 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521BE1F000C4;
	Fri, 16 Oct 2026 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141979;
	bh=mQH+kXpKSTymGia/uumXbgT78aV2agpPTvM0izIRqhE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LYZgl/L47fPO8Aq+OVvp5UAIfE6hgsH5zIh9oJrQPyGOyzlbTMZ+sEC6Ba2iivygG
	 TkPuULqc5Ixpat8F42Z/hB853dD7BfPLHituatCT9QtBtX37bYoB2UITBUScGPZJTv
	 /usSd5kkvMwdNHq8GlE8NVjVR68AUrk8rBGTbLTczFneKEc+Vlra2BuBzIxoldvSJD
	 5k/PrxNtsyWoMGyB7jwmq/3ALOfJ2jyscwflYFHeck2tVFD/wKAmWKx5Sd0GuFkzRm
	 5Nais/Vmmp4nMWPIYN3Q5NTbSyK91tqJb4EB8JS7BrO04489Jub9pYLLW9dhx6IUPi
	 ELIJk5iqbinsA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Fred Griffoul <griffoul@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/11] mm: Memory providers for guest_memfd and
 iommufd
In-Reply-To: <20261014093733.90312-1-griffoul@gmail.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
Date: Fri, 16 Oct 2026 14:42:40 +0530
Message-ID: <yq5a4iem57qv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>

 [ ... 24 lines skipped ... ] 

>
> Why a new interface
> ===================
>
> kvm_gmem_ops gives KVM a way in. For devices, the only option today is
> a dma-buf plus a private call that iommufd looks up with symbol_get(),
> which is how vfio-pci works. Each new owner would need another such
> lookup, and iommufd would end up knowing each owner by name. With a
> common interface, a provider module only calls into mm, and nothing
> needs symbol_get().
>
> It also means the provider revokes a range once. The VMM hands the
> same file to KVM and to iommufd; on a revoke the core forwards it to
> every consumer, so KVM clears the range from stage-2, iommufd from the
> IOMMU page tables, and guest_memfd from the VMM's own mapping, all
> before the revoke returns.
>

What confused me was the introduction of memory providers as a subsystem
in their own. What we really need is the ability to map PFNs from
other subsystems into KVM stage-2 and into subsystems such as iommufd?.

Restricting the scope to the above, at least initially, would make this
much easier to reason about.

For my use case, the VFIO fd becomes the backing provider (referred to
as backend below). We can create a guest_memfd using that
resource_fd, allowing MMIO BAR ranges to be mapped into KVM stage-2.

Another feature provided by this series is the ability to map the same
range into iommufd. We probably want to restrict this to shared ranges.
It may be simpler for guest_memfd to drive this. The resulting
relationship would be:

+-----------------------+
| VFIO PCI BAR backing  |
+-----------------------+
            |
            | guest_memfd_backing_ops
            | Supplies BAR PFNs
            v
+------------------------------------------+
| guest_memfd                              |
|                                          |
| Controls shared/private state            |
| Exports shared, accessible PFNs          |
| Revokes consumer mappings when needed    |
+------------------------------------------+
            |
            | mem_provider_ops
            | IOAS_MAP_FILE(fd = guest_memfd)
            v
+-----------------------+
| IOMMUFD               |
|                       |
| Creates and refreshes |
| IOMMU DMA mappings    |
+-----------------------+
            |
            v
      Device DMA access


Another capability the memory-provider interface could provide is
kernel-initiated IOAS mapping, for example by allowing a guest_memfd fd
to be used with IOAS_MAP_FILE.

Currently, a private-to-shared conversion causes a VM exit, followed by
an IOAS_MAP for the newly shared range. Could using guest_memfd with
IOAS_MAP_FILE avoid this?

Perhaps the series could be rearranged as follows:

- Allow a guest_memfd fd to be used with IOAS_MAP_FILE.
- Add a VFIO or other backend for guest_memfd, without calling it a provider.
- Add support for guest_memfd to provide guest PFNs to other subsystems
  through its file descriptor.

Would this work?

-aneesh

