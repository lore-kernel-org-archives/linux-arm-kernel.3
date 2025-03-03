Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D81C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJv8sbi30FpTvlQDBkPTmpk9/XqdhxgUpv0PpOkXPOI=; b=c78GmFQyb3IqXuv/9iug04UVRC
	GyWhLZuDsRQ6UHgzy0u5t0piAxtbB+orK7Y+edz+DzABt7fG1DuwF/cCoN86KB2PlyatL1aTtyzZH
	sxSfIhdtH2eh7rFLHZMzeF2LCvyjNxZ5doi0cGH5HinnXxpbmyb19Sow0Yp4NynEUNyfjYTLgPRnK
	axljvWzEPQbMT6RduztLRIqGI9nVISB3OGj2+pKytW9jrPu7YpkWcHoY/gtA+En6AiIpyWsThYpfU
	IAHfzFY7hzb6GjruQBl4UiB/RM48mteJ6a0BdPTEajdiijNeY+NsYJ/ViKHGuY6Y9b1Un1r0M8a6R
	v1puefzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4Ko-00000000dcR-0IAS;
	Mon, 03 Mar 2025 11:51:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hc-00000000TqQ-2ILp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJv8sbi30FpTvlQDBkPTmpk9/XqdhxgUpv0PpOkXPOI=;
	b=DPMhc5St6/iBg0Y6tqofShmyTKuwKq3vvfQL17Fv17cL5576zmzU/q8wwATt065xdTEIe0
	H5/lUJEkDJb4Dnot8oim8ONpHiXn4rxkl4ZKuUNIRZf1yoBxWK3e3fFVIHF4t5DYt+Pta1
	WjEaK2yuyJ7lEyiV/TYAsOZNVCsiQO5Xend1W+CLKTyAaVSTMUdP1qYL2R4vusXlk+lUxC
	Wz6VPs7+syo2CcYwbmSbLSbcCRq+/ECmxtW8MdBwpiNShdz4AC/P1mN0h6oa7FsU54kOh6
	fzTsvsJNKNKPJWpfL0/vFFAWVvQz2jAywdZxbsnCOt1EFdsExTkIMvIy5evpAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJv8sbi30FpTvlQDBkPTmpk9/XqdhxgUpv0PpOkXPOI=;
	b=1+KAwjf81amAe8EFn1H/1U+g2iwu7oBX2L4PER3y+YH1TmvAt1mLk0jvbLUY5cZe+V6lBa
	XrUyykEgLplRiQAg==
Date: Mon, 03 Mar 2025 12:11:14 +0100
Subject: [PATCH 12/19] vdso/vsyscall: Prepare introduction of struct
 vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-12-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=5035;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TGrYgHBDC1ym/D0u89FhQ1yXA+RjazyIG5JtuCcOFIQ=;
 b=O0ykrjovG/rAJm0nxuT72171DFtNpYj28xh5+v7YJoR1artjVb5TWt8ayEA+4+1DaKgw1KXq4
 S4wO7RvQ76JASNE0pYEgVClwArWHVorrse27BBdxE3CW+jNIThljxoa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031116_876426_CCD76773 
X-CRM114-Status: GOOD (  11.68  )
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
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/vsyscall.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 418192296ef7dd3c1772d50f129e7838883cf00c..dd85b41a70bee7decbd943c35197c091916ee4c7 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -18,25 +18,26 @@
 static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct timekeeper *tk)
 {
 	struct vdso_timestamp *vdso_ts;
+	struct vdso_clock *vc = vdata;
 	u64 nsec, sec;
 
-	vdata[CS_HRES_COARSE].cycle_last	= tk->tkr_mono.cycle_last;
+	vc[CS_HRES_COARSE].cycle_last	= tk->tkr_mono.cycle_last;
 #ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-	vdata[CS_HRES_COARSE].max_cycles	= tk->tkr_mono.clock->max_cycles;
+	vc[CS_HRES_COARSE].max_cycles	= tk->tkr_mono.clock->max_cycles;
 #endif
-	vdata[CS_HRES_COARSE].mask		= tk->tkr_mono.mask;
-	vdata[CS_HRES_COARSE].mult		= tk->tkr_mono.mult;
-	vdata[CS_HRES_COARSE].shift		= tk->tkr_mono.shift;
-	vdata[CS_RAW].cycle_last		= tk->tkr_raw.cycle_last;
+	vc[CS_HRES_COARSE].mask		= tk->tkr_mono.mask;
+	vc[CS_HRES_COARSE].mult		= tk->tkr_mono.mult;
+	vc[CS_HRES_COARSE].shift	= tk->tkr_mono.shift;
+	vc[CS_RAW].cycle_last		= tk->tkr_raw.cycle_last;
 #ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-	vdata[CS_RAW].max_cycles		= tk->tkr_raw.clock->max_cycles;
+	vc[CS_RAW].max_cycles		= tk->tkr_raw.clock->max_cycles;
 #endif
-	vdata[CS_RAW].mask			= tk->tkr_raw.mask;
-	vdata[CS_RAW].mult			= tk->tkr_raw.mult;
-	vdata[CS_RAW].shift			= tk->tkr_raw.shift;
+	vc[CS_RAW].mask			= tk->tkr_raw.mask;
+	vc[CS_RAW].mult			= tk->tkr_raw.mult;
+	vc[CS_RAW].shift		= tk->tkr_raw.shift;
 
 	/* CLOCK_MONOTONIC */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 
 	nsec = tk->tkr_mono.xtime_nsec;
@@ -54,7 +55,7 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	nsec	+= (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
 
 	/* CLOCK_BOOTTIME */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	= sec;
 
 	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
@@ -64,12 +65,12 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	vdso_ts->nsec	= nsec;
 
 	/* CLOCK_MONOTONIC_RAW */
-	vdso_ts		= &vdata[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
+	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	= tk->raw_sec;
 	vdso_ts->nsec	= tk->tkr_raw.xtime_nsec;
 
 	/* CLOCK_TAI */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_TAI];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_TAI];
 	vdso_ts->sec	= tk->xtime_sec + (s64)tk->tai_offset;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
 }
@@ -78,6 +79,7 @@ void update_vsyscall(struct timekeeper *tk)
 {
 	struct vdso_time_data *vdata = vdso_k_time_data;
 	struct vdso_timestamp *vdso_ts;
+	struct vdso_clock *vc = vdata;
 	s32 clock_mode;
 	u64 nsec;
 
@@ -85,21 +87,21 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_write_begin(vdata);
 
 	clock_mode = tk->tkr_mono.clock->vdso_clock_mode;
-	vdata[CS_HRES_COARSE].clock_mode	= clock_mode;
-	vdata[CS_RAW].clock_mode		= clock_mode;
+	vc[CS_HRES_COARSE].clock_mode	= clock_mode;
+	vc[CS_RAW].clock_mode		= clock_mode;
 
 	/* CLOCK_REALTIME also required for time() */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
 	vdso_ts->sec	= tk->xtime_sec;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
 
 	/* CLOCK_REALTIME_COARSE */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
 	vdso_ts->sec	= tk->xtime_sec;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
 
 	/* CLOCK_MONOTONIC_COARSE */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 	nsec		= tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
 	nsec		= nsec + tk->wall_to_monotonic.tv_nsec;

-- 
2.48.1


