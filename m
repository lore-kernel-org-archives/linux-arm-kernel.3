Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F682D2AB3E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI8hlswPn+2rtuLbW59b6ml3Vaf2FAE8DLSW53b+mIU=; b=3oldVErS9tOm3v3DANiY4wd9Rl
	fRqnjlW1yFfzOJoR3A4Wt6W+SOmuZuwOt6a68oLhrFk8fjXfojfpTKO1fakvAoJQrlRHZs7qTf+oV
	pBFzzh9dw9NBXNFKoEJoqz8d8U9nOndMD4444dG1Q4o2uc8dvfEj4HgGypOY1eG+fbSdBvZUD+Jfe
	lg4glCcsksTDZi4wR84cYZDBo7doAIEIwgdEc+EQRvEKUgUdK3eqZJB0/JJi4wEzkPyF6usbpmNJN
	27m7fuZWffauW8LPqN0mNcbiPlr0ikjp83iaFV0h64Bf5tMXTNxWW/lRrxV/GozajNtWgl7xY2mA1
	oduzrY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mBv-0000000EYxz-3qmr;
	Tue, 29 Oct 2024 13:23:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lkX-0000000ETgB-3FGH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF4485C5DAF;
	Tue, 29 Oct 2024 12:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4371DC4CEE3;
	Tue, 29 Oct 2024 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206504;
	bh=wsrgcgckUzKVDFRbi/YSgS+i6orOaA/wjwoY2un0FkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UuPxIOvGybzKkys8k2LVtms50JndeSNUJ5GCHKY85ECulRtSECWCwMGoSvFakNOHX
	 Bl4y/WCSgQPm5CN1AjONBxIK1zBBcpcyaqop4Dh2vN7swUrY70rjgC6vIuX8CjW1nk
	 OTTTDoFCgrzF0/Jmuf/7j2dnWaF48voPhCQnaV2rWiKcw+SPxo9KH5wlbDcyYxz4lU
	 sV2GoQ7PrSdAJ7QPfA4luNjfG/k2ChoDg1xqFRNH1kL9CZ1lc6kEaH/YiJbX5LTl6X
	 2xmfbKFkop17dn4NUtLpin8u+JZ0HUMid6Y7h/YbYBgLea9fiSbdz56hKErDNGDyjS
	 PDVRlx33siCaQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/10] ARM: smp_twd: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:45 +0100
Message-ID: <20241029125451.54574-5-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_055505_880071_82B60D79 
X-CRM114-Status: GOOD (  10.74  )
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
 arch/arm/kernel/smp_twd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/kernel/smp_twd.c b/arch/arm/kernel/smp_twd.c
index 9a14f721a2b0..42a3706e16a6 100644
--- a/arch/arm/kernel/smp_twd.c
+++ b/arch/arm/kernel/smp_twd.c
@@ -93,7 +93,6 @@ static void twd_timer_stop(void)
 {
 	struct clock_event_device *clk = raw_cpu_ptr(twd_evt);
 
-	twd_shutdown(clk);
 	disable_percpu_irq(clk->irq);
 }
 
-- 
2.46.0


