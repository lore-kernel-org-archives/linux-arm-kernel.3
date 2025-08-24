Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B773CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXvVStmoHhquVh2ryn4/UdV+KLvFTfZ6BUKV2d3Y2Cs=; b=pPpe9hc+zJzoA6OtRvukJzeGBB
	TP14cRKnneJAUidxpRfevOmY7Pu/FCfVBjvG9EMJ6XqgkZNVtvKWwlQ0wT88Ap0ILF5znOqTPZSW1
	b5MHLzAD76JlVyOEWejaeyfQzUIVU9Fux6ICt9j3G+SLaCD2YrdyNBTPx75iWZEUloLNNZH1HBzP8
	UC4qB+4wqFfDMCYkVMehHeF1yiNzmmkwXgkasgXiSlU5P/ahJzTq19sBwfX6kvYgSlvBcCUFnKqer
	6juC7tL4IJsAFW+d57O7aCHNVc2UhA0TmQL4vlb5ur4DplZV95TkpCSFqdGQfYKglUjotQSK58un7
	g1rAvOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqACj-000000069dm-0AFW;
	Sun, 24 Aug 2025 12:52:13 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqA4u-0000000699f-2CXj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 12:44:11 +0000
Received: from x415ea.vlan11.wl120.cc.ntu.edu.tw (ip24-218.wifi.cc.ntu.edu.tw [140.112.24.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id DED282E6C3;
	Sun, 24 Aug 2025 20:44:01 +0800 (CST)
From: b10902118 <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	b10902118 <b10902118@ntu.edu.tw>
Subject: [PATCH 3/3] ARM: ptrace: minimize default bp_len for hw breakpoints to pass check
Date: Sun, 24 Aug 2025 20:43:17 +0800
Message-Id: <20250824124317.390795-4-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250824124317.390795-1-b10902118@ntu.edu.tw>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_054408_698561_8EC9AFA0 
X-CRM114-Status: GOOD (  15.46  )
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

The cause is that ptrace_sethbpregs() can only modify either
addr or ctrl of a breakpoint per call, but always checks alignment in
hw_breakpoint_arch_parse(). If a breakpoint has ctrl.len=4 (the
default), then users cannot set the addr to a non-4-byte aligned
address. Likewise, if the addr was previously set unaligned, users
cannot set ctrl.len to 4.

This patch mitigates the issue by minimizing the default bp_len, so
that any possibly valid address can pass the check with it. However, it
does not solve misaligned addr/len in modifying existing breakpoints;
further work may be needed to remove or relax the alignment check.

Signed-off-by: b10902118 <b10902118@ntu.edu.tw>
---
 arch/arm/kernel/ptrace.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 7951b2c06..920cf77d1 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -415,12 +415,26 @@ static u32 ptrace_get_hbp_resource_info(void)
 static struct perf_event *ptrace_hbp_create(struct task_struct *tsk, int type)
 {
 	struct perf_event_attr attr;
+	int min_len;
+
+	/*
+	 * min_len ensures any possibly valid address can pass alignment
+	 * validation with it.
+	 * In PTRACE_SETHBPREGS, addr and ctrl can only be set one after one. If
+	 * addr is set first, ctrl will remain as initial value.
+	 */
+	if (type == HW_BREAKPOINT_X)
+		min_len = (tsk && is_compat_thread(task_thread_info(tsk))) ?
+				  HW_BREAKPOINT_LEN_2 :
+				  HW_BREAKPOINT_LEN_4;
+	else // watchpoint
+		min_len = HW_BREAKPOINT_LEN_1;
 
 	ptrace_breakpoint_init(&attr);
 
 	/* Initialise fields to sane defaults. */
 	attr.bp_addr	= 0;
-	attr.bp_len	= HW_BREAKPOINT_LEN_4;
+	attr.bp_len	= min_len;
 	attr.bp_type	= type;
 	attr.disabled	= 1;
 
-- 
2.50.1


