Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2171C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ddJMjzmSVlj3ZFAumHWC0fEgCC+ifQjE0giD0DMzI8=; b=k0PL0h8RHMaTPhL8klFggE2oEr
	wekir04g3PAhv0uyzn9fpi29iNTaz7TarGSJBT9X3AiQpOugWhchGRHRSgyvcboLNKaRWKav5WDLV
	QdafdHyb5myhSTSBCjIkeEDPrKQXsdZIZ3odtyUoFbnF89wEDYasODjP5kXlCfpnAfgqZ6Us+/7Nj
	V0VSl3lAK6blZKiwjgAewy9KIxEhVu2XigzGcBdV4K8WA1lKecAtRSJF02i7swNpqlTbeccm5QGL+
	txFqSxjpy0c3X3277ntGxRoYUlvfmXSAkcN18LVumBap/B0Zye6OA3lSfgo9JGCKoXgEaicPUjxy5
	iHsMouHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRa-0000000FqrY-3zb9;
	Sun, 02 Aug 2026 16:53:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRZ-0000000FqpG-23zg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E978F601DE;
	Sun,  2 Aug 2026 16:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977831F00ACF;
	Sun,  2 Aug 2026 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689624;
	bh=1ddJMjzmSVlj3ZFAumHWC0fEgCC+ifQjE0giD0DMzI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EnxcngrdrxYgrQ68dHejrhk3OZR5ULOTHf7u56rU1kxV5VCoRKQ/RGs6wwfSR5aB6
	 lzDrdsH5yw1nYoqv5Mo7QVB0YSPBEBVS7dJSv2R0vAiKy+Tkco/0ZBEjTsdX5GzKvC
	 QYBRK/a39+WiSCQ64jri1S9014b8v01NR4J6iSeBCBYWMg6gAU0XofFScnrCIHwuWO
	 JKEU7c0w5LD5/kiz0a1xgiazTeJqiuYafE4P3RnCc0Pxn/k9fudyRXi/+8NNXAnPpG
	 3J7GDNaEQfuBQsWU4jVlj+P5iNoAJO1qD62pgXCwE0yzw4jfz7GnKPMpvw4pSnjFPS
	 in7fUY5C4xkcA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRW-0000000BVIZ-1GnL;
	Sun, 02 Aug 2026 16:53:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 8/8] arm64: Convert __delay_cycles() to arch_timer_read_vcounter()
Date: Sun,  2 Aug 2026 17:53:27 +0100
Message-ID: <20260802165327.385217-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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


