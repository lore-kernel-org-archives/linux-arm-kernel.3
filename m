Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E82C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxQ1ovDyhvvGVyJA8vX4ADWtfoejcpKh9n/5W0S+X/0=; b=rUdQbY//mzIqRwwIxcwCHJR3tN
	bqJfo7ykpbztuj3/GYpEzbuKohgL6R5VIjHaFCf8oG+vfyLra8+cCXvsYSlbwgLdlGNKL0bOGNRSM
	VO9NXeExZfnghVLm+8v8p8R8gdxK2g51vLF9bdjueXeTTp2wlfzHnnLFJBLiAvmbqv2YAmNddiQUm
	x7m3IqrUhmt1JRSVLD46Tja5F4WYDE/BWzI4vdMZtWSrRW1qfStxt2LlHrIKLjU+FFquX0wt6dbLl
	B5ScAsH1UbqFEBfCVhN4kPHaEb4mHJFg+Tx/7ht0juxzJTrkNRDL6UNo5BgspARnFh05ltKXu5J1J
	fEoz2dGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSbj-00000006LDl-48QX;
	Sat, 11 Jul 2026 07:58:43 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSbg-00000006LCg-1Qi6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 07:58:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pxQ1ovDyhvvGVyJA8vX4ADWtfoejcpKh9n/5W0S+X/0=;
	b=LGE0hMkPdeowF8yD213VC9YiTyviyT/M2oD99py9EoMELuo+yzb2Xxzktwdl1yL2SwXYpkxDo
	ZfyuWXDn3tnB2Uww9HSLUma2+9wm+SWtuOJrVOmJZOsit9u7nuBfzLvdMSRySwDTU5is/OS6IU5
	CkHnKcQ0jpUQziohLwrrmRQ=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gy17J3HW1zpSvB;
	Sat, 11 Jul 2026 15:49:32 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id D4A41203C1;
	Sat, 11 Jul 2026 15:58:17 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 11 Jul 2026 15:58:16 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <ljs@kernel.org>, <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mhocko@suse.com>, <rppt@kernel.org>,
	<sunnanyong@huawei.com>, <surenb@google.com>, <vbabka@kernel.org>,
	<wangkefeng.wang@huawei.com>, <xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Sat, 11 Jul 2026 15:56:51 +0800
Message-ID: <20260711075651.3114-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <alHnqsIdcMghnUER@lucifer>
References: <alHnqsIdcMghnUER@lucifer>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_005840_540515_201B60AE 
X-CRM114-Status: GOOD (  15.38  )
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

On Sat, 11 Jul 2026 08:27:23 +0100, Lorenzo Stoakes wrote:
> In general yeah but with mmap_write_trylock() after you add the attached
> patch to a series (making sure to cc- the right people etc.)... but also,
> wouldn't you just generally want this in show_pte()?
>
> Seems to me best way is to put the existing show_pte() into a __show_pte()
> and then do show_pte() like (untested top of my head thing):
>
> void show_pte(const char *lvl, struct mm_struct *mm, unsigned long addr,
> 	      bool is_user)
> {
> 	/* Write lock needed to account for concurrent downgraded munmap(). */
> 	if (is_user && !mmap_write_trylock(mm)) {
> 		printk("%s[%08lx] unable to acquire lock for PTE output\n",
> 			lvl, addr);
> 		return;
> 	}
> 	__show_pte(lvl, mm, addr);
> 	if (is_user)
> 		mmap_write_unlock(mm);
> }

For user faults, I think we don't need to worry about deadlock issues.

As Russell King described, deadlock problems can only occur in kernel faults.
On Tue, 7 Jul 2026 16:34:21 +0100, Russell King wrote:
> Unconditionally taking the lock could lead to a deadlock. Consider
> the case where the mmap lock is held, and we get an unrecognised
> abort from the kernel.

As we never return to user mode with mmap lock held, so for user faults,
it is safe to acquire mmap lock. This is just the same with the syscall
entry of `pkey_alloc`, we immediately acquire the mmap write lock:
Link: https://elixir.bootlin.com/linux/v7.2-rc2/source/mm/mprotect.c#L1011

For the kernel, the user faults entry and the system call entry are not
fundamentally different; they are both kernel entry points.

