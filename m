Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8EACA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSuGAke0gdqeRAIfeWQr8j6H1h4Rm4Qza2dPLd6deIU=; b=xbEiS+SZ9WNwFem0DAriB3r8zE
	0sYLEHf3Fo/DbsJBjxm6B3NmgM7soLxErCZiUP1xr4iRR2jZnJtV310jAKMsEPrFE9601gD6Xg3Re
	UEZlp1VN9ErAyXorHaJ+5NoNGra+U5Wuet/dC3PfkuXlSscgOu4STqMJnoOOqlUvr1MQanO81HbR/
	jqkVIIg/YQmP9qU0TxW/236xYkm7gIFxpw894p3Oox4yMVmhxLpqS3UK2bELqmQFfEWcgj7qqIph6
	8Lcfxrtvg9gQlt5Hd/pxXI86DcD1//ExFM6Fel9VRZpPUR8RtcY0gg+T5nQaXjgiGhWGEyve1dZ0b
	LyfPNo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGDX-0000000E9Hr-0ESl;
	Thu, 04 Sep 2025 20:05:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDJz-0000000D7je-2sn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 17:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B712434F3;
	Thu,  4 Sep 2025 17:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E4CC4CEF0;
	Thu,  4 Sep 2025 17:00:24 +0000 (UTC)
Date: Thu, 4 Sep 2025 18:00:22 +0100
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
Subject: Re: [PATCH v7 6/6] arm64: mm: Optimize linear_map_split_to_ptes()
Message-ID: <aLnFpndf-XikPPFf@arm.com>
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-7-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829115250.2395585-7-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_100027_743351_ADD99E33 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, Aug 29, 2025 at 12:52:47PM +0100, Ryan Roberts wrote:
> When splitting kernel leaf mappings, either via
> split_kernel_leaf_mapping_locked() or linear_map_split_to_ptes(),
> previously a leaf mapping was always split to the next size down. e.g.
> pud -> contpmd -> pmd -> contpte -> pte. But for
> linear_map_split_to_ptes() we can avoid the contpmd and contpte states
> because we know we want to split all the way down to ptes.
> 
> This avoids visiting all the ptes in a table if it was created by
> splitting a pmd, which is noticible on systems with a lot of memory.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

