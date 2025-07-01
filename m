Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5874C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRHvw41rR6k2CXfRNpVAkucpo+CGu/QUxPMlHxm0VFU=; b=pKILIzEICz74jWO3ndZ/a9PC+M
	OHB5dX5idN2IP4UvJUMU1KkVGFhz3DrZQMl2lYmZwPfeo3dOdOTm5j13aUtvnBN6m/P18omx9WHVR
	q09hqD9CajlS7WLkd04vpf1UunfZis9Jou5qhOYf+MiZPyGLmk7pEqeWJB0qk+EPhbQOVcATM0Pun
	XvOsyLFs8kQTK1ecbZoMCOUsU+QhdoQkldRI6MiNEWTM0pq/jH30HpIX4FDrtgnldxFOLwY5yW6XZ
	uhYZ36NJnTiMe0+2GCsumfUY7QFAqbyMpA1fHWVIsX3VNuOrPp4ClepYCJGTWy06/tXp9bRFhMnO6
	cdCa/qpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXLN-00000004bpo-0Cl8;
	Tue, 01 Jul 2025 09:32:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp3-00000004WRe-10IW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VRHvw41rR6k2CXfRNpVAkucpo+CGu/QUxPMlHxm0VFU=; b=EaK4jkmVxBmJSjnjaedQ8IJ7vm
	hZgtGQUdGKjISGTQy/lNcMCCeb/BsYbINI9dcQ5tGFTgZSh2fs7h+njB3oK48etzfSV2p+5TSrVwT
	8r5/pWnrr4gdnAwOW+TUtnk9+jHNvp5aHFB3VkjunzQooAty/EXu33xi8TvoExkfgxbLPgF4BevIB
	PmjpbrPb8vjR9ajGk1tAVdGsMH+U9xZ/tCF9ELLGXJOwDehrw/asxciS4t/wJoeDyKgYuKudS0iPu
	VO+IU9gqAcoXV3HlIzff3kSvVm+KeqSdRt5tmk9lBaZr4mq8wbYpw7xbAW8gqcBveYIkd7klxtu4x
	CRxPHIQw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-000000070nT-1jVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRHvw41rR6k2CXfRNpVAkucpo+CGu/QUxPMlHxm0VFU=;
	b=cZUEI+ZWwrpIOUwpN59qkqfsHQ28OiVuU20/SMtS2hxUrw8aWnINnJ0ffpbNYHLJ/5UJXJ
	O/l6oUKRcdkWhfG41or2qOviq0jHjuXie8qblg4VoLc9NaI9eReM2nX4eb78wwJ40e3oZN
	YCDcbVu7zPg8Hl08XKGxNbwDDSxHz/1sU41hCYsUpiCxx+eV59bW8Rhsi8M8rWHsJsRJpC
	imw3KijpfVGsKmTdNRMY79NJo1mF9+RLw3BEMKAkbmkj1/WPaVhkAglbZf0DksmoveWuo1
	LH/hOXnMAjs6m6v4kTTHgTb5Z6U6IUh0NBzI/pT0NUgzc+orqQPhJCo5izyYUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRHvw41rR6k2CXfRNpVAkucpo+CGu/QUxPMlHxm0VFU=;
	b=ffbGYJYDgaQ3PocT43ygu+WEgcKUBnnhJ5s7syxm20zKVw/z/N3DLGAS7Q2fBccv1uQ+JB
	cJWrBrHgywPHeeBw==
Date: Tue, 01 Jul 2025 10:58:06 +0200
Subject: [PATCH 12/14] vdso/gettimeofday: Add support for auxiliary clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-12-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=3709;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xvjCYJ8mK4mm1osuZA69etc3l9N5nef3XUciIrrNCVc=;
 b=8epmu6riVb6Cimt5TflcONcv5+2kAze7zj+/Y0LDsxXjd2AFyIPEUELEyZxVrZr4KCXHMwE5s
 FEIdtgRGwruATHKRhUUGmkAZG48gXneaw/JXe8VaXq32AIu2beiRXCH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095834_622598_850B316E 
