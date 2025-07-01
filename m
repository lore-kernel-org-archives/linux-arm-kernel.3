Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F688C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLGlXBLoHCl8iTZFGkpWl+4cLC4fbRbFQ1Cna6OA294=; b=y3SSwTj6PGj+pRXf24sF8z9JQv
	SiO2dCD6ZWn7zezQ3nwgrv720CkoZ4oFDgGXtvBlH7GdVf45zheAjYPPbdWDBsc0OJm6TzQZDMg2k
	mqWG/JEpef9rNORfEUesYt6QwyHIU3A3H06LHGDbvSr648akYvb3w+/noB7p974Mv9Eg4l342ScMR
	u9aflIiF07GVQcPE7GwuIXIDvOThTTxQijvFNUOCATrgfAATuAbRbLMsvgDHxczLgdihelNUlY6z/
	7kdV4880U+GNZ+XSC7+l7PaInSig8xYBrsO1IswXwP1ye/B4XYMINA5yKt7rtvNK05pUKpBN3E0fn
	6Oo4POkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY6e-00000004jjS-33Np;
	Tue, 01 Jul 2025 10:20:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-00000004WNa-1ix7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:31 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLGlXBLoHCl8iTZFGkpWl+4cLC4fbRbFQ1Cna6OA294=;
	b=hCdg9J/c9E6RT0wp6/DhGRc8l2ths+F2e0C3PVLM5LyMtcRgzSnaJkHkcQPPghkg/XeIpd
	LWGQ7lX3WJUFxu3ek2BvL8C6SIKdZZCnnfAazdnoDGestgjVmLWS7pp8l9vtfnfLKRJCbr
	XJXluEsSZP/mJ3JhmR2CxKsF1IugmZxvxhTTY235Ij3lq6ld4ULlPsfC9olhKlyxHYgWTC
	NEb5IBp538bTUXHNDpo7FJPd/m1D4oK/x4gPmt5lejA0NpMusHSEhEYSIkfUR9IhQqKnXh
	/5nUYmD7mc2ugRKGfjNgNfpa0roYwNLQgrs/CeQU6Hcca6RY3aKTm6HfPSUclw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLGlXBLoHCl8iTZFGkpWl+4cLC4fbRbFQ1Cna6OA294=;
	b=SODPMp3s/oAwW35AK1TnWm29pKng8GpRaNdGr9v2vbfuSLyfCFSWsbW6EBxgbSwh5NqAtV
	LeWbBp4VXN/84xCw==
Date: Tue, 01 Jul 2025 10:58:01 +0200
Subject: [PATCH 07/14] vdso/gettimeofday: Introduce vdso_clockid_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-7-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=1538;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dRtOLc0Ah0kuXXHJncEp4KlW6Rn2+hYOmoEn9rpo9FQ=;
 b=HTm3jtAk7vagm4p603uxzJ6EQojuf/6O5qSR9JWQUCAE793nMRMynN0XVRWXyboEG1fCIAwoE
 4hpXQVIhcWLCO71c9GbNNfwf5IiU8zNqmXABKY3tM0pBQK7mnBSSfn1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015830_610080_8098B9BE 
X-CRM114-Status: GOOD (  10.42  )
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

With the upcoming addition of auxiliary clocks the clockid validation will
become more complicated. Split it into a dedicated function to keep the
code readable.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index c5266532a097c06f33d12e345c695357d75abf42..215151bd5a1320ee6edda8f334d47c739577f696 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -71,6 +71,12 @@ static inline bool vdso_cycles_ok(u64 cycles)
 }
 #endif
 
+static __always_inline bool vdso_clockid_valid(clockid_t clock)
+{
+	/* Check for negative values or invalid clocks */
+	return likely((u32) clock < MAX_CLOCKS);
+}
+
 #ifdef CONFIG_TIME_NS
 
 #ifdef CONFIG_GENERIC_VDSO_DATA_STORE
@@ -268,8 +274,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	const struct vdso_clock *vc = vd->clock_data;
 	u32 msk;
 
-	/* Check for negative values or invalid clocks */
-	if (unlikely((u32) clock >= MAX_CLOCKS))
+	if (!vdso_clockid_valid(clock))
 		return false;
 
 	/*
@@ -405,8 +410,7 @@ bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t cloc
 	u32 msk;
 	u64 ns;
 
-	/* Check for negative values or invalid clocks */
-	if (unlikely((u32) clock >= MAX_CLOCKS))
+	if (!vdso_clockid_valid(clock))
 		return false;
 
 	if (IS_ENABLED(CONFIG_TIME_NS) &&

-- 
2.50.0


