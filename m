Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46463C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr9JkpQD/EJDtjJ/SbcgjVylqUnYY78xk0lDKlXhM0w=; b=e+sctsEJqSJhx98qLCT/o7dUOn
	qSGNAEzkwtQY0KzE9LtZgaDADC5xvQURqC2ofVEf9DOSzW4u++AqCoWIF2PxWSRD3jDQDLiA4ElAi
	9WwkPKM3tLxUFkgclrXAfAy9bOyR0/HLpp9gK87s1BK48JKzaGxeIQruPCn+AesMaeFMVbeEI5uFN
	/UjiNhCEG5YXMp68GXxC96fgcMAyw0ZYSHBGmHZTZii+fTW1tPkj8Lfn79ROUyxabesIG9k0XJdyS
	7JYTxXnYIfWiSMQomIu0yxtuQWg7FMWYX46yiT787COOCFoa6uMGrbXZhU7HDmFkKLM+yNRkX6Drm
	wwv0xYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4JG-00000000dLJ-1dGc;
	Mon, 03 Mar 2025 11:50:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3ha-00000000Top-3vTz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr9JkpQD/EJDtjJ/SbcgjVylqUnYY78xk0lDKlXhM0w=;
	b=1jkX2xc2USYyAVaKA3S/OUrtvY2RcEpewvV903vx/WCEkI24THdZfXqweO1EoWZLpD6A4X
	DZXLWiRtTmw+u6w/EnUpGE8Nfb/lHSISkTdJ4jjJEKXZbwpJALXFXTcTyYlQ5xdz3I18ev
	ZweAb7a2ZMen44+qD3Z3qskbkr6rJN1540t8UHc/ftkF/ezKAYZMvpEk40nG3daTnZfWrr
	q/gzPfN17+a36mItfW8onrsRchta4RwL4yPH5mqPTNIeWpJ4Ev3ebBX6URWpyzl6o8b3lI
	pXKlViIwTVqn8dBeh5bQw8+rUFe2buemtHNGqlf5B+95jr7b+rDnYsxsjM++NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr9JkpQD/EJDtjJ/SbcgjVylqUnYY78xk0lDKlXhM0w=;
	b=MrIpg7wj0aDz+QOskd587OX+pxI3VaGZCuFwLTTiyZ8Qtz5fDhWN6DGrlNZ0NaPhXXqUhU
	gjp1WYXtYyPx+aAQ==
Date: Mon, 03 Mar 2025 12:11:11 +0100
Subject: [PATCH 09/19] vdso/gettimeofday: Prepare do_coarse() for
 introduction of struct vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-9-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2706;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4/BaH4I6+0tHmgqZ+WQUoIr8V7gABIjPIKZPE3OAkPc=;
 b=n8/pYeVd8xAqWuFxtbQOVJ1JDPO6LbfKuv0hp91lyg/I3/WqXF/DTOVHYeTT9gNOl4sC92FND
 rYkHHuurgLwDVr8z+B90JdwYjQ0MjQ32+l9bQmHG+S1h0oUqkAsUzEp
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031115_307155_75295303 
X-CRM114-Status: GOOD (  12.90  )
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

Prepare for the rework of these structures by adding struct vdso_clock
pointer argument to do_coarse(), and replace the struct vdso_time_data
pointer with the new pointer arugment whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index e8d4b02bcb616af19f1e794b14fb4419809408da..36ef7de097e6137832605928a155a0ff78123fb4 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -229,10 +229,11 @@ static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, c
 }
 #endif
 
-static __always_inline int do_coarse(const struct vdso_time_data *vd, clockid_t clk,
-				     struct __kernel_timespec *ts)
+static __always_inline
+int do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
+	      clockid_t clk, struct __kernel_timespec *ts)
 {
-	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
+	const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
 	u32 seq;
 
 	do {
@@ -240,17 +241,17 @@ static __always_inline int do_coarse(const struct vdso_time_data *vd, clockid_t
 		 * Open coded function vdso_read_begin() to handle
 		 * VDSO_CLOCK_TIMENS. See comment in do_hres().
 		 */
-		while ((seq = READ_ONCE(vd->seq)) & 1) {
+		while ((seq = READ_ONCE(vc->seq)) & 1) {
 			if (IS_ENABLED(CONFIG_TIME_NS) &&
-			    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
-				return do_coarse_timens(vd, clk, ts);
+			    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
+				return do_coarse_timens(vc, clk, ts);
 			cpu_relax();
 		}
 		smp_rmb();
 
 		ts->tv_sec = vdso_ts->sec;
 		ts->tv_nsec = vdso_ts->nsec;
-	} while (unlikely(vdso_read_retry(vd, seq)));
+	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	return 0;
 }
@@ -274,7 +275,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	if (likely(msk & VDSO_HRES))
 		vc = &vc[CS_HRES_COARSE];
 	else if (msk & VDSO_COARSE)
-		return do_coarse(&vc[CS_HRES_COARSE], clock, ts);
+		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
 	else if (msk & VDSO_RAW)
 		vc = &vc[CS_RAW];
 	else

-- 
2.48.1


