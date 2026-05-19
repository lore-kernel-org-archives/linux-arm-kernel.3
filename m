Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE454CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XlKeqxLWG+WsTE2s2h2Ld/68Q9LpBOV4N0lSXK7wn+4=; b=3IGrz+baAHWYfvWa7RI9aH6eUj
	XvwF4NaK1kKzz1pHFW0W3OZNzohS6EsPpVKEajFH7lGh5kDXMaRpF//Ne2U5OTQJy1/PjdfSt95N7
	cHgyEulxHvVtdG05dhWxHqFk0nIFtOv0RyXNi3j9/PJB8eHS3gEMvvHFKdhRIIjbG2sZGAqUBu4WA
	igZOlEi9SBv02o+hDmNawtftwangpMDRuodmF8BYTIDUAI2hLOje+mnXXO6yBQQ/DGWBtztQD/bGV
	P2uW2SCcudRcbwAQGPR/RoflfweN0RjERnHkqW7HCoeHWqPfOrP4sskX5XX/eSDPZMjK/t8BryHNt
	I4ZkhIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGRG-00000000rIz-3Z1S;
	Tue, 19 May 2026 09:08:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGRF-00000000rIg-34vM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 090CB600AE;
	Tue, 19 May 2026 09:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A541FC2BCC6;
	Tue, 19 May 2026 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181712;
	bh=LAFdGaMfnNEWoCOPYPuA9U7U/HR1HElp8AzF77GO4hI=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6GMP7TBq/dnuYmChY44zdLnFno/feiDC+aJhfwe0Az1aZYfvOR5e5yTZ/nxTDQET
	 Lq/bWQHqkZoU6wkPuvh9/eYok844IOD4LbDg1VTElyMIPFj6YAsiz0CJdnP//8ttgA
	 q8u4g93h341hXHDprc7TIx2jMnzW9Tc0RH7Xuj9GAM/JsxkvDBTQvTPi+2SJiSrbpg
	 7qXlhqeBzPn6jebSCU5WKu+cKJaAx4SBJwdt/+M4GXzoaH9Xx/KTB3Rjh8nuE+UVcJ
	 8VH7fMyfwI7Q/WrloEE/U0Rr6epC61jJ9+F6mJ81bZCj9KaqHlKIKXCa6KPM1CYY12
	 Seg0bqoC5+32w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] arm64: futex: Consolidate 'old == new' check in __lsui_cmpxchg32()
Date: Tue, 19 May 2026 10:08:22 +0100
Message-ID: <20260519090823.7216-1-will@kernel.org>
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
returns -EAGAIN.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/futex.h | 53 ++++++++++++----------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index d1d2ff9d323a..db84a7b2de74 100644
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
+	int ret;
+
 	/*
 	 * Callers of futex_atomic_cmpxchg_inatomic() already retry on
 	 * -EAGAIN, no need for another loop of max retries.
 	 */
-	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
+	ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
+	*oval = oldval;
+	return ret;
 }
 #endif	/* CONFIG_ARM64_LSUI */
 
-- 
2.54.0.563.g4f69b47b94-goog


