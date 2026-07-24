Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5267BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QM9Lp+UCHv2nA/JQ1VGCr81S6Dhpwf0SM7XAotFxf3U=; b=YlJgxTrcIq5kTz
	w8zKAK4lHiC4MX9za1NMPU8LGcbrxbOKrNm2Z67ENNFhxXvLFqUWN0sBTzaUJUu4wTGAZLL8jaJUZ
	MCktXQCJDBfyTDyTgpHukKg9OFq7ndQ9LUYPqtEVDpX2ezWLAY4LluI81tekTlB1TRaoi48Sr8pCu
	rXZE01nk8mAjHmDCn4RIIIsFot6QlADLYrvT4oA3kES7lxZsw3Q2i6dIHf9tk7sMeaI4yP7NenWLy
	csqbdYd3bikqC6im0WQXolC+z+N3ULW+5fWdSlLaV9v5UTzP2xDgYivVrMX5z8L2CzVkvJfjsplsN
	8/N1gQaoHDZ320zzoZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6l-0000000GUQq-2x2Z;
	Fri, 24 Jul 2026 13:38:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGT-1EVJ;
	Fri, 24 Jul 2026 13:38:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM9Lp+UCHv2nA/JQ1VGCr81S6Dhpwf0SM7XAotFxf3U=;
	b=rCPIxj/5GrKq7vySuH0J27acfkdy45eS4OkunF7DqNmJWiyv5GotlWxcjvpMClILBS2LJ2
	cwK8pEcQwe9EjN2OWtWYG+ouAlI4ZI+fHxq+RzJc9kykL6QOxgww8Hsvfp9bftkP2Z5lUu
	HqeOighQaG/RVGk4BOuRmJkY6Dm4TD1YVVURPw5NzQTzXEAYopB3VCzhK6H1JjNDF9414J
	01WlY5G4SfJ5zhDBfKfyN2OsfqWY31CreFbs0X5BY1ROZ1JGQxP4mRbWuyavhODvXowIZl
	Q1RRjmSUH7KOL44M6ORH2GbGNm0wq0JmmnF8HYj5RPeib6+0zLk2iVjW5tWF1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM9Lp+UCHv2nA/JQ1VGCr81S6Dhpwf0SM7XAotFxf3U=;
	b=dhUeWzjmjXdkv1lOF5bi3OznddEHnV+wyC2rPF3koqyn+0bYsfbAwM07wqFfK3y4pQCEE1
	JgmU+lO4hby65gAw==
Subject: [PATCH v4 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Date: Fri, 24 Jul 2026 15:36:17 +0200
Message-Id: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XN0Q6CIBTG8VdpXEcDBNGueo/WBR4gWSUNjNmc7
 x7ajWt2+f+28zsjiiY4E9FxN6JgkovOdzn4foegVd3VYKdzI0ZYSUoicNLRYxWgxXD3cHt4bSJ
 uLChbKwYVr1A+fQZj3bCw50vu1sXeh/fyJdF5/YKS1NtgopjgwmpZkaaxlaCnu+teffCdGw7ao
 BlNbAVR+QdiGZKitEIJTXkpt6BiBTH2ByoyxEFIUdCaAvBfaJqmD8nT4PtOAQAA
X-Change-ID: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1982;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MP2SkrhK4GMSu5UIhEImPDNR3U350uvYxSPXvYLkbUU=;
 b=NRJ2rvH1f+h/UNlgNbYSlgtGoD45GCI1EXeDV8NzMkGgeC27xjfKz8lFaet2Qpmfgw6n4nBSA
 SE/1fQ32nXjCwqcSE3UpnL6MQz8E955+FZjZq56PwFgaGej21vor2ut
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_503841_77F561D1 
X-CRM114-Status: UNSURE (   6.73  )
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

Always provide the definitions of the VDSO_CLOCKMODE_* constants and
remove some ifdeffery from the clocksource drivers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v4:
- Pick up Ack from Mark Zyngier.
- Fix '-type d' argument to find.
- Link to v3: https://patch.msgid.link/20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de

Changes in v3:
- Update *all* commit messages to the latest logic.
- Link to v2: https://patch.msgid.link/20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de

Changes in v2:
- Also drop the IS_ENABLED() logic.
- Link to v1: https://patch.msgid.link/20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de

---
Thomas Weißschuh (7):
      kbuild: support generated asm-headers in subdirectories
      vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
      MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      clocksource/drivers/mips-gic-timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      clocksource/drivers/arm_arch_timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      clocksource/drivers/timer-riscv: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      LoongArch: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery

 arch/loongarch/kernel/time.c           |  2 --
 arch/mips/kernel/csrc-r4k.c            |  2 --
 drivers/clocksource/arm_arch_timer.c   |  4 ----
 drivers/clocksource/mips-gic-timer.c   |  2 --
 drivers/clocksource/timer-riscv.c      |  4 ----
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/vdso/clocksource.h |  0
 include/vdso/clocksource.h             |  4 +---
 scripts/Makefile.asm-headers           | 11 +++++------
 9 files changed, 7 insertions(+), 23 deletions(-)
---
base-commit: ecacc9c8d3ed0f63065f4a1e94bfd8bf65a3ffaf
change-id: 20260605-vdso-arch-clockmodes-bfcaf9a2c848

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


