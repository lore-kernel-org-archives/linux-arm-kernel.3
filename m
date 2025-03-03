Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD4C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOb1j+830+L2uc5mgMSRGFN3ViOd+N17QiffCrSYHk4=; b=vsqscB/MyXCByoWGGl8TxgrAuF
	0alVi6mHNbE4It+WjcJGa4rRduuzbv7djaYSTZ8LDNpSzyBQgx7bL1T0MsytoE0DIh7fPJN7GejtS
	VKqynNyPACB5MfjRL0IcvmHo8rFvuZdL8Inxbj10fiH/kCGB7Zo3MlUODIDjyNncfL3JqxxiczLEz
	ipBJOcRtg/sHyyj7nnn2DpBCXrlFkbLQJ1wBg8nKwRAYauIZqprmsPdE4MdYrb5D8HuhekVfr+Gsx
	dWxq3CCVgOyoGwTy3LpPEHwuE7dSHmKgNHF1L9Dm1nZtfE8HoWBZB38YuuWDOzftKJo0IzIWDEBsp
	8rgAXF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp45O-00000000aXd-09eT;
	Mon, 03 Mar 2025 11:35:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hX-00000000Tm8-4BG0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:13 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOb1j+830+L2uc5mgMSRGFN3ViOd+N17QiffCrSYHk4=;
	b=XmXWkKs18KvBgwCLec9sE2WfytIol8uBJMrocKvJVLbeiOYYi4FaLohlwg2bG4tNOaAosv
	u/weCBoaVG0JKctHLyYHHYK47Mta9LgUbpf0rB+op47Golj1hfJ7gkkO9lQY/w10+fEljY
	6IGSd4P7CBHQfRNt9LjCH12rYr/zg2eH74yz4kSq1iQYuVWyv+larEEmeu9Q8zFMVwfjvT
	EdLy6uzdF0kguXQpqZWK22VArwZdItGzGam4LCcMGiul8kd15o/sjXZ354UtlcWc5YvF/U
	U9/kOxK+C0JCRIoXNYKeQYQz8HNeaPGfZ4VWkdItWhdU4mCgDMHm1CbZ/OTTPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOb1j+830+L2uc5mgMSRGFN3ViOd+N17QiffCrSYHk4=;
	b=daDT/5PBEsCo5YvUqMaO/OFqg8j4UWG6U+YVX4tUUbVhnThgHXXAeFdxh16iUrDM7UiwNX
	eoviGFLDEC8Du5Bg==
Date: Mon, 03 Mar 2025 12:11:03 +0100
Subject: [PATCH 01/19] vdso: Introduce vdso/cache.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-1-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2031;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QicJWSkRxiGmzzoQ0Aniprry18vJY+DCMdz2bkhHj00=;
 b=GtEtpiK0bFbVap25sLkJQRfP4QgJXwKc/eEYZUJvPvc3sE2U4JP5GeW1CvH6eCUWZ4Gd03Xdo
 esTi0v4kjEwDDKsbHURqiM8BoZI6WHvtyKXGg9Tunv9JgZNVRL4XaXD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031112_176222_72E4EB48 
X-CRM114-Status: GOOD (  11.65  )
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

The vDSO implementation can only include headers from the vdso/
namespace. To enable the usage of ____cacheline_aligned from
the vDSO, move it and its dependencies into a new header vdso/cache.h.
Keep compatibility by including vdso/cache.h from linux/cache.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/cache.h |  9 +--------
 include/vdso/cache.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/linux/cache.h b/include/linux/cache.h
index ca2a05682a54b51af991154a99f57a00c88fc5a8..e69768f50d5327b874ba4bd56609300526511a69 100644
--- a/include/linux/cache.h
+++ b/include/linux/cache.h
@@ -3,16 +3,13 @@
 #define __LINUX_CACHE_H
 
 #include <uapi/linux/kernel.h>
+#include <vdso/cache.h>
 #include <asm/cache.h>
 
 #ifndef L1_CACHE_ALIGN
 #define L1_CACHE_ALIGN(x) __ALIGN_KERNEL(x, L1_CACHE_BYTES)
 #endif
 
-#ifndef SMP_CACHE_BYTES
-#define SMP_CACHE_BYTES L1_CACHE_BYTES
-#endif
-
 /**
  * SMP_CACHE_ALIGN - align a value to the L2 cacheline size
  * @x: value to align
@@ -63,10 +60,6 @@
 #define __ro_after_init __section(".data..ro_after_init")
 #endif
 
-#ifndef ____cacheline_aligned
-#define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
-#endif
-
 #ifndef ____cacheline_aligned_in_smp
 #ifdef CONFIG_SMP
 #define ____cacheline_aligned_in_smp ____cacheline_aligned
diff --git a/include/vdso/cache.h b/include/vdso/cache.h
new file mode 100644
index 0000000000000000000000000000000000000000..f89d48304bf8f101df581aee0e32a2efa9d2fb2d
--- /dev/null
+++ b/include/vdso/cache.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __VDSO_CACHE_H
+#define __VDSO_CACHE_H
+
+#include <asm/cache.h>
+
+#ifndef SMP_CACHE_BYTES
+#define SMP_CACHE_BYTES L1_CACHE_BYTES
+#endif
+
+#ifndef ____cacheline_aligned
+#define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
+#endif
+
+#endif	/* __VDSO_ALIGN_H */

-- 
2.48.1


