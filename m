Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6807C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUFBByn56mt9Jh1l7bqRrS+uh5r/Oj/pRKH3aZrKn6c=; b=mt4k62JFmos5TPO+kDlWi0cd58
	bbEQdSayT37v39kk3xYs4YJCaY8WQ5OmoHkaTfRGyIYmJClUwnZLdgm4F977qKYJUdqKPma+Z64lS
	+WfPGvAJrVK6ksF/52VpiSaY3oUfu+nLEZDi6FWLJ8vCez/2fWy0FKytDX0jnX1P9Gl+rrBaiKhmX
	gL09xuJ8w/VVKpZlU4OOesC0+5X3y11Z2h62+989lsFykh2FA/K+edEnCezPzfp01uYQ0yDWJZgdX
	wd4FnQ8/DhYTVT9a4sIFYqwbeVONmodkMDR707naYvZXfOO2no9NjWfoZnbRbZyBYQ89wyiWQjlrC
	ALKrE0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4Hj-00000000d2u-2i1D;
	Mon, 03 Mar 2025 11:48:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hc-00000000Tpk-0E8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUFBByn56mt9Jh1l7bqRrS+uh5r/Oj/pRKH3aZrKn6c=;
	b=KlR439wtCzp63opnm08CadoaqR8EQHOVNMecQAMDWoAhzDLh7N3HFaYn99kLzJu8c/87cj
	PcoK5OuK723FpyvA1wheJacC1EUReOItFr5w8LOb9w/sHZABa3hgKJlcuxaSr+CDU4uT+D
	/qn2O9wbsLkrc6XCAhqsgWL7fVrU+FM1vVAS/8nm3teVQ88wgepBI3arc2dnuMJWrbqyWj
	KC9OcwTcxlJ7E3AzrRjVe6rclqXONGygAdyACYuzkXcNZpM5MhSrWBwE2mLD8rejqUZw+t
	chZE/XpfsyKRUeAtMJM+OeoynYe/mThHbcJcTUYgdHbfzH1s2gaG2zEX8Na8ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUFBByn56mt9Jh1l7bqRrS+uh5r/Oj/pRKH3aZrKn6c=;
	b=OJe2RCd5u100FPp11ThFrMz2Ji9YSpds6cbr1c7c7JF8cnoqMnPMZDMIxaFlYM9gtX2jzU
	VQDwt7hl+t3MYeCw==
Date: Mon, 03 Mar 2025 12:11:13 +0100
Subject: [PATCH 11/19] vdso/gettimeofday: Prepare helper functions for
 introduction of struct vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-11-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2810;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pm5bZvYeNAbEXTS39nRQ8eH42gMxWLNzUgPBgPezn1g=;
 b=FW8VbpGBDOc4gehZB0MHAgjqGugUx9jW+N8jr9fT+S+TPc15+FFXFF/O8gZIvxn8lSHVS+KUE
 MyHS7ULSmBsA61eJvARcZc9prIjVbV+Dg6xv1H+Y8KdITJ/pmkwkb9I
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031116_385660_24FE2203 
X-CRM114-Status: GOOD (  11.47  )
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

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer argument of the helper functions with struct
vdso_clock pointer if applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 03fa0393645ac0f5ee465ddc19d84b330913da65..c6ff6934558658f9e280d5b84cfb034f4828893d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -17,12 +17,12 @@
 #endif
 
 #ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-static __always_inline bool vdso_delta_ok(const struct vdso_time_data *vd, u64 delta)
+static __always_inline bool vdso_delta_ok(const struct vdso_clock *vc, u64 delta)
 {
-	return delta < vd->max_cycles;
+	return delta < vc->max_cycles;
 }
 #else
-static __always_inline bool vdso_delta_ok(const struct vdso_time_data *vd, u64 delta)
+static __always_inline bool vdso_delta_ok(const struct vdso_clock *vc, u64 delta)
 {
 	return true;
 }
@@ -39,14 +39,14 @@ static __always_inline u64 vdso_shift_ns(u64 ns, u32 shift)
  * Default implementation which works for all sane clocksources. That
  * obviously excludes x86/TSC.
  */
-static __always_inline u64 vdso_calc_ns(const struct vdso_time_data *vd, u64 cycles, u64 base)
+static __always_inline u64 vdso_calc_ns(const struct vdso_clock *vc, u64 cycles, u64 base)
 {
-	u64 delta = (cycles - vd->cycle_last) & VDSO_DELTA_MASK(vd);
+	u64 delta = (cycles - vc->cycle_last) & VDSO_DELTA_MASK(vc);
 
-	if (likely(vdso_delta_ok(vd, delta)))
-		return vdso_shift_ns((delta * vd->mult) + base, vd->shift);
+	if (likely(vdso_delta_ok(vc, delta)))
+		return vdso_shift_ns((delta * vc->mult) + base, vc->shift);
 
-	return mul_u64_u32_add_u64_shr(delta, vd->mult, base, vd->shift);
+	return mul_u64_u32_add_u64_shr(delta, vc->mult, base, vc->shift);
 }
 #endif /* vdso_calc_ns */
 
@@ -58,9 +58,9 @@ static inline bool __arch_vdso_hres_capable(void)
 #endif
 
 #ifndef vdso_clocksource_ok
-static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 {
-	return vd->clock_mode != VDSO_CLOCKMODE_NONE;
+	return vc->clock_mode != VDSO_CLOCKMODE_NONE;
 }
 #endif
 

-- 
2.48.1


