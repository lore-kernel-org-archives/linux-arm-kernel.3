Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A325BCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Xtzlc4MKtN/ybKpqClt3CVRXBWPmpbb7mGbAWUMgnA=; b=oOnOAv9FdCFWKvSzY6Lu6O4+9y
	2Zcsek59w450N7By6tTUmf6jAXF3yGkRZr/4hXVjpDO4/uisRJXNtCsh47rZSFQxsYo8lkhPzxRBx
	Jq4ebjCtkKqG/wLayRzUQNJ+SfEAd88udUAbd8eIoxqi4xnOErA2TyA7/flQ4/xlhUmtEt+g8eI+U
	uh/0IH2ZuuoVuuN/Ivfe3i3PbkFVySU7wjNZVELuYk2n9ZgGc5WMIuAaq6EjTSfX/29pB/oyC0boB
	/rzyfpzvtnshJMnhA6dyYSs0zBafkGOZ6N+X54yqycpiq0MlxXdAOQG64R2+DJhGAARE8IP6mV1h6
	Ss78NxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf3B-0000000BtfP-18it;
	Fri, 02 Oct 2026 15:19:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf37-0000000BtdG-1Iqv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 15:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/Xtzlc4MKtN/ybKpqClt3CVRXBWPmpbb7mGbAWUMgnA=; b=BqHzbyeThEfglNAuNisiPYABrO
	SjDJKNcwBAB+pel9ZzPvWu0szGC0CHz2YilOVMrVvXc8dWskcvU8ikANLsPaggZPdLktmWNG0F/gq
	xG/0cS6ubkYCLHKqgqkZDjLgFjJoSjYn34rygKWINF4YOJIk30zd+Iq0scIgqy0NfVKLGRiscP1Z+
	i3PuSY5ZhNPyOQ3Yue+wrWVZsTGUYL50KiCYeuO0DtsrW09DeBKEefeGVrad2b8DRRpfLe9V5x9kh
	27Ve9NIjb+ncIEWu8Ulj5ZFW9R5CExE4mKFpvBMb8lFbHDLvv/Tpuqb//xII5958A4canRzvE2WuQ
	YRruJ6ag==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCf34-000000064CS-2zke;
	Fri, 02 Oct 2026 15:19:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCf31-00000000IAx-45IT;
	Fri, 02 Oct 2026 16:19:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 2/2] timekeeping: Use inlined counter read in ktime_get_snapshot_id()
Date: Fri,  2 Oct 2026 16:19:38 +0100
Message-ID: <20261002151938.69857-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151938.69857-1-dwmw2@infradead.org>
References: <20261002151938.69857-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Every instruction between a PPS/hwstamp caller's triggering event and
the counter read inside ktime_get_snapshot_id() displaces the returned
timestamp from that event. When the clocksource supports inlined
reads, read the counter directly in tk_clock_read_snapshot(), avoiding
the indirect call. The inlined read cannot provide a hardware
snapshot, so clear the chs struct after the read instead of
beforehand.

Also bypass the clock_id case statement for CLOCK_REALTIME, which is the
common and latency-critical caller.

Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter), with
inlined clocksource reads enabled: the interval from a raw counter
read in the caller to the counter read inside the function drops from
49.9ns to 41.2ns with the inline read, and to 38.8ns with the dispatch
bias, mean of 1M iterations.

Assisted-by: LLM
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 kernel/time/timekeeping.c | 110 +++++++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 37 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..f0768efb8cff 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -304,6 +304,30 @@ static __always_inline u64 tk_clock_read(const struct tk_read_base *tkr)
 	return clock->read(clock);
 }
 
+static inline u64 tk_clock_read_snapshot(const struct tk_read_base *tkr,
+					 struct clocksource_hw_snapshot *chs)
+{
+	struct clocksource *clock = READ_ONCE(tkr->clock);
+	u64 count;
+
+	if (static_branch_likely(&clocksource_read_inlined)) {
+		count = arch_inlined_clocksource_read(clock);
+	} else if (unlikely(clock->read_snapshot)) {
+		*chs = (struct clocksource_hw_snapshot){ };
+		return clock->read_snapshot(clock, chs);
+	} else {
+		count = clock->read(clock);
+	}
+
+	/*
+	 * Unless it's *used* by ->read_snapshot(), this can be cleared
+	 * *after* the clocksource is read, allowing the clocksource to
+	 * be sampled sooner.
+	 */
+	*chs = (struct clocksource_hw_snapshot){ };
+	return count;
+}
+
 static inline void clocksource_disable_inline_read(void)
 {
 	static_branch_disable(&clocksource_read_inlined);
@@ -321,6 +345,22 @@ static __always_inline u64 tk_clock_read(const struct tk_read_base *tkr)
 	return clock->read(clock);
 }
 
