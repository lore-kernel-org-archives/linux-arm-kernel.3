Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06074CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCc5dWx94uDsgm2vFWLxYZQ8XDvd2PR/3FJli510E/M=; b=eoFQqCPUEeGtZuAIT3wLb+Z1Cj
	lev+1fvB5A0FCQwbekXKqqJogTgVEy3Ye4nQKzOkQTJVHCA68QEV1iS1Mlt9CiXb5vEJJZFMYCOQ4
	MobFKAbBz3fUOWNSH8kI6MZCnzadWJq5uKmpfDSlYeBVH4NFufnlrpUDF6dPTOUFx4tdKXoz5oY2s
	LvKmyLhX0BqxtNt0nAUnveGMObL148D2jTcmSY4SThdnOoCn/YaacRHjzdRYitoTkx8Z8gQZlorPM
	Qw5dgl+2ah5KiS1In6gJZbHf7Efoy8uWxo15UFXDiCZtG64UanHROQZF9axvbV37XVIqMcEnVRVzL
	9gIZb4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08X-00000007zEC-3Bkd;
	Wed, 12 Nov 2025 01:59:05 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08R-00000007z9q-0zsW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:59:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tCc5dWx94uDsgm2vFWLxYZQ8XDvd2PR/3FJli510E/M=;
	b=PnwF6rmirMI1fh3F7p/wUuUWStGvuLFd6zVfK8nN4P6HcA+7SBSNB0jxrIrnv+j11ssIUBAYF
	JCK1Dhonicifdg+BDsxdryvRM/CyJ8E1/v8GIHpyghBKi8g0oODdduDplwZSm5805dwgpH9nYsi
	qkBEg6cJAba5qna0I83UhFA=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4d5mk675b4znTXd;
	Wed, 12 Nov 2025 09:57:18 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 9890B1A0188;
	Wed, 12 Nov 2025 09:58:50 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:50 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:49 +0800
From: Chenghai Huang <huangchenghai2@huawei.com>
To: <arnd@arndb.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <andriy.shevchenko@linux.intel.com>,
	<herbert@gondor.apana.org.au>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: <fanghao11@huawei.com>, <shenyang39@huawei.com>, <liulongfang@huawei.com>,
	<qianweili@huawei.com>
Subject: [PATCH RFC 3/4] io-128-nonatomic: introduce io{read|write}128_{lo_hi|hi_lo}
Date: Wed, 12 Nov 2025 09:58:45 +0800
Message-ID: <20251112015846.1842207-4-huangchenghai2@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251112015846.1842207-1-huangchenghai2@huawei.com>
References: <20251112015846.1842207-1-huangchenghai2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200001.china.huawei.com (7.202.195.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_175859_792317_F52D6D6B 
X-CRM114-Status: GOOD (  11.75  )
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

From: Weili Qian <qianweili@huawei.com>

In order to provide non-atomic functions for io{read|write}128.
We define a number of variants of these functions in the generic
iomap that will do non-atomic operations.

These functions are only defined if io{read|write}128 are defined.
If they are not, then the wrappers that always use non-atomic operations
from include/linux/io-128-nonatomic*.h will be used.

Signed-off-by: Weili Qian <qianweili@huawei.com>
Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
---
 include/linux/io-128-nonatomic-hi-lo.h | 35 ++++++++++++++++++++++++++
 include/linux/io-128-nonatomic-lo-hi.h | 34 +++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 include/linux/io-128-nonatomic-hi-lo.h
 create mode 100644 include/linux/io-128-nonatomic-lo-hi.h

diff --git a/include/linux/io-128-nonatomic-hi-lo.h b/include/linux/io-128-nonatomic-hi-lo.h
new file mode 100644
index 000000000000..b5b083a9e81b
--- /dev/null
+++ b/include/linux/io-128-nonatomic-hi-lo.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_IO_128_NONATOMIC_HI_LO_H_
+#define _LINUX_IO_128_NONATOMIC_HI_LO_H_
+
+#include <linux/io.h>
+#include <asm-generic/int-ll64.h>
+
+static inline u128 ioread128_hi_lo(const void __iomem *addr)
+{
+	u32 low, high;
+
+	high = ioread64(addr + sizeof(u64));
+	low = ioread64(addr);
+
+	return low + ((u128)high << 64);
+}
+
+static inline void iowrite128_hi_lo(u128 val, void __iomem *addr)
+{
+	iowrite64(val >> 64, addr + sizeof(u64));
+	iowrite64(val, addr);
+}
+
+#ifndef ioread128
+#define ioread128_is_nonatomic
+#define ioread128 ioread128_hi_lo
+#endif
+
+#ifndef iowrite128
+#define iowrite128_is_nonatomic
+#define iowrite128 iowrite128_hi_lo
+#endif
+
+#endif	/* _LINUX_IO_128_NONATOMIC_HI_LO_H_ */
+
diff --git a/include/linux/io-128-nonatomic-lo-hi.h b/include/linux/io-128-nonatomic-lo-hi.h
new file mode 100644
index 000000000000..0448ee5a13de
--- /dev/null
+++ b/include/linux/io-128-nonatomic-lo-hi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_IO_128_NONATOMIC_LO_HI_H_
+#define _LINUX_IO_128_NONATOMIC_LO_HI_H_
+
+#include <linux/io.h>
+#include <asm-generic/int-ll64.h>
+
+static inline u128 ioread128_lo_hi(const void __iomem *addr)
+{
+	u64 low, high;
+
+	low = ioread64(addr);
+	high = ioread64(addr + sizeof(u64));
+
+	return low + ((u128)high << 64);
+}
+
+static inline void iowrite128_lo_hi(u128 val, void __iomem *addr)
+{
+	iowrite64(val, addr);
+	iowrite64(val >> 64, addr + sizeof(u64));
+}
+
+#ifndef ioread128
+#define ioread128_is_nonatomic
+#define ioread128 ioread128_lo_hi
+#endif
+
+#ifndef iowrite128
+#define iowrite128_is_nonatomic
+#define iowrite128 iowrite128_lo_hi
+#endif
+
+#endif	/* _LINUX_IO_128_NONATOMIC_LO_HI_H_ */
-- 
2.33.0


