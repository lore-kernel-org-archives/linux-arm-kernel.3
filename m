Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD8CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE2CxEXJOfKr7K8FtOB/32zzx5YIJyaR1qDxdSntSXg=; b=TnmFhOEKPEVaDmoIeeH6ptikiV
	UvXXTV2z6qna2a86sF+5ziWjBS9d8QWrecEX+uedpSJka1BdC1lf15uPcPSvtjj0o+5yacKXfvfE+
	+48mTN4RDBB3fvDONM8HgnpAANKafZsMsV1pF5w4Xagfh55Az6lrkxbKh+OTG03VqTicidHANTjj/
	kljmCBA2pzDMgx9giwPguKNcUO2Lc99/HYyGsxwyM1tG4NMOI9NrjOpG0shEuphqJLnWhS4xr4FSi
	ahYfT6cVSDwrGJT6GsT/yY/FqHvm/qtaDvlejHPg3gmr4mZ5a1KZBGcXD4beLpGRvNhmOg+eGfCsw
	1S/zJBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQS-00000008Dz2-0Gp6;
	Thu, 04 Sep 2025 02:10:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt1x-00000007RV3-0wyv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 19:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EEAD6013F;
	Wed,  3 Sep 2025 19:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA02AC4CEE7;
	Wed,  3 Sep 2025 19:20:25 +0000 (UTC)
Date: Wed, 3 Sep 2025 20:20:23 +0100
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
Subject: Re: [PATCH v7 4/6] arm64: mm: Optimize split_kernel_leaf_mapping()
Message-ID: <aLiU9xnZl-7LBqkX@arm.com>
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-5-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829115250.2395585-5-ryan.roberts@arm.com>
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

On Fri, Aug 29, 2025 at 12:52:45PM +0100, Ryan Roberts wrote:
> The common case for split_kernel_leaf_mapping() is for a single page.
> Let's optimize this by only calling split_kernel_leaf_mapping_locked()
> once.
> 
> Since the start and end address are PAGE_SIZE apart, they must be
> contained within the same contpte block. Further, if start is at the
> beginning of the block or end is at the end of the block, then the other
> address must be in the _middle_ of the block. So if we split on this
> middle-of-the-contpte-block address, it is guaranteed that the
> containing contpte block is split to ptes and both start and end are
> therefore mapped by pte.
> 
> This avoids the second call to split_kernel_leaf_mapping_locked()
> meaning we only have to walk the pgtable once.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

And I agree with Yang, you can just fold this into the previous patch.

