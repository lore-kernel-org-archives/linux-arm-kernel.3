Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F0ECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G9KwwvdCGw4wnkqkBvgSxtro1CwOxVuRFZAYG/9e5sw=; b=BDElgvTv8rM99s2lQRGrBTcCg/
	P2Q/d8stg7iS3NR2W2x/LiXE3GbUj/RFSkLU7PUUv6GmiRT+Fwn82E8XNr8Z3Z5MpwQR1hYNPLaiP
	fp4/+l76rNQWCJhEntmfjKVq+tMr/ghfD+5VVEoj55M/6uNf9PluoDIFWtjFX/94aDzEfXg1UbhDq
	fe+Qwk1g5ZNDUOaVsizAz9nB2i4noQN0kixoJsPJ03keDG8/ZWc6pAgp7WoprQ8WsWNqCyBsq/F5h
	xqyYR8ORSMSFGZ/7kakTtgWeCgybc+m/GywILGjXAoh4eg7p2flmgOL0TSdTtXzAiCo0ZLlOzfpM+
	/kW1oD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2X1-00000000WlF-2U6N;
	Tue, 06 Oct 2026 10:36:23 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Wy-00000000WkX-1sQ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:36:22 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e501442e2so978668a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791282978; x=1791887778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9KwwvdCGw4wnkqkBvgSxtro1CwOxVuRFZAYG/9e5sw=;
        b=r47W42SwMIe1JQ90wbAD677vqBxRIJ0jkt2xr/of2ptxm2vi4Z+sZTFnFZsrjnNbJu
         VaYaZfKYW9lxHTYMVTzSZkp7/0RYjBU5Rob/NuHCxKgvi9L4c4t4UgJXcFE2vRg1Bavb
         FAEYEh/KObu52+PDfzjAfSumFdt64fQuuJtiW6zMq4rUM546YO+3FlwZoaeHoWYsuPyL
         rKUDWHvpijS2NzCIRa7am6iw9dKRhtVfCBtB+PpnmBYz6opdJkuZHYWEGBYYkFnyQRAF
         UhFK7KFk9YTfzBA7gpTW5N7dI9XYvE62RVlIHzMjoqnBiMjsv/QIpLQCMEdUYfwdQEwt
         2qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282978; x=1791887778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9KwwvdCGw4wnkqkBvgSxtro1CwOxVuRFZAYG/9e5sw=;
        b=VvpAUpS25C0iBNLYlzbL+jXLeCQup5epom9Pwpk+O5BExcWseg8b9IVz9JOVLWZNkU
         MMenuAsrew6TiJrkcpTFaAKEJmhf1RBfTp7Fiy0zfA3LAwBH8lC7XXEdb/1rGsBO0Rfu
         Vm9R03G8skybslL0vST1XSma00eUjqAoP8YMCojwO1rj9GUFqXGNPx7tBI5sa56Ip8nM
         3mAgkKa4ciP+YVdHXSt9BtzzLyDJRVgvQthz1oMgVUSWDq7s51fBWO/L/Ttcwb1SPkjx
         M5BVvmOZIldR5l0NV1txtrbBDepqZngpZbpnLQgOmqCGVnH/YEryXmrjooqz0eSUPfA1
         97VA==
X-Forwarded-Encrypted: i=1; AKwUvBzmY6uEcRGqOVJLQS52yzDuq9ZY1LIlQq0/b1f1k3NfotiqroW+qEHqcZlXxVWUSjKRkDVPJjfuRGUnUbRT4IUK@lists.infradead.org
X-Gm-Message-State: AFq9FYKFBo4Pp1UAZrBXtGZ4nd/5s33b3zz+HlyDVANohhkW1oy9taYC
	aYa6NHmVjDAg5Q0sPucBA9AzcbQtJ+s7lHQak/fLnvPlJHSj3UKTRFvmLf1GVvBYqw==
