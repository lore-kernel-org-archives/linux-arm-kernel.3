Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iPr+hHrEKgvP0v6M2Cs3HYrasCTlafxHuSp/+8CPWHs=; b=h+TS5ovZrBzvsMunF/ufs8kQGw
	eDXBHJAXfj4ewIc1iExgQJWw1G2OiOaD9QzY5coxURrjnkx/YPV4yR0OYQP2z3Z1hu8grVEhgNBt5
	9K1QUFabrvWqeuHgMX0I7F2EY/6gnqUrqpnd75GqsZVrc0pSl7v2SfcYA/11aMGDNWjrvGiHBHdPO
	UGoI5SGZUw6cKgKsBqV71FWA/hIUl7y0HPDoFaN/yEB0uTJq7ToAzolcg0HR3F1Lw/wMYMMXh+elq
	2JV5O49Bi3IvlS7Qjqig1Zs7AWdlAhox/oOEXougAG+/2o5ZvRiZJbuD8UOmXHRDilAIqQoMf/2MH
	ZQPMfHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9EG-0000000DSSC-3E4j;
	Wed, 13 Aug 2025 11:01:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7G5-0000000D9fU-3Lie
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 08:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iPr+hHrEKgvP0v6M2Cs3HYrasCTlafxHuSp/+8CPWHs=; b=K+b6zgaR6RJQ4zaNf9nC3gbJ+L
	wGNA8t3NKjaOAFlHabveV915sbOiLyU9tXIyozM466U/56w1ra2ANTYIsjzCTaDCuL0Z70Vs9JZsQ
	6Ed3zG1hYR+FFHX4IHh7xDLh31qY7IBvF5sK6zuxDnfvwmzsBaaL7xvDcvhg8O/Vu/nGp4xbNMAg/
	mbnn0dwYfD+L2WjRG1UU8+yFqgupUoo63BBI6yvjNEvs36KI6Wi8TR3LUqHUZJcN1jsrrTSmnrIdG
	fbFpOj5uFbgB2rjL2v0tpo8rfVLGqKCT7OzvTRAHGCqu+8RyTt7MXeWFkT2QAVCN0lxZWh7fW6NVs
	Bk401DnQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7G2-0000000G1W1-3TWp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 08:54:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45036113E;
	Wed, 13 Aug 2025 01:54:45 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB28D3F63F;
	Wed, 13 Aug 2025 01:54:52 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark.Rutland@arm.com
Cc: alexandru.elisei@arm.com,
	Sudeep.Holla@arm.com
Subject: [boot-wrapper-aarch64 PATCH] Configure the memory-mapped generic timer
Date: Wed, 13 Aug 2025 09:54:34 +0100
Message-ID: <20250813085434.8585-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_095455_105867_0360A070 
X-CRM114-Status: GOOD (  13.23  )
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

Linux added a memory-mapped generic timer node to the device tree for FVP
in commit 7556a55b07c0 ("arm64: dts: fvp: Add system timer for broadcast
during CPU idle"). The timer needs to be configured by EL3 before it can be
accessed by lower exception levels.

If the timer isn't accessible to Linux, probing fails:

[    0.000000] arch_timer: Unable to find a suitable frame in timer @ 0x000000002a810000
[    0.000000] Failed to initialize '/timer@2a810000': -22

which leads to KVM failing to initialise properly:

[    0.532000] kvm [1]: kvm_arch_timer: uninitialized timecounter

Configure the memory-mapped generic timer in boot-wrapper so Linux can use
it.

Configuration consists of:

* Enabling access to the CNTBaseN timer frame, CNTACR<n> and CNTVOFF<n>
  registers in the CNTNSAR register.

boot-wrapper tries to enable access to all possible timer frames and
registers for simplicity. This is safe to do, since the CNTNSAR.NS<n> bit
is RES0 if frame n is not implemented.

* Setting the memory-mapped timer register CNTFRQ to COUNTER_FREQ, as
  mandated in ARM DDI 0487 L.a, section I5.7.7, "CNTFRQ, Counter-timer
  Frequency".

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Makefile.am       |  2 ++
 common/platform.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Makefile.am b/Makefile.am
index 0178e5dc1050..7c7098c6a103 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -27,6 +27,7 @@ endef
 PHYS_OFFSET	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findmem.pl $(KERNEL_DTB))
 UART_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,pl011')
 SYSREGS_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,vexpress-sysreg' 2> /dev/null)
+TIMER_MEM_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,armv7-timer-mem' 2> /dev/null)
 COUNTER_FREQ	:= 100000000
 
 CPU_IDS		:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findcpuids.pl $(KERNEL_DTB))
@@ -36,6 +37,7 @@ DEFINES		= -DCOUNTER_FREQ=$(COUNTER_FREQ)
 DEFINES		+= -DCPU_IDS=$(CPU_IDS)
 DEFINES		+= -DNR_CPUS=$(NR_CPUS)
 DEFINES		+= $(if $(SYSREGS_BASE), -DSYSREGS_BASE=$(SYSREGS_BASE), )
+DEFINES		+= $(if $(TIMER_MEM_BASE), -DTIMER_MEM_BASE=$(TIMER_MEM_BASE), )
 DEFINES		+= -DUART_BASE=$(UART_BASE)
 DEFINES		+= -DSTACK_SIZE=256
 
diff --git a/common/platform.c b/common/platform.c
index 4e390e101b24..a51a1ef56a5b 100644
--- a/common/platform.c
+++ b/common/platform.c
@@ -31,6 +31,11 @@
 #define V2M_SYS(reg)	((void *)SYSREGS_BASE + V2M_SYS_##reg)
 #endif
 
+#ifdef TIMER_MEM_BASE
+#define TIMER_MEM_CNTNSAR	0x004
+#define TIMER_MEM_CNTFRQ	0x000
+#endif
+
 void print_char(char c)
 {
 	uint32_t flags;
@@ -124,4 +129,9 @@ void init_platform(void)
 	raw_writel((1 << 31) | (1 << 30) | (7 << 20) | (0 << 16),
 				V2M_SYS(CFGCTRL));
 #endif
+#ifdef TIMER_MEM_BASE
+	/* Try to enable all the timer frames. */
+	raw_writel(0xff, (void *)TIMER_MEM_BASE + TIMER_MEM_CNTNSAR);
+	raw_writel(COUNTER_FREQ, (void *)TIMER_MEM_BASE + TIMER_MEM_CNTFRQ);
+#endif
 }

base-commit: b621b157b42f1fe398520cf499db88aa654c78e2
-- 
2.50.1


