Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33202FEEF50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7VCwf5RaYNvHJJKgsQhVb+QKar9Np7ef6NlSkdRpzw=; b=a/x++4kZY87LrEhLwjz+7gKsJQ
	YTb2435EbQforCR/is1MSgAKG3RapiWbCWdoC+0tXtcTjzu17jlZIoSJnn0sKiK1jq3dOxOClwr+4
	Ml2ssStv5pHzLbcnZxyKEJAMu9mmQzz7KMR9bNFUuxkK7T8VKiUg6hQwJsCgx1ZlMZHkRIwNCETRs
	z0qX/Bh3SbSfdXERcE9m8j+3zqoXyPu4DgjOsCHOo46qSN+3EKLD5nEGAW+0K0WBRwh7TEiCRjDTY
	ilbTTWoFIvOKX34NbJ7TxmjCbaHI8mTJTc5bmNaKgFFrRFFBysoQx4i7xCOv8GxE2cKy42t3bJmPm
	GFMqrVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RZ-00000006bim-0Lsh;
	Tue, 07 Apr 2026 14:30:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RW-00000006bgY-3a6M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEA7360133;
	Tue,  7 Apr 2026 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D43C116C6;
	Tue,  7 Apr 2026 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572212;
	bh=zXlPjSjJdZ1ja9eNaaYsLbU6jHV6bkXu/LbF2O2Rslk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SRPEz+/S9/dK0A8JDQ5OuY1+2hVd/bEf8LIdeTo7yHf322NXXtQM1BkEBJRBU6diL
	 sqNBr7Q12MAkwoYlQv6IXEBdjZYQ9i/gFuGZ0C9w+0uLaeDzKsdSwhMLBtc9a/9w3C
	 C58O4MbwdDhqHYhs0gWMDXWdiUhEEhsdkeRnqRfM0L2+Ei2U5zY9keavYeAgwikSks
	 /CMaDawUPm6w3swEDWL05/694l8lod7hNgg+bQ2OOpqPzacLlylJjLtqmNTUfU4T3G
	 AZSvD76WdsKm/aciB9ija91/NZUydkwXgzY35IOCVMfhbTOT/Jm31wR2v+DoVjO0iS
	 2OejfP+JtlXQw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Apr 2026 09:29:44 -0500
Subject: [PATCH v4 2/6] arm64: hw_breakpoint: Add additional kprobe
 excluded functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-arm-debug-8-9-v4-2-a4864e69b0ea@kernel.org>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
In-Reply-To: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15-dev
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

Everything that either runs during exceptions or touches the
breakpoint/watchpoint registers should be excluded from kprobes and
breakpoints.

The static functions are may or may not end up in the no kprobe section
depending on whether the compiler inlines them or not. They are likely
inlined, but make it explicit to ensure that they always are.
Unfortunately, it is not possible to leave the inlining decision up to
the compiler and place code within the no kprobes section.

Parts of what hw_breakpoint_control() calls are excluded already. Just
exclude all of it to be safe.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/kernel/hw_breakpoint.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index 38fbd67b2a6e..bb39bc759810 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -187,9 +187,9 @@ static int is_compat_bp(struct perf_event *bp)
  *	-ENOSPC if no slot is available/matches
  *	-EINVAL on wrong operations parameter
  */
-static int hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
-				    struct perf_event *bp,
-				    enum hw_breakpoint_ops ops)
+static nokprobe_inline int
+hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
+			 struct perf_event *bp, enum hw_breakpoint_ops ops)
 {
 	int i;
 	struct perf_event **slot;
@@ -283,6 +283,7 @@ static int hw_breakpoint_control(struct perf_event *bp,
 
 	return 0;
 }
+NOKPROBE_SYMBOL(hw_breakpoint_control);
 
 /*
  * Install a perf counter breakpoint.
@@ -718,8 +719,8 @@ NOKPROBE_SYMBOL(do_breakpoint);
  * The function returns the distance of the address from the bytes watched by
  * the watchpoint. In case of an exact match, it returns 0.
  */
-static u64 get_distance_from_watchpoint(unsigned long addr, u64 val,
-					struct arch_hw_breakpoint_ctrl *ctrl)
+static nokprobe_inline u64 get_distance_from_watchpoint(unsigned long addr, u64 val,
+							struct arch_hw_breakpoint_ctrl *ctrl)
 {
 	u64 wp_low, wp_high;
 	u32 lens, lene;
@@ -739,8 +740,8 @@ static u64 get_distance_from_watchpoint(unsigned long addr, u64 val,
 		return 0;
 }
 
-static int watchpoint_report(struct perf_event *wp, unsigned long addr,
-			     struct pt_regs *regs)
+static nokprobe_inline int watchpoint_report(struct perf_event *wp, unsigned long addr,
+					     struct pt_regs *regs)
 {
 	int step = is_default_overflow_handler(wp);
 	struct arch_hw_breakpoint *info = counter_arch_bp(wp);

-- 
2.53.0


