Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD1CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xH/dYh9+61Zw9s7WJ+ymcWtaxDOHvFEU7kBYJsTw9g=; b=vIrVFdA66fzEu/jl5qARYDqNhZ
	wFimtPDgdLyG/8DZH8VMyW2hJ1UZ4cMHnpCKOvhW5BhlVUQ2++rw/QisbiVPP47HR8AePJzqXNwgB
	2jbe4D976gd0mMjs3mR3b1lplrXlX+H/ksbPfAYh3l2tAR3nHIT3HkxsizXZj7J1wxUkdCNOu42lC
	C6/4c1Fa8mK0cfJ7IqaHdbn6dR0IMzNP1CYONrLady/9fvjArU9p8XUq3nvjHHd1+HZq54AcNulEz
	oE997d6IcrXBwgHbPOPN2putEZ6524wcJ/lZMwH0LZBKXvq39gWhel/4d9+pVVCKFmqL3fMMDQ49z
	3Qe653MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA791-00000009yiw-0IE8;
	Sat, 18 Oct 2025 13:38:51 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA78c-00000009yej-30Gd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 13:38:49 +0000
Received: from x415ea.. (unknown [101.14.4.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 8B5EE34F4C;
	Sat, 18 Oct 2025 21:38:07 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v4 1/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
Date: Sat, 18 Oct 2025 21:37:31 +0800
Message-ID: <20251018133731.42505-2-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251018133731.42505-1-b10902118@ntu.edu.tw>
References: <20251016154401.35799-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_063827_022326_B15A49FE 
X-CRM114-Status: GOOD (  19.53  )
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

This patch fixes the failure of PTRACE_SETREGSET when setting a hardware
breakpoint on a non-4-byte aligned address with a valid control to a
32-bit tracee. The issue was discovered while testing LLDB.

Link: https://github.com/llvm/llvm-project/pull/152284

The failure happens because hw_break_set() checks and sets the breakpoint
address and control separately. This can result in an check failure when
it first validates the address to be set with old control.

For example, the control are initialized with breakpoint length of 4.
Combining with a non-4-byte aligned address would cross a 4-byte boundary,
which is invalid. However, the user-provided control may actually specify a
length of 1, which should be valid.

The fix is to set the address and control together. This is supported
by modify_user_hw_breakpoint(), the function that sets and checks
breakpoints. The original implementation wrap this function to
ptrace_hbp_set_addr() and ptrace_hbp_set_ctrl() for 32-bit API
PTRACE_SETHBPREGS simply because it can only modify one register (address
or control) per call. For the 64-bit PTRACE_SETREGSET API, this
restriction does not apply, so a new helper function ptrace_hbp_set() was
added to set both in a single call to modify_user_hw_breakpoint().

Then ptrace_hbp_set_addr() and ptrace_hbp_set_ctrl() are only used by
compat_ptrace_hbp_set(), so moved into CONFIG_COMPAT block and renamed
with prefix compat_.

For reference, the check is in
	arch/arm64/kernel/hw_breakpoint.c:hw_breakpoint_arch_parse()
which is called via:
	modify_user_hw_breakpoint()
	-> modify_user_hw_breakpoint_check()
	-> hw_breakpoint_parse()
	-> hw_breakpoint_arch_parse()

Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
---
 arch/arm64/kernel/ptrace.c | 90 ++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4b001121c72d..c8caf4e0805e 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -421,10 +421,11 @@ static struct perf_event *ptrace_hbp_get_initialised_bp(unsigned int note_type,
 	return bp;
 }
 
-static int ptrace_hbp_set_ctrl(unsigned int note_type,
-			       struct task_struct *tsk,
-			       unsigned long idx,
-			       u32 uctrl)
+/* Set the address and control together for non-compat ptrace */
+static int ptrace_hbp_set(unsigned int note_type,
+				   struct task_struct *tsk,
+				   unsigned long idx,
+				   u64 addr, u32 uctrl)
 {
 	int err;
 	struct perf_event *bp;
@@ -438,6 +439,8 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 	}
 
 	attr = bp->attr;
+	attr.bp_addr = addr;
+
 	decode_ctrl_reg(uctrl, &ctrl);
 	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
 	if (err)
@@ -446,27 +449,6 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 	return modify_user_hw_breakpoint(bp, &attr);
 }
 
-static int ptrace_hbp_set_addr(unsigned int note_type,
-			       struct task_struct *tsk,
-			       unsigned long idx,
-			       u64 addr)
-{
-	int err;
-	struct perf_event *bp;
-	struct perf_event_attr attr;
-
-	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
-	if (IS_ERR(bp)) {
-		err = PTR_ERR(bp);
-		return err;
-	}
-
-	attr = bp->attr;
-	attr.bp_addr = addr;
-	err = modify_user_hw_breakpoint(bp, &attr);
-	return err;
-}
-
 #define PTRACE_HBP_ADDR_SZ	sizeof(u64)
 #define PTRACE_HBP_CTRL_SZ	sizeof(u32)
 #define PTRACE_HBP_PAD_SZ	sizeof(u32)
@@ -524,9 +506,6 @@ static int hw_break_set(struct task_struct *target,
 			return -EINVAL;
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
 					 offset, offset + PTRACE_HBP_ADDR_SZ);
-		if (ret)
-			return ret;
-		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
 		if (ret)
 			return ret;
 		offset += PTRACE_HBP_ADDR_SZ;
@@ -537,10 +516,11 @@ static int hw_break_set(struct task_struct *target,
 					 offset, offset + PTRACE_HBP_CTRL_SZ);
 		if (ret)
 			return ret;
-		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
+		offset += PTRACE_HBP_CTRL_SZ;
+
+		ret = ptrace_hbp_set(note_type, target, idx, addr, ctrl);
 		if (ret)
 			return ret;
-		offset += PTRACE_HBP_CTRL_SZ;
 
 		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
 					  offset, offset + PTRACE_HBP_PAD_SZ);
