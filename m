Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB16EC531E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4clD1oP+RWxauJpYxliVouI9jYTcopF0KjBePvbepCQ=; b=DMalRVQap4bizwwrX3ledIBCN7
	yx1p4JLGFTCfpVuj3QSEzxH3PWBTzcSDp4UCyTRJPpMDA2mhbveo/nmhFGBV4pz0LdYSk18VkHo/0
	MUpxlFU7ZTNb1IDXutdqL365+gIlW1GuA6qzH7eP6+sXCnY/BdddTF9Sedeurqpcrms6nMl7Gih5y
	tFfKNCXgrkqHn7hksPJASakp/x4AqHTgLH2QglDKgoGBY1rcOTPQ3rldbmWrlfMq3zMNvaRGgbv4O
	BxLDXC8EPDp2rvbpuIAEnssxKV+uK48pMbg0N4Su8x47qiR1i+JeeADDQQDLdeiySQCSNcbcalxeP
	P8OGy2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtISH-0000000DGMO-0AaX;
	Fri, 20 Feb 2026 04:49:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtISG-0000000DGMI-2XML
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Feb 2026 04:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4clD1oP+RWxauJpYxliVouI9jYTcopF0KjBePvbepCQ=; b=alnItKrQeL0jz+SXvBVy2yrBfV
	ETTDZ1canePb7Wo8Vqq9zkt0Q5N39V7OXESlFgJ1Rp3fIHPbUcDAseuJAa/iUoOa2fUHXTJAneivS
	INhMs6GHhA41oaTyxypNK4OjIkEdsiCb9D9aI4WLxA2parzkcdBpiw4o7rdQC1DgvR98dp4q6NK0V
	UN7uSInq5YMlafZpC5ogUCYrBPbcQ7MBocFzr6N8g0/gW/DmiTDttUzDcMmAGBx1ddMYpEdloltvh
	oATOhh0s1XEssJk708Q3VKXE2V6IoKhgkeeHc34SaE5cHdo+4y5vivCn7iqelWZpoQO1eyrFe+ilW
	CI5aCxMg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtISB-00000008roY-0Sne;
	Fri, 20 Feb 2026 04:49:23 +0000
Date: Fri, 20 Feb 2026 04:49:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, lsf-pc@lists.linux-foundation.org,
	ryan.roberts@arm.com, catalin.marinas@arm.com, will@kernel.org,
	ardb@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <aZfn0tbKl_1JD-VM@casper.infradead.org>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <aZSHvt9Trlq7k7aH@casper.infradead.org>
 <2e68ef61-dcf2-46b2-913f-14980a104faf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e68ef61-dcf2-46b2-913f-14980a104faf@kernel.org>
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

On Tue, Feb 17, 2026 at 04:30:59PM +0100, David Hildenbrand (Arm) wrote:
> In a private conversation I also raised that some situations might make it
> impossible/hard to drop+re-read.
> 
> One example I cam up with if a folio is simply long-term R/O pinned. But I
> am also not quite sure how mlock might interfere here.
> 
> So yes, I think the page cache is likely the one of the most
> problematic/messy thing to handle.

So what if we convert to max-supported-order the first time somebody
calls mmap on a given file?  Most files are never mmaped, so it won't
affect them.  And files that are mmaped are generally not written to.
So there should not be much in the page cache for the common case.
And if no pages from the file have been mmaped yet, they cannot be pinned
or mlocked.

