Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64216CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LRztOyIqyrMC2Ez/HddfGnFygKmQq5glgGfhkLoOfQ=; b=AGZP5uIdOvHT9Wbk5FKkFUwy/g
	3+bD8Z+PlFcJpXuWVYXZy4p/EZftcbqazmGcUovPIN0kAEJUHAtSH2LthrM121P6HIF7IMmptQ9m5
	81llds4McMWv1dK26M0JAzp4PRtptNE8E7ApR1w5gXLGvDfntIsg4gPM7COKkC9hTvVBA7/pnRTHt
	iTjpn8eW8MC+EzxDHz5dlgue7GlXmMSwxBbxdGH7VFLurfDmdO+SR1En7deumpegD78LvwmxUJeRn
	wK1UsK3zR0qw3CS+SbZkv1zU0j8xITeYqLXDWt1B+5eUFwGb/2dkxwuzBa1rsWs4d4D6m9iVJzujU
	0VGBSNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aI-00000001tuf-2WPh;
	Wed, 29 Oct 2025 15:59:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aE-00000001trX-3lUh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:59:36 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761753573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LRztOyIqyrMC2Ez/HddfGnFygKmQq5glgGfhkLoOfQ=;
	b=ivQpHH+VIOhvSnzE7CppoebQT0ng8d7YgsQq/1Loyt9HP2+/Seva8N7nCmWY/jhZ35EPTq
	wp41zFNRq0fM6eCK4vf1d02yyOj0g7GVuhmCErVo5yn/TDiPT6ylutfKJswE7/cTkd3+Tb
	gTs8IT0EuIJiL8U97IFlrdB5sUHB+UaxsSeDxequ6YImPYEdGPj3wTRQuEFQO8RHBmGHyn
	kWZKiWWu7I1kbSl+4z47fFmshEHJclvs7G6Rtmil5JixNpR2Zbo5cQhm1u5AIz53MOtDNJ
	pu+sSSjWAUy/PehvNiePyvU/xIIUVbpRziF+cGYIDSO8rM2gbxcsIAE09tAN4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761753573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LRztOyIqyrMC2Ez/HddfGnFygKmQq5glgGfhkLoOfQ=;
	b=QYj8Pu8G6ZnR6NLrw4eU1ghlBsZj+4QPiqi5Cn0QsnLjqF8lAdvHgsa/wJ5qgx+zXsGNEf
	XrPZlF9TErZgQZCA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Date: Wed, 29 Oct 2025 16:59:17 +0100
Message-ID: <20251029155918.503060-5-bigeasy@linutronix.de>
In-Reply-To: <20251029155918.503060-1-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085935_074635_3B205976 
X-CRM114-Status: GOOD (  13.10  )
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

From: Thomas Gleixner <tglx@linutronix.de>

jump-labels are used to efficiently switch between two possible code
paths. To achieve this, stop_machine() is used to keep the CPU in a
known state while the opcode is modified. The usage of stop_machine()
here leads to large latency spikes which can be observed on PREEMPT_RT.

Jump labels may change the target during runtime and are not restricted
to debug or "configuration/ setup" part of a PREEMPT_RT system where
high latencies could be defined as acceptable.

Disable jump-label support on a PREEMPT_RT system.

[bigeasy: Patch description.]

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 864a14a434b08..99c9b1c320af8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -80,7 +80,7 @@ config ARM
 	select HAS_IOPORT
 	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
 	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
-	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
+	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU && =
!PREEMPT_RT
 	select HAVE_ARCH_KFENCE if MMU && !XIP_KERNEL
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
--=20
2.51.0


