Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7B0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=; b=Tdtn8y6uIUO8bZ+KuMyOMXa2jg
	+CpDoWFjtpwCfB7ImT64WJXOqf4MlTNyfn+jhs8DuclrWykVqCXw+X4C2vTZxx5DaGpdIeFOrm5XC
	+XucSQaGMUFtDA99h1VIVlhXwbCJlodtUx0KqeBUZUq2vEfaG7yfgbh8BdmOBze3J5hPIdZScs9GD
	4sNmv0l/A7OsHUYz6cnAbMJpjDhnXlt/BzeXeaV/CVbGtV4OmmRYPgh8i4A6y52A12aXuV4OYBz/g
	dp2Y2xAFR0qe/VdDykMQDM4f/woCFJESB0i/u16UKE8WPyJl+cP+khEQpxmxNUESZnGfk/Imo0Hh0
	yL5dDatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzr-00000002BzG-3Tgh;
	Thu, 09 Jul 2026 11:32:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzo-00000002Bsd-3FHl;
	Thu, 09 Jul 2026 11:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=; b=RvklxzABcTebWV+rW/sabww0jk
	2mNvBlwySshumIDeBCqyfti7pJzkgCT2YSmJz3h8KracR/gJJcdQW5ZDjiyk1VZJGx86Z2tyITDqv
	n9NM/Nf9rzpiyNb7rI059kAxc1CxEOpGm1+KEvoQpA9bWy8KdS55J/pD/HH4x/xooBqdAUDUGeO1d
	khS37B1ufC0cCm9hWQiaQY3mQ8rA29mxchY6LGmLX0Ko5NKTulzIfAAm3wItwxAKkntQINtiM0ZJf
	GekSZlHP1sNrOuGW2TnSsw/H2wHjKPlUxsPyzfl37Dp0sdCMSw3lJOfjNKm7c1Kfu2+6rwl/4DGM3
	FglBecMg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzk-000000098xW-1l9A;
	Thu, 09 Jul 2026 11:32:46 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=;
	b=3Tlr8lwjEQMKUWzx2INzXGyqzMn7U7cffmZUVyqa4EabPGgOlth6pNXkh69SdZD9IyTuva
	P6LcVPAyvPH3BR3XWD80JId7SB7vxgjFqLOoFYZ96eBUfQJ+7qbelhC2Unbdz/e9/LRmRS
	h3tZILA4lKwjjPrtBBwTmXGFxOb/6mO5Ofba3hxsKasNgfNb4LCABYp2ii3FDuD2zF/BY0
	8L8WSMyub4zU02TewatPe06w2I5TmQ7U4+JVhko2v2LVy6s7TOTsc7gkdIYwZnPzIMcrB7
	77BbGmtoZSIrFl5xdnSY3IvvMH6O5q2zThMK3fn7WxLCpVpOu8Xa1fJtP2NnVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=;
	b=1odo7jSNfz5NW/HvHzWtgVuuOaD6TIOwysekv2u0iL+FsKAjM1a56kySZs9tXkR5a3FEY/
	9DyNKWP5h645jWDg==
Date: Thu, 09 Jul 2026 13:32:38 +0200
Subject: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1850;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xax8qgR+SGGeOkJrm9ZK8P3x7lKX/ptqrxvCpMAlK6g=;
 b=46BCx+9PphfTRayVEAxbIQeVvMzW/0LWqNLBEcXQOqP9X9mObQV+e21QCB2KfVXaitBboNNYq
 iSHkBBI2pMPDE6SOc1YgmV5vYEtwJ8WyMhnDMk7paHoHTHPKge8t1Pz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123244_702744_CF8041C5 
X-CRM114-Status: GOOD (  11.02  )
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

Some code, for example clocksource drivers, may want to use the vDSO
clockmode constants even when CONFIG_GENERIC_GETTIMEOFDAY=n.
But the symbols are completely hidden in that case, making ugly
ifdeffery necessary.

Provide unlinkable dummy definitions. These can be used with
IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY).

As not all architectures provide asm/vdso/clocksource.h,
provide an empty stub in asm-generic for it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/Kbuild             | 1 +
 include/asm-generic/vdso/clocksource.h | 0
 include/vdso/clocksource.h             | 7 +++++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 15df9dcb42a5..2bc00c67dc54 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -62,6 +62,7 @@ mandatory-y += topology.h
 mandatory-y += trace_clock.h
 mandatory-y += uaccess.h
 mandatory-y += unwind_user.h
+mandatory-y += vdso/clocksource.h
 mandatory-y += vermagic.h
 mandatory-y += vga.h
 mandatory-y += video.h
diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic/vdso/clocksource.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
index c682e7c60273..63ee8c4ea15c 100644
--- a/include/vdso/clocksource.h
+++ b/include/vdso/clocksource.h
@@ -4,9 +4,12 @@
 
 #include <vdso/limits.h>
 
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 #include <asm/vdso/clocksource.h>
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
+
+#if !IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && defined(VDSO_ARCH_CLOCKMODES)
+/* Unlinkable dummy stubs */
+extern int VDSO_ARCH_CLOCKMODES;
+#endif
 
 enum vdso_clock_mode {
 	VDSO_CLOCKMODE_NONE,

-- 
2.55.0


