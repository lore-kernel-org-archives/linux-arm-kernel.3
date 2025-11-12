Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23603CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP8vjdYZDSobWILtLfZiQMWdEZEMU/+jU5eftNIaWJc=; b=piC0vi5gAUxpfFAuX6iqrTNTjP
	Kpt8H8XlfXvYtSqAfp6QZukSh480Xrzwgp6VSrvoh5InqEmogmxQXbIoXZblR62jnfKn7W5hfjqab
	9lBT+xAm2XlUltONyWdG0eZCGrXPEsDDgVej2T0PzsFDiwXWF/xGsJmIbwv7LRNl3taOcrsgGfkQZ
	kG9ArAWXIIr1q/0DnYnPR4bxzErAiczIrkWQ3UXJOIiMKdyNHc9rjRkzBKU/LXNJIAJxoxNNZSldG
	WbjrhIFxO6yFQRaTycIZ7OZyU/HI4g3+e5EEWLTesfzT4GKfTCQODRno1aSXD4WoXpHdkG7zsDg09
	hnHtYWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08Y-00000007zEj-0Hfe;
	Wed, 12 Nov 2025 01:59:06 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08R-00000007z9V-0JBO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:59:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DP8vjdYZDSobWILtLfZiQMWdEZEMU/+jU5eftNIaWJc=;
	b=I4H5FiXsckWGKiwWuQR7YErH3Rji7+fO7qkBrNGdRRFeAHv9JftjHulXLGSF9EJZYhFuf2Rv0
	rkhZI5AsoMZ9WjnEYveCtbpo237GjdS1FEeCFcU8u02B9uzb+SV5bAluJBXhQ/zpumjJeK08HSP
	2+IQfOFEbYkgz0himOw+HgA=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4d5mjz0drmzLlVP;
	Wed, 12 Nov 2025 09:57:11 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 11544140135;
	Wed, 12 Nov 2025 09:58:50 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:49 +0800
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
Subject: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
Date: Wed, 12 Nov 2025 09:58:44 +0800
Message-ID: <20251112015846.1842207-3-huangchenghai2@huawei.com>
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
X-CRM114-CacheID: sfid-20251111_175859_796630_66DFDBC6 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Weili Qian <qianweili@huawei.com>

Architectures like ARM64 already support 128-bit memory access. Currently,
device drivers implement atomic read and write operations for 128-bit
memory using assembly. This patch adds generic io{read,write}128 access
functions, which will enable device drivers to consistently use
io{read,write}128 for 128-bit access.

Signed-off-by: Weili Qian <qianweili@huawei.com>
Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
---
 include/asm-generic/io.h | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index ca5a1ce6f0f8..c419021318e6 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -146,6 +146,16 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #endif
 #endif /* CONFIG_64BIT */
 
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+#ifndef __raw_read128
+#define __raw_read128 __raw_read128
+static inline u128 __raw_read128(volatile void __iomem *addr)
+{
+	return *(const volatile u128 __force *)addr;
+}
+#endif
+#endif /* CONFIG_ARCH_SUPPORTS_INT128 */
+
 #ifndef __raw_writeb
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 value, volatile void __iomem *addr)
@@ -180,6 +190,16 @@ static inline void __raw_writeq(u64 value, volatile void __iomem *addr)
 #endif
 #endif /* CONFIG_64BIT */
 
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+#ifndef __raw_write128
+#define __raw_write128 __raw_write128
+static inline void __raw_write128(u128 value, volatile void __iomem *addr)
+{
+	*(volatile u128 __force *)addr = value;
+}
+#endif
+#endif /* CONFIG_ARCH_SUPPORTS_INT128 */
+
 /*
  * {read,write}{b,w,l,q}() access little endian memory and return result in
  * native endianness.
@@ -917,6 +937,22 @@ static inline u64 ioread64(const volatile void __iomem *addr)
 #endif
 #endif /* CONFIG_64BIT */
 
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+#ifndef ioread128
+#define ioread128 ioread128
+static inline u128 ioread128(const volatile void __iomem *addr)
+{
+	u128 val;
+
+	__io_br();
+	val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
+	__io_ar(val);
+
+	return val;
+}
+#endif
+#endif /* CONFIG_ARCH_SUPPORTS_INT128 */
+
 #ifndef iowrite8
 #define iowrite8 iowrite8
 static inline void iowrite8(u8 value, volatile void __iomem *addr)
@@ -951,6 +987,18 @@ static inline void iowrite64(u64 value, volatile void __iomem *addr)
 #endif
 #endif /* CONFIG_64BIT */
 
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+#ifndef iowrite128
+#define iowrite128 iowrite128
+static inline void iowrite128(u128 value, volatile void __iomem *addr)
+{
+	__io_bw();
+	__raw_write128((u128 __force)__cpu_to_le128(value), addr);
+	__io_aw();
+}
+#endif
+#endif /* CONFIG_ARCH_SUPPORTS_INT128 */
+
 #ifndef ioread16be
 #define ioread16be ioread16be
 static inline u16 ioread16be(const volatile void __iomem *addr)
-- 
2.33.0


