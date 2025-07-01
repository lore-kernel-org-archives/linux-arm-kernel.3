Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05356C8303A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cikZxWQJUp10v41R0BNtsJYkeVVYRn1u1TYcRTLvcoQ=; b=MyF3gEnkbXIq4tVNq/DrLferHZ
	ec4uz4+vvq8Nd1fIW4w9Zy1hQtT7we/PLd7q1vpe1SmwYN541eCwK4bCxDXaWtCsmNJ4VkqX6xawn
	pnwwDA9Y7RxRfH4iuuvjdRYov3MOGoHj3n+TmGH6x8Hux52c0POFw+QUGYO/AOMANBMsh3Ci26Oi/
	G/vIYY6no6PVrWUEk9bxy8vkOZHu33TIW8oXHdw4MWLtU94amQl8nFNl/fFWhh34X7lnhmyz0IuHu
	z80kWj1O7VOdlRC98+xEwWZQ3+ii30owFR/CQ5XN8nFyThaqj9TUdlkBU8j8MFu1ubDtdSRUL2vW4
	Zhmk1Cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXsE-00000004gmt-0CJt;
	Tue, 01 Jul 2025 10:05:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWot-00000004WLu-3k2L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cikZxWQJUp10v41R0BNtsJYkeVVYRn1u1TYcRTLvcoQ=;
	b=JOuClH5zQfirMyVQzHci+YfWykFkJQAT07wxXn8bnSfP4v2Mtf+khZO8PSEMtF5vyKm2kz
	r9Sikskh2A//wDpioSHNcdhBU907OkSp6RxyCqpFzG8qB/Y0Gnpyju4ax0/BBFlQIn7iV9
	azZNnRv7uHbwqAQ/uzD8ey9XSnndaMTkvoPtMwxEJxmxnYJLXsfA5gLdbVNMaUJSdPldIZ
	wjjgeBdVsnfqK8THDT6DDv0sBNshupWmWDV+pchmGkAbCgjGLE4tDXdD1N5OYnFQEg4btp
	+DHxqtWX5GHGrBp6V60Y/Pdj4EitHMpYXPS1TM0+AuTM0vn2bZf2nTS/ZDR/9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cikZxWQJUp10v41R0BNtsJYkeVVYRn1u1TYcRTLvcoQ=;
	b=JUWHL11Y6dNQ7/wHtW7b8xlh7JM5awfSucplCUe0MFlcjzaQ9+fKPqu+fLeoBv4h/ZcJVx
	+HsBDFUhjK1wERAA==
Date: Tue, 01 Jul 2025 10:58:00 +0200
Subject: [PATCH 06/14] vdso/gettimeofday: Return bool from clock_gettime()
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
In-Reply-To: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 Christopher Hall <christopher.s.hall@intel.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miroslav Lichvar <mlichvar@redhat.com>, 
 Werner Abt <werner.abt@meinberg-usa.com>, 
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=6489;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hXHsnYDcoK6vZrSu6iAfWgcpr0RtJi0oTjs+lySQy+A=;
 b=HQ6guH4xKYzDLrGcPir6sQ0D8ksrjbFgWflXvOxV/zrvFpJHB21lBA59Vudl9gKnpFZ5XRa3n
 qIsPlaEK4LvA65HlAXaFwZAVlN+fBWsOzWip/2yX8Py+WUG7TeVh+S7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015828_088900_72A16838 
X-CRM114-Status: GOOD (  15.25  )
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

The internal helpers are effectively using boolean results,
while pretending to use error numbers.

Switch the return type to bool for more clarity.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 58 +++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9b77f23566f6a35887d4c9aaefc61a971131b499..c5266532a097c06f33d12e345c695357d75abf42 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -82,8 +82,8 @@ const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_tim
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 static __always_inline
-int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		   clockid_t clk, struct __kernel_timespec *ts)
+bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		    clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
 	const struct timens_offset *offs = &vcns->offset[clk];
