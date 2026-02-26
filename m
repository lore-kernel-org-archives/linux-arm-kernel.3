Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915E6FC592C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r4SZo5uZC/P7ElPVfHiGmk8g1VraQoDmCXo/VdatM7c=; b=I3VlQj9wA5X6IK7GNQiONK1VDU
	94A+ZewHTMM4vQzYRUqdp9YJub4U0x21xTMxBz1TjpXSGypaviGtO6bPfkuPRsH3KEoFlRsG8KYAw
	nn9K816eQ9L70Kg4u5Vho08rz0/c4V/IE6iQiSgp49g+Zr8O1o/ReQWDv66N6BJLi7QJgBZWwW5/L
	hLg7YZaTnAiqPEjyI2PTJbAzBTP0fzP1bjCYddePZRfOPX5oLhdQBNEC07TLPXP5pvzfAzAyX7KSN
	bE0Zm4lPLHrNqXYvLnqz6PQpDUIQfTzpOcpfVGv1+BPFqdyqXHgVNn4VkleIIdWlhs8EP8pqJ68W4
	lxVsMocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZNX-000000061MW-3kw6;
	Thu, 26 Feb 2026 11:17:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZNU-000000061K8-2do0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:17:58 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772104671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r4SZo5uZC/P7ElPVfHiGmk8g1VraQoDmCXo/VdatM7c=;
	b=eQPIBagm5WlGNaY2x3fZ4Mmo00mFmCcMto9CX1ac5gTVFJDSEf6lZVXwvfefeIT7VTFG81
	tvd4WvsLqy/0mMTlcgZ2MJ+jzurCkek94xhwZfx44eQBMeC4FJhaq04udY2F+JNyub6ZTl
	LIh+x8AjqXD+5Wm7AWa6YxTT9fUkHofCGySf8+U7dP9x4s3d0KxEr4knAiZwA1SKFNDuP5
	durYekfm3vWSa3EeN+QhLoG8Q8aDPCZ9aWKEhH3LoXscE5wq05C5rWmjDV8ZxlWzvEKZZO
	PBaDB+wxYcM6yBQyn+2u7pSB/hSUhBDEK+c6kI2tUAq/Emp/juhG5gbG2KrkMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772104671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r4SZo5uZC/P7ElPVfHiGmk8g1VraQoDmCXo/VdatM7c=;
	b=GruVQ9gN0+uWbSd8aXX+7Ne4dz0SEOB/fPNI2joKzi4vVCKQsFlrZc5y1U49e3Q9ywK3N4
	wVcxo42NCmb2J5Cw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v5 0/2] ARM: Remaining PREEMPT_RT bits
Date: Thu, 26 Feb 2026 12:17:40 +0100
Message-ID: <20260226111742.3598421-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_031756_828486_BBEEFF75 
X-CRM114-Status: GOOD (  11.98  )
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

this is the last batch I have to enable PREEMPT_RT on the ARM
architecture. It is just sending a signal with disabled interrupts and fina=
lly
enabling PREEMPT_RT on ARM.

Is this okay?

v4=E2=80=A6v5: https://lore.kernel.org/all/20260116170041.1059997-1-bigeasy=
@linutronix.de
  - Repost.
    Russell said in aWqZDwxUtaE1yP28@shell.armlinux.org.uk that #1
    shouldn't be needed anymore because he has changes in his queue
    which should provide effectively the same changes as #1. I can't
    access it. Here is the whole set so it does not get lost.
    I would appreciate if it could hit the next merge window.

v3=E2=80=A6v4: https://lore.kernel.org/all/20251110145555.2555055-1-bigeasy=
@linutronix.de
  - Dropped applied patches
  - Rebased the remaining one on top of the recent fault handler and branch
    predictor fixes.

v2=E2=80=A6v3: https://lore.kernel.org/all/20251103101545.760243-1-bigeasy@=
linutronix.de
  - Collected tags.

v1=E2=80=A6v2: https://lore.kernel.org/all/20251029155918.503060-1-bigeasy@=
linutronix.de
  - Allow to enable jump-labels on UP. The UP build does not involve
    stop_machine(). Reworked by Arnd.

  - Instead of forbidding HAVE_GUP_FAST with HIGHPTE enabled just
    disable HIGHPTE on PREEMPT_RT. As Arnd explained, HIGHPTE is rarely
    needed.

  - Don't let ARCH_SUPPORTS_RT depend on HAVE_POSIX_CPU_TIMERS_TASK_WORK
    which in turn depends on !KVM. Since KVM has been removed from ARM
    it is sufficient to unconditionally allow ARCH_SUPPORTS_RT. Noted
    by Arnd.

Sebastian Andrzej Siewior (1):
  ARM: Allow to enable RT

Yadi.hu (1):
  ARM: mm: fault: Enable interrupts before invoking __do_user_fault()

 arch/arm/Kconfig    | 1 +
 arch/arm/mm/fault.c | 4 ++++
 2 files changed, 5 insertions(+)

--=20
2.51.0


