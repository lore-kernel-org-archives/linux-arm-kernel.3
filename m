Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C020BC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aCd4EMkjlNalFoR07yY3E582pKdgj75t6H7h3ol4lU=; b=3fb0pu1HEwTeyn1023UeauV5b5
	KuZGoTgOEePOwxH5aR6HdHe9LSdbuj30XFW/ycxBmfdS35ctgzdLDhsvCdcKrJsKe5pOXPXfUzRkA
	6zXDbjvLczoexGLCKs0qKM7GJfh5Mltl042fntWf7gmfxc5vTUCTBqunP5ilxiSG1TvNvAGuwTJ3y
	USKr8bE9cklfwCdfHKn8r7TeBceVNfMAisEgGw4T46YeuAPef1LIWPGni42zI+rLN1fsHa4WQqF60
	U5PfUWfKoEjwcS9QYIVjO+WEh5vLRO1C+jhHPo8f34acjxK75Rbt4lRBTTumKYJzm+xuA3D0c4Ezg
	GLkn9DFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4Ee-00000000cWq-0ov1;
	Mon, 03 Mar 2025 11:45:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3ha-00000000To2-1LBv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aCd4EMkjlNalFoR07yY3E582pKdgj75t6H7h3ol4lU=;
	b=eTOvMpIMxmyAd9LOliw0S+YruQOiVjmBeLzScbkioXmoTB1ynEytW3q3/oR/TOfPRsYz7n
	0UZTLzt1xJj/QxJotLsT5C+wKny2iVGSwJwsBdIH30OG7L0zwbQ6SnjyaLBuVoL1q9jqC7
	/ewuYnBMKcmQ2tpwJosDyjBi9QadoZhoV2EEQhXsyXr1IUNGADV72vx9lWS5UZv9oSXHPm
	/WgfnQzIq0SHtk9KWbQOub2UMHmHnFCKrpUw4jr5bNGOV/VWz8/O61QqzbxvvLAK/ZkDYc
	i5CmWss+MsJzI9fkG5gUQIRMwLJGr3VYC2a+KCvbx3kf7AMoz/CuCr2CekkcOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aCd4EMkjlNalFoR07yY3E582pKdgj75t6H7h3ol4lU=;
	b=3coPW8heN6x2TMm5riaOgfCuNNyicJ0eoPWFUOkenchvU+tFhsoPFowfTEyEXZCJQna9RV
	IWQA8ohD+HuOgxDQ==
Date: Mon, 03 Mar 2025 12:11:10 +0100
Subject: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=3635;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DD6TqSTT0n4lKxdBvYuWMMqzxVw/01dOoQIaUbeVuus=;
 b=ByURjHW0BXzpZLG3Q9Xizbjjjp5WZvUhrwy8shGeZwF08cAt5jmXQsOCnq5t/j798V8dxzaCG
 JkI07e3Haq+AG5dJh2BXfo7Uv+OjdM2UJuGE+s+TDCpSagjO4sUqlEH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031114_640201_30137031 
X-CRM114-Status: GOOD (  13.83  )
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
pointer argument to do_hres_timens(), and replace the struct vdso_time_data
pointer with the new pointer arugment whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 15611ab650232f2e847b7de80c7293c4fb7f84f2..e8d4b02bcb616af19f1e794b14fb4419809408da 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -81,36 +81,36 @@ const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_tim
 }
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
-static __always_inline int do_hres_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					  struct __kernel_timespec *ts)
+static __always_inline
+int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		   clockid_t clk, struct __kernel_timespec *ts)
 {
-	const struct timens_offset *offs = &vdns->offset[clk];
+	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
+	const struct timens_offset *offs = &vcns->offset[clk];
 	const struct vdso_timestamp *vdso_ts;
-	const struct vdso_time_data *vd;
+	const struct vdso_clock *vc = vd;
 	u64 cycles, ns;
 	u32 seq;
 	s64 sec;
 
-	vd = vdns - (clk == CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_COARSE);
-	vd = __arch_get_vdso_u_timens_data(vd);
 	if (clk != CLOCK_MONOTONIC_RAW)
-		vd = &vd[CS_HRES_COARSE];
+		vc = &vc[CS_HRES_COARSE];
 	else
-		vd = &vd[CS_RAW];
-	vdso_ts = &vd->basetime[clk];
+		vc = &vc[CS_RAW];
+	vdso_ts = &vc->basetime[clk];
 
 	do {
-		seq = vdso_read_begin(vd);
+		seq = vdso_read_begin(vc);
 
-		if (unlikely(!vdso_clocksource_ok(vd)))
+		if (unlikely(!vdso_clocksource_ok(vc)))
 			return -1;
 
-		cycles = __arch_get_hw_counter(vd->clock_mode, vd);
+		cycles = __arch_get_hw_counter(vc->clock_mode, vd);
 		if (unlikely(!vdso_cycles_ok(cycles)))
 			return -1;
-		ns = vdso_calc_ns(vd, cycles, vdso_ts->nsec);
+		ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
 		sec = vdso_ts->sec;
-	} while (unlikely(vdso_read_retry(vd, seq)));
+	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	/* Add the namespace offset */
 	sec += offs->sec;
@@ -132,8 +132,9 @@ const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_tim
 	return NULL;
 }
 
-static __always_inline int do_hres_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					  struct __kernel_timespec *ts)
+static __always_inline
+int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		   clockid_t clk, struct __kernel_timespec *ts)
 {
 	return -EINVAL;
 }
@@ -166,7 +167,7 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		while (unlikely((seq = READ_ONCE(vc->seq)) & 1)) {
 			if (IS_ENABLED(CONFIG_TIME_NS) &&
 			    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
-				return do_hres_timens(vd, clk, ts);
+				return do_hres_timens(vd, vc, clk, ts);
 			cpu_relax();
 		}
 		smp_rmb();

-- 
2.48.1


