Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9BAC5DF6C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 02:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PA4g+OizJfvmA1hw/8Ly+KG50OSh6AJCc/e9UEFcmA=; b=PqtbG+H+CtDTtvRXdSWFNVjMtL
	hxMPRYQ1UnJuPjBMdJh65BhzZM5EUn8i5MZ8acZberGYJFyU9pNQwUjVwB5/q6wMu5lKq2JqiLLI8
	2rwSs0Ppc0ingR+2EPpEexRI8dRUgZ61GkexHWUByyudgq3/+GWJIUhA2IAqaWi8tZzEO0BWsnbgH
	vzvIhZhfcgZ2Hn3V9bcgiwVsVtmgxulD38BGnA8cPBC12LXi4C7rAQileq0wuHzCqmVb5iOm9zZll
	80z9wRUBIa6m5H/uI72Eg/w5zwzC1HoP9TVh8ObxnPZbJRzopmRQu1DpBlOzOQ7umi/NDnXRz83qF
	UzbbS6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtdBH-0000000FmYY-1J7o;
	Sat, 21 Feb 2026 02:57:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtdBE-0000000FmY1-33Ym
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 02:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EDEE4337A;
	Sat, 21 Feb 2026 02:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14ACC116C6;
	Sat, 21 Feb 2026 02:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771642635;
	bh=buzl7XCbiE0HKuN/EHltr1H5QGDZ7uUTl2HJnM9XAIs=;
	h=From:To:Cc:Subject:Date:From;
	b=K4NpRXAxaBntZBzb+6eLLRghUZ1jM/GNerPhzwztJlCbfcw2P96P8o03n4bA5i1Vp
	 NEZEk3n81qY39+5mN1B1gweV7EKao0fiDRhXUAhg/6cITGj8APVUGG3dbql57Q3QDQ
	 qfimMB8hCHpLH7i0J6T5OVwW3O2nIISzj+cfd17J5oM15UinyOWIrv5X6xmbrSFdoU
	 yYa8ovpCJHn1v8wyTIe/In25jdGIgMeRezUgNStPZcv/OQugqzstNfuhS8FdFqktgP
	 WCoUMTLCMTHUv+LaKQNoCK3EbI+Y5cgywPLMW55zFOUQQuRqZACM3u9ZJKQHSSL/S6
	 RIAXJHtB7t+Fw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: make runtime const not usable by modules
Date: Sat, 21 Feb 2026 10:38:47 +0800
Message-ID: <20260221023847.3506-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_185716_781974_8080CF08 
X-CRM114-Status: UNSURE (   9.31  )
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

Similar as commit 284922f4c563 ("x86: uaccess: don't use runtime-const
rewriting in modules") does, make arm64's runtime const not usable by
modules too, to "make sure this doesn't get forgotten the next time
somebody wants to do runtime constant optimizations". The reason is
well explained in the above commit: "The runtime-const infrastructure
was never designed to handle the modular case, because the constant
fixup is only done at boot time for core kernel code."

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/include/asm/runtime-const.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
index be5915669d23..c3dbd3ae68f6 100644
--- a/arch/arm64/include/asm/runtime-const.h
+++ b/arch/arm64/include/asm/runtime-const.h
@@ -2,6 +2,10 @@
 #ifndef _ASM_RUNTIME_CONST_H
 #define _ASM_RUNTIME_CONST_H
 
+#ifdef MODULE
+  #error "Cannot use runtime-const infrastructure from modules"
+#endif
+
 #include <asm/cacheflush.h>
 
 /* Sigh. You can still run arm64 in BE mode */
-- 
2.51.0


