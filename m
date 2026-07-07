Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D96C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeqnHolqvupennIplS/D4Qb+nQEYOXtCZ3+bQBmewjM=; b=MHuqE7G9JBwV3SGrSCmR6S55te
	amd1ZO9pSE44eR3mBrMgSvUZHa2iZNqeBZVWfKQdJSi2AJWwtg2Yt+QWvQI124NXw4Ax692j/+rUn
	Bh3i1TuTS1nuyH2Kdlho5K7EisfqDbayTvzlyw1xFjHQvgMEHvIITJZCVLBRrE/rigAMr3QsWQlgG
	TLmFiTkyzMiCBV0NPC5tBu4+Bj86ddVT/tb91+fRJfuXB/324nYeoTqxmIS/kfgWLkoXe9XQg9Tff
	HLoogHJXKb79WOV65BKE64E84GP1h/FX2zQS41xbBHi6GL4vl/3qoosctR5rerWpfBWT5VB12kst9
	ureGfFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5yP-0000000F4Ck-4BO9;
	Tue, 07 Jul 2026 13:36:30 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5yM-0000000F4C1-2Zo0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:36:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CeqnHolqvupennIplS/D4Qb+nQEYOXtCZ3+bQBmewjM=;
	b=kzUQhfS+Yha6KTVB71IH4oQNliXnuHIxjb7QbikBcuJQ1e90X15E/8xiPk9OHFFsYPVpMTRh8
	vwqru0MUTzMLyOyMlOfSid/mVaEO6idW5xcCgADL+S6r5bkZFGn58cmJejv9vvIXulBD/i0FSqL
	/uagqyWiR+QnE6LFO11sPY4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gvhpZ2DPDzLlTZ;
	Tue,  7 Jul 2026 21:27:02 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id CE7D0402AB;
	Tue,  7 Jul 2026 21:36:15 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 7 Jul 2026 21:36:15 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <ljs@kernel.org>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <mhocko@suse.com>,
	<rppt@kernel.org>, <sunnanyong@huawei.com>, <surenb@google.com>,
	<vbabka@kernel.org>, <xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Tue, 7 Jul 2026 21:35:27 +0800
Message-ID: <20260707133527.81833-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akzgsZi6aKCFWg_U@lucifer>
References: <akzgsZi6aKCFWg_U@lucifer>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_063626_954680_C38D4E53 
X-CRM114-Status: GOOD (  24.56  )
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

On Tue, 7 Jul 2026 13:46:19 +0100, Lorenzo Stoakes wrote:
> On Mon, Jul 06, 2026 at 09:32:47PM +0800, Xie Yuanbin wrote:
>> I have read this article:
>> Link: https://docs.kernel.org/mm/process_addrs.html
>> `mmap_read_lock(&init_mm)` should be able to ensure that the kernel
>> address's page tables can be traversed. But I'm not quite sure if
>
> I added a section specifically about this -
>
> https://docs.kernel.org/mm/process_addrs.html#traversing-non-vma-page-tables
>
> But note:
>
> "Since, aside from vmalloc and memory hot plug, kernel page tables are not torn
> down all that often - this usually suffices, however any caller of this
> functionality must ensure that any additionally required locks are acquired in
> advance."
>
> With the latter part being particularly important - you really need to be sure
> you aren't going to be raced on page table teardown by anything.
>
> However:
>
> 	* You're safe from vmalloc trying to install a huge page table (only way
>	  it removes intermediate page tables) since !HAVE_ARCH_HUGE_VMAP.
>
>	* And since arm32 !ARCH_ENABLE_MEMORY_HOTPLUG you're safe from that too
>          :)
>
> (Really I think you should be using walk_page_range_debug() here ultimately but
> that's a future refactor).
>
> BUT see below:
>
>> `mmap_read_lock(&current->mm)` provides protection for user-space non-VMA
>> addresses?
>
> OK so this _does_ need addressing, and I covered it in the document:
>
>	We also permit a truly unusual case is the traversal of non-VMA ranges
>	in userland ranges, as provided for by walk_page_range_debug().
>
>	We must take great care in this case, as the munmap() implementation
>	detaches VMAs under an mmap write lock before tearing down page tables
>	under a downgraded mmap read lock.
>
>	This means such an operation could race with this, and thus an mmap
>	write lock is required.
>
> I.e. you need a write lock.

Thank you very much for your reply. Now I fully understand: to traverse
the page tables of non-VMA addr in user address space, the mmap write
lock is required.

But I still want like to ask a question:
> However:
>
> 	* You're safe from vmalloc trying to install a huge page table (only way
> 	  it removes intermediate page tables) since !HAVE_ARCH_HUGE_VMAP.
>
>	* And since arm32 !ARCH_ENABLE_MEMORY_HOTPLUG you're safe from that too
>          :)

If (just hypothetically), the ARM32 architecture supports huge pages
and memory hotplug, what kind of lock do I need to safely traverse the
page tables of non-VMA addr in kernel space?

Thanks again.

