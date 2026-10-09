Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FB2CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuatJsYuabYYvzPBBzh4zcG6HEJg4mE6fowtxZTSlU0=; b=WNJjsiBGnaC+Yb3JN3cf8r+x/1
	tlZg8CMy5p6WGdLROv8r6bzC08rPXmcFBp3xBEaQYhi6LLaqEku34nkl2kV817YPohzu/GcKfp1kO
	KFydRe/h4d56NkNUF2tzElUGdymctdDvIJCS8LgrmAF5Oed2BRe+p2OjrTYA9LoryB87Oi7Wg8ag8
	xB7JneE66lHYBCO8VFnPoNWGnhIEar5SPjz10QOj5ZR4L9TyMZgAwrbs9/mGfDoiiF/rqOD8qgGJ8
	cNSlSdeyo4o3Dl1ESIqt32Lk504sP4cwanvOtyr0pjlJAk4Gw1rSBKOCxbHI+06ckk/Xm4sgRZpv8
	YVqExOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WD-00000005yu4-1xpB;
	Fri, 09 Oct 2026 10:08:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WB-00000005ysu-1Rj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:07:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7BFC60DC1;
	Fri,  9 Oct 2026 10:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9BC1F000FF;
	Fri,  9 Oct 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540478;
	bh=yuatJsYuabYYvzPBBzh4zcG6HEJg4mE6fowtxZTSlU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cKfqshKBfJc3VMLlat94tBBi/MIBRn9tTRz6ntjL0YoKvrE54VlbPuaoR2rKbA0od
	 lGLN9X1iEdgAL7xDZpl7/YUMUmTC7pP1NuY9KUh+D7B6DLY4oaqD51NSIF7AHh3poi
	 9EA+tVVX7l6PXamV0hmZa4iwf72jvvUZV6QjAXWLRxKxBpzFYfD+F1816F6xLtyLSJ
	 Aejflcc5vuMoUUz7KDGTSAYQLWy5YIK2a6ZtaAGaco5l8WuWP0VJsSGlyzGOof4XLM
	 qhmdUPgiHS7yeNt9MZYOhfgSydjz2D2x4WqboyoKwsVnvwKwPJ+0IYPfhls+V8p9gm
	 i0JPTqQSmJrJA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 03/23] cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
Date: Fri,  9 Oct 2026 11:07:14 +0100
Message-ID: <20261009100738.31288-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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

On some architectures (such as arm64), cpu_relax() is effectively a NOP
and so isn't particularly efficient when used in a tight polling loop
such as the CPU state synchronisation in cpuhp_ap_sync_alive().

Once an incoming CPU has reached the SYNC_STATE_ALIVE state, we know
that it is executing within the kernel and so we can use the more
efficient polling mechanism provided by the atomic_cond_read* API,
allowing the use of WFE on arm64 and Zawrs on RISC-V.

Change cpuhp_ap_sync_alive() to poll using atomic_cond_read_relaxed()
instead of cpu_relax(). No change on x86.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 97a9bfe4edad..786c3191431c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -395,8 +395,7 @@ void cpuhp_ap_sync_alive(void)
 	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
 
 	/* Wait for the control CPU to release it. */
-	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
-		cpu_relax();
+	atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);
 }
 
 static bool cpuhp_can_boot_ap(unsigned int cpu)
-- 
2.56.0.385.gd3acb90ef8-goog