@@ -103,11 +103,11 @@ int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *v
 		seq = vdso_read_begin(vc);
 
 		if (unlikely(!vdso_clocksource_ok(vc)))
-			return -1;
+			return false;
 
 		cycles = __arch_get_hw_counter(vc->clock_mode, vd);
 		if (unlikely(!vdso_cycles_ok(cycles)))
-			return -1;
+			return false;
 		ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vc, seq)));
@@ -123,7 +123,7 @@ int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *v
 	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
 	ts->tv_nsec = ns;
 
-	return 0;
+	return true;
 }
 #else
 static __always_inline
@@ -133,16 +133,16 @@ const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_tim
 }
 
 static __always_inline
-int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		   clockid_t clk, struct __kernel_timespec *ts)
+bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		    clockid_t clk, struct __kernel_timespec *ts)
 {
-	return -EINVAL;
+	return false;
 }
 #endif
 
 static __always_inline
-int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
-	    clockid_t clk, struct __kernel_timespec *ts)
+bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
+	     clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
 	u64 cycles, sec, ns;
@@ -150,7 +150,7 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 
 	/* Allows to compile the high resolution parts out */
 	if (!__arch_vdso_hres_capable())
-		return -1;
+		return false;
 
 	do {
 		/*
@@ -173,11 +173,11 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		smp_rmb();
 
 		if (unlikely(!vdso_clocksource_ok(vc)))
-			return -1;
+			return false;
 
 		cycles = __arch_get_hw_counter(vc->clock_mode, vd);
 		if (unlikely(!vdso_cycles_ok(cycles)))
-			return -1;
+			return false;
 		ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vc, seq)));
@@ -189,13 +189,13 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
 	ts->tv_nsec = ns;
 
-	return 0;
+	return true;
 }
 
 #ifdef CONFIG_TIME_NS
 static __always_inline
-int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		     clockid_t clk, struct __kernel_timespec *ts)
+bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		      clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
 	const struct timens_offset *offs = &vcns->offset[clk];
@@ -223,20 +223,20 @@ int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock
 	 */
 	ts->tv_sec = sec + __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
 	ts->tv_nsec = nsec;
-	return 0;
+	return true;
 }
 #else
 static __always_inline
-int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		     clockid_t clk, struct __kernel_timespec *ts)
+bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		      clockid_t clk, struct __kernel_timespec *ts)
 {
-	return -1;
+	return false;
 }
 #endif
 
 static __always_inline
-int do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
-	      clockid_t clk, struct __kernel_timespec *ts)
+bool do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
+	       clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
 	u32 seq;
@@ -258,10 +258,10 @@ int do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		ts->tv_nsec = vdso_ts->nsec;
 	} while (unlikely(vdso_read_retry(vc, seq)));
 
-	return 0;
+	return true;
 }
 
-static __always_inline int
+static __always_inline bool
 __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 			     struct __kernel_timespec *ts)
 {
@@ -270,7 +270,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 
 	/* Check for negative values or invalid clocks */
 	if (unlikely((u32) clock >= MAX_CLOCKS))
-		return -1;
+		return false;
 
 	/*
 	 * Convert the clockid to a bitmask and use it to check which
@@ -284,7 +284,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	else if (msk & VDSO_RAW)
 		vc = &vc[CS_RAW];
 	else
-		return -1;
+		return false;
 
 	return do_hres(vd, vc, clock, ts);
 }
@@ -293,9 +293,11 @@ static __maybe_unused int
 __cvdso_clock_gettime_data(const struct vdso_time_data *vd, clockid_t clock,
 			   struct __kernel_timespec *ts)
 {
-	int ret = __cvdso_clock_gettime_common(vd, clock, ts);
+	bool ok;
 
-	if (unlikely(ret))
+	ok = __cvdso_clock_gettime_common(vd, clock, ts);
+
+	if (unlikely(!ok))
 		return clock_gettime_fallback(clock, ts);
 	return 0;
 }

-- 
2.50.0


