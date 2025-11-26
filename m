Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4022AD10390
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SYrF8vtHOzZA8g/R+xrV1eMlzbnF/Fjt++a/NVV0g2s=; b=sfZrj4WMbGjsm+Au9A5V0sUE0q
	a5sKYUs0foBReSK6XqL3ukL4lmFpOyPiPWIe+V+dR5DXgBEn/jUAuHVsHk7coOXUy4C6MDBYmvo3X
	uelrthuLlUBH6U9HPbEZEFwBZ4LjiIyNiF9+YykEntErI2/2Cr9EKpl5HxGhw1FfRwxxM6aqSJa8i
	fHwYz966+P+RLYjxHJJXtGY/wgJgtaEcjYYHU2pAc5ZAshypSSAC5YZGgWzk9G2ZE54tkDF/rbYuC
	ANu1/56zysyDPyufGh2ZRQr638kYEZI0fmX1r3XE1wgUlJmsFxdVdAdD9Xq7OJtSZg06i5dRSojru
	iam8FHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBcA-0000000Eh8V-1MIb;
	Wed, 26 Nov 2025 09:15:06 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBc5-0000000Eh5f-02ag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:15:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dGYld5F9BzKHMxB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:14:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 480201A0F8C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:14:44 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.129])
	by APP4 (Coremail) with SMTP id gCh0CgAXQV4DxSZpUsJHCA--.59425S4;
	Wed, 26 Nov 2025 17:14:44 +0800 (CST)
From: Zizhi Wo <wozizhi@huaweicloud.com>
To: jack@suse.com,
	brauner@kernel.org,
	hch@lst.de,
	akpm@linux-foundation.org,
	linux@armlinux.org.uk
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	wozizhi@huawei.com,
	yangerkun@huawei.com,
	wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com,
	xieyuanbin1@huawei.com
Subject: [Bug report] hash_name() may cross page boundary and trigger sleep in RCU context
Date: Wed, 26 Nov 2025 17:05:05 +0800
Message-Id: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAXQV4DxSZpUsJHCA--.59425S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW7Jr45Ww1xtF1rury5XFb_yoW5JFWrpr
	45CryYkrZxZryrZr10ka9IgFyYyayUGr43Grs2qryUua1agF1avF48ta4Y9r9Iqr1DWa9r
	Wrs09wn7uw1q9FUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4I
	kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7Cj
	xVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUoEfOUUUUU
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_011501_399031_AB6C0DD6 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

We're running into the following issue on an ARM32 platform with the linux
5.10 kernel:

[<c0300b78>] (__dabt_svc) from [<c0529cb8>] (link_path_walk.part.7+0x108/0x45c)
[<c0529cb8>] (link_path_walk.part.7) from [<c052a948>] (path_openat+0xc4/0x10ec)
[<c052a948>] (path_openat) from [<c052cf90>] (do_filp_open+0x9c/0x114)
[<c052cf90>] (do_filp_open) from [<c0511e4c>] (do_sys_openat2+0x418/0x528)
[<c0511e4c>] (do_sys_openat2) from [<c0513d98>] (do_sys_open+0x88/0xe4)
[<c0513d98>] (do_sys_open) from [<c03000c0>] (ret_fast_syscall+0x0/0x58)
...
[<c0315e34>] (unwind_backtrace) from [<c030f2b0>] (show_stack+0x20/0x24)
[<c030f2b0>] (show_stack) from [<c14239f4>] (dump_stack+0xd8/0xf8)
[<c14239f4>] (dump_stack) from [<c038d188>] (___might_sleep+0x19c/0x1e4)
[<c038d188>] (___might_sleep) from [<c031b6fc>] (do_page_fault+0x2f8/0x51c)
[<c031b6fc>] (do_page_fault) from [<c031bb44>] (do_DataAbort+0x90/0x118)
[<c031bb44>] (do_DataAbort) from [<c0300b78>] (__dabt_svc+0x58/0x80)
...

During the execution of hash_name()->load_unaligned_zeropad(), a potential
memory access beyond the PAGE boundary may occur. For example, when the
filename length is near the PAGE_SIZE boundary. This triggers a page fault,
which leads to a call to do_page_fault()->mmap_read_trylock(). If we can't
acquire the lock, we have to fall back to the mmap_read_lock() path, which
calls might_sleep(). This breaks RCU semantics because path lookup occurs
under an RCU read-side critical section. In linux-mainline, arm/arm64
do_page_fault() still has this problem:

lock_mm_and_find_vma->get_mmap_lock_carefully->mmap_read_lock_killable.

And before commit bfcfaa77bdf0 ("vfs: use 'unsigned long' accesses for
dcache name comparison and hashing"), hash_name accessed the name byte by
byte.

To prevent load_unaligned_zeropad() from accessing beyond the valid memory
region, we would need to intercept such cases beforehand? But doing so
would require replicating the internal logic of load_unaligned_zeropad(),
including handling endianness and constructing the correct value manually.
Given that load_unaligned_zeropad() is used in many places across the
kernel, we currently haven't found a good solution to address this cleanly.

What would be the recommended way to handle this situation? Would
appreciate any feedback and guidance from the community. Thanks!


