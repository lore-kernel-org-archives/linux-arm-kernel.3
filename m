Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7C2CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZDGVKXmK0DrP73XUwG7R5KbZVQj8LTgpIzpeD1RI90=; b=pofo16Iii5iAiEV8PlNjKlUJBY
	TtvMzKf+ZwkZ4+O+SBpijaIVr00hLKYUykhO+ev8HdcyO5cU9DW1uJqpnzKIkLafKCcVRiYKSUger
	KXbFU4f13wM3luW9NseK7WKoGwpWaaAQTFrsgyPZn3zj0i1QqJb2H7qRaFZWkDFAv4S8v/0wGdaw7
	wcxrdBLmc2SBwgasH9uweezMQnKgRf7gK62MCFSa9oWmflVpgx4Xzb8e8MIo6LThACOCY9leW6tMT
	UegxDzcqHlUOcHiwCUMP7Yo5kj6MA7x7ULm1mOakAbPYkZ8ydvGctxKn2RC9PcPA8b6Frkewh0J4e
	dqUllf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1nD-0000000GSXB-3G7j;
	Thu, 21 Aug 2025 09:41:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0AH-0000000GAM7-0UCY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:56:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755763010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZDGVKXmK0DrP73XUwG7R5KbZVQj8LTgpIzpeD1RI90=;
	b=H+CnCdjd6lpe6sysQTEYx7JoBc7gUd7yqoTXHWwDnYDNWqHQWhJDZkF/7Z1m8eoooFoLIb
	4ONKeYMLeD1qZ7Vst5585Wv7xvy4+3zBoIIMORWMOhxQhmR76M44IA3JACSUKlGPXfszeX
	KpqDgEpkjD4bi6BPbyZ33u6EGkJP1nuIGbB8m/0YxIaJHhxFhrv5sPS1eORfzfF4JMFay0
	JRkqbSm938V6Kk7i3I45+/rT1MV8lodVQHeII3YwNu4wGIi3DVjlE3c2voDQPl3qgypvv0
	rth9HRa/EmVHYMjzhZy2YAK18v1fT8usqJ81B5K1R0hwLl35MFEXvWYdQ29gHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755763010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZDGVKXmK0DrP73XUwG7R5KbZVQj8LTgpIzpeD1RI90=;
	b=VHD7/huPGIBLHZ0WUatDCVttPmtxuhxsxAl13SRQ0PwP/Pr2K8Ev+hDU6Oq4X09R2YR23a
	YhKqHTUda3fecEBA==
Date: Thu, 21 Aug 2025 09:56:45 +0200
Subject: [PATCH 2/3] arm64: vdso32: Stop suppressing warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-vdso-arm64-compat-bitsperlong-v1-2-700bcabe7732@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755763005; l=1932;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=n2qRj27gMV9HtrK57nk2Kj0O4VPuGEHIaNui3njxil0=;
 b=hrJA2V3Iy/r5NOoKeqjug/i0yJoFJEzzZgrEcad1UejfeMjHC3zloJ0dWqbWIKBsroLpH4YcF
 xf7nz6xP71MB5ixHNKa7ccT8sq+zwk4u1Q0/d6MiNmsDy9HbwqHt2H6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005653_307579_AB16ECA6 
X-CRM114-Status: UNSURE (   9.81  )
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

These warnings don't seem to trigger anymore. Probably due to the
introduction of the vdso/ header namespace. Nowadays these suppression
only hide real problems.

Re-enable the warnings.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso32/Makefile | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index f2dfdc7dc8185bc045907283b68ab18fed980312..fd80123bc8e620d868040a61244e83575d855e35 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -21,8 +21,6 @@ endif
 
 cc32-option = $(call try-run,\
         $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
-cc32-disable-warning = $(call try-run,\
-	$(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
 # We cannot use the global flags to compile the vDSO files, the main reason
 # being that the 32-bit compiler may be older than the main (64-bit) compiler
@@ -74,16 +72,6 @@ VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
 VDSO_CFLAGS += -Werror=date-time
 VDSO_CFLAGS += $(call cc32-option,-Werror=incompatible-pointer-types)
 
-# The 32-bit compiler does not provide 128-bit integers, which are used in
-# some headers that are indirectly included from the vDSO code.
-# This hack makes the compiler happy and should trigger a warning/error if
-# variables of such type are referenced.
-VDSO_CFLAGS += -D__uint128_t='void*'
-# Silence some warnings coming from headers that operate on long's
-# (on GCC 4.8 or older, there is unfortunately no way to silence this warning)
-VDSO_CFLAGS += $(call cc32-disable-warning,shift-count-overflow)
-VDSO_CFLAGS += -Wno-int-to-pointer-cast
-
 # Compile as THUMB2 or ARM. Unwinding via frame-pointers in THUMB2 is
 # unreliable.
 ifeq ($(CONFIG_THUMB2_COMPAT_VDSO), y)

-- 
2.50.1


