Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66437C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O3AnmpQI3jBSfzVaFR0gisRYPo1AftdSa2GSlKHZsw=; b=I05Zgbf7cOzGbR4K5gTBjmFXVo
	LcuLmneOrKPQAsPcMqWgQd1tCtaYL6+8jHKULlQeAohJfZaOwJsBL1iHTys6TaRYsxAtV6LHKYP4M
	YPK8HjLHMOaeBRliVzkmbV8BR++OOhhGi6vK7KhlfGzcpD3xN2zU71Ihl1bEdtvs4rBCYUpoUsdTb
	n/Bx0TOsP4uDfOLCJQKjD5Ggobf6uu/p3ONrPlO7aeyE7FQLluWnkUvV6RnCW6NDDTLziO0CmdzPt
	RuDLDQ3M8lIF208FgGwrtm/uOO/XOqtaI3VN0WbBUWgJUOQoyfgz1fqVCFTMUhFpSOWDNKoVehjwF
	5JUjLPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYXE-0000000ERNg-3zdW;
	Fri, 07 Mar 2025 14:18:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYVa-0000000ER9U-46nd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 14:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741357021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3O3AnmpQI3jBSfzVaFR0gisRYPo1AftdSa2GSlKHZsw=;
	b=itPl7SK/Z26G/7CRkdMyajb1KYkC//i7dm2IQ1Vl9G9GlOrsaUeKWrBEy2UkJ/y2KULdL3
	5Kl3hbsTav4Qalu5zH8JCQrqBoL5bcn7JIsamlsYX+CfDuehj9tGzPhzNLesb+X2vN3Y5T
	RisoaJF7fUay9pmojeu6nsxlHXangYs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-M6TIZUB7M4Cy3RWcS4Aomw-1; Fri, 07 Mar 2025 09:15:27 -0500
X-MC-Unique: M6TIZUB7M4Cy3RWcS4Aomw-1
X-Mimecast-MFC-AGG-ID: M6TIZUB7M4Cy3RWcS4Aomw_1741356926
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-30bfaec88edso1888891fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 06:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741356926; x=1741961726;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3O3AnmpQI3jBSfzVaFR0gisRYPo1AftdSa2GSlKHZsw=;
        b=sagAb+u+vL8TSLaxZ6MyeWgro214cJ3PdV7NjIRUz5PvMaDpP+cmOlJ84wmsc0/fqq
         rZeZPyQnGZwUgvi29q0DO08hgO1F4C/UzYnAVEOjQ7gtjpBpfceNmQqFtRvbjjBVD8mW
         IvaSmXj9jkMro9WqpxpPhSbOHDFKDn1BN538d9+5bNf5+OX6LyIBE3ub9szklMyoqHjX
         0fIZlOQ++7uK5BG7u/+uC/lAG2SHO7uWW38wAFhXk2H74zi21u9S7VbnsVixMDoMFdcI
         OjqSPrCrqshvTQNpQKpZf/dh0GMrCmP08dEeghTxbfWnnkAvGEYoRfjGd+jrKGqR6c/p
         wnPA==
X-Forwarded-Encrypted: i=1; AJvYcCXVblr8t8VScKrZDUgamB4DTvKO4TVoDkbRPfFUI8FOv3IKz2s1krZfD6WjWzGX3YM9sKsAr4h4prfuirTt0O90@lists.infradead.org
X-Gm-Message-State: AOJu0Ywod238Ad+MXn68EVcfaQcq2g3z1ikAZpTgJ7u4XR9GX/qDfuv7
	pkYI8QFN3mktm2asRtTdBd17j3uxGBCmY+SvBGqJJs01yTx4AowZY2Xu+iJPapFvYsJrmZnAD3g
	uTPsfEU2wSFlG4XrSP4b2gU2SoYvcgqso2x8fdPJQedswhQd7CPo9baBr74OZTOTuoQ7s0qsb
X-Gm-Gg: ASbGncvjXw9SL0rhO1j7HHKwIdEUPe1jcTcl4I7S2UdhAz7uH/pcGch8bhHW7+X/wCj
	9YdDN4H/FUutko4YV/2KSeFKOpk5ebY0CJkr/VAJSR9//RgKMZ2cDobSdSGGnUpWWcQaH6vRsay
	WVE0akqqoZnV/MkQiI8HJCKcmE5Ic9KB4ZvNzTNmtLC5phWhlGJyZt2TAJ8I28u1aTgBVuZQtKB
	c5Y/HYR/1IVXJMK62NnrH8CxZIHlPiIHNyGr+riG3oL3ENU0qt0nGU2L8PnF8HWL7ae8d3AJDo5
	YNvP8UotH/lf
