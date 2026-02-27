Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87FAFEFB6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZ+KV2h6m4qzDWrhyAkt/eZ63shs/vO3Sn+sWCB4kvg=; b=177IRGja1uwArC6diXfxClqlew
	w/+nief3kNrVEFVcL8NiMt5ghqSqJZMG5Et0BSbCpCxKyEfy10cmAA+nqy8yEetqIuQy20YWwhhAB
	sx7hItBA/0SClxkXuy3WWcOrSY9CEG2yXp9OryihzUKZGsZCAjhHE3yksEMJ1ckbrSv+F2YF5Obia
	XqQ4KimzuOGKefggmFrsr7+LuiCa3uDQGWfEtOTeHDNR7QQzniFFuRjTOdHFdjMjVwaLYLTQC3gJr
	g0UVmLFNff2MNZvXfWojv4HPGZPc96SHro3y78ddRV0bcyqmd8H0QN28kGVbIaS0kQ130Zyf6U12w
	XO0PTEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw085-00000008ga9-0yzD;
	Fri, 27 Feb 2026 15:51:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw083-00000008ga3-3foM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7D6260122;
	Fri, 27 Feb 2026 15:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732B6C19422;
	Fri, 27 Feb 2026 15:51:45 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH] arm64: Silence sparse warnings caused by the type casting in (cmp)xchg
Date: Fri, 27 Feb 2026 15:51:42 +0000
Message-ID: <20260227155142.1332743-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The arm64 xchg/cmpxchg() wrappers cast the arguments to (unsigned long)
prior to invoking the static inline functions implementing the
operation. Some restrictive type annotations (e.g. __bitwise) lead to
sparse warnings like below:

sparse warnings: (new ones prefixed by >>)
   fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t

Force the casting in the arm64 xchg/cmpxchg() wrappers to silence
sparse.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602230947.uNRsPyBn-lkp@intel.com/
Link: https://lore.kernel.org/r/202602230947.uNRsPyBn-lkp@intel.com/
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/cmpxchg.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index d7a540736741..6cf3cd6873f5 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -91,8 +91,9 @@ __XCHG_GEN(_mb)
 #define __xchg_wrapper(sfx, ptr, x)					\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__ret = (__typeof__(*(ptr)))					\
-		__arch_xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
+	__ret = (__force __typeof__(*(ptr)))				\
+		__arch_xchg##sfx((__force unsigned long)(x), (ptr),	\
+				  sizeof(*(ptr)));			\
 	__ret;								\
 })
 
@@ -175,9 +176,10 @@ __CMPXCHG_GEN(_mb)
 #define __cmpxchg_wrapper(sfx, ptr, o, n)				\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__ret = (__typeof__(*(ptr)))					\
-		__cmpxchg##sfx((ptr), (unsigned long)(o),		\
-				(unsigned long)(n), sizeof(*(ptr)));	\
+	__ret = (__force __typeof__(*(ptr)))				\
+		__cmpxchg##sfx((ptr), (__force unsigned long)(o),	\
+				(__force unsigned long)(n),		\
+				sizeof(*(ptr)));			\
 	__ret;								\
 })
 

