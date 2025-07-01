Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A753C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjeWk9zqwweIgociDbPCS45o0KwQTUtlv3dSFR85Uf8=; b=I/RKDotMyqYLyeR503QlUu/Rj+
	8QiJD2OD/S+6MhTq3pYUDs2CjSX9l/0haq938V+ZRYqzbXqIyfxqnK/YN/TAIRoiIf1eOBE3IY+Ho
	5EF3pUxYkY42M/Z/m3xtyrZkhIvcrJpA4tMWxGwB+INSdqPTwytqqCH2NZ5FA+q6OFTxrCCIQoeq+
	z+93AXuTLS+cbvYqViv5jMnKwNn2PZcbDRRKLjzg5DMYiP5WJG2uvZ+Q7LRusHHvZK0cRgjrP7WWh
	sOfxt3MKmfFjioeioS4Tj8kvcp3I2L9hGaws/73m5xwDeSw7HvprOwDGqM2O27wIhlclRu5ersBHX
	RohA53Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWxy-00000004YYc-2LYN;
	Tue, 01 Jul 2025 09:07:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWot-00000004WLv-3k7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EjeWk9zqwweIgociDbPCS45o0KwQTUtlv3dSFR85Uf8=;
	b=Q3Bq7jJDuyJYZZNBtxqwLQORnk+1VWGdxJ5VZ/5n8JC/Mp6Fh3IvRjPoe8G8c0J+O4T5VE
	KiXJoAnvbFFP+I9owauyAUuofSNFbRFmNmAAlI/WXPdFRPZDl53qNiW6E27P3L/ZMBI16s
	qBqoY0bkaLg4ux9pXGa3+j+8s4HtxsXK9Ucwf07oYqOx4pM5NJCPGma7zvJHD6T7NV5kWU
	6snc5AaEYoCE6BEb9WUvw6WQ0iJAii/iN7RA+ekjlYTBxiU0cDl0XejtXF5qlD5RCkEFHF
	mZoDHsqrvQPWbssyF7Qg4Y4QJvS9uLooQRwRkXv/zzc6th7h3hgqCnLvgMYu7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EjeWk9zqwweIgociDbPCS45o0KwQTUtlv3dSFR85Uf8=;
	b=5bleG6OHL3bnoymfUdalPRYi3NtkgJM/zEM5og7glKoX+JQWYLzWp5LXRyJEIBHoy0aVuP
	xxQtI3Ds9lIF9eCg==
Date: Tue, 01 Jul 2025 10:57:59 +0200
Subject: [PATCH 05/14] vdso/gettimeofday: Return bool from clock_getres()
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-5-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=2609;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WrNmDq00XPL9/kcKPoWaUE05zyuMZ1wASlKqJKUZvV4=;
 b=tN3l3TzL2aN33IdNstQl9X9W45CCH/yMvg2ndeJaAOtYqHqBFxk+zMlSkxDO3EBvMH4sMt5em
 LTTGotpyffNDjM9h5UsfpqDXNLO0vxPFLzrx5nuppVM50KXpkxEBIh0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015828_099357_9875CB0A 
X-CRM114-Status: GOOD (  13.73  )
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

The internal helpers are effectively using boolean results,
while pretending to use error numbers.

Switch the return type to bool for more clarity.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 93ef801a97ef25f66195490d14e41bebcd41982b..9b77f23566f6a35887d4c9aaefc61a971131b499 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -396,8 +396,8 @@ static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time
 
 #ifdef VDSO_HAS_CLOCK_GETRES
 static __maybe_unused
-int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
-				struct __kernel_timespec *res)
+bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
+				 struct __kernel_timespec *res)
 {
 	const struct vdso_clock *vc = vd->clock_data;
 	u32 msk;
@@ -405,7 +405,7 @@ int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock
 
 	/* Check for negative values or invalid clocks */
 	if (unlikely((u32) clock >= MAX_CLOCKS))
-		return -1;
+		return false;
 
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
 	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
@@ -427,23 +427,25 @@ int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock
 		 */
 		ns = LOW_RES_NSEC;
 	} else {
-		return -1;
+		return false;
 	}
 
 	if (likely(res)) {
 		res->tv_sec = 0;
 		res->tv_nsec = ns;
 	}
-	return 0;
+	return true;
 }
 
 static __maybe_unused
 int __cvdso_clock_getres_data(const struct vdso_time_data *vd, clockid_t clock,
 			      struct __kernel_timespec *res)
 {
-	int ret = __cvdso_clock_getres_common(vd, clock, res);
+	bool ok;
 
-	if (unlikely(ret))
+	ok =  __cvdso_clock_getres_common(vd, clock, res);
+
+	if (unlikely(!ok))
 		return clock_getres_fallback(clock, res);
 	return 0;
 }
@@ -460,18 +462,18 @@ __cvdso_clock_getres_time32_data(const struct vdso_time_data *vd, clockid_t cloc
 				 struct old_timespec32 *res)
 {
 	struct __kernel_timespec ts;
-	int ret;
+	bool ok;
 
-	ret = __cvdso_clock_getres_common(vd, clock, &ts);
+	ok = __cvdso_clock_getres_common(vd, clock, &ts);
 
-	if (unlikely(ret))
+	if (unlikely(!ok))
 		return clock_getres32_fallback(clock, res);
 
 	if (likely(res)) {
 		res->tv_sec = ts.tv_sec;
 		res->tv_nsec = ts.tv_nsec;
 	}
-	return ret;
+	return 0;
 }
 
 static __maybe_unused int

-- 
2.50.0


