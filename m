Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCCDCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68bH8lyOwehZ17D+qnzdBHGIHciTVMK4a1YYlxiYL+A=; b=BJ+oola02ExXpw3Y1GPnQ3MePn
	g1gIGr0zjMCuwJfPNw0UiLc2zmCLTkgqG5zoMK8IlsngWTLfbmrgDpqY72u07yM/XCnLbz+rGFpwE
	R8cEMVjXjoN3qdZO1bV6P125M34Gp+KdrG5kfgwiB/slSvqrEwDD06Tsd73AxLw0Lhs32URv7yOPi
	hc9r8nJfQ1cUzsWukvDwJuKm36HKfgAtYFVef2+VK2pCt9qq1mdSufNG8eAy2UU17T7U+CGftiq+q
	1+txT3StSnK9G/F2g8LL/eEzEol/OyNjKmX/IUdEiXmRJ3WUgjlTU7kUewjWURsMDQL5sdRjilMiN
	8qf5Sj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QAy-00000005FK4-10lb;
	Thu, 16 Oct 2025 15:46:00 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QAt-00000005FIs-4Aem
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:45:58 +0000
Received: from x415ea.. (unknown [49.214.10.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id C9EDB32A79;
	Thu, 16 Oct 2025 23:45:49 +0800 (CST)
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
Subject: [PATCH v3 1/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
Date: Thu, 16 Oct 2025 23:44:01 +0800
Message-ID: <20251016154401.35799-2-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016154401.35799-1-b10902118@ntu.edu.tw>
References: <20250827014113.5852-1-b10902118@ntu.edu.tw>
 <20251016154401.35799-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_084556_163651_6AC7909E 
X-CRM114-Status: GOOD (  17.89  )
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

For reference, the check is in
	arch/arm64/kernel/hw_breakpoint.c:hw_breakpoint_arch_parse()
which is called via:
	modify_user_hw_breakpoint()
	-> modify_user_hw_breakpoint_check()
	-> hw_breakpoint_parse()
	-> hw_breakpoint_arch_parse()

Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
---
 arch/arm64/kernel/ptrace.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4b001121c..8963f40ba 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -467,6 +467,34 @@ static int ptrace_hbp_set_addr(unsigned int note_type,
 	return err;
 }
 
+/* Set the address and control together for non-compat ptrace */
+static int ptrace_hbp_set(unsigned int note_type,
+				   struct task_struct *tsk,
+				   unsigned long idx,
+				   u64 addr, u32 uctrl)
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
+	attr.bp_addr = addr;
+
+	decode_ctrl_reg(uctrl, &ctrl);
+	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
+	if (err)
+		return err;
+
+	return modify_user_hw_breakpoint(bp, &attr);
+}
+
 #define PTRACE_HBP_ADDR_SZ	sizeof(u64)
 #define PTRACE_HBP_CTRL_SZ	sizeof(u32)
 #define PTRACE_HBP_PAD_SZ	sizeof(u32)
@@ -524,9 +552,6 @@ static int hw_break_set(struct task_struct *target,
 			return -EINVAL;
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
 					 offset, offset + PTRACE_HBP_ADDR_SZ);
-		if (ret)
-			return ret;
-		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
 		if (ret)
 			return ret;
 		offset += PTRACE_HBP_ADDR_SZ;
@@ -537,10 +562,11 @@ static int hw_break_set(struct task_struct *target,
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
-- 
2.51.0


