Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E3C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLJ7so2eQ04eUxA7uRgkuQiNgLyO0A/w5Eo0GY7ooL8=; b=AVsG5P+4tj6CYsrK/0yoxIz9dA
	hRP86ze2wvk19EpDAjB11XFp8ENDLKttof4T+js7igudpgJPHpEOjD5NGtYgXkjkJ2WYUx4rb4J29
	mr+XlqIQPadBd4DiVHyiT5yTNQm/742lEYylRqqsTMt5Xl8+YxgQckMDlaQ0midBuf1ZlZH1+H9Vk
	M89RMlxS2zPNqyJAFDxYhGAwvUUav7k0hu351X/6YT6RGi4V0BwL6p1BDS5DdfAE300ONqIDdIaxq
	2pGfcloH93PUHV/BbdM3GSywfu/IXixomzmlPz6WWakpjR6uQnsR99SfK5DGp+qdgUhmXgo9ne9I8
	F/kdaurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OIX-0000000CAbw-20SJ;
	Tue, 01 Sep 2026 13:13:09 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OIQ-0000000CAUZ-0ffV;
	Tue, 01 Sep 2026 13:13:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bLJ7so2eQ04eUxA7uRgkuQiNgLyO0A/w5Eo0GY7ooL8=;
	b=xTyBELc/cInYBPOUaTwt3ILOfZ8Pf1/HI1d647R/Wj1c7mrsUsFgGo6dMICOPm6/A2FvA1OPa
	OLpDQ8pLDW77LCeJ/wMWwQZwTA8vs7oqYp02u/NAFMCA1JTKhXa+1DFZkbttwNYqEJRvMcS+5Dk
	X8P9UZhgp21LbdrV9BHtios=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hZ5bz1vPzz1prLc;
	Tue,  1 Sep 2026 21:02:07 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E33440579;
	Tue,  1 Sep 2026 21:12:58 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:12:57 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 8/8] jffs2: add runtime toggle for write verification
Date: Tue, 1 Sep 2026 21:05:49 +0800
Message-ID: <20260901130549.1761342-9-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
References: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_061302_552664_D9CC72A0 
X-CRM114-Status: GOOD (  12.43  )
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

Write verification is a diagnostic facility that adds read-back
overhead to every write. In production, this overhead is undesirable
unless fault isolation is required.

Add a module parameter jffs2.write_verify (bool, 0644) that defaults
to off when CONFIG_JFFS2_FS_WRITE_VERIFY is enabled. The verification
entry checks READ_ONCE(jffs2_write_verify) and returns immediately
when disabled, avoiding any overhead. The parameter can be toggled at
runtime via /sys/module/jffs2/parameters/write_verify or set at
boot/modprobe time.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/Kconfig  |  8 ++++++++
 fs/jffs2/writev.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index 556025a5d438..03dadbd003cd 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -61,6 +61,14 @@ config JFFS2_FS_WRITE_VERIFY
 	  tell transport/program-time corruption from post-commit media
 	  damage.
 
+	  Verification defaults to off when this option is selected and can
+	  be enabled at runtime via sysfs:
+
+	    /sys/module/jffs2/parameters/write_verify
+
+	  Write 0 to disable, 1 to enable.  Boot/modprobe parameter
+	  jffs2.write_verify=0|1 is also supported.
+
 	  If unsure, say 'N'.
 
 config JFFS2_SUMMARY
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index 604a14bb5710..342c413be95c 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -9,12 +9,32 @@
  *
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
 #ifdef CONFIG_JFFS2_FS_WRITE_VERIFY
+/*
+ * Optional read-back after writes.
+ *
+ * Catch cases where data is corrupted after node CRCs are calculated but
+ * before it is correctly programmed -- e.g. in RAM or during DMA/bus
+ * transfer to the flash controller -- so mtd_write() succeeds while the
+ * medium does not match the in-memory image.
+ *
+ * Runtime toggle: /sys/module/jffs2/parameters/write_verify
+ * (also boot/modprobe: jffs2.write_verify=0|1)
+ */
+static bool jffs2_write_verify;
+module_param_named(write_verify, jffs2_write_verify, bool, 0644);
+MODULE_PARM_DESC(write_verify,
+		 "Verify flash writes by reading back (default: N)");
+
+
 int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
 			      uint32_t ofs, size_t len)
 {
@@ -23,6 +43,9 @@ int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
 	char *eccstr;
 	void *verify_buf;
 
+	if (!READ_ONCE(jffs2_write_verify))
+		return 0;
+
 	verify_buf = kmalloc(len, GFP_NOFS | __GFP_NOWARN);
 	if (!verify_buf) {
 		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
-- 
2.52.0


