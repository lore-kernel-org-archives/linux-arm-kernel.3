Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD26C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9CB1eehJp33uQ6ZyBgYv4OdqX54PvqopF73lDTzJBeE=; b=SXF2hXdVqJowHYqfSFdb39U71p
	AqxIG6qSwKPRS80U9+b1D81NmF62TDSBxBBpZI1uI95kEvI2Dtfpz2N5TdakrGoDmHkcub0WIXTGN
	rhnsNgfTxxgjr7ufv/MTGBqOHWhshHTuW52KfzZ49SFclksu844dXS7jwDiHttwWnP/3WTUiE1lgT
	9Ipo3Q5G3VAU61sMDJiBtCG98hBzTNlYpLXU8UzUTVIKS+tfpf97Oi6xCbp3SbOcZ7rnD81hzIRPD
	0ZnEQPuYRicSVDPnmRhI/lGjNoVSFYckoDlyw4PU5FvLGlPz0I4AQv512nexsXIuhXKLNsBXV6kua
	+9A38/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt4z-0000000EJjN-495V;
	Thu, 23 Jul 2026 13:03:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt4y-0000000EJip-2BE9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:03:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B376360A62;
	Thu, 23 Jul 2026 13:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0501F000E9;
	Thu, 23 Jul 2026 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784811791;
	bh=9CB1eehJp33uQ6ZyBgYv4OdqX54PvqopF73lDTzJBeE=;
	h=From:To:Cc:Subject:Date;
	b=gPn9p6duhMKHyvGLdISmjkcy/18puPb3S2I6irX/AbYudpDi5zeknfKiY/NDmhcsR
	 g+pR2EYELTWVRxjsccs1B1S7j47Q/oAo4oJR7izSepELSnmklyH5DQfsAXO6Mz/ygb
	 I4r6UFRwdf3W9bRIanaBucFArKOnNUSvtf5PCDEIyB7wRkUB8TPTbtEmTMAHZLDJdT
	 lvuFfHJzuCV1pXygtD7oibLsnvMsDl8fnK3p7WeTADauOr071WEr4r+O3Bxg/eBsVE
	 KD2v359ByQdkcQvpmcd+jK+tkUuKFFFDSa23c6qmeJNKFDVX3EyoGe/50KvQ+gNIvY
	 q9bBqNCnYo3ow==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2] arm64: futex: Consolidate 'old == new' check in __lsui_cmpxchg32()
Date: Thu, 23 Jul 2026 14:03:04 +0100
Message-ID: <20260723130304.3161-1-will@kernel.org>
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

The LSUI futex implementation relies on a cmpxchg() loop to implement
FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
atomics. Since the unprivileged 'CAST' instructions used to implement
the cmpxchg() can only operate on 64-bit memory locations, the
__lsui_cmpxchg32() helper function performs a song and dance to marshall
the 32-bit futex value into the correct part of a 64-bit register and
fill the remaining bytes with the neighbouring data.

A consequence of this structure is that the 'CAST' failure/success
condition ends up being split into two separate 32-bit checks across
__lsui_cmpxchg32() and its caller. This is a little fiddly to read and
introduces some additional local variables which can be avoided if the
check is done in one place.

Tweak __lsui_cmpxchg32() so that it performs the full 64-bit check on
the value returned from the 'CAST' instruction and returns success to
its caller only in the case that the cmpxchg() operation has succeeded.
With that in place, simplify the outer loop in __lsui_futex_atomic_eor()
to pass 'oldval' by reference and return unless the cmpxchg() operation
returns -EAGAIN. __lsui_futex_cmpxchg() then swallows the -EAGAIN if the
futex word has changed.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---

v1: https://lore.kernel.org/r/20260519090823.7216-1-will@kernel.org

 arch/arm64/include/asm/futex.h | 61 ++++++++++++----------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index d1d2ff9d323a..79c6d86c38a9 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -151,42 +151,31 @@ __lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
 }
 
 static __always_inline int
-__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+__lsui_cmpxchg32(u32 __user *uaddr, u32 *oldval, u32 newval)
 {
 	u64 __user *uaddr64;
 	bool futex_pos, other_pos;
-	u32 other, orig_other;
 	union {
 		u32 futex[2];
 		u64 raw;
-	} oval64, orig64, nval64;
+	} orig64, oval64, nval64;
 
 	uaddr64 = (u64 __user *)PTR_ALIGN_DOWN(uaddr, sizeof(u64));
 	futex_pos = !IS_ALIGNED((unsigned long)uaddr, sizeof(u64));
 	other_pos = !futex_pos;
 
-	oval64.futex[futex_pos] = oldval;
-	if (get_user(oval64.futex[other_pos], (u32 __user *)uaddr64 + other_pos))
+	orig64.futex[futex_pos] = *oldval;
+	if (get_user(orig64.futex[other_pos], (u32 __user *)uaddr64 + other_pos))
 		return -EFAULT;
 
-	orig64.raw = oval64.raw;
-
+	nval64 = oval64 = orig64;
 	nval64.futex[futex_pos] = newval;
-	nval64.futex[other_pos] = oval64.futex[other_pos];
 
 	if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
 		return -EFAULT;
 
-	oldval = oval64.futex[futex_pos];
-	other = oval64.futex[other_pos];
-	orig_other = orig64.futex[other_pos];
-
-	if (other != orig_other)
-		return -EAGAIN;
-
-	*oval = oldval;
-
-	return 0;
+	*oldval = oval64.futex[futex_pos];
+	return oval64.raw == orig64.raw ? 0 : -EAGAIN;
 }
 
 static __always_inline int
@@ -202,7 +191,7 @@ __lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
 static __always_inline int
 __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
 {
-	u32 oldval, newval, val;
+	u32 oldval, newval;
 	int ret, i;
 
 	if (get_user(oldval, uaddr))
@@ -214,33 +203,27 @@ __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
 	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
 		newval = oldval ^ oparg;
 
-		ret = __lsui_cmpxchg32(uaddr, oldval, newval, &val);
-		switch (ret) {
-		case -EFAULT:
-			return ret;
-		case -EAGAIN:
-			continue;
-		}
-
-		if (val == oldval) {
-			*oval = val;
-			return 0;
-		}
-
-		oldval = val;
+		ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
+		if (ret != -EAGAIN)
+			break;
 	}
 
-	return -EAGAIN;
+	*oval = oldval;
+	return ret;
 }
 
 static __always_inline int
 __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 {
-	/*
-	 * Callers of futex_atomic_cmpxchg_inatomic() already retry on
-	 * -EAGAIN, no need for another loop of max retries.
-	 */
-	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
+	u32 curval = oldval;
+	int ret;
+
+	ret = __lsui_cmpxchg32(uaddr, &curval, newval);
+	if (ret == -EAGAIN && curval != oldval)
+		ret = 0;
+
+	*oval = curval;
+	return ret;
 }
 #endif	/* CONFIG_ARM64_LSUI */
 
-- 
2.55.0.229.g6434b31f56-goog


