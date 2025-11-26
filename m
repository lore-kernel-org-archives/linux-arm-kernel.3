Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F5D10F20
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W8o25AgxlH7+QfG+oBNtnz+caoBjyY/46T5x0IbzoA=; b=42hMNxdHtehH3OTOdVpZBO7M2W
	Q7JFcHdx2w6yWZtJkaB/isNFsDbKUpIiwt6AaESQyoB4MMn7O8Yne17EppXZinoNLKjJYE/Ejhoxp
	7+SR539kIfHsqI4qOZQMXqXGEHzu7VsxmQVlFJZXuyJ9I22+c4EKakVe1EhPMPI+3le2olZ1RcYvt
	b8DJ8F8uKf6yTEIe47rf63sAgQ3FU4AdAc6ddkYEYhlM9FLGxsiC5C0vPZXzqLoWPMlPiAMRSvknk
	0kpCHzY8u5g920h0n6HHXPwyxr578xokUP8kzRlj7VR/NgL6fJ43qrIDd+93PlQh1jDa1iXcXSIml
	Mo8dhn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCdD-0000000ElrX-234Z;
	Wed, 26 Nov 2025 10:20:15 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCd9-0000000ElqH-3tuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:20:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2W8o25AgxlH7+QfG+oBNtnz+caoBjyY/46T5x0IbzoA=;
	b=QOGngWyEjKE5fIOkMZ4ZzNmhm9Kt3raoRFvaQqZDm1WGvTsyHX9qRgZGqkUpoRf0XbJ+f0ZfR
	4EqnI/1bMACbWGKqNZlrC/p0PG7FqiaboykSHoIUlg+/Mm9UrzfGywp0oAUJcouN+4RhfK9p2C6
	rHwRpL6RxVypSEOp3AfFg88=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dGb9Y2z67zKmVm;
	Wed, 26 Nov 2025 18:18:09 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 018A8180043;
	Wed, 26 Nov 2025 18:19:58 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 26 Nov 2025 18:19:57 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <jack@suse.cz>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <nico@fluxnic.net>,
	<akpm@linux-foundation.org>, <hch@lst.de>, <jack@suse.com>,
	<wozizhi@huaweicloud.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<lilinjie8@huawei.com>, <liaohua4@huawei.com>, <wangkefeng.wang@huawei.com>,
	<pangliyuan1@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad() with rcu read lock held
Date: Wed, 26 Nov 2025 18:19:52 +0800
Message-ID: <20251126101952.174467-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_022012_729409_220DBFBB 
X-CRM114-Status: GOOD (  17.93  )
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

When the path is initialized with LOOKUP_RCU flag in path_init(), the
rcu read lock will be acquired. Inside the rcu critical section,
load_unaligned_zeropad() may be called. According to the comments of
load_unaligned_zeropad(), when loading the memory, a page fault may be
triggered in the very unlikely case.