@@ -2139,6 +2119,52 @@ static int compat_ptrace_hbp_get(unsigned int note_type,
 	return err;
 }
 
+static int compat_ptrace_hbp_set_ctrl(unsigned int note_type,
+			       struct task_struct *tsk,
+			       unsigned long idx,
+			       u32 uctrl)
+{
+	int err;
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	struct arch_hw_breakpoint_ctrl ctrl;
+
+	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
+	if (IS_ERR(bp)) {
+		err = PTR_ERR(bp);
+		return err;
+	}
+
+	attr = bp->attr;
+	decode_ctrl_reg(uctrl, &ctrl);
+	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
+	if (err)
+		return err;
+
+	return modify_user_hw_breakpoint(bp, &attr);
+}
+
+static int compat_ptrace_hbp_set_addr(unsigned int note_type,
+			       struct task_struct *tsk,
+			       unsigned long idx,
+			       u64 addr)
+{
+	int err;
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+
+	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
+	if (IS_ERR(bp)) {
+		err = PTR_ERR(bp);
+		return err;
+	}
+
+	attr = bp->attr;
+	attr.bp_addr = addr;
+	err = modify_user_hw_breakpoint(bp, &attr);
+	return err;
+}
+
 static int compat_ptrace_hbp_set(unsigned int note_type,
 				 struct task_struct *tsk,
 				 compat_long_t num,
@@ -2151,10 +2177,10 @@ static int compat_ptrace_hbp_set(unsigned int note_type,
 
 	if (num & 1) {
 		addr = *kdata;
-		err = ptrace_hbp_set_addr(note_type, tsk, idx, addr);
+		err = compat_ptrace_hbp_set_addr(note_type, tsk, idx, addr);
 	} else {
 		ctrl = *kdata;
-		err = ptrace_hbp_set_ctrl(note_type, tsk, idx, ctrl);
+		err = compat_ptrace_hbp_set_ctrl(note_type, tsk, idx, ctrl);
 	}
 
 	return err;
-- 
2.51.0


