Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A1D65C66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHyBkX8U08hLirxXYcmfBKElEIOtNCgRo3rKtNIc3F0=; b=nZBtuT9Kw4cZrMUfWEUJben2lz
	DYL2Wls7OlR6ou+4Kl6pebeUJ6jitmSHxxO0BIqvkla4OPOYzuYcNrYXO5yaVQURvROE4TpEn7Z3J
	d6zNv1ewEhskmXffExafOlIFIwtz1dN5xlurVpBwlWuyY7DEDHhwVIURscDA4HPmUISTfwS0my1bU
	InR22ofo9UKlHeazR4rQoWFjwF8al3pK3mJ7Nlz0gUB+zq2QN7skPp8N05mHCb0LugDLJCEq4n2/d
	1pt1WBTddUYdCMUPzS02/dYkijTQZc3RatPg0VH+QzyTAxju5ZwZSdkPrKf9zxh/QPTWLtIqlWn9k
	c41hug7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWZe-00000009Qmj-1EMA;
	Thu, 14 Nov 2024 09:55:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWXm-00000009QRB-2CFw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0DC88A416E7;
	Thu, 14 Nov 2024 09:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8256DC4CECD;
	Thu, 14 Nov 2024 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731578020;
	bh=BH5DNo2WAnWH8HNwRpFgXkTiNcVlRrlX/l2dKCZTwCM=;
	h=From:To:Cc:Subject:Date:From;
	b=N8UFFbfdTJpwcr9jciX4f3n66x7L9mIKbO3MP4jKUavH9LPpNueuqN5hgetEKgXlY
	 jvH/jH1s6seNncRkbxW5eIVTnTNDsTp4cm7O4IUquebirSuCVxvb0XZ/cIy1bdWn+M
	 smrei8YPpMXBUDXsV6C9JI/Aczg1XnaQdXBnuUosav9AW1+8feQ9S2Ka5avwZ0zzsa
	 q/JXfRHhC9tl0442Bu/6c17krMn68jDUm5rln6h16lrWHT32Kt5pxOPAG4HrNqCta1
	 L5FZ16FAGt2YixKZ4vvxLyhbUQOQoQrw9L6DN0LvBZupjUFwY+hJPtmmo8nTWlFKZD
	 RghgFziM4oTqQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com
Cc: maz@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: tls: Fix context-switching of tpidrro_el0 when kpti is enabled
Date: Thu, 14 Nov 2024 09:53:32 +0000
Message-Id: <20241114095332.23391-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_015342_661407_F8F7E6CC 
X-CRM114-Status: GOOD (  12.07  )
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

Commit 18011eac28c7 ("arm64: tls: Avoid unconditional zeroing of
tpidrro_el0 for native tasks") tried to optimise the context switching
of tpidrro_el0 by eliding the clearing of the register when switching
to a native task with kpti enabled, on the erroneous assumption that
the kpti trampoline entry code would already have taken care of the
write.

Although the kpti trampoline does zero the register on entry from a
native task, the check in tls_thread_switch() is on the *next* task and
so we can end up leaving a stale, non-zero value in the register if the
previous task was 32-bit.

Drop the broken optimisation and zero tpidrro_el0 unconditionally when
switching to a native 64-bit task.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: <stable@vger.kernel.org>
Fixes: 18011eac28c7 ("arm64: tls: Avoid unconditional zeroing of tpidrro_el0 for native tasks")
Signed-off-by: Will Deacon <will@kernel.org>
---

You fix one side-channel and introduce another... :(

 arch/arm64/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 3e7c8c8195c3..2bbcbb11d844 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -442,7 +442,7 @@ static void tls_thread_switch(struct task_struct *next)
 
 	if (is_compat_thread(task_thread_info(next)))
 		write_sysreg(next->thread.uw.tp_value, tpidrro_el0);
-	else if (!arm64_kernel_unmapped_at_el0())
+	else
 		write_sysreg(0, tpidrro_el0);
 
 	write_sysreg(*task_user_tls(next), tpidr_el0);
-- 
2.47.0.277.g8800431eea-goog


