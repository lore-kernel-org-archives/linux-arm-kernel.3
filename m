Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87389C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j01uzCoLVpnyze/ne4qVPEjweSMhaL+T/SfXMybPgVw=; b=j8p8GoGMu7Oywv6rvbt2bdnKL0
	y9qd7BlwyJeuKtJOWYGHdDsW/2JOuD8SofAVufuEy0QtcZUkzlk6Jyp6aOXjWPcSbAS5pka8kxw+m
	e+sgRslx0w5xbUTCr8SeHrn/gilaMHsBkPYCLDI63AS8XJ4D1TEPmRjSJ+1A+VdFuYF+yma5u58/k
	KT66+GCsajgfBOcS6gS8gf9uxVcB5o7KtN8y43f3RS5SCjkWF/QFoEbdRb5/ZJLf4C62CxNQxSJzS
	ZUvcFhVpEZPPeEYh8qU/H5uEFvX236T8b4QVgGTuMl7DCCbnt3SM0PnXFfxEBo2HYx5SOxEu9/fCQ
	UdjtV3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXER-00000004amq-1uBM;
	Tue, 01 Jul 2025 09:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp1-00000004WR3-42IQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j01uzCoLVpnyze/ne4qVPEjweSMhaL+T/SfXMybPgVw=; b=WToCRmxqGjV9e6lwg3FlDQ1oGH
	CmmDnNRjnbEtu5KJooOCFfkVlqUBc8n9MAJmdRSuUAg+DkruN2eXCDoCIc2cXW0VEZEIP8D1PoA2x
	ipnE6d94O/ouicQVPXETMcd42FtCurndNZIwbv/tpEH+DZKK8Ud1SgmSL8Pp/jXb6isCdgI6nECHQ
	uZcajSsaPO5C5HzhhYM2hX04Cj7RDKhK8z/8WniMbsasPnKmO3ZJla0Jh7Q5J0YniTlemzCL0J3Fq
	xUV+egCwor1vvbVAJFMYTZFcUh5SlwoawRr+snerlE9pRRzonn/fA+ed4o2gwy8NUYO/RQPQoT5Zw
	IRN4jUiQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-000000070nO-1Dc9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j01uzCoLVpnyze/ne4qVPEjweSMhaL+T/SfXMybPgVw=;
	b=OU0d6ovJHnj+NG7timt9a2g47DdM/l6V8vNHRRCHU0tb2nmj/mxJLvc2WYicLFE0dYHx7E
	hwPYnSCtm/lV/4RiGCJHaWu6Cvb2TR9CqYkIzIH4m+vQlgJl2BSB0nbKOCIVejdj8KCGzT
	da+KlCNMsDAnY4ewAstftHZm7IeEIcHicbgF9R82bzPFPI5w4TxW1CAp4Vtt8m3JQZr+yg
	m4LvZUNysPiTG4yFHMkx2hmmbKPygkdOQWpw8UkDPJJ2MetJ4TAJFWGIPqPtaQ0Y5YDc4j
	blyqDuE3T54WX9MieaB2vFTe+3n+dyNIgYzbdEV6Q/y/teG8kXStt47xlurMOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j01uzCoLVpnyze/ne4qVPEjweSMhaL+T/SfXMybPgVw=;
	b=+OMgzfx8O8M8wqez+hCXg6yGhzfqiC+uJQrKAjMfTNDAfi78MoMpEL6m55UMJRKP2MKUdH
	9mEWAnKVmsqUGUBA==
Date: Tue, 01 Jul 2025 10:58:04 +0200
Subject: [PATCH 10/14] vdso: Introduce aux_clock_resolution_ns()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-10-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=1617;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QLkkveUI/cyGTLTyApgh10OSDNXJ3sXYct42yO3P5B0=;
 b=R8Ek6dz1meGMCadr7lA0G0xaOobq5oTQx63iTTSrhy6xilDGAYn7vlT45j/KMLSiBBuaePOs8
 f+1StZD0FpkDR8PTXaqwnWJ5w40lEfFP0WlKydEOKc/miaPfb697wmm
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095830_592425_26229CE6 
X-CRM114-Status: GOOD (  14.04  )
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

Move the constant resolution to a shared header,
so the vDSO can use it and return it without going through a syscall.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/auxclock.h   | 13 +++++++++++++
 kernel/time/timekeeping.c |  6 ++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/vdso/auxclock.h b/include/vdso/auxclock.h
new file mode 100644
index 0000000000000000000000000000000000000000..6d6e74cbc400e7f5cd7194280759f5e5f3059900
--- /dev/null
+++ b/include/vdso/auxclock.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _VDSO_AUXCLOCK_H
+#define _VDSO_AUXCLOCK_H
+
+#include <uapi/linux/time.h>
+#include <uapi/linux/types.h>
+
+static __always_inline u64 aux_clock_resolution_ns(void)
+{
+	return 1;
+}
+
+#endif /* _VDSO_AUXCLOCK_H */
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 6a61887eb87e364b3ef170939919a8d4046c0508..6a088378df54d561ecfeafb45a8b54333e11a9a7 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -26,6 +26,8 @@
 #include <linux/audit.h>
 #include <linux/random.h>
 
+#include <vdso/auxclock.h>
+
 #include "tick-internal.h"
 #include "ntp_internal.h"
 #include "timekeeping_internal.h"
@@ -2842,8 +2844,8 @@ static int aux_get_res(clockid_t id, struct timespec64 *tp)
 	if (!clockid_aux_valid(id))
 		return -ENODEV;
 
-	tp->tv_sec = 0;
-	tp->tv_nsec = 1;
+	tp->tv_sec = aux_clock_resolution_ns() / NSEC_PER_SEC;
+	tp->tv_nsec = aux_clock_resolution_ns() % NSEC_PER_SEC;
 	return 0;
 }
 

-- 
2.50.0


