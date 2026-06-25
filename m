Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152CECDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VUqMECiZlY9thhbQvmy35ab0ws4JsaGHxxluesab0Q=; b=qilx37yMq17OsAWydv+h5JLWVA
	nOUr2PFKvOwtBY6y+5k39zkgbXOKP0ZHLtAs8Wq+FYCv/3iGiq/Qvmv+HJq4k+sPZO3u81ZtNHwFt
	4fhb5okMBEymEob4h70lRotZdpN0brIpq6ag9drRqE9wUZUfP/KMVWrcPVYSL70D/fcQ0q8SvlpD6
	T0CB+GsZ4UvLInvYnQz4I9wKg+i86tXjEX8ufLCwG3APh0Wj4ZxctND54Nz7ibPoeIyrKK9vHJLKw
	Q9Q//BmEFbgAK1O/NjDhu5LgF5saCan8c0m3qUfAChkl5c1UH8R3xX1WmjBoBLLs8WUdwzganUrYa
	q0pfTxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcaH5-00000008b1G-0Gdh;
	Thu, 25 Jun 2026 02:57:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcaH4-00000008b1A-09ke
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7FE843C49;
	Thu, 25 Jun 2026 02:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1481F000E9;
	Thu, 25 Jun 2026 02:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782356225;
	bh=1VUqMECiZlY9thhbQvmy35ab0ws4JsaGHxxluesab0Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=wUfWXj5aUF9eoVta8SgZEnnNduNGTOKD5CBkcZw8lAQZ5nDQRfynZOikmNZair0Ja
	 xXlXcSLqbYwRVFC0GBj35O/iJAfNJHkfNGgjOUcxYCbjg/mRCa74VQbQf+iHrTDgCb
	 jyvQry5GV5UdWA2ROhhIbcXZti87XuVpMIrNdw/8=
Date: Wed, 24 Jun 2026 19:57:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
 baohua@kernel.org, Xueyuan.chen21@gmail.com, dev.jain@arm.com,
 rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-Id: <20260624195704.5c29c0353163babb721585ca@linux-foundation.org>
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 18 Jun 2026 16:47:20 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous. Two techniques are used:

Thanks.

> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
>    segments
> 2. Use batched mappings wherever possible in both vmalloc and ARM64
>    layers
> 
> Besides accelerating the mapping path, this also enables large
> mappings (PMD and cont-PTE) for vmap, which are currently not
> supported.
> 
> Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> CONT-PTE regions instead of just one.
> 
> Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
> mapping logic between the ioremap and vmalloc/vmap paths, handling both
> CONT_PTE and regular PTE mappings. This prepares for the next patch.
> 
> Patch 4 extends the page table walk path to support page shifts other
> than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
> mappings. The function is renamed from vmap_small_pages_range_noflush()
> to vmap_pages_range_noflush_walk().
> 
> Patches 5-6 add huge vmap support for contiguous pages, including
> support for non-compound pages with pfn alignment verification.
> 
> On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> the performance CPUfreq policy enabled, benchmark results:
> 
> * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> * vmalloc(1 MB) mapping time (excluding allocation) with
>   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)

Nice.

> Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

Indeed.

I see Dev had a good look at v3 - hopefully he (and Ulad) (and more ARM
folks) have time to go through this.

Is there any effect on anything other than arm64?  I'm wondering how
much testing these changes will really get in mm.git and linux-next.

How is our selftests coverage of these changes?  Is there some existing
selftest which will exercise these new features?

You diligently went through the Sashiko report against v3 (thanks). 
Please pass an eye across its v4 report, see if something new popped
up?
	https://sashiko.dev/#/patchset/20260618084726.1070022-1-jiangwen6@xiaomi.com


