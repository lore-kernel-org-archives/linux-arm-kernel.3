Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48419CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sMF6qJo2WiodKPx7sdGCoYC5r7NLvAxgI7YX4vFUwiU=; b=Ml2HNPaLUTzc8oXEDukZSp/Dn/
	BhCqfpWcBbuHtM6BCx0n9yLYt6beEHjhGBiEgXrcWFOMlrNfgOCvo5M9Jt9/QmHMlUAgUYu7DDjIA
	NphZ8GLmhDa/RrxtVBabaI5DhxNyDsm72wztAeivxQ7kq6SPjX3wHwD9pBRX7JDNOVJXS/fKXkGXj
	Sqx6sHXEj3afQUzI3D7qrU5mAKkU1LhkoYWYyMrQfonDn/VtpE5Mk5xHtmB91MBJK1L1Y+l5swzvM
	FJCy0p1+Zb6QXcqUuvMVolp+4W6eQovjDx/EABRi7zIxbupzcIwuzgECZrXkYKW5JOSccRQGC0Awc
	coZFrPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W5G-00000008ZmI-00Z5;
	Mon, 22 Sep 2025 02:15:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W54-00000008ZX9-3GUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:15:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cVRWh4ccPz14MPw;
	Mon, 22 Sep 2025 10:14:40 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E99C1401E9;
	Mon, 22 Sep 2025 10:14:59 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Sep 2025 10:14:58 +0800
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
Subject: [RFC PATCH 1/2] ARM: mm: support memory-failure
Date: Mon, 22 Sep 2025 10:14:52 +0800
Message-ID: <20250922021453.3939-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_191506_971215_45FFA5F5 
X-CRM114-Status: GOOD (  14.13  )
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

Memory failure provides the ability of soft offline pages,
which is very useful to handle the memory errors such as CE in ECC.

Although ARM does not have a user interface like
`/sys/devices/system/memory/soft_offline_page`, memory-failure still
provides some exported func that can be used by some module ko driver.

Memory-failure will use one page flag (PG_hwpoison). For historical
versions, this will cause the page flags to exceed the 32-bit limit
(when CONFIG_SPARSEMEM and CONFIG_HIGHMEM are both enabled),
and therefore it cannot be enabled.

The following commit:
commit 09022bc196d2 ("mm: remove PG_error")
removes a page flag, so memory-failure can now be launched on ARM now.

The core codes of memory-failure is architecture independent, in fact,
it has performed well in current testing. Perhaps it can also be enabled
on other 32-bit architectures(like x86, and it seems that it can already
be enabled on 32-bit parisc architecture), but I haven't tested it yet.

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5527935fd15a..b38c194a5cc4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -149,20 +149,21 @@ config ARM
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC
 	select RTC_LIB
 	select SPARSE_IRQ if !(ARCH_FOOTBRIDGE || ARCH_RPC)
 	select SYS_SUPPORTS_APM_EMULATION
 	select THREAD_INFO_IN_TASK
 	select TIMER_OF if OF
 	select HAVE_ARCH_VMAP_STACK if MMU && ARM_HAS_GROUP_RELOCS
 	select TRACE_IRQFLAGS_SUPPORT if !CPU_V7M
 	select USE_OF if !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
+	select ARCH_SUPPORTS_MEMORY_FAILURE
 	# Above selects are sorted alphabetically; please add new ones
 	# according to that.  Thanks.
 	help
 	  The ARM series is a line of low-power-consumption RISC chip designs
 	  licensed by ARM Ltd and targeted at embedded applications and
 	  handhelds such as the Compaq IPAQ.  ARM-based PCs are no longer
 	  manufactured, but legacy ARM-based PC hardware remains popular in
 	  Europe.  There is an ARM Linux project with a web page at
 	  <http://www.arm.linux.org.uk/>.
 
-- 
2.48.1


