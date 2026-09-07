Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B0DC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0TnF0EdtSAjs6s5ohnJS7vNK/6l+Z91b6PJOF9Vof0=; b=cqAthm2YO00YoemyYOEJKfijnm
	sc3JUSuG1q0Orj3JsnopF2V+cULr5ocDQCnlEWQY6D9uCgogckS1tiXedShDxCOkGJ9FrV1kKgrqE
	3eOBwgD1FQS1XDXSWAepyvD9NcxythzFFUwU+BYo8U/hSyYZJrpnGgNuYUa+vbe+w++fmqJ4a5OQn
	MyLZiNHyQO3lOK5keVBtjXFLWJkXmWzGUo6zudUbM9Jhivo9375i1wO8oAp0kofqVdcKBVwsgon7M
	iEhWhWRk4XSrmwXidTjfuMLxlZyCWjIo8fHXxKOa1IFxyJ/+u0oClSRfWXvadTF3W5IibNTYPT24g
	n9BNdeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOh-00000007LGq-3NeC;
	Mon, 07 Sep 2026 16:40:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOf-00000007LFd-3FsI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:40:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A3B760239;
	Mon,  7 Sep 2026 16:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986811F00A3A;
	Mon,  7 Sep 2026 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799240;
	bh=G0TnF0EdtSAjs6s5ohnJS7vNK/6l+Z91b6PJOF9Vof0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fEbnloOv9GjrTNDcDEMqFW38QNNqnZpKB9puUB8QoNObvdlHLcsM81ng0rRPCK1dm
	 utIwFWmbXy/TAaw85mSe61P3d4AlUptqlHawOUo1yba9WbrXaLUDZksEmbqfrST+8n
	 C9w9YCRmxbNVGQ+MOa+x/UnM+losT0dErQofYVEQIR2CMyQVyxwHI5oTGgIVhHHmPW
	 4pZ3JdZFXC3HvfO8VspXHSva0AjQCfD+j3GgG7+YN8FON4LDgTKn9gYO9GB3jAZH93
	 AnDVoOIKRrpM+4IlgzNfPFg3wq3gqFM2z0kYR3yy2EIFuJu3yskk42nEoJs5WtzmRF
	 lVZl8OsZD7cUw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 02/19] cpu/hotplug: Avoid trying to bring up CPUs that are already online
Date: Mon,  7 Sep 2026 17:40:05 +0100
Message-ID: <20260907164024.17164-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