X-Received: by 2002:a05:6512:3e08:b0:549:8c0c:f059 with SMTP id 2adb3069b0e04-549903f7501mr1328599e87.10.1741356925925;
        Fri, 07 Mar 2025 06:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3xCZIBKOSDK+lcZFrDyk8zQiKyadlLEz2VUX4gZrVM2Ry982AQyl3kHsVBYxqC5TNxfqK0A==
X-Received: by 2002:a05:6512:3e08:b0:549:8c0c:f059 with SMTP id 2adb3069b0e04-549903f7501mr1328584e87.10.1741356925465;
        Fri, 07 Mar 2025 06:15:25 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58e4fsm500345e87.82.2025.03.07.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 06:15:24 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id C544C18B8B34; Fri, 07 Mar 2025 15:15:22 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com
Cc: zhangkun09@huawei.com, liuyonglong@huawei.com, fanghaiqing@huawei.com,
 Yunsheng Lin <linyunsheng@huawei.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Gaurav Batra <gbatra@linux.ibm.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, IOMMU <iommu@lists.linux.dev>, MM
 <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v11 0/4] fix the DMA API misuse problem for
 page_pool
In-Reply-To: <20250307092356.638242-1-linyunsheng@huawei.com>
References: <20250307092356.638242-1-linyunsheng@huawei.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 07 Mar 2025 15:15:22 +0100
Message-ID: <87v7slvsed.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JJCH9_NK5o6QlpdEnXKsABC---wG0seqcqaFm1LPsac_1741356926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_061703_083570_8CF26216 
X-CRM114-Status: GOOD (  33.75  )
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

Yunsheng Lin <linyunsheng@huawei.com> writes:

> This patchset fix the dma API misuse problem as below:
> Networking driver with page_pool support may hand over page
> still with dma mapping to network stack and try to reuse that
> page after network stack is done with it and passes it back
> to page_pool to avoid the penalty of dma mapping/unmapping.
> With all the caching in the network stack, some pages may be
> held in the network stack without returning to the page_pool
> soon enough, and with VF disable causing the driver unbound,
> the page_pool does not stop the driver from doing it's
> unbounding work, instead page_pool uses workqueue to check
> if there is some pages coming back from the network stack
> periodically, if there is any, it will do the dma unmmapping
> related cleanup work.
>
> As mentioned in [1], attempting DMA unmaps after the driver
> has already unbound may leak resources or at worst corrupt
> memory. Fundamentally, the page pool code cannot allow DMA
> mappings to outlive the driver they belong to.
>
> By using the 'struct page_pool_item' referenced by page->pp_item,
> page_pool is not only able to keep track of the inflight page to
> do dma unmmaping if some pages are still handled in networking
> stack when page_pool_destroy() is called, and networking stack is
> also able to find the page_pool owning the page when returning
> pages back into page_pool:
> 1. When a page is added to the page_pool, an item is deleted from
>    pool->hold_items and set the 'pp_netmem' pointing to that page
>    and set item->state and item->pp_netmem accordingly in order to
>    keep track of that page, refill from pool->release_items when
>    pool->hold_items is empty or use the item from pool->slow_items
>    when fast items run out.
> 2. When a page is released from the page_pool, it is able to tell
>    which page_pool this page belongs to by masking off the lower
>    bits of the pointer to page_pool_item *item, as the 'struct
>    page_pool_item_block' is stored in the top of a struct page.
>    And after clearing the pp_item->state', the item for the
>    released page is added back to pool->release_items so that it
>    can be reused for new pages or just free it when it is from the
>    pool->slow_items.
> 3. When page_pool_destroy() is called, item->state is used to tell
>    if a specific item is being used/dma mapped or not by scanning
>    all the item blocks in pool->item_blocks, then item->netmem can
>    be used to do the dma unmmaping if the corresponding inflight
>    page is dma mapped.

You are making this incredibly complicated. You've basically implemented
a whole new slab allocator for those page_pool_item objects, and you're
tracking every page handed out by the page pool instead of just the ones
that are DMA-mapped. None of this is needed.

I took a stab at implementing the xarray-based tracking first suggested
by Mina[0]:

https://git.kernel.org/toke/c/e87e0edf9520

And, well, it's 50 lines of extra code, none of which are in the fast
path.

Jesper has kindly helped with testing that it works for normal packet
processing, but I haven't yet verified that it resolves the original
crash. Will post the patch to the list once I have verified this (help
welcome!).

-Toke

[0] https://lore.kernel.org/all/CAHS8izPg7B5DwKfSuzz-iOop_YRbk3Sd6Y4rX7KBG9DcVJcyWg@mail.gmail.com/