X-Gm-Gg: AYBFou1EAN+JEHkpkqO6DfH8ffH/AkhxyOhOCVABzC5RhRrTZyXXw46ZRccztWdPpEM
	sMevPQbIg2QNb2qByL9F02RAKvl6IY+bZBQ4mymLVWCmTGF9JMKjHwQCSFDK0rvCXLteRy75zjI
	zYqI+fHx1sSdLUNiL1GQhGVRTMK7gibbxmWRukrLH7wTUb/2nWf/JPX3wBQBBwGonXxN2nt4ggI
	+7cE1CrsZ8BJoGy2hVvldL/9WdqSi7/txjZXysvCFUwSwnbjCxp75TW+yW/41VLxdqU79T1YyQs
	uI45jS+KTyu7ZUSna967/XFQDjEA3vEWd7pOR9lUJQlVPvfHpZuFyoui8NYlaaQslaiJI5Q/OOQ
	KeY2mGLME2TQ9MUQ+inWP7ar4hz0TPQa3zPsPVFv1qURLmNEBdxRx5EYcdRoOizp14WZhW8/10u
	hluvrfIu1zYFgWK1e/C2vE7Yq2J0QIB1vwnYdOVOAOc4oyrXOwulQWvkjHFpzl4KR+4qfJ+u+aH
	zBWfrQ=
X-Received: by 2002:a17:90b:3c81:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3a87267eb17mr864083a91.4.1791282978152;
        Tue, 06 Oct 2026 03:36:18 -0700 (PDT)
