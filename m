Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48E7D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BFcJKbGb3E9mJ5EsFDLFnqr34Y42nTMqQdmb2h5i0Q=; b=cBX4DdmoovjpK/h0QNcZS7+q8Z
	X1RSmcvnj1UOomTnOBRmAcvNUGJ/UoJJyWKENGhjjaPAz3ceExBLIKvUOL/QJgXoD6sCw0wvbexLE
	LzLD8bobtXGfkFJgNU2OBjjSxqJUkBEVIyqL9xQ3vbQAzS9Tg/d4R2h0wdoBhDV8MyaGxDYctEzR8
	ce/7SB5Hu+jgRsB3CWkUjS8IxR1wcZrBjCSzZcvY9ZPV4Bzp/9VugHk3S3sOwahrQxNauJDdHgcth
	I2KRJO6uBfE6WZx77r0OLn4QPiU2mOH2jXngjWQWpXVl+dCWrwa2kBKVXmj6Slnsb4Fl0hyWCzOlt
	IL0aHOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mDU-0000000EZ59-49bY;
	Tue, 29 Oct 2024 13:25:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lkZ-0000000EThD-3Haw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 311C35C5DDB;
	Tue, 29 Oct 2024 12:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3902BC4CEE9;
	Tue, 29 Oct 2024 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206507;
	bh=LSVbONdYSI3CZ/dJAq35R0rVW7RNPedEHyCHamPd/X4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gkNRyVnGdgi/trV2bBALBw8EvREHuwKmyHGwmiZfq6dsPX+GtXYkMmsfew8d2qgp1
	 RXB2xm1PxgCl9KHnApsQAPo2THazdRFMnjGoroATzRoIAMkrA5DlD3Tc5w18ni3+8h
	 cGm+L7Whw+ySv93kBXMogr2wVP9nbCDXXy3eqqFsCnOfuwjdkYxV4dKubCawBrx7cM
	 Dhv8k2HpEjvP10JWmErN19jCwNxV55pZv/8I53+BMUaorGpOOr4tKceamb1IOZg5lg
	 g2XMhLwA8uI38/yWqt6fM2zd/BVsk2utUPoaFP/NhQ21ZcZhrS5cZ3tUowK6/uWUH5
	 RvKRBB+AiujFg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/10] clocksource/drivers/arm_arch_timer: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:46 +0100
Message-ID: <20241029125451.54574-6-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_055507_891758_AA7514E6 
X-CRM114-Status: UNSURE (   9.50  )
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

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 03733101e231..2bba81e25aa2 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1179,8 +1179,6 @@ static void arch_timer_stop(struct clock_event_device *clk)
 	disable_percpu_irq(arch_timer_ppi[arch_timer_uses_ppi]);
 	if (arch_timer_has_nonsecure_ppi())
 		disable_percpu_irq(arch_timer_ppi[ARCH_TIMER_PHYS_NONSECURE_PPI]);
-
-	clk->set_state_shutdown(clk);
 }
 
 static int arch_timer_dying_cpu(unsigned int cpu)
-- 
2.46.0


