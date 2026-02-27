Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9EEFD4600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIzyOBO0MUC1gjnQlOZaz5WdpoHJoIjGFPUUXU0dq7E=; b=sZi0q4OrpsiJD3UHO2qFScS37/
	dnRkEObN1+U+2ntCznvNkMIMWJ0IEHrf/2HOWGEKjg37eZJCiPJuUQLl/Apc60eiDqFxhsVGqchg7
	IIDjXABJn+ygR7Rl2CnBmmLPSAmLgobtI9OZG2SuCF3jCO32Om4FDkA2O6EwpmQ3tKiPLLGGHkNC3
	b7iLuK6WP0nN4dTAOx//6JZedZZjcixJekmb6UFeijqmCk+lC1ORTHhUHEvin5cYUr9rm0hVnWNpl
	V/7FZN/q02Z/x1q9pM73G9FfP2umrqxNgqiarrdnQx43AbTwtvYLo6gKI8+riPqql3jxWEvjUJNho
	XV+rt/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrar-00000007nlZ-2bPq;
	Fri, 27 Feb 2026 06:44:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrai-00000007nff-1BtQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIzyOBO0MUC1gjnQlOZaz5WdpoHJoIjGFPUUXU0dq7E=;
	b=E81MX9z27fb6iOgDPvOjHyZq9lLoj5k7Xn4lhkXaNGe+gQTytI7YYl/p5GxyCR0bpojyEl
	I+ytafun06DCmWYljV840vgi/0RqQ0PrTsgD1b6mau/3ev4WlS35Flv65khQJPJm69OB19
	5/Ui4qC67Lli03t78tLB3XaKiMWrgsXYg3sSUT5skJ7m85q/xhqehxm2ciaKp9LgGaqrtp
	cwgKZPwiOPxbxB2axoaVmFdKlSr87wTTQU7R3UTjM7UJQ2RyquhN7VyIdVNYjuAwr99jkn
	k7CNW3By19H79/yNTztN1GKacKgRTLbJVqum68Ca0M4YVfCpEteDCjyhoVNLMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIzyOBO0MUC1gjnQlOZaz5WdpoHJoIjGFPUUXU0dq7E=;
	b=U94drMM56wMv6zpBylLQPwmLFuDXo72akf5+eb1y2OjPiFv44gi9g/toB2rqCZHPxOpY1/
	5xKusqE5XrZEMwBQ==
Date: Fri, 27 Feb 2026 07:44:29 +0100
Subject: [PATCH v2 03/15] ARM: vdso: gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-3-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=899;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=aYrHWJd0bhmjChMmo+JGha4OUSHIgaD7jcuPC+kTlSg=;
 b=L+nxYTe4Xu7tbOaysmodJ3f65uyex5hwuv4KS3TnbH0HYi4mZ5/LtcKTrbLS5iK5/ygPPMWVi
 i+XTjg51+63DE4ZupdB1nrJ3vyHCCtJqQWsPOwIN0nJQy9oIttoD0qK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224448_487328_9926F682 
X-CRM114-Status: UNSURE (   8.63  )
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

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 1e9f81639c88..26da5d8621cc 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,8 @@
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1

-- 
2.53.0