Received: from mimolette.lan ([58.136.77.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm3553119a91.12.2026.10.06.03.36.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 03:36:17 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: stmmac: ptp: switch to gettimex64() interface
Date: Tue,  6 Oct 2026 17:36:10 +0700
Message-ID: <20261006103610.98277-1-jjc@jclark.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_033620_754086_F5071A8C 
X-CRM114-Status: GOOD (  19.71  )
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

The stmmac PTP support currently implements the gettime64 callback to
retrieve the hardware clock time. Update the implementation to provide
the gettimex64 callback instead, adding support for the
PTP_SYS_OFFSET_EXTENDED ioctl.

The system clock readings are taken around the read of the nanoseconds
register in get_systime(), so get_systime() gains a ptp_system_timestamp
argument. rmb() is used to ensure proper ordering on weakly ordered
architectures.

Assisted-by: LLM
Signed-off-by: James Clark <jjc@jclark.com>
---
Tested on a Radxa ZERO 3E (RK3566, DWMAC 4/5) running net-next.
Width of the interval between the two system clock readings
bracketing each PHC read (2000 calls of 25 samples each):

                                         min      median
Before patch (PTP_SYS_OFFSET):           875 ns   1167 ns
After patch (PTP_SYS_OFFSET_EXTENDED):   291 ns    584 ns

On this board the 24 MHz arch timer counter advances in steps of 7
(~292 ns), so all intervals are multiples of that.

 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  5 ++++-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c   |  9 ++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c    | 17 ++++++++++-------
 .../ethernet/stmicro/stmmac/stmmac_selftests.c  |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c |  3 ++-
 5 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index a8a5c8fdd..6efbfe501 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -493,6 +493,8 @@ struct stmmac_ops {
 #define stmmac_fpe_map_preemption_class(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, fpe_map_preemption_class, __args)
 
+struct ptp_system_timestamp;
+
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
 	void (*config_hw_tstamping) (void __iomem *ioaddr, u32 data);
@@ -502,7 +504,8 @@ struct stmmac_hwtimestamp {
 	int (*config_addend) (void __iomem *ioaddr, u32 addend);
 	int (*adjust_systime) (void __iomem *ioaddr, u32 sec, u32 nsec,
 			       int add_sub, int gmac4);
-	void (*get_systime) (void __iomem *ioaddr, u64 *systime);
+	void (*get_systime)(void __iomem *ioaddr, u64 *systime,
+			    struct ptp_system_timestamp *sts);
 	void (*get_ptptime)(void __iomem *ioaddr, u64 *ptp_time);
 	void (*timestamp_interrupt)(struct stmmac_priv *priv);
 	void (*hwtstamp_correct_latency)(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa7..a556b49aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -183,7 +183,8 @@ static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 					 10, 100000);
 }
 
-static void get_systime(void __iomem *ioaddr, u64 *systime)
+static void get_systime(void __iomem *ioaddr, u64 *systime,
+			struct ptp_system_timestamp *sts)
 {
 	u64 ns, sec0, sec1;
 
@@ -191,8 +192,14 @@ static void get_systime(void __iomem *ioaddr, u64 *systime)
 	sec1 = readl_relaxed(ioaddr + PTP_STSR);
 	do {
 		sec0 = sec1;
+		ptp_read_system_prets(sts);
+		if (sts)
+			rmb();
 		/* Get the TSSS value */
 		ns = readl_relaxed(ioaddr + PTP_STNSR);
+		if (sts)
+			rmb();
+		ptp_read_system_postts(sts);
 		/* Get the TSS value */
 		sec1 = readl_relaxed(ioaddr + PTP_STSR);
 	} while (sec0 != sec1);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3bfcc9760..41f0885ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -89,7 +89,8 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		u64 cycle_time;
 
 		mutex_lock(&priv->est_lock);
-		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+		priv->ptp_clock_ops.gettimex64(&priv->ptp_clock_ops, &current_time,
+					       NULL);
 		current_time_ns = timespec64_to_ktime(current_time);
 		time.tv_nsec = priv->est->btr_reserve[0];
 		time.tv_sec = priv->est->btr_reserve[1];
@@ -114,15 +115,17 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 }
 
 /**
- * stmmac_get_time
+ * stmmac_get_timex
  *
  * @ptp: pointer to ptp_clock_info structure
  * @ts: pointer to hold time/result
+ * @sts: pointer to hold system timestamps around the read, or NULL
  *
  * Description: this function will read the current time from the
  * hardware clock and store it in @ts.
  */
-static int stmmac_get_time(struct ptp_clock_info *ptp, struct timespec64 *ts)
+static int stmmac_get_timex(struct ptp_clock_info *ptp, struct timespec64 *ts,
+			    struct ptp_system_timestamp *sts)
 {
 	struct stmmac_priv *priv =
 	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
@@ -130,7 +133,7 @@ static int stmmac_get_time(struct ptp_clock_info *ptp, struct timespec64 *ts)
 	u64 ns = 0;
 
 	read_lock_irqsave(&priv->ptp_lock, flags);
-	stmmac_get_systime(priv, priv->ptpaddr, &ns);
+	stmmac_get_systime(priv, priv->ptpaddr, &ns, sts);
 	read_unlock_irqrestore(&priv->ptp_lock, flags);
 
 	*ts = ns_to_timespec64(ns);
@@ -200,7 +203,7 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 
 		target_ns = cfg->start.tv_nsec + ((u64)cfg->start.tv_sec * NSEC_PER_SEC);
 
-		stmmac_get_systime(priv, priv->ptpaddr, &ns);
+		stmmac_get_systime(priv, priv->ptpaddr, &ns, NULL);
 		if (ns > TIME64_MAX - PTP_SAFE_TIME_OFFSET_NS)
 			return -EINVAL;
 
@@ -304,7 +307,7 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.pps = 0,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
-	.gettime64 = stmmac_get_time,
+	.gettimex64 = stmmac_get_timex,
 	.settime64 = stmmac_set_time,
 	.enable = stmmac_enable,
 };
@@ -321,7 +324,7 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
 	.pps = 0,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
-	.gettime64 = stmmac_get_time,
+	.gettimex64 = stmmac_get_timex,
 	.settime64 = stmmac_set_time,
 	.enable = dwmac1000_ptp_enable,
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 6097f312f..2ae4f0e76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1778,7 +1778,7 @@ static int stmmac_test_tbs(struct stmmac_priv *priv)
 		return ret;
 
 	read_lock_irqsave(&priv->ptp_lock, flags);
-	stmmac_get_systime(priv, priv->ptpaddr, &curr_time);
+	stmmac_get_systime(priv, priv->ptpaddr, &curr_time, NULL);
 	read_unlock_irqrestore(&priv->ptp_lock, flags);
 
 	if (!curr_time) {
@@ -1800,7 +1800,7 @@ static int stmmac_test_tbs(struct stmmac_priv *priv)
 
 	/* Check if expected time has elapsed */
 	read_lock_irqsave(&priv->ptp_lock, flags);
-	stmmac_get_systime(priv, priv->ptpaddr, &curr_time);
+	stmmac_get_systime(priv, priv->ptpaddr, &curr_time, NULL);
 	read_unlock_irqrestore(&priv->ptp_lock, flags);
 
 	if ((curr_time - start_time) < STMMAC_TBS_LT_OFFSET)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 42a00446e..57ebeb2c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1070,7 +1070,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	mutex_lock(&priv->est_lock);
 	/* Adjust for real system time */
-	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+	priv->ptp_clock_ops.gettimex64(&priv->ptp_clock_ops, &current_time,
+				       NULL);
 	current_time_ns = timespec64_to_ktime(current_time);
 	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
 					qopt->cycle_time);

base-commit: cfb7793d1bc0f7d90571611979654cf1b3886b29
-- 
2.55.0


