Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58AEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+04s1T3yXqZrrf3aK3nXtq7h92lG6xtvLkzD/OirFg=; b=4dt813+cGMrhyjuYg1gWvprPto
	M6+FXR2cAl2gqdkkNUAv8hfk3T5oSRFHc0fU3tPJhJP+MZScDJ7RnCaqFCVJVsQ++WeHRwOd+TrzW
	3WYT80duk5tPxyGhYabcn5KUU70aC9lF87X7Gy6vmb11OkQBMqFg0gFd8tAp+TQqUlPLvjDpPnonB
	ugNS+nEhz+Ns97VJQUvMp9KJoozuBam67flwNkUM+kWS8fP3doZHkrHGxZckD2zMdjY2huqQWmiwt
	PPkBezqW/mtqjfoD0z0J/eGb3MNSlVZEomrdcyKQbio9LjYIRzPnh8dAOmFs+u1otJGO4fCbbzB9i
	xJIHfQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWX2m-00000004ZOm-0KcY;
	Tue, 01 Jul 2025 09:12:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-00000004WOP-3q8C
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=z+04s1T3yXqZrrf3aK3nXtq7h92lG6xtvLkzD/OirFg=; b=NBNC9DBBn4DNHs/oTekBJeLDLW
	Y3Mnd6SDMoQbDf0Vs8XpqzMS3YT7ZAOPkyI5xeesXrX1ZDYgQU5HE7yILf+Bvpte7y8qAd7mBK4mk
	Am1r9Rc63+v6vAXDvi2vTDQzC9fDh0qhijzNR3dKq44dweTTX9CdKJkx52hFQaHy7IaUUPiXzx4gf
	FOkFcD0+BtTcyjn0aS4Yz2pd1Lj4dOB29saqkSTJejN74ZyTPs3Q+D5yQU+yLNS8794L3FnbtPA9d
	qzjgbMCZ9Q7BQvWZ/fs7eJN/YpS6l7xt5dD5aRWO/JvhpMvTt4MZtbK725MtQUgF77kgFnUtbpy0Y
	C/ZI4CaA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWos-000000070hU-1kXV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+04s1T3yXqZrrf3aK3nXtq7h92lG6xtvLkzD/OirFg=;
	b=yHKwD2Q5pHM3DAgZXj244Xh5OLAiiOnolD2S6MvXgxek2cL49J3kEGXFMBeYnVwMjx2sqS
	33DUSS9tBcITt0bjfFYgqmKnhlNrnwH1m5oQAtDE9JLICsHFsRdJXnsAhzaLXdUVA9e7ho
	/Af4JFo4ZfqQBpfnBjBdXJk5CzetI9Mi9rJomFbdbBjucV5OObAQC3DGQJMI8YoMr6xKRs
	6gV71fi7QVahC5ZFwPhf8vhMooaJMDfhBdG2V2rAPLurOX6x0VqAeOUbe68V6YqifvzBom
	irSv4Rt84flYLCHMQWsQc0ZKkVOJrcfFZ/GjVfNqcaDe/X2/Vj6NdNtrarukqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+04s1T3yXqZrrf3aK3nXtq7h92lG6xtvLkzD/OirFg=;
	b=AuFZMdozwhxxl4czhHsrAJjfJ6FrL8qsqQQWXGRVIwh1aHSCVfgD9N2IxH9pBDeor0f1os
	H3cU/qtRD96lhRAQ==
Date: Tue, 01 Jul 2025 10:57:57 +0200
Subject: [PATCH 03/14] vdso/vsyscall: Split up __arch_update_vsyscall()
 into __arch_update_vdso_clock()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-3-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=2862;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7aTgq0KSjM6EGaXtNhSs9nQlKXik5A0X/dUKdIChsT0=;
 b=5+hqp1gTVgnk3Y+ZA8yf+WT55NlfCoI2CtKaCxxJB92agsCM4gnSJpWL0J1ICnFCSb6eFEGuc
 CTULiQ+9dTBBGkm84WQcYFGeX83ew8QQHoSPXfu1uq4UoUqki8d8Peh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095827_298812_28CA18DE 
X-CRM114-Status: GOOD (  11.63  )
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

The upcoming auxiliary clocks need this hook, too.
To separate the architecture hooks from the timekeeper internals, refactor
the hook to only operate on a single vDSO clock.

While at it, use a more robust #define for the hook override.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/vsyscall.h | 7 +++----
 include/asm-generic/vdso/vsyscall.h    | 6 +++---
 kernel/time/vsyscall.c                 | 3 ++-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/vdso/vsyscall.h
index de58951b8df6a4bb9afd411878793c79c30adbf2..417aae5763a86f39acffe1e6f96cb0e57212d04b 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -13,12 +13,11 @@
  * Update the vDSO data page to keep in sync with kernel timekeeping.
  */
 static __always_inline
-void __arm64_update_vsyscall(struct vdso_time_data *vdata)
+void __arch_update_vdso_clock(struct vdso_clock *vc)
 {
-	vdata->clock_data[CS_HRES_COARSE].mask	= VDSO_PRECISION_MASK;
-	vdata->clock_data[CS_RAW].mask		= VDSO_PRECISION_MASK;
+	vc->mask	= VDSO_PRECISION_MASK;
 }
-#define __arch_update_vsyscall __arm64_update_vsyscall
+#define __arch_update_vdso_clock __arch_update_vdso_clock
 
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index b550afa15ecd101d821f51ce9105903978dced40..7fc0b560007dd8f09a2f24ace76ce68579ad17c1 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -22,11 +22,11 @@ static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(vo
 
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
-#ifndef __arch_update_vsyscall
-static __always_inline void __arch_update_vsyscall(struct vdso_time_data *vdata)
+#ifndef __arch_update_vdso_clock
+static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
 {
 }
-#endif /* __arch_update_vsyscall */
+#endif /* __arch_update_vdso_clock */
 
 #ifndef __arch_sync_vdso_time_data
 static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index d655df2597336f7305bfc74e2a87c651f314267b..df6bada2d58ed9a03e5dd3cb4b218983089a2877 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -118,7 +118,8 @@ void update_vsyscall(struct timekeeper *tk)
 	if (clock_mode != VDSO_CLOCKMODE_NONE)
 		update_vdso_time_data(vdata, tk);
 
-	__arch_update_vsyscall(vdata);
+	__arch_update_vdso_clock(&vc[CS_HRES_COARSE]);
+	__arch_update_vdso_clock(&vc[CS_RAW]);
 
 	vdso_write_end(vdata);
 

-- 
2.50.0


