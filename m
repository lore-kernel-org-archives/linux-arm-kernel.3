Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F272C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=esBiTzM0YMZJaHRPo8C9o8Uyx3hv3mWceMEfg8hR9K0=; b=UwfZVCUjS/osHz
	9FRzPBS15jHzW+ca2cRJSWjfIdm/ozFZoiyeHUvidQD5Q764HZ27rrtvkDu7hPkkheWYEd0529nr7
	sDrf7hyvN2u/WIxQ1T5O66n0nES0p5HubEMCNkuhAQGtS6mTmtthWXrhsCYhRLOAo9WQmZnb5OhG+
	j+eQWBogah3xjoQgOE84Rpr0T0LtZtVAtwbQ1/NqK6SlR/2z11k4EdBfy8fe88sP4LjYkFHFg3BvY
	7WfqOF6H2cXrb8NItw2PUZdgZ2UJjZ1mGOepPtXYa85lyTJMsqqKkSqTXW8o/+WwgM8561XBHzBxy
	mQs5vWyVxCEvuOTjXVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmJ-0000000BAIx-3Ovb;
	Wed, 22 Jul 2026 07:54:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmH-0000000BAFu-0raz;
	Wed, 22 Jul 2026 07:54:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=esBiTzM0YMZJaHRPo8C9o8Uyx3hv3mWceMEfg8hR9K0=;
	b=laWRibYATJixqIxXMIs22ReJlQG/+C5LJskCMYxc6LfZOADlSy1GF5xLIiKqEXE+o0Rlb5
	lmTJNYmphv5jXmpPG2qGcHDLzMQh9QcGfG8rzh1jcmgebj/+vWX0T8euBRlDGjO3ZSqI33
	a/JDSRptXbpno6ugRI7ufT/lHkZRVRCXI//sxQgjGxnFjH6kYX4bFPEVVGKUvQnFiNmHEC
	7zkJFV9MBLht1ul/pa1jXQfYOcTxjBDn7Oz+iTPBTQNPRjw37r9FZUrAnHCI5AupawWl3+
	islAIV8p4h+IXfkJMuz6pXpf/TrlD3oFKVFS0D60+Xc0hFrwctAWQGf1+RbzFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=esBiTzM0YMZJaHRPo8C9o8Uyx3hv3mWceMEfg8hR9K0=;
	b=k4BoSx+0yhCqEVDg+FKrCfzUGO8KMuuSe4E+ZiXCPao/GSg7YPhN2Lh7o6IwAUACVgABXJ
	7W3b83mwwAIBfhCQ==
Subject: [PATCH v3 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Date: Wed, 22 Jul 2026 09:53:26 +0200
Message-Id: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSw7CIBSF4a00jMUALY86ch/GAeVhiRUMVFLTd
 O/SOjFGh/9J7ndnkEx0JoFDNYNosksu+BL1rgKql/5ioNOlAUGEIYYozDoFKKPqoRqCut6CNgl
 2VknbSqJEI0A5vUdj3bSxp3Pp3qUxxOf2JeN1fYMctb/BjCGCtdVcoK6zguLj4PxjjMG7aa8NW
 NFMPiDM/0CkQJwySyXVuGH8G1qW5QUpzdRdBQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ODl0setkvj0uIlTGNGfxVZ2OpkxJixp7vvM45HUxSeU=;
 b=EtnQPZl191QmxUTsRxjG3FvEAMh/Rvkn1+MohLuwUUauSHnpds2Gap6Jj0V0Jz9Jie/xZZSeQ
 RtJDfuahXveCBHPhZVs46xzomPnnkogB0uvir/fEXRiqs77WUzztZUL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005405_383823_A6F3D4BE 
X-CRM114-Status: UNSURE (   6.72  )
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


