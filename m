Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F33CD31A15
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=; b=qHzfvvxfQ9frQwa8DCz8mVW0eU
	PcfKpxECw6CoC9B4oaohanKSoIfYG6452gxcSjxCLnw1nOMCgzORav+BjANpEtutXktWjsKXkhYn4
	Vlte1qIr8Wi/AS+Brj3DoJRYhvqaZH+dqvDqE5fcqlEufeCSiO6XHcD8jekFVn0/diGKv/Ofekrfi
	+lmRkVwLJR8lJF7cmoSGQtrlSv+O7Ot2maBOkuc+qzrQdZvQG+5jf/wLSh2X5CPljwNq1RotI4oQa
	sd/lORsQQoHNyoUXjZPkV6xEgbbvEQea1Bn4E54KmrsdqrzaVzY+5zpsEXnD+u2Yg51uznLa/Sbll
	boKIsBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpe-00000008Fsb-1tmP;
	Wed, 14 Jan 2026 08:02:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpA-00000008FNB-10th
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	b=RyurSBgjrMnPpN/v7XuuODcctqlEwgt8J5X0gQmXLCYO95Ln2RiV8XwaF4Fl5j4YUFO4lY
	696rPN38dXLI3L0pJcq/HngYPzDxyBwDCId7f0s8Vz3OJCSNR7VJAQwgJ53kqgL6RJPpLT
	igj2jTKMkQJ/zxRZj8YAqOlQww0Nn09pf7uR1g7QREOBG9DwfFUuaEwDHXCgDlyhsmCqAV
	kNzLv/7X1Z7uuriUned/Uh6x3M/HjtJi816D/F3YuXS0Gudo4YFAHa3o06w9Ys86v3b8B4
	VYnK+lnmVkhLqnPfnBTgdofGujprEcE0bZKQik5Hig4UeljVINe2w3DOoLRRYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	b=l7qPGnGHXJH0KcmQmnTwm1GJP+DHUChsn0oiH4+FraC+bkq8CiTeQ47lnjYNbQgxKFN+Je
	WvEeHFxO18ry+uDA==
Date: Wed, 14 Jan 2026 09:01:47 +0100
Subject: [PATCH 15/15] random: vDSO: remove ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=2360;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hWNS5r+nVG82qGHJBln+sFq/LMfDMjk+1mqnsZRfOv0=;
 b=K+9+vpziH6VU/E7N8SWkH0wrpo7XaNAxqoMMFZ3emFBortUZ3UoHCQj7XlPTB+KcBwqZhdmpm
 FrOM7L8+JFpBTtEhmxp8CYwqmrSKBXfUdVWxXKDsrZGp1x5kwnmKm9s
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000152_472492_82E82AE6 
X-CRM114-Status: GOOD (  12.21  )
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

Recent cleanups of the vDSO headers allow the unconditional inclusion of
vdso/datapage.h and the declarations it provides. This also means that
the declaration of vdso_k_rng_data is always visible and its usage does
not need to be guarded by ifdefs anymore. Instead use IS_ENABLED().

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index c5122ff33594..64f709fdf434 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -56,9 +56,7 @@
 #include <linux/sched/isolation.h>
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
-#ifdef CONFIG_VDSO_GETRANDOM
 #include <vdso/datapage.h>
-#endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>
 #include <asm/irq.h>
@@ -274,7 +272,7 @@ static void crng_reseed(struct work_struct *work)
 	if (next_gen == ULONG_MAX)
 		++next_gen;
 	WRITE_ONCE(base_crng.generation, next_gen);
-#ifdef CONFIG_VDSO_GETRANDOM
+
 	/* base_crng.generation's invalid value is ULONG_MAX, while
 	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
@@ -288,8 +286,9 @@ static void crng_reseed(struct work_struct *work)
 	 * because the vDSO side only checks whether the value changed, without
 	 * actually using or interpreting the value.
 	 */
-	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
-#endif
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
+
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
 	spin_unlock_irqrestore(&base_crng.lock, flags);
@@ -742,9 +741,8 @@ static void __cold _credit_init_bits(size_t bits)
 		if (system_dfl_wq)
 			queue_work(system_dfl_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
-#ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
-#endif
+		if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+			WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
 		pr_notice("crng init done\n");

-- 
2.52.0


