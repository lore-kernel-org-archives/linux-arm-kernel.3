Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE747CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c9ooz8wSRU2u6BlT2LPhS1jlGu4ehqNMANigrfTTlE=; b=BOjn5x5gyD37bdDfKagZtpeAc+
	XgIZVeOfXOZ4dRPTKGWxg+kVue8Bnw2TKDjSxO4EC0rVxQ21CFKzdHKba03k+zsERIvJ99KWGx3Vb
	yicZ+EfF7sk2qdVqu4VqAYRxE2TO+Rddh+nyPWDhFY1omvN/hElmV3mchlB0rQdxmjuW+2BNWIHcv
	G0s+hnIxTqkCVmOl03jYGFB/ChB9XKK2Qtppmdw/SCgBHZWQpm0uTBkJQxj96+TggewajM8R1ZGs1
	2qnV4/aNsbva1jJ60BE7ApgN7oN2RLyoYmcKNVg9dAJa3d7s7Pz+JMqCqtv6AKBh/U9O2zQhpePUM
	VJr/R6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJo-00000005dNJ-3WRr;
	Mon, 10 Nov 2025 14:56:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJh-00000005dJz-11Zs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:56:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762786580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5c9ooz8wSRU2u6BlT2LPhS1jlGu4ehqNMANigrfTTlE=;
	b=sPz8UBELIsmxkqtdMx/Qr3z0hMIn8xEcphfEOKUl0phKipK53nWRZ05fm05ino7wM6Byhc
	SxV5CLFS34UVo90wZj4yurkecDUJ2a2aQTw2Omw4qtaqbEPWuZB5LeP7t6g264qNsXQkw7
	RO24JyJo88e5QnlIwVcooDJ1nY4J/ZlAr2n7kCsSMnXRYvz3dj/a27fgM6BBg5cONa4PjS
	bu8ngPMg9eE9CuQo8ifcKNnCaH63oCljAHJj9Fga1QFhcbEoKu9D5jAva/saucX4graKxw
	H9fXjK8oY5LV6kF3xWP9m4Za9K4VJ7NQ4oRabAnjn0Sx5DIH165rlJ7v8esD+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762786580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5c9ooz8wSRU2u6BlT2LPhS1jlGu4ehqNMANigrfTTlE=;
	b=6q7RV/lvnibF77A9aLEfv5p4DKW5Y/jXq4K5BoqANlSwDMT00hJAv8/L8HCgyseZH8HNp+
	lyZkZyMLO27nWdAA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v3 3/5] ARM: Disable jump-label on PREEMPT_RT
Date: Mon, 10 Nov 2025 15:55:53 +0100
Message-ID: <20251110145555.2555055-4-bigeasy@linutronix.de>
In-Reply-To: <20251110145555.2555055-1-bigeasy@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065626_255176_3132AE32 
X-CRM114-Status: GOOD (  16.80  )
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

On 64-bit Arm, it is possible to use jump labels without the
stop_machine() call, which architecturally provides a way to atomically
change one 32-bit instruction word while keeping maintaining consistency,
but this is not generally the case on 32-bit, in particular in thumb2
mode.

Disable jump-label support on a PREEMPT_RT system when SMP is enabled.

[bigeasy: Patch description.]
[arnd: add !SMP case, extend changelog]

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4fb985b76e97f..5941566df3ed0 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -82,7 +82,7 @@ config ARM
 	select HAS_IOPORT
 	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
 	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
-	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
+	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU && =
(!PREEMPT_RT || !SMP)
 	select HAVE_ARCH_KFENCE if MMU && !XIP_KERNEL
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
--=20
2.51.0


