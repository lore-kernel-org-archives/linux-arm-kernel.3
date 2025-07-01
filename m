Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B614C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUv1tHn4Gb15SCtBOdwANRio4D/S8/QmhpZlRN18zW8=; b=ATh8mPrZIgC+p7ILfGE16JgMNa
	x8L8GagdwsJ781/uEJX9/cOJC0PaV8G9virROpyJrc2BpLh22gBZgmK3CVNA8H6JjATr/8uruNavs
	6itH51aFvIyd4Hejvp8N8O82G5GfUWYfXQVyklqWtO+pTzWs+jCBl7ipFoBx/zP/R8ireHPYZfl5n
	uORO8aM5H7KOWnKS1ELH7pE+lZbDZn0CIpwYTf2Cc4mqxaxUFI5v6hMEf+JFzpsKRPYRtzoko1cok
	aHWTSXgoGXgfmeNAzL6GAHwv81/MeqmkF8k1XEeIuCSO5TVyCTB9iDGNfy6QYpStwOoUjaiYQYdCt
	nj1eFM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXC8-00000004aYD-3EIb;
	Tue, 01 Jul 2025 09:22:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-00000004WNb-1pIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:31 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUv1tHn4Gb15SCtBOdwANRio4D/S8/QmhpZlRN18zW8=;
	b=wB37phIU1cgHL9oe4WYfMGliy5jbaoTzF0DhUFJs/rOu6Z9k1d3vYlAoN9EKggIwQUdu7l
	+TljAEBva1iFEhXtwj719UDDhlB7E7ALl8cwsgv8F+HUkIarv/qpDzLbPy7v4o/GeFoOFd
	2R4a1ZFq2m8qwljdwSfFlnkniHuUtcqgGxU+sUvfvGw1lpcFjL8gkz81eCl3e1b7Pk8VKb
	10dcpeqesAIzny9jyLb46PnxK5K9QIJu7XVW1XaC7Hw+NAvENeYfSx+DUhGLnd9jyQJXPU
	ot0rpxGS270Y+z4vxiKynztpNbEmcLdOyJkwgdvYSvWmLEQ/LGbCnC4ntsmYTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUv1tHn4Gb15SCtBOdwANRio4D/S8/QmhpZlRN18zW8=;
	b=ZgZmCR6hsNO6h+aAy42Sjmgm6zIioVVD4G5orMl9SniBw8do+p9kwhp5Mrhd+6o7spFRYw
	zppOqtmG7rk7GaCA==
Date: Tue, 01 Jul 2025 10:58:02 +0200
Subject: [PATCH 08/14] vdso/gettimeofday: Introduce vdso_set_timespec()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-8-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=2428;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CC5cQSfSGmKdKkeZa7p5tvupyfG2CLNGehREDf1mFcc=;
 b=7doTRp//wkLzPlGHPeeVXsRB2rVPSQaX9szW5pOx13TUBMCDQh6Ba5Lm0uy/yEitK/NoNivtP
 C/e1SD9At+pB4f04mSGvpQui1WuaofZ+BHAxek5oRzMozDtD+tqbaLD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015830_779685_5845E6F5 
X-CRM114-Status: UNSURE (   9.52  )
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

This code is duplicated and with the introduction of auxiliary clocks will
be duplicated even more.

Introduce a helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 215151bd5a1320ee6edda8f334d47c739577f696..50611ba28abfcfc7841616e8787101ea1ffcb7d8 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -77,6 +77,16 @@ static __always_inline bool vdso_clockid_valid(clockid_t clock)
 	return likely((u32) clock < MAX_CLOCKS);
 }
 
+/*
+ * Must not be invoked within the sequence read section as a race inside
+ * that loop could result in __iter_div_u64_rem() being extremely slow.
+ */
+static __always_inline void vdso_set_timespec(struct __kernel_timespec *ts, u64 sec, u64 ns)
+{
+	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
+	ts->tv_nsec = ns;
+}
+
 #ifdef CONFIG_TIME_NS
 
 #ifdef CONFIG_GENERIC_VDSO_DATA_STORE
@@ -122,12 +132,7 @@ bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *
 	sec += offs->sec;
 	ns += offs->nsec;
 
-	/*
-	 * Do this outside the loop: a race inside the loop could result
-	 * in __iter_div_u64_rem() being extremely slow.
-	 */
-	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
-	ts->tv_nsec = ns;
+	vdso_set_timespec(ts, sec, ns);
 
 	return true;
 }
@@ -188,12 +193,7 @@ bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vc, seq)));
 
-	/*
-	 * Do this outside the loop: a race inside the loop could result
-	 * in __iter_div_u64_rem() being extremely slow.
-	 */
-	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
-	ts->tv_nsec = ns;
+	vdso_set_timespec(ts, sec, ns);
 
 	return true;
 }
@@ -223,12 +223,8 @@ bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock
 	sec += offs->sec;
 	nsec += offs->nsec;
 
-	/*
-	 * Do this outside the loop: a race inside the loop could result
-	 * in __iter_div_u64_rem() being extremely slow.
-	 */
-	ts->tv_sec = sec + __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-	ts->tv_nsec = nsec;
+	vdso_set_timespec(ts, sec, nsec);
+
 	return true;
 }
 #else

-- 
2.50.0


