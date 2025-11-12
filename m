Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AF7CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NGVOMoFoiYK8NHpr6+aDzLHn4o8fKsUT+YnbH38cQc=; b=D8KZyc0loSWqdtWlqukU47LQyX
	2fyYcN1dKiqtjK8HnIpBSy/rQOohop6icWfu5U1AJvF0P2BWg9p9Td6szxGZh2eAvcyL4AwKkNNzS
	/Sru7AY3qfDK19es+rN2Ml5Anl1/iJNWqrUqaZxtAopJRdn6oa+EC6K0ORqU8iLLFeaHP5BR0Cqut
	JzOcEye70/ebx71aFrg7CbE4uFff9zW9o9J3Hn9Ag5txHYSyAwWIUekHJpY0XK7F4T3pZp1CWXMTh
	KSMVpd/TPRGfE6l90cegwWykv2t/DuAUoLdb+8Yf6g+HiguQnuoYtWi5OfOZtEkTTrI1S+utTB3Oh
	BgKm3VJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08X-00000007zDZ-1kvs;
	Wed, 12 Nov 2025 01:59:05 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08R-00000007z9b-2J7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:59:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4NGVOMoFoiYK8NHpr6+aDzLHn4o8fKsUT+YnbH38cQc=;
	b=nsgAEFK7w6R/ueKq5W+USJKU8iwoWNGUVqjvqa+ZGS+/mNxMTC2XtkOItgPGdbPyBZzreEtBP
	BigFrBS/NqJn1NH88gXlWhN3vXq/Axg5ukB+OJhCaJ2G+ArBtgrVNqfwWf02s4OU9tqm863zloE
	PNofJq0NuN8VJc6iyu1k1hg=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4d5mjz1D9Bz1prM1;
	Wed, 12 Nov 2025 09:57:11 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D5011400D9;
	Wed, 12 Nov 2025 09:58:51 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:50 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:50 +0800
From: Chenghai Huang <huangchenghai2@huawei.com>
To: <arnd@arndb.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <andriy.shevchenko@linux.intel.com>,
	<herbert@gondor.apana.org.au>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: <fanghao11@huawei.com>, <shenyang39@huawei.com>, <liulongfang@huawei.com>,
	<qianweili@huawei.com>
Subject: [PATCH RFC 4/4] arm64/io: Add {__raw_read|__raw_write}128 support
Date: Wed, 12 Nov 2025 09:58:46 +0800
Message-ID: <20251112015846.1842207-5-huangchenghai2@huawei.com>
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
X-CRM114-CacheID: sfid-20251111_175859_800205_93913658 
X-CRM114-Status: UNSURE (   9.19  )
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

Starting from ARMv8.4, stp and ldp instructions become atomic.
Currently, device drivers depend on 128-bit atomic memory IO access,
but these are implemented within the drivers. Therefore, this introduces
generic {__raw_read|__raw_write}128 function for 128-bit memory access.

Signed-off-by: Weili Qian <qianweili@huawei.com>
Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
---
 arch/arm64/include/asm/io.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 83e03abbb2ca..80430750a28c 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -50,6 +50,17 @@ static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
 }
 
+#define __raw_write128 __raw_write128
+static __always_inline void __raw_write128(u128 val, volatile void __iomem *addr)
+{
+	u64 low, high;
+
+	low = val;
+	high = (u64)(val >> 64);
+
+	asm volatile ("stp %x0, %x1, [%2]\n" :: "rZ"(low), "rZ"(high), "r"(addr));
+}
+
 #define __raw_readb __raw_readb
 static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
 {
@@ -95,6 +106,16 @@ static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 	return val;
 }
 
+#define __raw_read128 __raw_read128
+static __always_inline u128 __raw_read128(const volatile void __iomem *addr)
+{
+	u64 high, low;
+
+	asm volatile("ldp %0, %1, [%2]" : "=r" (low), "=r" (high) : "r" (addr));
+
+	return (((u128)high << 64) | (u128)low);
+}
+
 /* IO barriers */
 #define __io_ar(v)							\
 ({									\
-- 
2.33.0