+static inline u64 tk_clock_read_snapshot(const struct tk_read_base *tkr,
+					 struct clocksource_hw_snapshot *chs)
+{
+	struct clocksource *clock = READ_ONCE(tkr->clock);
+	u64 count;
+
+	if (unlikely(clock->read_snapshot)) {
+		*chs = (struct clocksource_hw_snapshot){ };
+		return clock->read_snapshot(clock, chs);
+	}
+
+	count = clock->read(clock);
+	*chs = (struct clocksource_hw_snapshot){ };
+	return count;
+}
+
 static inline void clocksource_disable_inline_read(void) { }
 static inline void clocksource_enable_inline_read(void) { }
 #endif
@@ -1219,18 +1259,6 @@ noinstr time64_t __ktime_get_real_seconds(void)
 	return READ_ONCE(tk->xtime_sec);
 }
 
-static inline u64 tk_clock_read_snapshot(const struct tk_read_base *tkr,
-					 struct clocksource_hw_snapshot *chs)
-{
-	struct clocksource *clock = READ_ONCE(tkr->clock);
-
-	if (unlikely(clock->read_snapshot))
-		return clock->read_snapshot(clock, chs);
-
-	return clock->read(clock);
-}
-
-
 /**
  * ktime_get_snapshot_id -  Simultaneously snapshot a given clock ID with
  *			    the corresponding monotonic raw and the underlying
@@ -1263,36 +1291,41 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
 	if (WARN_ON_ONCE(timekeeping_suspended))
 		return;
 
-	switch (clock_id) {
-	case CLOCK_REALTIME:
-		tkd = &tk_core;
-		offs = &tk_core.timekeeper.offs_real;
-		break;
-	/* Map RAW to MONOTONIC so the loop below is trivial */
-	case CLOCK_MONOTONIC_RAW:
-	case CLOCK_MONOTONIC:
-		tkd = &tk_core;
-		offs = &offs_zero;
-		break;
-	case CLOCK_BOOTTIME:
-		tkd = &tk_core;
-		offs = &tk_core.timekeeper.offs_boot;
-		break;
-	case CLOCK_AUX ... CLOCK_AUX_LAST:
-		tkd = aux_get_tk_data(clock_id);
-		if (!tkd)
+	/*
+	 * Bias the dispatch for CLOCK_REALTIME: it is the overwhelmingly
+	 * common caller (PPS, PTP cross-timestamps) and the most
+	 * latency-critical -- everything ahead of the counter read
+	 * displaces those callers' timestamps from their triggering event.
+	 */
+	tkd = &tk_core;
+	offs = &tk_core.timekeeper.offs_real;
+
+	if (unlikely(clock_id != CLOCK_REALTIME)) {
+		switch (clock_id) {
+		/* Map RAW to MONOTONIC so the loop below is trivial */
+		case CLOCK_MONOTONIC_RAW:
+		case CLOCK_MONOTONIC:
+			offs = &offs_zero;
+			break;
+		case CLOCK_BOOTTIME:
+			offs = &tk_core.timekeeper.offs_boot;
+			break;
+		case CLOCK_AUX ... CLOCK_AUX_LAST:
+			tkd = aux_get_tk_data(clock_id);
+			if (!tkd)
+				return;
+			offs = &tkd->timekeeper.offs_aux;
+			break;
+		default:
+			WARN_ON_ONCE(1);
 			return;
-		offs = &tkd->timekeeper.offs_aux;
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return;
+		}
 	}
 
 	tk = &tkd->timekeeper;
 
 	do {
-		struct clocksource_hw_snapshot chs = { };
+		struct clocksource_hw_snapshot chs;
 
 		seq = read_seqcount_begin(&tkd->seq);
 
@@ -1911,8 +1944,11 @@ int timekeeping_notify(struct clocksource *clock)
 	 * If the clocksource has been selected and supports inlined reads
 	 * enable the branch.
 	 */
-	if (tk->tkr_mono.clock == clock && clock->flags & CLOCK_SOURCE_CAN_INLINE_READ)
+	if (tk->tkr_mono.clock == clock && clock->flags & CLOCK_SOURCE_CAN_INLINE_READ) {
+		/* The inlined read cannot provide a hardware snapshot */
+		WARN_ON_ONCE(clock->read_snapshot);
 		clocksource_enable_inline_read();
+	}
 
 	tick_clock_notify();
 	return tk->tkr_mono.clock == clock ? 0 : -1;
-- 
2.43.0


