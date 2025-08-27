Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A0CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 01:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xvPBgU12KeWpWVOPU/mMiLBOtLOHqDZbiSNvTViDBM=; b=z6D292xe9yADHgK2fwStUSlRph
	vMZcyJsehN/gqlhNGdVXSouu64tC0qd+d62Mt+tM8zKEf48vYxidJZzuGjSVhV3iSmrC6XAhMxpQH
	GqIqfW+nHU9snDVq7gMxNE2upOR/Vmg0F04c9ayQffUPxsNvlZ0QB48k7n9ALO609K7vEqB5MzxVC
	eAAqdKoh9dkAWTOmbunAkpBHF3643j8P7GbConVfC8ym7HTYJ+hyc9MHTTlC7HMQjk+R0Y9FxEbxU
	2tNRsXLDG1kZDaJuZZ5yaUyltHeOjix5UplrD3EoOxrXRlJSrlFUokRfazNorhw3ghZkN40RLnWCs
	CaHZZkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5Do-0000000Da3t-04yC;
	Wed, 27 Aug 2025 01:45:08 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5B5-0000000DZTO-1fn0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 01:42:20 +0000
Received: from x415ea.. (unknown [101.12.130.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 6BF5D31F50;
	Wed, 27 Aug 2025 09:42:14 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v2 2/3] arm64: ptrace: minimize default bp_len for hw breakpoints to pass check
Date: Wed, 27 Aug 2025 09:41:12 +0800
Message-Id: <20250827014113.5852-3-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827014113.5852-1-b10902118@ntu.edu.tw>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_184219_581844_E9AFA705 
X-CRM114-Status: GOOD (  15.94  )
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

PTRACE_SETHBPREGS fails when setting a hardware breakpoint on a
non-4-byte aligned address with a valid length to a 32-bit tracee. The
length should be valid as long as the range started from the address
is within one aligned 4 bytes.

The cause is that compat_ptrace_hbp_set() can only modify either
addr or ctrl of a breakpoint per call, but always checks alignment in
hw_breakpoint_arch_parse(). If a breakpoint has ctrl.len=4 (the
default), then users cannot set the addr to a non-4-byte aligned
address. Likewise, if the addr was previously set unaligned, users
cannot set ctrl.len to 4.

This patch mitigates the issue by minimizing the default bp_len, so
that any possibly valid address can pass the check with it. However, it
does not solve misaligned addr/len in modifying existing breakpoints;
further work may be needed to remove or relax the alignment check.

Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
---
 arch/arm64/kernel/ptrace.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 73c67f743..70c9acd94 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -288,14 +288,25 @@ static struct perf_event *ptrace_hbp_create(unsigned int note_type,
 {
 	struct perf_event *bp;
 	struct perf_event_attr attr;
-	int err, type;
+	int err, type, min_len;
 
+	/*
+	 * min_len ensures any possibly valid address can pass alignment
+	 * validation with it.
+	 * This is for compat mode, in which addr and ctrl can only be set
+	 * one after one with SETHBPREGS. If addr is set first, ctrl will
+	 * remain as initial value.
+	 */
 	switch (note_type) {
 	case NT_ARM_HW_BREAK:
 		type = HW_BREAKPOINT_X;
+		min_len = (tsk && is_compat_thread(task_thread_info(tsk))) ?
+				  HW_BREAKPOINT_LEN_2 :
+				  HW_BREAKPOINT_LEN_4;
 		break;
 	case NT_ARM_HW_WATCH:
 		type = HW_BREAKPOINT_RW;
+		min_len = HW_BREAKPOINT_LEN_1;
 		break;
 	default:
 		return ERR_PTR(-EINVAL);
@@ -308,7 +319,7 @@ static struct perf_event *ptrace_hbp_create(unsigned int note_type,
 	 * (i.e. values that will pass validation).
 	 */
 	attr.bp_addr	= 0;
-	attr.bp_len	= HW_BREAKPOINT_LEN_4;
+	attr.bp_len	= min_len;
 	attr.bp_type	= type;
 	attr.disabled	= 1;
 
-- 
2.50.1


