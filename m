Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD4CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qVcW2GziEfVUm3RUX0aBXQyU49fByi2p1AjgkK0CGI=; b=AkI+nVQKzClgnF8Rqst4xLj3hC
	edzzFL/SCK1QaRUvNAKAFfHJAa/UD2SJL1+imVsvtOjfhVLZUOjkkUeBa15GhmNCLwPHC6ij2XnZY
	hKXfBu5+cau/eKu77wpMsJxtRUuP9OCb0LJ4uA0rGIAqiJUIQHRYlMeo2vlELbGsAOkY1VvrMEeyR
	9A2khws/+JLDON+9b0EcpCm21YaU5nAtCpl+89VTX16KkTJwAP70IuVXfLiJpEWxd4KE7+SEWB+8h
	UK4gerCnNk7pFCTN1AFaG+kbmQ4zjMPFMedJfUuwjd0gt+DIRvjpwXg0r6+Zhg48aTN7do0i2L5De
	oXBtztHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHim-000000068qu-44VJ;
	Fri, 08 May 2026 09:42:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHil-000000068q9-3SLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 103E36057A;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E0DC2BCB8;
	Fri,  8 May 2026 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233330;
	bh=8nT2QL41qh0YTYDMx9toL1jPyGWMqS0ony+FQLtS8nQ=;
	h=From:To:Cc:Subject:Date:From;
	b=XcgpXcpPX5aeSI3/qV2Ym8owffrov2WvneHX/k1RFUq6nvOoBUyuuOb6ewwjRd9c9
	 PVM7KGv9qcb5NPjJEGKcZU6AK7FozBUQKZgySc+CvLXZs1gdQdGx0g04jNuAwGvkS1
	 AJFjVEWjHWFk4iksqNdJvBo/JNimYsshM5vH2qz7qEdgPLAIwZwgqyFq4cl/EmzyNe
	 fGhfV4uUrAxZlZPJryo1sZHOpPLwPwdAxJzgSe8AJExaNrqu2KS8EnSFE4X/izSKa3
	 CC3lWJSRJTgQiN9Rdo0xH1o83PblbsSxTw7GJB43Lp73ufYpoqXG4dOMTSbOnf9DOp
	 AG1/cZmNrKGOg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wLHii-00000000HJz-233y;
	Fri, 08 May 2026 09:42:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v2 0/5] arm64: arch_timer: Improve errata handling
Date: Fri,  8 May 2026 10:41:58 +0100
Message-ID: <20260508094203.2913880-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

This is the second version of this series addressing a couple of
embarrassing bugs in the prolific arm64 timer errata handling
department. Nothing changed since v1, which didn't get much traction,
so this is only a rebase.

Time is hard. Timers are harder. As a consequence, we have plenty of
broken counter/timer implementations in the wild, and an
infrastructure to deal with them.

However, what we have today suffers from a number of issues:

- if, on an heterogeneous system, affected CPUs are secondaries, we do
  record their broken state but don't correct anything

- we always play games with preemption in order to access per-CPU
  state, irrespective of the presence of broken CPUs

I hear someone saying "just use a static key to enable the errata and
be done with it". Good call, except that we need to do that from a
CPUHP callback, and that's deadlock central. We can't do it later,
because this could affect the CPU before the workaround is enabled.

However, not everything is lost if we turn the logic on its head:

- always start with the mitigations enabled, even if we don't know of
  any affected CPU

- once all CPUs have been seen once, and that we still haven't
  enabled any workaround, disable the mitigations globally.

With that, a normal kernel boot with all CPUs will quickly switch to
no mitigation on decent HW. If you're booting with CPUs disabled, this
will only kick in once you have booted them all.

Patches on top of 7.1-rc2.

Marc Zyngier (5):
  clocksource/drivers/arm_arch_timer: Add a static key indicating the
    need for a runtime workaround
  clocksource/drivers/arm_arch_timer: Convert counter accessors to a
    static key alternative
  clocksource/drivers/arm_arch_timer: Drop the
    arch_counter_get_cnt{p,v}ct_stable() accessors
  clocksource/drivers/arm_arch_timer: Expose a direct accessor for the
    virtual counter
  arm64: Convert __delay_cycles() to arch_timer_read_vcounter()

 arch/arm64/lib/delay.c               |  5 +-
 drivers/clocksource/arm_arch_timer.c | 99 +++++++++++++++++-----------
 include/clocksource/arm_arch_timer.h |  1 +
 3 files changed, 64 insertions(+), 41 deletions(-)

-- 
2.47.3


