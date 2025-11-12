Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3587DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI+shLkJDKP9R9FfeV7amQ3F21U8McCYPl060RXsF6s=; b=IKwLcIMKKI9n+8z8u2QD8CfTIT
	hqLs8sVKjNaWq4Ge3jorC5+E3eq0gISSFl+k1Zsfk5R2dJ9p6/UZTD6eVK+hHYMnutJKVt75L9dGQ
	eGVosBCcZ3Ewbi+7kDpVeORKJIyfVjfnTs+7o2/Vipm8zMb/3ltgi7nWvVSMCwP/UbL5XZxHVGVpw
	o0EciLyRPGAKL4tzGFnA8A6PclDsmRzbk1cLiKhIkd3bFHkWETbXjQq00MbtDiOTqYMgvJLaP2nMY
	fQ9pyKPmHoW1kAKcxC5oFE4fe03mN+kW5+7DmTfcotxmkFKLeQIbTnVUFbB7I8kp2OvwPxbSuEV41
	cjQSLYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08U-00000007zBf-14a1;
	Wed, 12 Nov 2025 01:59:02 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08R-00000007z9k-11Pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:59:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yI+shLkJDKP9R9FfeV7amQ3F21U8McCYPl060RXsF6s=;
	b=X6AmB1TgFNTa6XtAjH1xMk95R+gRIPwso7WvfB00LQM7JQa+5LFCIbkXRJq9/OzVFeyfs2INg
	I10eYgoZNuBnxKDS+KEZC+gHaV1dyhKTI8zw9CBXFptqDB9FIeayEBY5aLLfO2NjrS4MLJYbKml
	riib1ZHqWsETQJUaT4rhGvI=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4d5mkG4hQvz1T4Fs;
	Wed, 12 Nov 2025 09:57:26 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 81DFC1400E3;
	Wed, 12 Nov 2025 09:58:49 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:49 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:48 +0800
From: Chenghai Huang <huangchenghai2@huawei.com>
To: <arnd@arndb.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <andriy.shevchenko@linux.intel.com>,
	<herbert@gondor.apana.org.au>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: <fanghao11@huawei.com>, <shenyang39@huawei.com>, <liulongfang@huawei.com>,
	<qianweili@huawei.com>
Subject: [PATCH RFC 1/4] UAPI: Introduce 128-bit types and byteswap operations
Date: Wed, 12 Nov 2025 09:58:43 +0800
Message-ID: <20251112015846.1842207-2-huangchenghai2@huawei.com>
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
X-CRM114-CacheID: sfid-20251111_175859_793437_FC5A4F66 
X-CRM114-Status: UNSURE (   9.79  )
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

Architectures like ARM64 support 128-bit integer types and
operations. This patch adds a generic byte order conversion
interface for 128-bit.

Signed-off-by: Weili Qian <qianweili@huawei.com>
Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
---
 include/uapi/linux/byteorder/big_endian.h    |  6 ++++++
 include/uapi/linux/byteorder/little_endian.h |  6 ++++++
 include/uapi/linux/swab.h                    | 10 ++++++++++
 include/uapi/linux/types.h                   |  3 +++
 4 files changed, 25 insertions(+)

diff --git a/include/uapi/linux/byteorder/big_endian.h b/include/uapi/linux/byteorder/big_endian.h
index 80aa5c41a763..318d51a18f43 100644
--- a/include/uapi/linux/byteorder/big_endian.h
+++ b/include/uapi/linux/byteorder/big_endian.h
@@ -29,6 +29,12 @@
 #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
 #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
+
+#ifdef __SIZEOF_INT128__
+#define __cpu_to_le128(x) ((__force __le128)__swab128((x)))
+#define __le128_to_cpu(x) __swab128((__force __u128)(__le128)(x))
+#endif
+
 #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
 #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
diff --git a/include/uapi/linux/byteorder/little_endian.h b/include/uapi/linux/byteorder/little_endian.h
index cd98982e7523..b2732452b825 100644
--- a/include/uapi/linux/byteorder/little_endian.h
+++ b/include/uapi/linux/byteorder/little_endian.h
@@ -29,6 +29,12 @@
 #define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
 #define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
+
+#ifdef __SIZEOF_INT128__
+#define __cpu_to_le128(x) ((__force __le128)(__u128)(x))
+#define __le128_to_cpu(x) ((__force __u128)(__le128)(x))
+#endif
+
 #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
 #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index 01717181339e..7381b9a785ce 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -133,6 +133,16 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
 	__fswab64(x))
 #endif
 
+#ifdef __SIZEOF_INT128__
+static inline __attribute_const__ __u128 __swab128(__u128 val)
+{
+	__u64 h = val >> 64;
+	__u64 l = val;
+
+	return (((__u128)__swab64(l)) << 64) | ((__u128)(__swab64(h)));
+}
+#endif
+
 static __always_inline unsigned long __swab(const unsigned long y)
 {
 #if __BITS_PER_LONG == 64
diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index 48b933938877..9624ea43cd8a 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -40,6 +40,9 @@ typedef __u32 __bitwise __be32;
 typedef __u64 __bitwise __le64;
 typedef __u64 __bitwise __be64;
 
+#ifdef __SIZEOF_INT128__
+typedef __u128 __bitwise __le128;
+#endif
 typedef __u16 __bitwise __sum16;
 typedef __u32 __bitwise __wsum;
 
-- 
2.33.0