X-CRM114-Status: GOOD (  16.92  )
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

Expose the auxiliary clocks through the vDSO.

Architectures not using the generic vDSO time framework,
namely SPARC64, are not supported.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h |  2 ++
 lib/vdso/gettimeofday.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index f4c96d9ce674abb07ccd8703f1a04da7631c1677..02533038640e53c40291c7e09139e0f9b32f502a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -5,6 +5,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/compiler.h>
+#include <uapi/linux/bits.h>
 #include <uapi/linux/time.h>
 #include <uapi/linux/types.h>
 #include <uapi/asm-generic/errno-base.h>
@@ -46,6 +47,7 @@ struct vdso_arch_data {
 #define VDSO_COARSE	(BIT(CLOCK_REALTIME_COARSE)	| \
 			 BIT(CLOCK_MONOTONIC_COARSE))
 #define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
+#define VDSO_AUX	__GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
 
 #define CS_HRES_COARSE	0
 #define CS_RAW		1
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index c383878bb5445a62d8fea6591e8550183852c2e6..3a54dbb8fe32849cd749e71ec2a8be44baf42816 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -2,6 +2,7 @@
 /*
  * Generic userspace implementations of gettimeofday() and similar.
  */
+#include <vdso/auxclock.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 
@@ -74,7 +75,7 @@ static inline bool vdso_cycles_ok(u64 cycles)
 static __always_inline bool vdso_clockid_valid(clockid_t clock)
 {
 	/* Check for negative values or invalid clocks */
-	return likely((u32) clock < MAX_CLOCKS);
+	return likely((u32) clock < CLOCK_AUX_LAST);
 }
 
 /*
@@ -268,6 +269,48 @@ bool do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 	return true;
 }
 
+static __always_inline
+bool do_aux(const struct vdso_time_data *vd, clockid_t clock, struct __kernel_timespec *ts)
+{
+	const struct vdso_clock *vc;
+	u64 sec, ns;
+	u32 seq;
+	u8 idx;
+
+	if (!IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
+		return false;
+
+	idx = clock - CLOCK_AUX;
+	vc = &vd->aux_clock_data[idx];
+
+	do {
+		/*
+		 * Open coded function vdso_read_begin() to handle
+		 * VDSO_CLOCK_TIMENS. See comment in do_hres().
+		 */
+		while ((seq = READ_ONCE(vc->seq)) & 1) {
+			if (IS_ENABLED(CONFIG_TIME_NS) && vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
+				vd = __arch_get_vdso_u_timens_data(vd);
+				vc = &vd->aux_clock_data[idx];
+				break;
+			}
+			cpu_relax();
+		}
+		smp_rmb();
+
+		/* Auxclock disabled? */
+		if (vc->clock_mode == VDSO_CLOCKMODE_NONE)
+			return false;
+
+		if (!vdso_get_timestamp(vd, vc, VDSO_BASE_AUX, &sec, &ns))
+			return false;
+	} while (unlikely(vdso_read_retry(vc, seq)));
+
+	vdso_set_timespec(ts, sec, ns);
+
+	return true;
+}
+
 static __always_inline bool
 __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 			     struct __kernel_timespec *ts)
@@ -289,6 +332,8 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
 	else if (msk & VDSO_RAW)
 		vc = &vc[CS_RAW];
+	else if (msk & VDSO_AUX)
+		return do_aux(vd, clock, ts);
 	else
 		return false;
 
@@ -433,6 +478,8 @@ bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t cloc
 		 * Preserves the behaviour of posix_get_coarse_res().
 		 */
 		ns = LOW_RES_NSEC;
+	} else if (msk & VDSO_AUX) {
+		ns = aux_clock_resolution_ns();
 	} else {
 		return false;
 	}

-- 
2.50.0


