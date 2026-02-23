Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4DEA4FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1Pyr+PuAUEvSin3Lid3+3iEaebJRuWaK1nzHUHfvJU=; b=DfDECx1CTYSGdCZKaiybfkup0M
	5EAhzDwR9DiV8B/2JPV5S4A3Gbv3PrRJxNjwa6Iy0I856BWjM9gB4lIj5HLod05YCK6BgjtKrQ//d
	kDpEP9f7TyFZuoLM8UIOJTLEeIdvZ/WCB1Wc5/El4fLosi0g72xI4PCV6c7Oua8MB8LKnsNqqArOv
	dff8XP5U/74BpyVKBjtooHt0YaWzVGejEiWLuHU+BbDGjSn/tYSiLv51XoQs+7ZEVq2q7k64aJChU
	X6RmDZhHLHhH07UcZWeeIZ+eg0HhiyqWrlcGY4Kz6AeluSKNwUIbAYXmN7iSgXIplMeaxruILx31N
	LU0R3BMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXhx-00000000Ydj-0bwQ;
	Mon, 23 Feb 2026 15:18:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXhv-00000000YdE-2anp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 15:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J1Pyr+PuAUEvSin3Lid3+3iEaebJRuWaK1nzHUHfvJU=; b=gA3K3dpbvNeInnLOTbSUFfNzCk
	vPBhNWwpfU9pwz3ungRZAi+0kDBTW7+HlajkgAuzelgB35eHW4qJMZ/XT7NMJwhh6i4aEEG86hLDC
	wphXKrrK/pCSZ3FGitimdei46DCTcVXjuaJJ3B1dINPRgs4o89lseU5XRUeOW2FNXUk5XiRw0iy0k
	3qAYDbQOJU/9hWwa0Lev89Ab88AFMCS50dPGzo/vizsHkxdlae4U83TaISx8Jmbf/oGOcIMmV2K+v
	i/VqdKip2dCvMGB9HwAtFHPgXybj/HsfEiIfN6AXECswAAQSzFa7ImnmQGi1fV2dmaXf4purfk2Yf
	EQcUmUng==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXhq-0000000Ef0a-351E;
	Mon, 23 Feb 2026 15:18:42 +0000
Date: Mon, 23 Feb 2026 15:18:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Pedro Falcato <pfalcato@suse.de>, lsf-pc@lists.linux-foundation.org,
	ryan.roberts@arm.com, catalin.marinas@arm.com, will@kernel.org,
	ardb@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <aZxv0mEd2BA3Mq-N@casper.infradead.org>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <yfe2xbb6qwthg3cf4yr7zszpw5o3mx2v4bv32iwnm7yzxqjsvl@et22s2nuwzzk>
 <a778d249-afea-4488-b045-beff3492a48a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a778d249-afea-4488-b045-beff3492a48a@arm.com>
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

On Mon, Feb 23, 2026 at 10:37:55AM +0530, Dev Jain wrote:
> I didn't understand the reclaimable reference, but yes we need to make this efficient.

this goes over 80 columns so much and so often, it's painful to read.
so i didn't.

> So for the above example I gave, native_set_ptes knows the virtual address to set -
> walking the native hierarchy from native_pgd->native_pmd->native_pte (in case of 64K native
> geometry) is inefficient. So we need to maintain a lookup mechanism from a linux pgtable
> pointer to the native pgtable pointer.
> The idea we have currently is to store such lookup in the struct ptdesc of the pagetable page.
> For 4K Linux pagetable and 64K native pagetable, 512M/2M = 256 Linux PTE tables correspond
> to different sections of the native PTE table. We will maintain the pointer to the relevant
> section in the native PTE table, in the struct ptdesc of the pagetable page of the Linux
> PTE table.
> The other case is that a single Linux pgtable leaf entry corresponds to multiple native
> leaf entries - take the case of a Linux PMD table which maps 1G of memory, this corresponds
> to 2 native PTE tables (2 x 512M). We will have to store a list of pointers here.
> 
> >
> 

