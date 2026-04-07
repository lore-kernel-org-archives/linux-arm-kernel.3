Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D061CFEEF52
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne9YhWeocrXt/5MhGBNsry2kXN5+/RkE7zYzKP/XdTE=; b=LGv1HiZVHDJtzGgor/3rq8h7Yb
	aUTbQX6XGO0l+vk+e7CfPSp1u+fG5jzavmOT825IiXFib0oBSgJfZ+08Z6GyjfpshLlRxNJesS46Z
	RGOMC2d4wT3QyTpy97Lrd5X03dv60raTUIYjBuZTrMSTuTBZm/hhlydZGn/X2RYlobeJq6xZtqGKK
	q4RXZTw7ZWGsz5ucza8o+QOoJXYtyytrYmLl2H+N0GYoiK2ZCV+YXFtpcsFVJ1jKo1wp+B68znxUv
	W67LRZj+usyWyTX10NkbPVWM87i/3YQDckZm/vsfgSzYKH7unWysv7dflFTD8KoWpBhZ8ouyiaprl
	FfXHP8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RY-00000006biN-3L1Q;
	Tue, 07 Apr 2026 14:30:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RW-00000006bga-3loZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54F9A60127;
	Tue,  7 Apr 2026 14:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C939DC2BCB2;
	Tue,  7 Apr 2026 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572214;
	bh=2mBdtCMg5XJhO2It05OyZWImRJfyjVt9ZDQUn9Uv+L8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P5rUk0l17s8TR/KCexB3phw3iVAAw23OVADZWDCjcg1bB08aGDgI4zPKMy1oLe5bs
	 viE39t/tVnQSD21ApcnfZ0RNMwbq+DSQDctZlMR3sjHAvdllC8fDW1TtCxa2NfGlc1
	 FLtai55m3VKhyc5TnXNphhf7fVspNz1aQm4TF2Bhwgt663SUsvRljb3P63Yv2cImNK
	 mfwkuB8PgNOgQ7n4C96Rrzz6tGPfWMJKDqShG20TTCrOkzCQXXQ/VeiI9B8FRQjSc0
	 Ino1vjGOmwJl9Oheg1jZ2jaPKwlG07F/8IG6MmBQc++Ua/MrvUC574ZL1DfiSevXdk
	 xcCMoGn71QsJQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Apr 2026 09:29:45 -0500
Subject: [PATCH v4 3/6] arm64: hw_breakpoint: Add
 lockdep_assert_irqs_disabled() on install/uninstall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-arm-debug-8-9-v4-3-a4864e69b0ea@kernel.org>
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

The breakpoint install/uninstall/restore code depends on interrupts
being disabled. Make this requirement explicit with a
lockdep_assert_irqs_disabled() assertion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/kernel/hw_breakpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index bb39bc759810..a9266dc710b4 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -231,6 +231,8 @@ static int hw_breakpoint_control(struct perf_event *bp,
 	enum dbg_active_el dbg_el = debug_exception_level(info->ctrl.privilege);
 	u32 ctrl;
 
+	lockdep_assert_irqs_disabled();
+
 	if (info->ctrl.type == ARM_BREAKPOINT_EXECUTE) {
 		/* Breakpoint */
 		ctrl_reg = AARCH64_DBG_REG_BCR;

-- 
2.53.0


