Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76A9C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zypL7Z/iJT9pt/jkPKsLbW/urAL7A4U3k+sv3E7jTg=; b=A2RTS5cwsUv5MId7xB/igzCImm
	qdSESDwv5Nt47hUlM860np567wM8hDfUCO6dthi/thm3wpfNdbD5i0n10vDeSz4Aj0jZxrzexeL+l
	MlNwDH3x70qqr+R4KgeGy7NtKfHuc3Cq8bLCoFS0tR7iw837U3YQJ51PSuwucGtSPxnlSeA9Lbd9t
	tx1T6SBkyX6ayXW6MCl677jVtG27btBeqMdil16Ljb1Pq1eit5ABVPAB8szeLCvD+pSJ/e7pWGjEC
	UXrprLXJyK1oc9HtZXtviKJUIwQF5j12+CmlHdMGccmZ10166gafutxiO2H/aJ5pxfzdlJfWeTN56
	xhVGArwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWX0O-00000004Z56-1PVe;
	Tue, 01 Jul 2025 09:10:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-00000004WNc-1LBj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6zypL7Z/iJT9pt/jkPKsLbW/urAL7A4U3k+sv3E7jTg=; b=XsKyL7J/A6i1DPo9X6cMyk643Y
	7bHDXeomNQQk71Bh/vkzCN0OC+yktWWXmWfiNV1YVj6vyG6FG78CMQOz5i/mTlfDZXROJ+9jbIcwe
	ObaFwuM9WKNLzg2ru3m13i+m5PRF2PhAH+gL1GgXo9+/9TGEdlFaW+lXchzRNI4K/B9sATQF96He4
	Y1ZnuxWaroGU76gPDpx2N+7JqsMNHuTBpJsPB75hEKvE7JXzVfHjcVWfPDMDk6LrQhlvyJKPovT4D
	f5RxPzoHjCZORO4lBLnhb72qXp+EXjRRxk8aJPdG3yrSaj9ytCyG9VxPLc60ZqA8TYzpflzQX3wjF
	Txxf4Cgg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWos-000000070hS-0qNa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zypL7Z/iJT9pt/jkPKsLbW/urAL7A4U3k+sv3E7jTg=;
	b=Cvfq+ShZBlRpqLEBOnn8FpMD0gK9w7CyXjIFIZyjrEoM5IoNGvRbep0gq3pyn8BIui/Kxk
	A2ViNmKpkZH3NAdGzCMMSnEmMhFfJ7Duypk+z7Ll3zCgk+TAscf2ipjjyetPBEQXzSBbC+
	080IcZD8bWfUkplxeUn94zbQD8NxbmiybQ5LND26COt6UwpdzUostFo8qh30YjPMwhRgKz
	5V3+YoJ5WGXZnEhhocJjZ7gokZtoaqaU9m0iwvEHUGkqKJ2qY99XWY0Wdjb+Bhml8q+g9J
	GhWElpAyu+wNRJ40rjxUxuo2hMiFJ4JDrZ8bg7wScZFxRqtQnamLnOpobO9X0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zypL7Z/iJT9pt/jkPKsLbW/urAL7A4U3k+sv3E7jTg=;
	b=sgmfuKLl97WFPgJQ2Cl1kAqQzhUmEQJC6TCmpkh3zY+DwrRRPYl9zbjgCqmJcyT/Wiqf4S
	jPoLsppETFf6eeBg==
Date: Tue, 01 Jul 2025 10:57:56 +0200
Subject: [PATCH 02/14] vdso/vsyscall: Introduce a helper to fill clock
 configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-2-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=2069;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=O+pdqhovJ5sCWr6cbVQYxtHMRmPHnT/rOYl0Ec66rdg=;
 b=p8vqvlzZbfPJuNB7hzPJj8dga3B+cwPmwh+UN2KNgYAAY1i/FYSqtwEPROhvYlPu5RH0FZzN+
 FzVHcGeNczjCyKAn7W8w6ERqHRSTH7MY5nl/wpUomcMyoG9AGWRKpyy
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095826_490184_68A717FE 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

The logic to configure a 'struct vdso_clock' from a
'struct tk_read_base' is copied two times.
Split it into a shared function to reduce the duplication,
especially as another user will be added for auxiliary clocks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/vsyscall.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 32ef27c71b57aaa4ed898c0dbfdefcb73b8ff56a..d655df2597336f7305bfc74e2a87c651f314267b 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -15,26 +15,25 @@
 
 #include "timekeeping_internal.h"
 
+static inline void fill_clock_configuration(struct vdso_clock *vc, const struct tk_read_base *base)
+{
+	vc->cycle_last	= base->cycle_last;
+#ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
+	vc->max_cycles	= base->clock->max_cycles;
+#endif
+	vc->mask	= base->mask;
+	vc->mult	= base->mult;
+	vc->shift	= base->shift;
+}
+
 static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct timekeeper *tk)
 {
 	struct vdso_clock *vc = vdata->clock_data;
 	struct vdso_timestamp *vdso_ts;
 	u64 nsec, sec;
 
-	vc[CS_HRES_COARSE].cycle_last	= tk->tkr_mono.cycle_last;
-#ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-	vc[CS_HRES_COARSE].max_cycles	= tk->tkr_mono.clock->max_cycles;
-#endif
-	vc[CS_HRES_COARSE].mask		= tk->tkr_mono.mask;
-	vc[CS_HRES_COARSE].mult		= tk->tkr_mono.mult;
-	vc[CS_HRES_COARSE].shift	= tk->tkr_mono.shift;
-	vc[CS_RAW].cycle_last		= tk->tkr_raw.cycle_last;
-#ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-	vc[CS_RAW].max_cycles		= tk->tkr_raw.clock->max_cycles;
-#endif
-	vc[CS_RAW].mask			= tk->tkr_raw.mask;
-	vc[CS_RAW].mult			= tk->tkr_raw.mult;
-	vc[CS_RAW].shift		= tk->tkr_raw.shift;
+	fill_clock_configuration(&vc[CS_HRES_COARSE],	&tk->tkr_mono);
+	fill_clock_configuration(&vc[CS_RAW],		&tk->tkr_raw);
 
 	/* CLOCK_MONOTONIC */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];

-- 
2.50.0