On arm32/arm64, a page fault may cause the current thread to sleep inside
mmap_read_lock_killable(). If CONFIG_DEBUG_ATOMIC_SLEEP=y, the following
warning will be triggered:
```log
[   16.243462] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1559
[   16.245271] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 68, name: test
[   16.246219] preempt_count: 0, expected: 0
[   16.246582] RCU nest depth: 1, expected: 0
[   16.247262] CPU: 0 UID: 0 PID: 68 Comm: test Not tainted 6.18.0-rc6-next-20251124 #28 PREEMPT
[   16.247432] Hardware name: Generic DT based system
[   16.247549] Call trace:
[   16.247618]  unwind_backtrace from show_stack+0x10/0x14
[   16.248442]  show_stack from dump_stack_lvl+0x50/0x5c
[   16.248458]  dump_stack_lvl from __might_resched+0x174/0x188
[   16.248475]  __might_resched from down_read_killable+0x18/0x10c
[   16.248490]  down_read_killable from mmap_read_lock_killable+0x24/0x84
[   16.248504]  mmap_read_lock_killable from lock_mm_and_find_vma+0x164/0x18c
[   16.248516]  lock_mm_and_find_vma from do_page_fault+0x1d4/0x4a0
[   16.248529]  do_page_fault from do_DataAbort+0x30/0xa8
[   16.248549]  do_DataAbort from __dabt_svc+0x44/0x60
[   16.248597] Exception stack(0xf0b41da0 to 0xf0b41de8)
[   16.248675] 1da0: c20b34f0 c3f23bf8 00000000 c389be50 f0b41e90 00000501 61c88647 00000000
[   16.248698] 1dc0: 80808080 fefefeff 2f2f2f2f eec51ffd c3219088 f0b41df0 c066d3e4 c066d218
[   16.248705] 1de0: 60000013 ffffffff
[   16.248736]  __dabt_svc from link_path_walk+0xa8/0x444
[   16.248752]  link_path_walk from path_openat+0xac/0xe18
[   16.248764]  path_openat from do_filp_open+0x94/0x134
[   16.248775]  do_filp_open from do_sys_openat2+0x9c/0xf0
[   16.248785]  do_sys_openat2 from sys_openat+0x80/0xa0
[   16.248806]  sys_openat from ret_fast_syscall+0x0/0x4c
[   16.248814] Exception stack(0xf0b41fa8 to 0xf0b41ff0)
[   16.248825] 1fa0:                   00000000 00000000 ffffff9c beb27d0c 00000242 000001b6
[   16.248834] 1fc0: 00000000 00000000 000c543c 00000142 00027e85 00000002 00000002 00000000
[   16.248841] 1fe0: beb27c20 beb27c0c 0006ea80 00072e78
[   16.923450] ------------[ cut here ]------------
[   16.923630] WARNING: kernel/rcu/tree_plugin.h:332 at rcu_note_context_switch+0x408/0x610, CPU#0: test/68
[   16.924780] Voluntary context switch within RCU read-side critical section!
[   16.924887] Modules linked in:
[   16.925670] CPU: 0 UID: 0 PID: 68 Comm: test Tainted: G        W           6.18.0-rc6-next-20251124 #28 PREEMPT
[   16.926120] Tainted: [W]=WARN
[   16.926257] Hardware name: Generic DT based system
[   16.926474] Call trace:
[   16.926487]  unwind_backtrace from show_stack+0x10/0x14
[   16.926899]  show_stack from dump_stack_lvl+0x50/0x5c
[   16.927318]  dump_stack_lvl from __warn+0xf8/0x200
[   16.927696]  __warn from warn_slowpath_fmt+0x180/0x208
[   16.928060]  warn_slowpath_fmt from rcu_note_context_switch+0x408/0x610
[   16.928768]  rcu_note_context_switch from __schedule+0xe4/0xa58
[   16.928917]  __schedule from schedule+0x70/0x124
[   16.929197]  schedule from schedule_preempt_disabled+0x14/0x20
[   16.929514]  schedule_preempt_disabled from rwsem_down_read_slowpath+0x26c/0x4e4
[   16.929875]  rwsem_down_read_slowpath from down_read_killable+0x58/0x10c
[   16.930320]  down_read_killable from mmap_read_lock_killable+0x24/0x84
[   16.930761]  mmap_read_lock_killable from lock_mm_and_find_vma+0x164/0x18c
[   16.931101]  lock_mm_and_find_vma from do_page_fault+0x1d4/0x4a0
[   16.931354]  do_page_fault from do_DataAbort+0x30/0xa8
[   16.931649]  do_DataAbort from __dabt_svc+0x44/0x60
[   16.931862] Exception stack(0xf0b41d88 to 0xf0b41dd0)
[   16.932063] 1d80:                   c3219088 eec5dffd f0b41ec0 00000002 c3219118 00000010
[   16.933732] 1da0: c321913c 00000002 00007878 c2da86c0 00000000 00000002 b8009440 f0b41ddc
[   16.934019] 1dc0: eec5dffd c0677300 60000013 ffffffff
[   16.934294]  __dabt_svc from __d_lookup_rcu+0xc4/0x10c
[   16.934468]  __d_lookup_rcu from lookup_fast+0xa0/0x190
[   16.934720]  lookup_fast from path_openat+0x154/0xe18
[   16.934953]  path_openat from do_filp_open+0x94/0x134
[   16.935141]  do_filp_open from do_sys_openat2+0x9c/0xf0
[   16.935384]  do_sys_openat2 from sys_openat+0x80/0xa0
[   16.935547]  sys_openat from ret_fast_syscall+0x0/0x4c
[   16.935799] Exception stack(0xf0b41fa8 to 0xf0b41ff0)
[   16.936007] 1fa0:                   00000000 00000000 ffffff9c beb27d0c 00000242 000001b6
[   16.936293] 1fc0: 00000000 00000000 000c543c 00000142 00027e85 00000002 00000002 00000000
[   16.936624] 1fe0: beb27c20 beb27c0c 0006ea80 00072e78
[   16.936780] ---[ end trace 0000000000000000 ]---
```

Add pagefault_disable() to handle this situation.

Fixes: b9a50f74905a ("ARM: 7450/1: dcache: select DCACHE_WORD_ACCESS for little-endian ARMv6+ CPUs")

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Co-developed-by: Liyuan Pang <pangliyuan1@huawei.com>
---
On latest linux-next source, using arm32's multi_v7_defconfig, and
setting CONFIG_PREEMPT=y, CONFIG_DEBUG_ATOMIC_SLEEP=y, CONFIG_KFENCE=y,
CONFIG_ARM_PAN=n, then run the following testcase:
```c
static void *thread(void *arg)
{
	while (1) {
		void *p = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);

		assert(p != (void *)-1);
		__asm__ volatile ("":"+r"(p)::"memory");

		munmap(p, 4096);
	}
}

int main()
{
	pthread_t th;
	int ret;
	char path[4096] = "/tmp";

	for (size_t i = 0; i < 2044; ++i) {
		strcat(path, "/x");
		ret = mkdir(path, 0755);
		assert(ret == 0 || errno == EEXIST);
	}
	strcat(path, "/xx");

	assert(strlen(path) == 4095);

	assert(pthread_create(&th, NULL, thread, NULL) == 0);

	while (1) {
		FILE *fp = fopen(path, "wb+");

		assert(fp);
		fclose(fp);
	}
	return 0;
}
```
The might sleep warning will be triggered immediately.

