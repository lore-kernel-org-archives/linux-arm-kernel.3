Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F89CE9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vsrl/Bkp06Fy7Npl8UJC5GdCSS/Cbymvr4nzR7m3JRo=; b=a+akTj6J5HPvwKQtvsUNHQBPTq
	0PQnh6kewhT0cxwSVvB508P6e/ZfQ0bargRyekd4dkvgS/ElJp64/nLlasdbV91/y3SxKANaVCct+
	ckd1SUnPe9Hi4N7KVkZkff5Zv000MmSde0D5XUF5MuBfg+e/RWEEGGL7lveOVZmETYhegPgbgPrgW
	zBmKv1xBunC9YOLPWfItQe+b+jb7kBagZReMIhoNM3vpJGU3oeCoJBcMpcuHmvCnOz1vr3ufNsmyT
	W9p2/sg+d9GyKaUsbLbQrogcJT9Kw2AlAB06PfwgVMmD1KcO6PSXEtnlwBugC65mzFVJDRFEHpxZr
	WSEUMuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X3-0000000ChqN-3WPl;
	Mon, 02 Mar 2026 10:29:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X1-0000000Cho6-2oEm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E871444CE;
	Mon,  2 Mar 2026 10:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D83AC2BCB0;
	Mon,  2 Mar 2026 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447383;
	bh=gZfp7AFUDRuKyFzNq7gSRxIUj7Mf0Qt8SSGk362fa3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cefjFVP5ZXUU503rm5C3FgR8riQwmG/NgPfnQkXVgBpybjKDBzpEfLroCAdqRgyjR
	 N+jZjca+jNX1UkKmGF0jSVMFdb7ALQOvPrgrFY1/flpVVAlSicegQo7JZHQ5RnnD3I
	 aFPoOQYbz62cChFeNKbkex+VuJs64RIxKvwBhChHzlR5TWMdyiHdabzuE3yPZuAnSf
	 G56G1jlcqNhPSz1bviKiQlZY+p8R8qESSmYksR2jgbuNt837ffQdZMx0jKKAmxdIIR
	 VFl5fDFFcfsjFz6I98fuhfCrXiEhIvyDFlbW19aHYfz74kPDYFnXpTxNLFGz+C2SkH
	 283CmPe0sdfdg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx0Wz-0000000FBCc-0vne;
	Mon, 02 Mar 2026 10:29:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 5/5] arm64: Convert __delay_cycles() to arch_timer_read_vcounter()
Date: Mon,  2 Mar 2026 10:29:37 +0000
Message-ID: <20260302102937.1516059-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302102937.1516059-1-maz@kernel.org>
References: <20260302102937.1516059-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022943_744106_E660DFBF 
X-CRM114-Status: GOOD (  11.93  )
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

Relax the need for disabling preemption in __delay_cycles() by
using arch_timer_read_vcounter(), which will disable preemption
only when this is actually required.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/lib/delay.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a9..a667df920697d 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -32,10 +32,9 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
  * Note that userspace cannot change the offset behind our back either,
  * as the vcpu mutex is held as long as KVM_RUN is in progress.
  */
-static cycles_t notrace __delay_cycles(void)
+static cycles_t __delay_cycles(void)
 {
-	guard(preempt_notrace)();
-	return __arch_counter_get_cntvct_stable();
+	return arch_timer_read_vcounter();
 }
 
 void __delay(unsigned long cycles)
-- 
2.47.3


