Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89856CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/UDRl9BMLfs0CKENJ0GOFGKfYZDsP8slcWL7SSEwds=; b=incLJSbNXGD3mI2FnJxTgDsppK
	lePuWogto3uRMRpCw/qUhtH6Wk59tBQqR3l9Z1t7FoxUa4Fc5K3FpCfpZWoY/z1o/gph+RY1p8slK
	7QGTSLzYGHGlfKfgjGgYjGtvpXZhH1nmsxlrN/Ej4/RWQOJnlt4j+RqKb1p2qjo2198DuIy8LOYab
	uLNQ8HjtmLouAscdYHbV69C4J+g0+CaiDnFTvQPG7MDgXj1VfHWmi67o5NaIBn0rNt8okOjuSCWlg
	rU0Qx6/1bww2BdscWFFFrzSm7RSgQYg6zORMjVnCfEy75telOSyvZNC3U0uMdhRMohfgnCJruylKL
	y2Hq0SPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W5B-00000008Zip-2gvG;
	Mon, 22 Sep 2025 02:15:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W55-00000008Zb4-28YV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:15:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cVRQk377Jz2CgD2;
	Mon, 22 Sep 2025 10:10:22 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id E560118001B;
	Mon, 22 Sep 2025 10:14:59 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Sep 2025 10:14:59 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<linmiaohe@huawei.com>, <nao.horiguchi@gmail.com>,
	<rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>, <nathan@kernel.org>,
	<ebiggers@kernel.org>, <arnd@arndb.de>, <rostedt@goodmis.org>,
	<kees@kernel.org>, <dave@vasilevsky.ca>, <peterz@infradead.org>
CC: <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <xieyuanbin1@huawei.com>
Subject: [RFC PATCH 2/2] ARM: memory-failure: not select RAS and MEMORY_ISOLATION
Date: Mon, 22 Sep 2025 10:14:53 +0800
Message-ID: <20250922021453.3939-2-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922021453.3939-1-xieyuanbin1@huawei.com>
References: <20250922021453.3939-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_191507_705405_DC56E1B8 
X-CRM114-Status: GOOD (  11.71  )
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

For memory-failure on ARM, these features do not seem necessary.

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 mm/Kconfig          | 4 ++--
 mm/memory-failure.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 034a1662d8c1..22eefc4747d5 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -742,22 +742,22 @@ config DEFAULT_MMAP_MIN_ADDR
 	  This value can be changed after boot using the
 	  /proc/sys/vm/mmap_min_addr tunable.
 
 config ARCH_SUPPORTS_MEMORY_FAILURE
 	bool
 
 config MEMORY_FAILURE
 	depends on MMU
 	depends on ARCH_SUPPORTS_MEMORY_FAILURE
 	bool "Enable recovery from hardware memory errors"
-	select MEMORY_ISOLATION
-	select RAS
+	select MEMORY_ISOLATION if !ARM
+	select RAS if !ARM
 	help
 	  Enables code to recover from some memory failures on systems
 	  with MCA recovery. This allows a system to continue running
 	  even when some of its memory has uncorrected errors. This requires
 	  special hardware support and typically ECC memory.
 
 config HWPOISON_INJECT
 	tristate "HWPoison pages injector"
 	depends on MEMORY_FAILURE && DEBUG_KERNEL && PROC_FS
 	select PROC_PAGE_MONITOR
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index a24806bb8e82..83b77caf41a1 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1271,21 +1271,23 @@ static void update_per_node_mf_stats(unsigned long pfn,
 	++mf_stats->total;
 }
 
 /*
  * "Dirty/Clean" indication is not 100% accurate due to the possibility of
  * setting PG_dirty outside page lock. See also comment above set_page_dirty().
  */
 static int action_result(unsigned long pfn, enum mf_action_page_type type,
 			 enum mf_result result)
 {
+#ifdef CONFIG_RAS
 	trace_memory_failure_event(pfn, type, result);
+#endif
 
 	if (type != MF_MSG_ALREADY_POISONED) {
 		num_poisoned_pages_inc(pfn);
 		update_per_node_mf_stats(pfn, result);
 	}
 
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
 	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
-- 
2.48.1


