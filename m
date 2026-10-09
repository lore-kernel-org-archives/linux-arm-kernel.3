Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52416CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfHxhycY4c003LsMRsPy6F6Xh21xTwGQzv/lLDaJzCU=; b=xNBFwOylJsreoSlxzIjWHUaJ7b
	bQkqXD/EmilQLTPB93wnwKZ6jdjh+3v3BiTV5W5JA907l1J0HvspQGKSyrFzkqc/WXK6zo9O0GOTT
	6HUspgqmy+WwRlCNayG/4IDf47FjGm+eJwLazKVIZtvFTD6AuwLBQcOYKtd1Fgmsk3ukvLuD6Xphu
	jYgfEj4yV5bqFJGYOlbeZjUw6WPwUYskf2vjUPQooVRqSHvEasykfyRT6TBQdNt94vaEG5YlbbdVF
	o/6GEOhOLEr5g1gvp/d0nJSX4Pjs5TTtGLtnColDQ+JQs7xcocLauew1ZfiwzDZDyMtxT3UKwSiB/
	41NEy8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7W8-00000005yrM-1OjB;
	Fri, 09 Oct 2026 10:07:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7W7-00000005yqe-1YPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:07:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C782343D05;
	Fri,  9 Oct 2026 10:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BAC1F00899;
	Fri,  9 Oct 2026 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540474;
	bh=pfHxhycY4c003LsMRsPy6F6Xh21xTwGQzv/lLDaJzCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=In3kowbKxzi0zjMZuqzN80/iyK437ZerWuTZkRHz6Jyik7ekEn2cYLzTUoak3EWUd
	 EjfkFJ9ZOzenPO/lmMhvKJlvq/Y/0tTyuLIUpaDWbf7hyWs5QacL9fDRzeZ1zkz3hq
	 ClDcSUsA8cXXojGHySxdI7B0GCzCAkrjl2HDjG3zVCKGh6kQASybloEz4+HIcI3iw7
	 8XzvEmG96MXY5TFBzKR7YEklflWXQiN+gIQZc9AdIBRpjRL3ig+Ih1OC0NERgxZvK6
	 hSID8wHl5AQPNENRKy4yvp7Jo83XQuHjFY/r3TvDO+bHQdvRvoYs8+0ZUfwnAbMptz
	 9LhUT8gZ//h+g==
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
Subject: [PATCH v2 02/23] cpu/hotplug: Avoid trying to bring up CPUs that are already online
Date: Fri,  9 Oct 2026 11:07:13 +0100
Message-ID: <20261009100738.31288-3-will@kernel.org>
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

There's little point trying to bring up a CPU that is already online.
Although _cpu_up() handles this case by doing nothing (because the
target state has already been reached), it's wasted effort when we can
easily elide the call to cpu_up() in the first place.

Check that the target CPU isn't already online before invoking cpu_up()
from cpuhp_bringup_mask().

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 198c929c452a..97a9bfe4edad 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1769,7 +1769,8 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 	for_each_cpu(cpu, mask) {
 		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 
-		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
+		if (!cpu_online(cpu) && cpu_up(cpu, target) &&
+		    can_rollback_cpu(st)) {
 			/*
 			 * If this failed then cpu_up() might have only
 			 * rolled back to CPUHP_BP_KICK_AP for the final
-- 
2.56.0.385.gd3acb90ef8-goog


