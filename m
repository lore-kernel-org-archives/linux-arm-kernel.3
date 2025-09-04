Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEA1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXdL69La8rlk4Cc+iX/4Org3UmBemAueG/dGwfzzzJs=; b=x/VRnU8EZWT9qz4U4naY4BZ4xV
	/EtevQYn9ga59QPwp9MZqTVHu+p5BfzKwQffCjTk+AZWbllU8X8u6Udb7uIGX1FNpUHre7LyDi4Qh
	a/6yXUMDpEv9SkGs+WJ+jHWZ6IaNa7Hklz7R8kJ+qPuRZ4MyJ+Q3QR9sQycYPj+rT+aG6wSf8H+Tq
	FxV493q0FRhZ1oCZX4auKWnLMrbV0/zsFQ27OdzobsPTMhKr0Zw3aIl87m8Naebuzws0enV4Z0hYu
	NrrPSAKj2f7HB5hnjqysr9Cr+bMWqUFqrFIKTqXkd9FKbusQRJzyBU4Hr38z0E5ddk9YA26Zdsw1g
	ydxJ2jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGAo-0000000E8PU-1CFv;
	Thu, 04 Sep 2025 20:03:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDJG-0000000D7PO-2uuK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 16:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0843A407F4;
	Thu,  4 Sep 2025 16:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC426C4CEF0;
	Thu,  4 Sep 2025 16:59:37 +0000 (UTC)
Date: Thu, 4 Sep 2025 17:59:35 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ard Biesheuvel <ardb@kernel.org>, Dev Jain <dev.jain@arm.com>,
	scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v7 5/6] arm64: mm: split linear mapping if BBML2
 unsupported on secondary CPUs
Message-ID: <aLnFd1Hl_FSHZR3z@arm.com>
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-6-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829115250.2395585-6-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_095942_750086_0C5A69CA 
X-CRM114-Status: GOOD (  24.04  )
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

On Fri, Aug 29, 2025 at 12:52:46PM +0100, Ryan Roberts wrote:
> The kernel linear mapping is painted in very early stage of system boot.
> The cpufeature has not been finalized yet at this point. So the linear
> mapping is determined by the capability of boot CPU only. If the boot
> CPU supports BBML2, large block mappings will be used for linear
> mapping.
> 
> But the secondary CPUs may not support BBML2, so repaint the linear
> mapping if large block mapping is used and the secondary CPUs don't
> support BBML2 once cpufeature is finalized on all CPUs.
> 
> If the boot CPU doesn't support BBML2 or the secondary CPUs have the
> same BBML2 capability with the boot CPU, repainting the linear mapping
> is not needed.
> 
> Repainting is implemented by the boot CPU, which we know supports BBML2,
> so it is safe for the live mapping size to change for this CPU. The
> linear map region is walked using the pagewalk API and any discovered
> large leaf mappings are split to pte mappings using the existing helper
> functions. Since the repainting is performed inside of a stop_machine(),
> we must use GFP_ATOMIC to allocate the extra intermediate pgtables. But
> since we are still early in boot, it is expected that there is plenty of
> memory available so we will never need to sleep for reclaim, and so
> GFP_ATOMIC is acceptable here.
> 
> The secondary CPUs are all put into a waiting area with the idmap in
> TTBR0 and reserved map in TTBR1 while this is performed since they
> cannot be allowed to observe any size changes on the live mappings. Some
> of this infrastructure is reused from the kpti case. Specifically we
> share the same flag (was __idmap_kpti_flag, now idmap_kpti_bbml2_flag)
> since it means we don't have to reserve any extra pgtable memory to
> idmap the extra flag.
> 
> Co-developed-by: Yang Shi <yang@os.amperecomputing.com>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

I think this works, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

However, I wonder how likely we are to find this combination in the
field to be worth carrying this code upstream. With kpti, we were aware
of platforms requiring it but is this also the case for BBM? If not, I'd
keep the patch out until we get a concrete example.

-- 
Catalin

