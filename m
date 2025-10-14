Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBDFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=; b=4x3Onr+mwvAjjsNG9U3rXJKl3F
	QLRkEiRhY8gtawVLHjM7JBcfCDVaRPXB3WoWeUp+/7Htyb6gX2GNCkt/HVhezAhNX650/gg73rxZD
	2W8iaQDLQSKOILCffnQMuRUC73Jk1gIeejvs8hDZX5sFsstQ9MBHxblz3E3dHLxa1m8oRZO4q402b
	xKijOIsX33aYBE78Jf1KRoLhBOBF2i89KVG58ng6HBv7PMb9PWrAG8XemL9mWoVEzOVdwhAwaH5+g
	9xe4H48ZY4z4TEDaHS2JXT7lZfalo9XvBtLAiz0u5t/5JNnjpGC6ERJbf8XUwiYt5Af8VD9zQyc35
	5/yeD23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YsF-0000000FM8k-0FNH;
	Tue, 14 Oct 2025 06:51:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YsE-0000000FM7D-0nrG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 06:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=; b=AexWcivRqlJuiuO/uXxcf0FYsO
	/pWN90xlcC+WmvSxQkO4zgnhctCgPo24CbcyN+nKM3yiWlFqdlzOfTt4C6lNAdRoNK7vgf+sHAfz1
	UP+KQ89n6ErkTIJgH5V9DATudN2bu9N3lxt+YoJerpqtMdlDcKDnHQ0uc6TdlTemsGxnp62bBOldO
	dwJsW+E8O79AQLebVuIodnOczK9hcZ8d0moCO4nr30TzzHEs/z7gIklf8KcSHXrw3WMU/HaQUOdk1
	Z884GZZLEj8kiujZznnMh1floKyTQmazRg9HFujwkyzG+6dSkHqIY9LkTwW5Xr8G+neqGqdX2t5kc
	PxNOdUsA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Yqk-00000004zbd-1VrQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 06:51:03 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=;
	b=SJgQY6rhi25HikAnpR7m/+GjLKzcNc+ulNm4jRwhYzAViDq+VP67/bKFvOBYac0wWIrn+b
	LR8qvE1dqWDxfktw/5U7BfPdmvX3fw+leswF6u4EUUZt79ha6aaf1DiZ0w1bh1fouAFTuM
	LMnxZcrPAy4dE2S29w935gxNTNOf6uFnG/AOzGFwHX04yd4PVRBz0mXxa5411vSov58+vz
	9tTort9wcS77PhZ1BQtYbKyglH9HvCLPxCWo8h8G6fr7gz3Hw8TZw5Mb5xPpH2hYB2s8QS
	qSc1ahRm2X3yVQoa04eqlEXSreVJUrQ6KKwI77QtKer6u2Y51WjgnEhmbUsIvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=;
	b=SIY964ibeBMDBfSWXaREGK3RST6oxNsrRUMtMNHo2iwqdWDn6tl1cXZPULW50EDd444CJr
	f6JBTw9BW/3/cxBA==
Date: Tue, 14 Oct 2025 08:49:21 +0200
Subject: [PATCH v4 35/35] clocksource: remove ARCH_CLOCKSOURCE_DATA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-35-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1786;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dQYrfrH6p59kOQp8CklF/Vp09pCtZ6J6GVY/7odturY=;
 b=Wu1NQgBNvnEB5LIkZlAVc2nl5UHIvAcwoDQQL5xS07arY9KRRtvEqZcoP347fwi2GCQ3xtn0+
 zA44cRMjJacBd8KGBEIzRjLhJyEIekF9k/Hds3wcM4CPYv+/tJE/JoO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_075021_897334_EC84D253 
X-CRM114-Status: GOOD (  10.25  )
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

From: Arnd Bergmann <arnd@arndb.de>

After sparc64, there are no remaining users of ARCH_CLOCKSOURCE_DATA
and it can just be removed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: John Stultz <jstultz@google.com>
[Thomas: drop sparc64 bits from the patch]
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/linux/clocksource.h | 6 +-----
 kernel/time/Kconfig         | 4 ----
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 65b7c41471c390463770c2da13694e58e83b84ea..12d853b1883265cb47d93e33d8370e3957e7e695 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -25,8 +25,7 @@ struct clocksource_base;
 struct clocksource;
 struct module;
 
-#if defined(CONFIG_ARCH_CLOCKSOURCE_DATA) || \
-    defined(CONFIG_GENERIC_GETTIMEOFDAY)
+#if defined(CONFIG_GENERIC_GETTIMEOFDAY)
 #include <asm/clocksource.h>
 #endif
 
@@ -106,9 +105,6 @@ struct clocksource {
 	u64			max_idle_ns;
 	u32			maxadj;
 	u32			uncertainty_margin;
-#ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
-	struct arch_clocksource_data archdata;
-#endif
 	u64			max_cycles;
 	u64			max_raw_delta;
 	const char		*name;
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 7c6a52f7836cef248e0949060b50baa293f446cf..fe33118770978682d0ff6c6e7990896f42703b50 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -9,10 +9,6 @@
 config CLOCKSOURCE_WATCHDOG
 	bool
 
-# Architecture has extra clocksource data
-config ARCH_CLOCKSOURCE_DATA
-	bool
-
 # Architecture has extra clocksource init called from registration
 config ARCH_CLOCKSOURCE_INIT
 	bool

-- 
2.51.0


