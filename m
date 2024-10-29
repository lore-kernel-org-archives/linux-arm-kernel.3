Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737DCD2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gck+Uk/3I+dgBwmezwwiN5Kl+pWAI3U8IJE1yPWtH/w=; b=n234FLLD+SF6fBx75TAqJFR3xR
	PUcw2EejypS+4XTRbZXnzSJDV7Hb8bWE3qfE9edFl0Z4r2XmxAq3gG2YtYhuKTuw7848LKmrlfQ2n
	FZCVfdXEiWzn1VrR+W/Jqe57tTpw52NBfH9faKs8IyAWMP5M9itX1se/IQmTtCVT5dBuCXxE9F8xu
	nFSuJzAk0cftdqFAVxv6TrzMtyBelD13CWAbO9USy3uPuQpLiK4UO9cfgbSnOj8GsUGVybz8hmj9d
	XB7TTLYJEWqfhBqc79mADnSZyKJ13wCLbsjS1F1JaY6i8ftRS8Uqiv8Ef3+5ICpHXei6xh6/ySU5P
	4NK0QBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mF5-0000000EZKa-0DqP;
	Tue, 29 Oct 2024 13:26:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lkb-0000000ETi1-3GrP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:55:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B0065C5C96;
	Tue, 29 Oct 2024 12:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72136C4CECD;
	Tue, 29 Oct 2024 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206509;
	bh=ohm5m/FEq12JHJkouCz6F5DIQ6ro0AAeDjfyVqNditQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNpT4zj669geWnZlsAZnDNm321Gj3pgB2vBPJ4+3YCKqnb7R4KLMqLkxDNOzVq/H6
	 8mJdIcY/R0BmGIMEr+9N+0TqNxOp6KaLdV2oU5OUG2BbXq3zyHiyWxk0Lvqb8SE0oG
	 dopDgR1XYcWQdexsZSsS5mor3fZ1An+7XSRRhV1K3yuh6gQZesdLnKfR6D4grwtCPN
	 mumigen6+cMMbeMwrtZ7sF1CSRA609sXyinviQR5+Xj/qzJVl4ntt2rpQeDHJ0iM9x
	 NwLA682lAGcMDAocybvfuM7ktIjRwoX0U5Fqb5Gg0Y16N/g63/bBmOi96ToTEtoK4w
	 Re5R+dJfhNQTg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/10] clocksource/drivers/arm_global_timer: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:47 +0100
Message-ID: <20241029125451.54574-7-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_055509_895440_F918CC4B 
X-CRM114-Status: GOOD (  10.15  )
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

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/clocksource/arm_global_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index a05cfaab5f84..2d86bbc2764a 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -195,7 +195,6 @@ static int gt_dying_cpu(unsigned int cpu)
 {
 	struct clock_event_device *clk = this_cpu_ptr(gt_evt);
 
-	gt_clockevent_shutdown(clk);
 	disable_percpu_irq(clk->irq);
 	return 0;
 }
-- 
2.46.0


