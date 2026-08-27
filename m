Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A231C61DDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUa7pS4OHibv7k1aZNkFDzTCnQ9Tn89o+Rildjw0B6k=; b=4LrcBMlwqGdCsi3UEJ+EZIcoUi
	k6Xc6LfqVl+XPI/uWamA/4s7O3CFWh9fl4OtBZlar6Wd7sKn3m47hDPg0L/SDAeNmWUIyZyiB9JE7
	XZV909bfBJSOl7DW8BpxWQVU0D7JDIB9cXKDgP5Z+rpKzgE6kl6rWPEMU6MR+6w3/OWyKbirpH1bX
	jj6XRLIeEbmfAzN3DSzkoN6up62jgpm12KC1puxdk5OxgHTL8SrsWJrRtvzl1+jFWTIYs1xdib2G4
	mDxylnZEl9cbLj/Kh/f8J0BvSA88SAG37LUOzEtQwQVHdSORufKzZS8j7RdPgr6e3iXiDJp3tQxy3
	s3B8aFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuP-00000004Jvr-47k8;
	Thu, 27 Aug 2026 16:24:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuH-00000004JkI-24Db
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fUa7pS4OHibv7k1aZNkFDzTCnQ9Tn89o+Rildjw0B6k=;
	b=CccpWaUsRgM2J3CMlge2JDc32pT8dih8KCHNscYv2r+jgWhSa/BbR/8RILkH8O5kbpzttbHXn
	6tbp/SC/chqJ3BbIXL3K7I04ctuktFcHeXy6i4fEkUR+lXXsoWpfO3tQGirIX0pTiGi04wxJ/z+
	pCpZ1bHP36L3Y9WHJC9YEtw=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KF5v67zHnH3h;
	Fri, 28 Aug 2026 00:24:01 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id D049140572;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
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
Subject: [RFC PATCH 15/18] arm64: add support of NUMA replication for ptdump
Date: Fri, 28 Aug 2026 00:11:55 +0800
Message-ID: <20260827161158.3618409-16-panov.nikita@huawei.com>
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
X-CRM114-CacheID: sfid-20260827_092449_715433_32002F00 
X-CRM114-Status: GOOD (  11.16  )
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
 arch/arm64/mm/ptdump.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 5a76c59b5ada..17c4de4b9b3e 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -18,6 +18,7 @@
 #include <linux/ptdump.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
@@ -328,7 +329,7 @@ static struct ptdump_info kernel_ptdump_info __ro_after_init = {
 	.mm		= &init_mm,
 };
 
-bool ptdump_check_wx(void)
+static bool ptdump_check_wx_pgd(struct mm_struct *mm, pgd_t *pgd)
 {
 	struct ptdump_pg_state st = {
 		.seq = NULL,
@@ -353,7 +354,7 @@ bool ptdump_check_wx(void)
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
+	ptdump_walk_pgd(&st.ptdump, mm, pgd);
 
 	if (st.wx_pages || st.uxn_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
@@ -367,6 +368,25 @@ bool ptdump_check_wx(void)
 	}
 }
 
+
+#ifdef CONFIG_KERNEL_REPLICATION
+bool ptdump_check_wx(void)
+{
+	bool res = false;
+	int nid;
+
+	for_each_memory_node(nid)
+		res |= ptdump_check_wx_pgd(&init_mm, per_node_pgd(&init_mm, nid));
+
+	return res;
+}
+#else
+bool ptdump_check_wx(void)
+{
+	return ptdump_check_wx_pgd(&init_mm, init_mm->pgd);
+}
+#endif
+
 static int __init ptdump_init(void)
 {
 	u64 page_offset = _PAGE_OFFSET(vabits_actual);
-- 
2.34.1


