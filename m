Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8581CFC590D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YpeDha5j27c3+5MowcqN39lHEb3++pposdMLe1uANg=; b=mDgQstCF1HYwW9QHl40ghXi1JJ
	rBwpSyIZQ+OWEx7wSZ2WTLkgmhxC6HSnX/w00kSAs1/kz5T7GXA99vh+ZR0um2LFflA/+SC8GjBMI
	ROoDprYKYNemNsg8Sblx3VcwBwNPNR5wq00MwWHnh/2NsbWW471qqGlRg/dxEYJpYrN0/d2gt/5eI
	IEUNzz4fUpkOINSMxS52hLuT0YjzduJ3xZ+xcnXo7djkalerqxy2GrvM4i6MG3kAphn79B1rN3wws
	Lnv4XvhHT2piC2XKWthJTz8XCbS/Camjn3N4G13N40aeS7QbyixFnJZldtX2YK5mSx10jbb5ic2k1
	cs3pkGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWdx-00000005dxa-1OXa;
	Thu, 26 Feb 2026 08:22:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWdt-00000005dw6-1OYk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 630A1600AE;
	Thu, 26 Feb 2026 08:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC37C19422;
	Thu, 26 Feb 2026 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772094160;
	bh=cjikbQOzAmI0v+IWtdhzBhOY5Fr2SyEUF9BByUhm818=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYr+djUooWI2UiMcttpV8zRLYgGBTM3itEHds7Mvczn9SMPwWGP4Vj8lOTonAsmdb
	 1nXS9DmztK0BF32Fr34yFSOJzkQbZAXB2Na+H06hz2jgDcEpwepi9GIs19DmoXu7YK
	 hgqi8rXKni/ItoYuRDJWSmH7jB3r3mu2lWv+5hqmq+8vE9D0723Ed37E/sKG/v+fUn
	 OrbHxqToQlderK6VOUwgnRt5puKHS++ChHZLrCN6grVQGU9bE+IO+U4eZWfEsC2Ryp
	 AdwBd+xGXtR3VIhKVtDo39JXKbjhHCE2ONARUexEUJOCUfdyhd7u4crxdbMoRVCb7d
	 KrhAn18Q7W9mA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vvWdq-0000000DyFd-0SV8;
	Thu, 26 Feb 2026 08:22:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 2/3] clocksource/drivers/arm_arch_timer: Expose a direct accessor for the virtual counter
Date: Thu, 26 Feb 2026 08:22:33 +0000
Message-ID: <20260226082234.26707-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226082234.26707-1-maz@kernel.org>
References: <20260226082234.26707-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, ben.horgan@arm.com, daniel.lezcano@linaro.org
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

We allow access to the architected counter via arch_timer_read_counter().
However, this accessor can either be the virtual or the physical
view of the counter, depending on how the kernel has been booted.

At the same time, we have some architectural features (such as WFIT,
WFET) that rely on the virtual counter, and nothing else.

If implementations were perfect, we'd rely on reading CNTVCT_EL0,
and be done with it. However, we have a bunch of broken implementations
in the wild, which rely on preemption being disabled and other
costly workarounds.

In order to provide decent performance on non-broken HW while still
supporting the legacy horrors, expose arch_timer_read_vcounter() as
a new helper that hides this complexity.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 5 +++++
 include/clocksource/arm_arch_timer.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 90aeff44a2764..4e4a62e1c9439 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -137,6 +137,8 @@ static noinstr u64 arch_counter_get_cntvct(void)
 u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
 EXPORT_SYMBOL_GPL(arch_timer_read_counter);
 
+u64 (*arch_timer_read_vcounter)(void) __ro_after_init = arch_counter_get_cntvct;
+
 static u64 arch_counter_read(struct clocksource *cs)
 {
 	return arch_timer_read_counter();
@@ -931,6 +933,9 @@ static void __init arch_counter_register(void)
 	}
 
 	arch_timer_read_counter = rd;
+	arch_timer_read_vcounter = (arch_timer_counter_has_wa() ?
+				    arch_counter_get_cntvct_stable :
+				    arch_counter_get_cntvct);
 	clocksource_counter.vdso_clock_mode = vdso_default;
 
 	width = arch_counter_get_width();
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 2eda895f19f54..5bfd6a5db75aa 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -88,6 +88,7 @@ struct arch_timer_mem {
 
 extern u32 arch_timer_get_rate(void);
 extern u64 (*arch_timer_read_counter)(void);
+extern u64 (*arch_timer_read_vcounter)(void);
 extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
 extern bool arch_timer_evtstrm_available(void);
 
-- 
2.47.3


