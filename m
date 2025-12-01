Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6355DD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FsYgFk9Of/KaHaE3G7n35bOsZK1dunOkMncY90kpyw=; b=VvA8ElyZswhckAB1r+qDOliLpr
	iBghB+jdO4LBS7yriNnW/ZBzMy70naM+eO/IV7iv+xWqHWWwWE67cpoIMQC6JA5yKpkahWYZ39fCX
	TGvQ0/WueSIG5TaCYHvR4NwQ2uUOfU8aCTIA38Yj+rcotSCsBnrIaF42qaauC49kfI9W6hUhC9m6i
	Q/97TBaCr0LFE6pKUvqjk/PNRE9PIf7aFjSiiRvxnZfFESZeBLtLJWPMcwEaO3opzl4yjzCUfZOWa
	NhqcTtp2nLCxunumnOHpqQ3C2SEGplMV28nP3hASV5I/ojnvX4CXv5uBQGUtDn37QCG2i5T7+5Wfn
	Kbg+oCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6gN-00000004Ff9-3da4;
	Mon, 01 Dec 2025 16:23:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6gM-00000004Fe8-0kUT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7B8D60147;
	Mon,  1 Dec 2025 16:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA41C116C6;
	Mon,  1 Dec 2025 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764606200;
	bh=jI2Xz4swv6NzW7KPu/IKp1XhNPCIaDL+QjuUHyw6uMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G/UhbdjW1d6DsPOsCmlw/Bj6lJAQvrgkme7H+SyraTkDoDtpuBjPOsXxArXqlssHg
	 0v2N6siQfR2ubsRPSVCPKwAo7iW0u8+OdDzyuKvy1gHZOi5jtOE4GlV5ivPNGcuCkl
	 EQDv9/ZLuxLihV+nFOgNdccm9PFjsmgbMV7QZ8TqfnA08c+fu36yE0lyfNZXMMFnHJ
	 BkQZJR+2JUkl/r9a7VhDDrtf5uNmCZwkoZkFYPpMWRozZ1h4JBD9BPE4KlBo7vWRXa
	 4l19T5HvXfe/uwJlvzonEI8gj85nfj/ZZ+YxIPMRxLcy4ui/Sv73sTE6Qncbu15OlU
	 haES3TV6LehVg==
Message-ID: <341d1aed-13ad-41ee-ad30-487c5baec399@kernel.org>
Date: Mon, 1 Dec 2025 17:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] support batched checks of the references for large
 folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/25/25 01:56, Baolin Wang wrote:
> Currently, folio_referenced_one() always checks the young flag for each PTE
> sequentially, which is inefficient for large folios. This inefficiency is
> especially noticeable when reclaiming clean file-backed large folios, where
> folio_referenced() is observed as a significant performance hotspot.
> 
> Moreover, on Arm architecture, which supports contiguous PTEs, there is already
> an optimization to clear the young flags for PTEs within a contiguous range.
> However, this is not sufficient. We can extend this to perform batched operations
> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
> 
> By supporting batched checking of the young flags and flushing TLB entries,
> I observed a 33% performance improvement in my file-backed folios reclaim tests.

Can you point at the benchmark or briefly explain what it does? What 
exactly are we measuring that improves by 33%?

-- 
Cheers

David

