Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B1FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 02:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl98tFGY+rPyC8FqJPKFVEBdvlsf0WDTKEQ63I8mg4k=; b=TlfBVW44uQYRuLtu6sC+UKe2+h
	jVIdPlr+6VW7WkTQWNcr0iY/u8ls2DdXkPGfDFMw5huMJ2Cn0o8pyM01VeAGWw+2idp/S+QJy+Hto
	9vmy2U84th4ZjYyECzuLo3Ky+BSkb++xP2GQPPnU5lQvgGZxWgzrReqxgT1YVTVRA8ljUyELTazut
	hg9RU3mHtxdfZuut7ySoNuCb5BbAq4kxolhWIwyYWXA/Smj4GuiurMSaHznFM9mfOH6xAn8bLhVNP
	YIC9KcEUVv/7qivNP2vairfwmtsYpC0/1dvCeZBrQhjkH0Kd89s3yLTcpv37GyXfyDTeUb+RJpVH1
	oducUk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKToH-00000006EcM-1QsP;
	Mon, 09 Dec 2024 02:47:45 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKTkD-00000006Dkk-0v2V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 02:43:35 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y65hT6ZTFz1T6l2;
	Mon,  9 Dec 2024 10:40:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 483AF14010C;
	Mon,  9 Dec 2024 10:43:21 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 10:43:19 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, James
 Morse <james.morse@arm.com>, Robin Murphy <robin.murphy@arm.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, Tong Tiangen <tongtiangen@huawei.com>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
Subject: [PATCH v13 1/5] uaccess: add generic fallback version of copy_mc_to_user()
Date: Mon, 9 Dec 2024 10:42:53 +0800
Message-ID: <20241209024257.3618492-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209024257.3618492-1-tongtiangen@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_184333_591999_E24384E6 
X-CRM114-Status: GOOD (  10.32  )
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

x86/powerpc has it's implementation of copy_mc_to_user(), we add generic
fallback in include/linux/uaccess.h prepare for other architechures to
enable CONFIG_ARCH_HAS_COPY_MC.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/powerpc/include/asm/uaccess.h | 1 +
 arch/x86/include/asm/uaccess.h     | 1 +
 include/linux/uaccess.h            | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..44476d66ed13 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -403,6 +403,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 
 	return n;
 }
+#define copy_mc_to_user copy_mc_to_user
 #endif
 
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 3a7755c1a441..3db67f44063b 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -497,6 +497,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
 
 unsigned long __must_check
 copy_mc_to_user(void __user *to, const void *from, unsigned len);
+#define copy_mc_to_user copy_mc_to_user
 #endif
 
 /*
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index e9c702c1908d..9d8c9f8082ff 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -239,6 +239,14 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
 }
 #endif
 
+#ifndef copy_mc_to_user
+static inline unsigned long __must_check
+copy_mc_to_user(void *dst, const void *src, size_t cnt)
+{
+	return copy_to_user(dst, src, cnt);
+}
+#endif
+
 static __always_inline void pagefault_disabled_inc(void)
 {
 	current->pagefault_disabled++;
-- 
2.25.1


