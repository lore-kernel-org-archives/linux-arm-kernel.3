Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B78DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZnTmXXPPJ43/SdX9l5xjKLxTpAA3+OeMalQ6WpsFjI=; b=kGWuGh5VZsHUODBCjK7w5RNXJD
	b+a+DDkYS0KnAw47Uu//HwIgfr1P2fiO389Nmqn1zzMktnbr5CBqISRzrQVsK71MZwBG9sZdZsx/h
	h6W1Q2GJtQJe+dhlQLgvZCCbXYT1ddGDFCdf4LS5RYxQROsFZ1eVZsROgd0ls097553NDY73LyUw7
	Gig0s6uthMdL4+UxDe+bGeP04QL/Fx6vf9WtTQgYIHcRNA8ohhfI1Br+5ssj+hC5cyZXgsM43MY8F
	ShhFDLOTjMJ+Ik3sg0rxdSXgG0bwgLgtyVSUevKoo6OQXWP3mXEasvb7m9RcGSLsSgUkaEi99mdSw
	rwpGOgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQpU-00000009Ac0-3YW8;
	Mon, 12 May 2025 10:56:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQki-0000000998q-3z8a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:51:23 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747047079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZnTmXXPPJ43/SdX9l5xjKLxTpAA3+OeMalQ6WpsFjI=;
	b=NJPjJ6l3HcVlf9x7yzLY6lOv0vLQF3BD1NT3n0vVucsulJ3ZbQoD2EdEcJ4Vgtq3Bjn7rO
	HpmT7KQ/sdjY9LoxGlXs+pvfNhVaQT4wYHSA+lra2MKx3faQiKCuQAgbZOgDQ+5QZF/GeG
	fNYQb0pKrYtrv5T0Gwpy36l05exJBqDDL3VPWTjOGAQ+6oMT7S53Eu8YmqNImCkHjyAsDY
	nfENxMHw2o/juaqGgbAvmnx8NL75nhUE73C/LbSidz91NbnBVh1bTWyBrpSt2Z1SRv7PEc
	wRSrB7TgZTL3MOIkOOkVezlAHDUmkrs7eaePFBZFKw6mwMbxOv7CXmU4pTLivQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747047079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZnTmXXPPJ43/SdX9l5xjKLxTpAA3+OeMalQ6WpsFjI=;
	b=Dji95j+HM2jVtEbCTKaQFGw1LFbGxnHkrzG+jOZG1qWr9mD7mZL8ru7KvwyBj2Yx/bk6Xe
	tOCnZ2zyHZ3+eDBQ==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 17/22] arm64: mm: Add page fault trace points
Date: Mon, 12 May 2025 12:51:00 +0200
Message-Id: <f5fccde2326a896e5c568ef06a4dbd9aa7465f6a.1747046848.git.namcao@linutronix.de>
In-Reply-To: <cover.1747046848.git.namcao@linutronix.de>
References: <cover.1747046848.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_035121_151408_C76D061A 
X-CRM114-Status: UNSURE (   9.94  )
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
index ec0a337891dd..55094030e377 100644
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


