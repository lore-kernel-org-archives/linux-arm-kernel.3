Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CCC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/qdmfV5C2ezGfUpUoaRbfT+DGO6POVIJmN8LgdDLsU=; b=38fp1WKCK5rhdYRXEAJ1PrKJQa
	xcwvAZvUOIFLppRfkSKsxowlIsvbT1IYjhGvt0BZAyQd04c/8kUQTXZHB5W4vJgy9cDJ2v51JAyy4
	6C5VcvMPaWsSbXZeqjGnJkDbPXjAKL8UreEdWTK7GcFqjl6Xat2eEr/fhXbaewnzAiffdopyjNtZ0
	/YtWRcYeAjAkrMKALhccs3vei8OfGj7xzqi1IyKeh2s18Mj62waYnv1DuiTtXzFzSdQpfF5H8dqg9
	a1NrKkjqAEP834wsX1omy1BuByfavQhExxiJsJ1j9pyw93D0CsTmPgTj4rvko0Qvr/y/wR5DHbLZ6
	mp55E7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXJ4-00000004bSh-02iZ;
	Tue, 01 Jul 2025 09:29:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp3-00000004WRd-06la
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M/qdmfV5C2ezGfUpUoaRbfT+DGO6POVIJmN8LgdDLsU=; b=GI7NTdw0mWjbqIOEWRY10qRbE2
	wKR0ja1TNBalYagsiiTwq4Cu+ZgI9vVVZvwYbPJP0CWcgGBifgPj7701caGmPd4uj1WRBGKg/lDog
	CTjb6PV896XX/B1pZbrE0JFrx+mzfjeOPq1hxJIa9RznMeqkI9glbKt6yodsw7pIESSYLYEac/GSS
	2WqnTnMWDRJhp3Hxy+2WnywULT9lBfqK1ktRtSpXNX84t9ZRR0P8C/tcoQQTDyePymTEUliU/UA89
	7GBmpkaZM4w9dJrVzCm1Nmy7o0vgD1VmMPUAGN9F6Sb1Vv40Rw6pbh6qOGBdoqyanMtu9i4GwaA12
	I7c98SFg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-000000070nS-1jJp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:35 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/qdmfV5C2ezGfUpUoaRbfT+DGO6POVIJmN8LgdDLsU=;
	b=zmRoiz5OMdwJSV5VU8x1H6fNophfk3dzw3fhf+q24KXhEmzotP9HrGiMxOyBY1ltOm6tTb
	jHcbiVfVn+1srnp0XnEEhuT8CnRw3cXknGmyeDz5pXVNl9nAitQ8a1FJmu2TMSjk8aQP1u
	sGlEvU8hqYj9zgc7ju+Mmc1aeSPz3E+bI/8WvFlejxHUOZTzfN9QzlAeJO5Elc85MlBiMK
	ulwAkv0btp0LvdpG0MYPiu5i0Q6kzKBs+U5k8D5Ofvga8GvdgHKFhsxfTDzUOHJ2GfioWy
	tRuJrnl0sQ8qAdcD1kjAgoDPnqFN+Hiq58XMzh/yR016RT1TvbZgdpeWE5SLPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/qdmfV5C2ezGfUpUoaRbfT+DGO6POVIJmN8LgdDLsU=;
	b=Nwg3GIkAH3MhBIPzrgaFS0OydPjn2AynWmyN+Z2lnAQT8npLekXRFGfCyAe+zoobFGy+zd
	upSbSMuKVw4YbqCA==
Date: Tue, 01 Jul 2025 10:58:05 +0200
Subject: [PATCH 11/14] vdso/vsyscall: Update auxiliary clock data in the
 datapage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-11-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=5571;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=I8cM041g5IAfoTDOmdmJralm5nAWrjZh5d0Wh6I7fg8=;
 b=ngNkB8/T/+ReUqwzpn1ZvYgZ8QeREdu0ojU91hJIArod5pUxq3LYeNFeie2plEmtNdpep3Eg7
 Sglv31wh+OcD/YbyBW/WgPBOoXr7sUtD0Yy5RIV30x+PWBoPWTBvtVs
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095834_464120_1063B059 
X-CRM114-Status: GOOD (  17.91  )
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

Expose the auxiliary clock data so it can be read from the vDSO.

Architectures not using the generic vDSO time framework,
namely SPARC64, are not supported.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/timekeeper_internal.h | 13 ++++++++++++
 include/vdso/datapage.h             |  3 +++
 kernel/time/namespace.c             |  5 +++++
 kernel/time/timekeeping.c           | 12 +++++++++++
 kernel/time/vsyscall.c              | 40 +++++++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+)

diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekeeper_internal.h
index ca79938b62f396afd503e0cf06bbecf6f95cfce4..5de2e019399c72246f7d7dfad561c8b3d479dbd1 100644
--- a/include/linux/timekeeper_internal.h
+++ b/include/linux/timekeeper_internal.h
@@ -190,4 +190,17 @@ static inline void update_vsyscall_tz(void)
 }
 #endif
 
