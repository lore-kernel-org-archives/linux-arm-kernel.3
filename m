Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D850C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5euHgUF21bp60qTQigBwKjH4x6Qvg0qe8ONZJ9cd938=; b=sY+wesGf47KZXHGILc88TReg5i
	VEJ17oviIlb78+W6djE3t2HbrLSlHldD2QCxvW6eu9+Qra7MjppfBSbRjJE3uY7xLJAvB9JcL71+y
	yMHdihdvdwUHKz2DOWCXHDCwo9vkVXJXnNoafdHAR8y3iqw6QuMYJCHUzyExvx6zrEutANs5vWR0U
	RRbQk1MhABdsb8e/KSpw+t6HBUUg6Br9IuLRL3ekxXUVBwdHA+PrLLA0UfCU/ru1FPM27+VxvhQM2
	f0fQUqU11XG84Wvj3tN9/FuwFUgVnEPw3+X9eSjJ6FsaNL4CikveOeHBiqQmW/+nt5u9kPdGSywPN
	sLwch5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuQ-00000004Jxu-2ze5;
	Thu, 27 Aug 2026 16:24:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuI-00000004Jkj-1OwE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5euHgUF21bp60qTQigBwKjH4x6Qvg0qe8ONZJ9cd938=;
	b=2TvuhQxUFr+fy+TYSZfwfzt2uKWRPMUlYGvkIcqkpSYVM6SYMIi2cNT3oGpFWAEDEkYLVmcp3
	27DLLJT6/TOlAQbpxu6X1KM8Trmh2Y7QCzb+ecElRL9a3atlGgKwmDr08QkmlRpPCcLbQ5ati4P
	s1CxhEaZ6wolohHl03XhMkk=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KG1l3lzHnH3h;
	Fri, 28 Aug 2026 00:24:02 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 4117C40570;
	Fri, 28 Aug 2026 00:24:38 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 16/18] arm64: add kernel modules text and rodata replication support
Date: Fri, 28 Aug 2026 00:11:56 +0800
Message-ID: <20260827161158.3618409-17-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092450_540868_26C771C9 
X-CRM114-Status: UNSURE (   8.15  )
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
Reply-To: artem.kuzin@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/kernel/module.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..61f605f74d86 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -18,6 +18,7 @@
 #include <linux/moduleloader.h>
 #include <linux/random.h>
 #include <linux/scs.h>
+#include <linux/vmalloc.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
@@ -25,6 +26,16 @@
 #include <asm/sections.h>
 #include <asm/text-patching.h>
 
+#ifdef CONFIG_KERNEL_REPLICATION
+void module_replicate(void *ptr)
+{
+	gfp_t gfp_mask = GFP_KERNEL;
+
+	__vmalloc_node_replicate_range(ptr, gfp_mask,
+			PAGE_KERNEL, 0);
+}
+#endif /*CONFIG_KERNEL_REPLICATION*/
+
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
 	RELOC_OP_ABS,
-- 
2.34.1


