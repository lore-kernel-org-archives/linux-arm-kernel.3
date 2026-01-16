Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DBCC982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ir0CVKUMRv2yB1rebgvkDwl7f00eEDBHBCY9mtzPkFE=; b=ovvRsJVVRlVvSWOe8ot1dz0Uma
	R44lKTLk5OA7zqZwl68iVzsJCzC6gDOPq20Wt0msruIDc8ubIGagkGMEUDqTvlNGXGjK0h0EY6Z/C
	R9CMMUzL8bjE8xRrH03kIP8TSKNGQZxojq4+kY6pJUGAbnxFJWR5KRggNeJrypWqSMS3SDqT9M7VY
	isaThqkdAk7u/gOwFnUsz64e7LgHZFmqXqXk9svp3+iejNRbWuv8PStdBwsAI8AanHbmrQdgo89x9
	dqwzS3J3jTzoxa5drE76C8dRjQK3pHGzc5gbShLqMWlRpzSGV7MPWWtf8sq8o3V3WfvsVHAn9edcY
	WUg2V3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnBx-0000000EVRn-2qjS;
	Fri, 16 Jan 2026 17:00:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnBu-0000000EVQK-2XDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:00:55 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768582850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ir0CVKUMRv2yB1rebgvkDwl7f00eEDBHBCY9mtzPkFE=;
	b=oBuaSpEnY0FAZnKcl1nDCO2CbxNqmEdea/3a4UojU0oe2QGrT8lJz2BgDmwSsm8Y6YtHwu
	p99tgud8WaUJa7EXA8xrt/UfY8Tfn5W7N2iLQRCiigPURbDSXnu0GcxC9u4CHm1yXWlxVG
	aGjXGE1zyX01n1azCAldJEM6+hI8Xs8i7LaU3KzBu+xQvlsvcsnimCYtJQxf93vW8fzV6T
	b9q31ySqLF/yxyF1N83j74O8StgQ2gNog2tT5ZyyJTdCpssRNjoEo/2k+RHwbsBqw8oH9V
	dUNlnZ9Rg90GdO39UggyD0zxUEbfQaGa4fmNNANuYSOEpB8hbxOHoHE1Kl7BFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768582850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ir0CVKUMRv2yB1rebgvkDwl7f00eEDBHBCY9mtzPkFE=;
	b=5JzoZReBxbJyKJrqWTaVoEl/TQhXwqsQliA+TyrMfQ697xAQ1ctbDAvgZOgDF8uqWqKOKf
	Nh+1RToP2BzNJABw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v4 0/2] ARM: Remaining PREEMPT_RT bits
Date: Fri, 16 Jan 2026 18:00:39 +0100
Message-ID: <20260116170041.1059997-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090054_790624_CC66D9F6 
X-CRM114-Status: UNSURE (   9.62  )
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

this is the last batch I have to enable PREEMPT_RT on the ARM
architecture. It is just sending a signal with disabled interrupts and fina=
lly
enabling PREEMPT_RT on ARM.

Is this okay?

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


