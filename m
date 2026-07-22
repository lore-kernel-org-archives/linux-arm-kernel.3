Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E8EC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=; b=LtOw5z9a1K+vYB+nThNB65pV6B
	Bd23ZEziLz6wW50oZRKZH+4N8k3TBdwfPNYBWlZp1X+URmNJYQ+c4rXtTYJXIE47FyIQ9RqWqnv0I
	cT4JUYtrUpY3O8hBye4quJVHtJcvIHKF9yBXWkLU06Wl2XckD8TFOMjjXhaXA+BbPYj6VlTgcYiAj
	TrqsohQYeSI0nnz75bwnqwupWaSdpzLPLkHdzCO6UdWvUwtlytvz1VTCJfUOH3pAsAQTw83dvdud3
	7WnDfOyYbDSK15eWgQIZSnJTKg8E31SEZEd2cM9/QCB0Xc8WIPLsuZOuh8YfEangSwFolGAgU93CK
	XhNJ50LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmV-0000000BAVA-3Cu3;
	Wed, 22 Jul 2026 07:54:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmK-0000000BAIF-1GUK;
	Wed, 22 Jul 2026 07:54:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=;
	b=twHNINz4A2SgJbaSpIoLpDzTN7YT8azPLRBbltI/J5f5JMFChDr8oKpgh4SphRI5q0chFt
	mIPt+MQ2aRzIz07nxSovXnyMXPg1KvtHBtf4JmSzpQfnA04J1OjCyPeWCo8P5hajJ2WY+E
	Thci06srHo7uC+ZeBH0kZyOb5GpxJUuMxCk8aFYNGUNAYFFOhp3eQVvY7quO9bhPE7bk7j
	/eyh5hftII79ZkBHyq3Er3e8v4JqrrXkDg97jlTR82zs9vf7rnReVoqyVVzecVDyyZyhtu
	EIb6A5EgWn6Saho2Fr9g3YE2lWq7KZq0PnQkaRxWjP6SkiT+w9bSY3EkPSYH+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=;
	b=lB1XSUsjBnCXqApB7W0QcRzaNLHwWXJ95tO/El8sb5mxMywWYDiELO2wOTmTzx2LdDsz8i
	VxPjEIma+g3/LRDw==
Date: Wed, 22 Jul 2026 09:53:31 +0200
Subject: [PATCH v3 5/7] clocksource/drivers/arm_arch_timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-vdso-arch-clockmodes-v3-5-4c5753191cc4@linutronix.de>
References: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
In-Reply-To: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1164;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lW6xuPaawuRjNMiAq3NjJ0vYClBA5grQp8KXYE1QcYY=;
 b=NRifUvpmMshkko5XZJtE/zr5zJOM6EqTDxL7DRbDbjNzbeJRv7QVDtCV+e1/53nNIfaD2atG2
 wBt65asPzndDT9QEKpNeCrDUgSOjQCMFhMZAk9SKEfv5di8/SfedsSz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005408_548533_014313F2 
X-CRM114-Status: UNSURE (   7.99  )
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

Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
even if no vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/arm_arch_timer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 4adf756423de..a5157d8a8a13 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -56,11 +56,7 @@ static struct clock_event_device __percpu *arch_timer_evt;
 static enum arch_timer_ppi_nr arch_timer_uses_ppi __ro_after_init = ARCH_TIMER_VIRT_PPI;
 static bool arch_timer_c3stop __ro_after_init;
 static bool arch_counter_suspend_stop __ro_after_init;
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_ARCHTIMER;
-#else
-static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_NONE;
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 static cpumask_t evtstrm_available = CPU_MASK_NONE;
 static bool evtstrm_enable __ro_after_init = IS_ENABLED(CONFIG_ARM_ARCH_TIMER_EVTSTREAM);

-- 
2.55.0