+#if defined(CONFIG_GENERIC_TIME_VSYSCALL) && defined(CONFIG_GENERIC_GETTIMEOFDAY) && \
+	defined(CONFIG_POSIX_AUX_CLOCKS)
+
+extern void vdso_time_update_aux(struct timekeeper *tk);
+
+#else
+
+static inline void vdso_time_update_aux(struct timekeeper *tk)
+{
+}
+
+#endif /* CONFIG_GENERIC_TIME_VSYSCALL && CONFIG_POSIX_AUX_CLOCKS */
+
 #endif /* _LINUX_TIMEKEEPER_INTERNAL_H */
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 1864e76e8f691bab10813543880f71bc59afa9c0..f4c96d9ce674abb07ccd8703f1a04da7631c1677 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -38,6 +38,7 @@ struct vdso_arch_data {
 #endif
 
 #define VDSO_BASES	(CLOCK_TAI + 1)
+#define VDSO_BASE_AUX	0
 #define VDSO_HRES	(BIT(CLOCK_REALTIME)		| \
 			 BIT(CLOCK_MONOTONIC)		| \
 			 BIT(CLOCK_BOOTTIME)		| \
@@ -117,6 +118,7 @@ struct vdso_clock {
  * @arch_data:		architecture specific data (optional, defaults
  *			to an empty struct)
  * @clock_data:		clocksource related data (array)
+ * @aux_clock_data:	auxiliary clocksource related data (array)
  * @tz_minuteswest:	minutes west of Greenwich
  * @tz_dsttime:		type of DST correction
  * @hrtimer_res:	hrtimer resolution
@@ -133,6 +135,7 @@ struct vdso_time_data {
 	struct arch_vdso_time_data	arch_data;
 
 	struct vdso_clock		clock_data[CS_BASES];
+	struct vdso_clock		aux_clock_data[MAX_AUX_CLOCKS];
 
 	s32				tz_minuteswest;
 	s32				tz_dsttime;
diff --git a/kernel/time/namespace.c b/kernel/time/namespace.c
index e3642278df433c41654ffb6a8043c3fcecc2994a..667452768ed3b50e48e3cfb70f8ef68e4bed9e0b 100644
--- a/kernel/time/namespace.c
+++ b/kernel/time/namespace.c
@@ -242,6 +242,11 @@ static void timens_set_vvar_page(struct task_struct *task,
 	for (i = 0; i < CS_BASES; i++)
 		timens_setup_vdso_clock_data(&vc[i], ns);
 
+	if (IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS)) {
+		for (i = 0; i < ARRAY_SIZE(vdata->aux_clock_data); i++)
+			timens_setup_vdso_clock_data(&vdata->aux_clock_data[i], ns);
+	}
+
 out:
 	mutex_unlock(&offset_lock);
 }
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 6a088378df54d561ecfeafb45a8b54333e11a9a7..928b8e0773f9e1b8fd700f130a700c5908fe6c27 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -66,11 +66,21 @@ static inline bool tk_get_aux_ts64(unsigned int tkid, struct timespec64 *ts)
 {
 	return ktime_get_aux_ts64(CLOCK_AUX + tkid - TIMEKEEPER_AUX_FIRST, ts);
 }
+
+static inline bool tk_is_aux(const struct timekeeper *tk)
+{
+	return tk->id >= TIMEKEEPER_AUX_FIRST && tk->id <= TIMEKEEPER_AUX_LAST;
+}
 #else
 static inline bool tk_get_aux_ts64(unsigned int tkid, struct timespec64 *ts)
 {
 	return false;
 }
+
+static inline bool tk_is_aux(const struct timekeeper *tk)
+{
+	return false;
+}
 #endif
 
 /* flag for if timekeeping is suspended */
@@ -719,6 +729,8 @@ static void timekeeping_update_from_shadow(struct tk_data *tkd, unsigned int act
 
 		update_fast_timekeeper(&tk->tkr_mono, &tk_fast_mono);
 		update_fast_timekeeper(&tk->tkr_raw,  &tk_fast_raw);
+	} else if (tk_is_aux(tk)) {
+		vdso_time_update_aux(tk);
 	}
 
 	if (action & TK_CLOCK_WAS_SET)
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index df6bada2d58ed9a03e5dd3cb4b218983089a2877..62d9701db9135ba4ef377f3f534a9279d7922d2d 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -136,6 +136,46 @@ void update_vsyscall_tz(void)
 	__arch_sync_vdso_time_data(vdata);
 }
 
+#ifdef CONFIG_POSIX_AUX_CLOCKS
+void vdso_time_update_aux(struct timekeeper *tk)
+{
+	struct vdso_time_data *vdata = vdso_k_time_data;
+	struct vdso_timestamp *vdso_ts;
+	struct vdso_clock *vc;
+	s32 clock_mode;
+	u64 nsec;
+
+	vc = &vdata->aux_clock_data[tk->id - TIMEKEEPER_AUX_FIRST];
+	vdso_ts = &vc->basetime[VDSO_BASE_AUX];
+	clock_mode = tk->tkr_mono.clock->vdso_clock_mode;
+	if (!tk->clock_valid)
+		clock_mode = VDSO_CLOCKMODE_NONE;
+
+	/* copy vsyscall data */
+	vdso_write_begin_clock(vc, true);
+
+	vc->clock_mode = clock_mode;
+
+	if (clock_mode != VDSO_CLOCKMODE_NONE) {
+		fill_clock_configuration(vc, &tk->tkr_mono);
+
+		vdso_ts->sec	= tk->xtime_sec;
+
+		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
+		nsec += tk->offs_aux;
+		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
+		nsec = nsec << tk->tkr_mono.shift;
+		vdso_ts->nsec = nsec;
+	}
+
+	__arch_update_vdso_clock(vc);
+
+	vdso_write_end_clock(vc, true);
+
+	__arch_sync_vdso_time_data(vdata);
+}
+#endif
+
 /**
  * vdso_update_begin - Start of a VDSO update section
  *

-- 
2.50.0


