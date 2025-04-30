Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBBAC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=; b=RpVZL6idmXPRBCkNiLGQ1Zux8z
	y7bdZ3qaxoB+iNmFkFFSYYnVjgLwf/3Br0gRib3PwK03HYyeDxEgdBAsesMAmipNqbwk1MNZY67IV
	BXNjKsBpMKqk6OI5imvSE4tpuR6tT1Aj95SuXt8UZXIaYQJR4zyAMOvFUMR/kSrHhMY7e9kz7cioE
	rA/ujfWXoJ3YqwOowp6OESs9jM7iXPx5oZB9sNXum8U+4RVoM/2o7tbBRAuQJf5bqaavaIcqxqsha
	417Gh11aA6HR0tI6VSiuwAwiCgXKUh7K/NpNSvsbUIA+NQuiIMOnktisxDrVAMgeIbJJAoZiQGi+7
	nCF9hwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5sA-0000000CjJq-2BdR;
	Wed, 30 Apr 2025 11:45:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5DH-0000000CcCR-15sD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 11:02:53 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746010969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=;
	b=ANqaAKL7xzONGZzgwjEwKQxoafpPmwihdB8CSIyrcsP3KcbC2ExMY75BPTBVLQA0zfcbtJ
	ZTiDewcAEoUvv1Yi5rGET1A08/yP0IylIY58Q7v4zO0CdbwR8Wg4g2lPFuMn/IFjg52I+n
	WuIPJbpr08vZDoCPjq7/lVW4gyWEdTBxhslRAXuH4Xx7Zf/9XggO+h+Bfym6jIcTO6AZVN
	gW5790lSI8OsBQbB21zuPu7XwS030pQ2/2eTARn5KageaYc34vam4Z83lc2RIKTO5yJJre
	bfBdHUptrBZGk/Kq/xPRPhEqYS0f7+4qpH/G1ik3xuhNBDgSI7xz92lQBHE/6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746010969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=;
	b=IeZfvP+C48+pRqTuFVYBkD4Ru8kfnfuLYOIeUVtA/GOD6yeEakAMarP+fHf/JwHyULRVZa
	b46u99+7ymuIsIAw==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Date: Wed, 30 Apr 2025 13:02:32 +0200
Message-Id: <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
In-Reply-To: <cover.1745999587.git.namcao@linutronix.de>
References: <cover.1745999587.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_040251_437989_71198E16 
X-CRM114-Status: GOOD (  10.11  )
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

Add page fault trace points, which are useful to implement RV monitor which
watches page faults.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/mm/fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ef63651099a9..e3f096b0dffd 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -44,6 +44,9 @@
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
=20
+#define CREATE_TRACE_POINTS
+#include <trace/events/exceptions.h>
+
 struct fault_info {
 	int	(*fn)(unsigned long far, unsigned long esr,
 		      struct pt_regs *regs);
@@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, =
unsigned long esr,
 	if (kprobe_page_fault(regs, esr))
 		return 0;
=20
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, esr);
+	else
+		trace_page_fault_kernel(addr, regs, esr);
+
 	/*
 	 * If we're in an interrupt or have no user context, we must not take
 	 * the fault.
--=20
2.39.5