Another possible solution: call pagefault_disable() after rcu_read_lock()
and call pagefault_enable() before rcu_read_unlock(). Inside path_init()
and leave_rcu(). However, this solution has a relatively large scope of
page fault disabling.

 fs/dcache.c | 10 ++++++++--
 fs/namei.c  |  7 +++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 23d1752c29e6..154195909f07 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -264,23 +264,29 @@ fs_initcall(init_fs_dcache_sysctls);
  */
 static inline int dentry_string_cmp(const unsigned char *cs, const unsigned char *ct, unsigned tcount)
 {
 	unsigned long a,b,mask;
 
+	pagefault_disable();
 	for (;;) {
 		a = read_word_at_a_time(cs);
 		b = load_unaligned_zeropad(ct);
 		if (tcount < sizeof(unsigned long))
 			break;
-		if (unlikely(a != b))
+		if (unlikely(a != b)) {
+			pagefault_enable();
 			return 1;
+		}
 		cs += sizeof(unsigned long);
 		ct += sizeof(unsigned long);
 		tcount -= sizeof(unsigned long);
-		if (!tcount)
+		if (!tcount) {
+			pagefault_enable();
 			return 0;
+		}
 	}
+	pagefault_enable();
 	mask = bytemask_from_count(tcount);
 	return unlikely(!!((a ^ b) & mask));
 }
 
 #else
diff --git a/fs/namei.c b/fs/namei.c
index 4ac7ff8e3a40..b04756e58ca3 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2304,10 +2304,11 @@ static inline unsigned int fold_hash(unsigned long x, unsigned long y)
  */
 unsigned int full_name_hash(const void *salt, const char *name, unsigned int len)
 {
 	unsigned long a, x = 0, y = (unsigned long)salt;
 
+	pagefault_disable();
 	for (;;) {
 		if (!len)
 			goto done;
 		a = load_unaligned_zeropad(name);
 		if (len < sizeof(unsigned long))
@@ -2316,10 +2317,11 @@ unsigned int full_name_hash(const void *salt, const char *name, unsigned int len
 		name += sizeof(unsigned long);
 		len -= sizeof(unsigned long);
 	}
 	x ^= a & bytemask_from_count(len);
 done:
+	pagefault_enable();
 	return fold_hash(x, y);
 }
 EXPORT_SYMBOL(full_name_hash);
 
 /* Return the "hash_len" (hash and length) of a null-terminated string */
@@ -2328,18 +2330,20 @@ u64 hashlen_string(const void *salt, const char *name)
 	unsigned long a = 0, x = 0, y = (unsigned long)salt;
 	unsigned long adata, mask, len;
 	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
 
 	len = 0;
+	pagefault_disable();
 	goto inside;
 
 	do {
 		HASH_MIX(x, y, a);
 		len += sizeof(unsigned long);
 inside:
 		a = load_unaligned_zeropad(name+len);
 	} while (!has_zero(a, &adata, &constants));
+	pagefault_enable();
 
 	adata = prep_zero_mask(a, adata, &constants);
 	mask = create_zero_mask(adata);
 	x ^= a & zero_bytemask(mask);
 
@@ -2357,17 +2361,19 @@ static inline const char *hash_name(struct nameidata *nd,
 {
 	unsigned long a, b, x, y = (unsigned long)nd->path.dentry;
 	unsigned long adata, bdata, mask, len;
 	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
 
+	pagefault_disable();
 	/*
 	 * The first iteration is special, because it can result in
 	 * '.' and '..' and has no mixing other than the final fold.
 	 */
 	a = load_unaligned_zeropad(name);
 	b = a ^ REPEAT_BYTE('/');
 	if (has_zero(a, &adata, &constants) | has_zero(b, &bdata, &constants)) {
+		pagefault_enable();
 		adata = prep_zero_mask(a, adata, &constants);
 		bdata = prep_zero_mask(b, bdata, &constants);
 		mask = create_zero_mask(adata | bdata);
 		a &= zero_bytemask(mask);
 		*lastword = a;
@@ -2383,10 +2389,11 @@ static inline const char *hash_name(struct nameidata *nd,
 		HASH_MIX(x, y, a);
 		len += sizeof(unsigned long);
 		a = load_unaligned_zeropad(name+len);
 		b = a ^ REPEAT_BYTE('/');
 	} while (!(has_zero(a, &adata, &constants) | has_zero(b, &bdata, &constants)));
+	pagefault_enable();
 
 	adata = prep_zero_mask(a, adata, &constants);
 	bdata = prep_zero_mask(b, bdata, &constants);
 	mask = create_zero_mask(adata | bdata);
 	a &= zero_bytemask(mask);
-- 
2.51.0


