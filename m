Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3229CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df4O4PXLaJmSBmEJ4M1UlLiC12+GKmicAVh0/rVhzGg=; b=XUm0b1sFGueTVFYAdwZiQyBpVN
	TW2K9rmwsFNVNKTEEiAqOhxGQnvI7s+2kDc+L7BFQX98QcZShdfbFHsyY7500+ixm/zcWBVlk2X59
	u2qqnk/tWfBqRQOb7fMT8+SZgma1w3o2hMlzOoTqudo1gJ8g9qlGQumaUzDt6kSLKI+kkvR/oNTuX
	8QyCKutHuy2/cCEaoUnK+K/mKbeVDS1YE9aOXDNH/5x2hoUb1ZiHXfo1DCzXd7gpdVAtyWExiqNdS
	BhRvv+boFKkO3fCUZta2CBKcfsGdbdLBmd/mzqEy5e3RpfeKb1wqsO9AsEh9YglKN2IvlAaMKh+o7
	lATKaoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ6H-000000032RF-10WT;
	Fri, 05 Sep 2025 16:15:45 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVXt-00000001gvG-43wW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:28:03 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0745E52C54;
	Fri,  5 Sep 2025 14:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757075277;
	bh=8CjpBmvrUyioClQv+4t4qWqIJCFOr+widzD2jXtprWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EONzcNdOrHAgSS/R7sA/baWHgglBoaJyxqbKCl822wd1J4gyDGD3l/KbFg2hELjEK
	 vLeMx68mqhnKsTRVe9eBoqtwlB0+LWgE056t4AgZv0ORHNQLtDHHnc9ZGlAwnKB8yD
	 ldX1vNQbZI3mH4SvUcLnuBS59Qa0BPCvCFfFyAcuueshf3YcVvozVNyNyggswjdp4o
	 Lf9EUiW+syyScoa+KmA/VzpNHaK2WLBvy0FDdBKUUZz83WOmPmcceOdQP15y2La0tP
	 c7qO4at7A4tF6CoGXTpycfyBZvVlz8HhdiJkEo1ZPjya2kD98eteQyZYjUWNqedGzV
	 1In0f20sVWSKQ==
Date: Fri, 5 Sep 2025 14:27:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 0/3] iommu/apple-dart: Four level page table support
Message-ID: <aLrXS9Z-F31SEd_G@8bytes.org>
References: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052802_157510_CE245C40 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu, Aug 21, 2025 at 12:15:57PM +0200, Janne Grunau wrote:
> The DART instances found in T602x based SoCs (Apple's M2 Pro/Max/Ultra)
> indicate an IAS of 42 bit. This results in alloc_io_pgtable_ops()
> failing as io-pgtable-dart supports at most 36-bit IAS.
> The t8110 DART design supports 4-level page tables. Implement support
> for this in io-pgtable-dart and mark DART stream with more than 36-bit
> IAS as 4-level page tables.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - simplified 4 page table level use in apple_dart_hw_enable_translation()
> - use "iommu/{apple,io-pgtable}-dart:" as commit subject prefix
> - added Sven's Rb:
> - Link to v1: https://lore.kernel.org/r/20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net
> 
> ---
> Hector Martin (3):
>       iommu/apple-dart: Make the hw register fields u32s
>       iommu/io-pgtable-dart: Add 4-level page table support
>       iommu/apple-dart: Add 4-level page table support
> 
>  drivers/iommu/apple-dart.c      |  50 +++++++++-----
>  drivers/iommu/io-pgtable-dart.c | 143 ++++++++++++++++++++++++----------------
>  include/linux/io-pgtable.h      |   1 +
>  3 files changed, 121 insertions(+), 73 deletions(-)

Applied, thanks.

