Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58E6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxVyPqY+IZBGIEiIPjcN9KImvgd2N1QLi/uVwsIgNTI=; b=zezHHjQ5BWMf1ZQyvMTQNdLDd1
	53WOt0rKDChpiETLOFIDHUO2MqSxyqEh1sULgn0G98yfx9j8nVSjV536Y4qhZAyqI7+qJQpwMh4AR
	bngMEZGGtEZ5lg+rGuWLktLDtLtlTgFl+DkJUy5jNs5/ljc04QE/AT5LtNK0jfCGkLwTB0fqKB32g
	QF46S86YgcL2BcRFVc76PK8oHQ7aNpL5JeNFM74Hpgp/B6JsjAxhShDLcIYoTBVLHvhwylMJLRE7N
	+r2zM/NxmKXqRV4IdobdXi9HSRPoYD1bRvCCnVSXFZXgis2MjvWEsDOItmfkZFk7e8usbvSqo9nbK
	vbb0sLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesAK-000000071VZ-3Crt;
	Thu, 24 Jul 2025 09:23:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerAl-00000006pvE-1fW1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF924601EE;
	Thu, 24 Jul 2025 08:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D28C4CEED;
	Thu, 24 Jul 2025 08:19:23 +0000 (UTC)
Date: Thu, 24 Jul 2025 09:19:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, will@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v4] arm64: Enable permission change on arm64 kernel block
 mappings
Message-ID: <aIHsiPtG0Ycm2DTe@arm.com>
References: <20250703151441.60325-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703151441.60325-1-dev.jain@arm.com>
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

On Thu, Jul 03, 2025 at 08:44:41PM +0530, Dev Jain wrote:
> This patch paves the path to enable huge mappings in vmalloc space and
> linear map space by default on arm64. For this we must ensure that we can
> handle any permission games on the kernel (init_mm) pagetable. Currently,
> __change_memory_common() uses apply_to_page_range() which does not support
> changing permissions for block mappings. We attempt to move away from this
> by using the pagewalk API, similar to what riscv does right now;

RISC-V seems to do the splitting as well and then use
walk_page_range_novma().

> however,
> it is the responsibility of the caller to ensure that we do not pass a
> range overlapping a partial block mapping or cont mapping; in such a case,
> the system must be able to support range splitting.

How does the caller know what the underlying mapping is? It can't really
be its responsibility, so we must support splitting at least at the
range boundaries. If you meant the caller of the internal/static
update_range_prot(), that's an implementation detail where a code
comment would suffice. But you can't require such awareness from the
callers of the public set_memory_*() API.

> This patch is tied with Yang Shi's attempt [1] at using huge mappings
> in the linear mapping in case the system supports BBML2, in which case
> we will be able to split the linear mapping if needed without
> break-before-make. Thus, Yang's series, IIUC, will be one such user of my
> patch; suppose we are changing permissions on a range of the linear map
> backed by PMD-hugepages, then the sequence of operations should look
> like the following:
> 
> split_range(start)
> split_range(end);
> __change_memory_common(start, end);

This makes sense if that's the end goal but it's not part of this patch.

> However, this patch can be used independently of Yang's; since currently
> permission games are being played only on pte mappings (due to
> apply_to_page_range not supporting otherwise), this patch provides the
> mechanism for enabling huge mappings for various kernel mappings
> like linear map and vmalloc.

Does this patch actually have any user without Yang's series?
can_set_direct_map() returns true only if the linear map uses page
granularity, so I doubt it can even be tested on its own. I'd rather see
this patch included with the actual user or maybe add it later as an
optimisation to avoid splitting the full range.

> ---------------------
> Implementation
> ---------------------
> 
> arm64 currently changes permissions on vmalloc objects locklessly, via
> apply_to_page_range, whose limitation is to deny changing permissions for
> block mappings. Therefore, we move away to use the generic pagewalk API,
> thus paving the path for enabling huge mappings by default on kernel space
> mappings, thus leading to more efficient TLB usage. However, the API
> currently enforces the init_mm.mmap_lock to be held. To avoid the
> unnecessary bottleneck of the mmap_lock for our usecase, this patch
> extends this generic API to be used locklessly, so as to retain the
> existing behaviour for changing permissions.

Is it really a significant bottleneck if we take the lock? I suspect if
we want to make this generic and allow splitting, we'll need a lock
anyway (though maybe for shorter intervals if we only split the edges).

-- 
Catalin

