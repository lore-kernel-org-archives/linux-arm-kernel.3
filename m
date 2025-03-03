Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1333C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+wRJrxNM282C+g9kU4vuAnxbkq5JTq67GnYAzZiRLM=; b=EaKeSt89qeW8FdVOkIa/tYCcGs
	D0g/EDmrHV89ZHWJfLRvCn3cR62dLfna+tDz6xuglBnx2tzpcgG6NEhxHEFWW9/e3KdjKU9ptJlbB
	45ggkmJWW+JOQOpswuxthUpVKJtrhbEMSTacjyDqX/aW8GKV0NE+LMCz64JE8n888yDw3MI1xsteY
	LDdJZgGajI9Yo/jcuFsEKQmht28fEa0UzqzN+OHD/HgERCHdGr3t7Pue7kAbsGLJlT95WljD4X34J
	ZeTvRMbUabbu1JZJ0BW86f/677q8NicUfbs7hiZ3Dlb+lEfNtIH4L5ErTnDyOksnX0hVczimbHpq+
	4XX3djdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4GB-00000000clA-3vy8;
	Mon, 03 Mar 2025 11:46:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hb-00000000TpN-25Lq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wRJrxNM282C+g9kU4vuAnxbkq5JTq67GnYAzZiRLM=;
	b=JUwQeVElPmivru/iDcQB1jz+YU3YptqhV7tZ4A3UnPaaWYeSAC2TCcM2pqpn+dIL9PAgyk
	sPfcXUgqfJkEbk8VAD8WOKDIYt8v/OnirpZst3tsfsbKsHirTWyRbgA/qteqCw8bLp3qzX
	E27o5DUz6qOlyPbWz4aSrNhB/cJ/XGaDR2bWn2GHta4ISsKfYpF0+bUjg+UV5+fijn1iy0
	BUuHUpEz5hqc9QJO+D8s1ZFlTjw+QVyGZB5Z0+Ts7rbRxg/0tow2f3O9+CDi3sLpZlwMfV
	p9DlnJ9nc1DEwrwdqvFCr+kIVIHpVPrvOyj2RlpAQ/D6BJrqEix05sg28vGFCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wRJrxNM282C+g9kU4vuAnxbkq5JTq67GnYAzZiRLM=;
	b=JFehfof/+9xh4U791YnEEwPlkllR+336Eu52CUZjWAHExQftHcUhWXamBtZ8GON03OCKxh
	dG9SR4cKmU8HscCw==
Date: Mon, 03 Mar 2025 12:11:12 +0100
Subject: [PATCH 10/19] vdso/gettimeofday: Prepare do_coarse_timens() for
 introduction of struct vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-10-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2984;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0h40dglNs6fnGxl4dOAKT3F3JwW4lYavueIQgAMF8RA=;
 b=saBNnkL0hQl7QE2A8rxZyUXJ547QYmIUFk5PeduK03TEkTi2dCnoZyxi2BIrkwlfsuNb8NMCk
 mppnQ1fw1ryBsJhroXABnLZZZtKFH3L0kVqYPmVxl8UJSAKaW7w83eE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031115_819105_FAC324C5 
X-CRM114-Status: GOOD (  12.53  )
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

Prepare for the rework of these structures by adding struct vdso_clock
pointer argument to do_coarse_timens(), and replace the struct
vdso_time_data pointer with the new pointer arugment whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 36ef7de097e6137832605928a155a0ff78123fb4..03fa0393645ac0f5ee465ddc19d84b330913da65 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -193,21 +193,25 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 }
 
 #ifdef CONFIG_TIME_NS
-static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					    struct __kernel_timespec *ts)
+static __always_inline
+int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		     clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
-	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
-	const struct timens_offset *offs = &vdns->offset[clk];
+	const struct timens_offset *offs = &vcns->offset[clk];
+	const struct vdso_timestamp *vdso_ts;
+	const struct vdso_clock *vc = vd;
 	u64 nsec;
 	s64 sec;
 	s32 seq;
 
+	vdso_ts = &vc->basetime[clk];
+
 	do {
-		seq = vdso_read_begin(vd);
+		seq = vdso_read_begin(vc);
 		sec = vdso_ts->sec;
 		nsec = vdso_ts->nsec;
-	} while (unlikely(vdso_read_retry(vd, seq)));
+	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	/* Add the namespace offset */
 	sec += offs->sec;
@@ -222,8 +226,9 @@ static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, c
 	return 0;
 }
 #else
-static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					    struct __kernel_timespec *ts)
+static __always_inline
+int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		     clockid_t clk, struct __kernel_timespec *ts)
 {
 	return -1;
 }
@@ -244,7 +249,7 @@ int do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		while ((seq = READ_ONCE(vc->seq)) & 1) {
 			if (IS_ENABLED(CONFIG_TIME_NS) &&
 			    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
-				return do_coarse_timens(vc, clk, ts);
+				return do_coarse_timens(vd, vc, clk, ts);
 			cpu_relax();
 		}
 		smp_rmb();

-- 
2.48.1


