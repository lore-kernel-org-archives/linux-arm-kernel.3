Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5C3C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiNmzZsI+IlqtlcCBw/HCwN6rFN2wNt5TZpQsWV/3tM=; b=F13AlRzTbSJ4o+eKCVINSFjXYc
	soFJmqBaXoJcmVYrHUtOboNbIB5KyofYVCk5vCxCX9GTYx1b3MBHrNjopbLrC2NAYgLjYSM54Fzcv
	dlrBpX6P6pU/stwVHCTsTKX+5OyqBzyFlRou7eUqnaFhfvMAYoLXbDBLVhxIgDOZUwHR7iCYJZko7
	Qgu9tNmJBz/iSk9F/Z1WhQkrYYYI2znHGVA4cqJGYxUUpnjBghjaMW2iE2DWlP8w962KVQmEOGwgs
	2OhsldglvqZWM9LAo9VFwHqrDRbkDUGmPcTB8EM/J4GzJ4dryxMpDJmqu3ore538nU3c3VniLGUPM
	we4mnZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4D6-00000000c7d-2PTx;
	Mon, 03 Mar 2025 11:43:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hZ-00000000Tnf-2j6g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiNmzZsI+IlqtlcCBw/HCwN6rFN2wNt5TZpQsWV/3tM=;
	b=Cl0AoCOKpupsyYAO5IIgXBPx/dwzDoqlSEJGaUvOMylaTpHHIysdjntn6Ctsm2nL8hX+sQ
	s+hryKYal9Rf4xH1DDeKAvcA8b+VRvXZvRDeExzwKnT9KgewllMkt2vjUNHN3dME4h16xV
	c9yStGjf3FgZfuBqqsnHFW+LguzchG+7SpKFCg9KG8lwctVwJNoYxgIssr5sz8crgS/xFe
	uUHF7HWBAp/rDaeSLRSsOyqmzUS7zuXuUaORbp/oy0m1KA6XZ8VI1wSFLmSfR9r5cIQmax
	jrGrCvTqlym1ZlCxYF0o6wRbUE+ROt5zBaTvMvtnlk/qugj5cmykO3jRzgxxEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiNmzZsI+IlqtlcCBw/HCwN6rFN2wNt5TZpQsWV/3tM=;
	b=TBsb7Kj66vCWCP6XUXD66wGWbCHqHHClQq6fuw1EMoMniwrPAF35PE+ig41PwgKMDBDvum
	B5IuuFkqNjH6/uAg==
Date: Mon, 03 Mar 2025 12:11:08 +0100
Subject: [PATCH 06/19] vdso/gettimeofday: Prepare introduction of struct
 vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-6-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=3916;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h8QoW/f3rU49l2BZnno5Ej+ilYnLc5MZmanJRJHxpLU=;
 b=abZnNYKsOGQP0oaHmpAMUtb18E47BKabUrpm1zoCjuMbUMyy9sW8Ip3ryJLR33/fwFe0OAmg2
 YSR+Gw5l1bnBYcJlJ/sMhD6901iTtR4NjPETiMDq5/6NGQFwLwu2CGa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031113_990732_17380293 
X-CRM114-Status: GOOD (  15.34  )
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
struct vdso_time_data there will be array of it. At the moment, vdso_clock
is simply a define which maps vdso_clock to vdso_time_data.

Prepare all functions which need the pointer to the vdso_clock array to
work well after introducing the new struct. Whenever applicable, struct
vdso_time_data pointer is replaced by struct vdso_clock pointer.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 299f027116ee0e50a69c5a8a17218004e4af0ea1..59369a4e9f25f937eb8d9aed3201ebd340097a9d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -257,6 +257,7 @@ static __always_inline int
 __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 			     struct __kernel_timespec *ts)
 {
+	const struct vdso_clock *vc = vd;
 	u32 msk;
 
 	/* Check for negative values or invalid clocks */
@@ -269,15 +270,15 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	 */
 	msk = 1U << clock;
 	if (likely(msk & VDSO_HRES))
-		vd = &vd[CS_HRES_COARSE];
+		vc = &vc[CS_HRES_COARSE];
 	else if (msk & VDSO_COARSE)
-		return do_coarse(&vd[CS_HRES_COARSE], clock, ts);
+		return do_coarse(&vc[CS_HRES_COARSE], clock, ts);
 	else if (msk & VDSO_RAW)
-		vd = &vd[CS_RAW];
+		vc = &vc[CS_RAW];
 	else
 		return -1;
 
-	return do_hres(vd, clock, ts);
+	return do_hres(vc, clock, ts);
 }
 
 static __maybe_unused int
@@ -328,11 +329,12 @@ static __maybe_unused int
 __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 			  struct __kernel_old_timeval *tv, struct timezone *tz)
 {
+	const struct vdso_clock *vc = vd;
 
 	if (likely(tv != NULL)) {
 		struct __kernel_timespec ts;
 
-		if (do_hres(&vd[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
+		if (do_hres(&vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
 			return gettimeofday_fallback(tv, tz);
 
 		tv->tv_sec = ts.tv_sec;
@@ -341,7 +343,7 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 
 	if (unlikely(tz != NULL)) {
 		if (IS_ENABLED(CONFIG_TIME_NS) &&
-		    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+		    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
 			vd = __arch_get_vdso_u_timens_data(vd);
 
 		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
@@ -361,13 +363,16 @@ __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 static __maybe_unused __kernel_old_time_t
 __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 {
+	const struct vdso_clock *vc = vd;
 	__kernel_old_time_t t;
 
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
-	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
 		vd = __arch_get_vdso_u_timens_data(vd);
+		vc = vd;
+	}
 
-	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
 
 	if (time)
 		*time = t;
@@ -386,6 +391,7 @@ static __maybe_unused
 int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
 				struct __kernel_timespec *res)
 {
+	const struct vdso_clock *vc = vd;
 	u32 msk;
 	u64 ns;
 
@@ -394,7 +400,7 @@ int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock
 		return -1;
 
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
-	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
 		vd = __arch_get_vdso_u_timens_data(vd);
 
 	/*

-- 
2.48.1


