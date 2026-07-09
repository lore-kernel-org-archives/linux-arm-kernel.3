Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A23C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=; b=Z9JHYudxYOLZG1
	3Y93MnV7YZXcXbRYz37AtpoztDS8i6iPnUWZkO9dlXcJrwhCEU/y7CqFpDXNZdjyhHySiPE9VVIwt
	KJydvtDXvj4STmjMF3kRX0homEEt3u++Ipiynu+/xX2D7jRS9JRcY2ksP8aPa7TpNAuEXF9Fm1tDh
	Mu+MvQWUIZNTlI3KuRdXNOy+9OC/rvXnKKbcpzMooXgyueswcb8J35MD/3wGcNM0hs9YiAs50q9wu
	eVUYGDBWwbJo7yNn3UZfqFaVCiyhjLL2ya5NdpkGflVYnRGsAERQyIM0l1nTdnwyfbFF7AOYGr6dS
	g/8FF7WqSGH5/7IACVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzp-00000002Bv0-0sIE;
	Thu, 09 Jul 2026 11:32:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzi-00000002Bjx-2hTz;
	Thu, 09 Jul 2026 11:32:45 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=;
	b=giBxjz3T0P2S6MQBaE7q0V1Y+P8GtU/83OH5yvA/IJYRF6rEaZNH72uhWRmoHYQPBvSeaM
	aYnR4r1jdyxlKCtHofIYIu21ZYJGKVw0zu+eZEOXrVSQ4jqcThtvVq/2UTbCrBN/YEV7Tq
	5tFNpsN0J1iSkT07jP/gg2PBJPINWCi3E3tnw+Fa9V9beR+M/vw5jMh1JmIJ1HAhyEjrfH
	hpRUEFeMrvg4MVEEMmBLkDNRDEghr9gcOcOvOWEXIrt33Fhbgz7NP8tocFyKQBWNFVbmLa
	pbX1QoRmmZ62rssps6gM9ElrjWLJL8LCmFPjAHg1v8EZF9vB/RLuN7DuE5bxiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=;
	b=dhUA7ErG68WNBRzhRd+NtTZFYpT3et+sDudNK/W2f5/GDKNvhVYhhGh6UArQIQUKejGRLk
	3THQK4lIsGB1LlCg==
Subject: [PATCH 0/7] vDSO: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
 with IS_ENABLED()
Date: Thu, 09 Jul 2026 13:32:36 +0200
Message-Id: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZqUVGvMrioaarBGTs0UATx7
 haXb/H/BcpJWGGqLkicRSUeBU1dAW3uWBnFF4M1tje96TB7jegSbUjfSPsvelZcArkwOktDO0B
 J/4mDnO/2M9/3Ayijr3NmAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1590;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bd62m/ysnHtkfVSUaGn+V8oLxmFUlxg59T9FJQBkVtY=;
 b=v0PUn23gIRlT3wMLw6uvxNhG8MDsFLklGKvI5FMtQ09FTJRHMHBj0/elS9bs0Z3CEgLqrSM8/
 LBkRruGlMC/DM32fLjupE7GsD6pdIWQ+TzzZgMOdIZkoEhk+dyQS3TE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043242_837735_C56B67D4 
X-CRM114-Status: UNSURE (   4.90  )
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

Provide dummy declarations of the VDSO_CLOCKMODE_* constants and use
those to replace some ugly ifdeffery with cleaner IS_ENABLED() checks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (7):
      kbuild: support generated asm-headers in subdirectories
      vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
      MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      clocksource/drivers/mips-gic-timer: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      clocksource/drivers/arm_arch_timer: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      clocksource/drivers/timer-riscv: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      LoongArch: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()

 arch/loongarch/kernel/time.c           |  5 ++---
 arch/mips/kernel/csrc-r4k.c            |  4 +---
 drivers/clocksource/arm_arch_timer.c   |  7 ++-----
 drivers/clocksource/mips-gic-timer.c   |  5 ++---
 drivers/clocksource/timer-riscv.c      |  7 ++-----
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/vdso/clocksource.h |  0
 include/vdso/clocksource.h             |  7 +++++--
 scripts/Makefile.asm-headers           | 11 +++++------
 9 files changed, 20 insertions(+), 27 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260605-vdso-arch-clockmodes-bfcaf9a2c848

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


