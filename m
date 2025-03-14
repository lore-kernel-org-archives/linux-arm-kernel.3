Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE7BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QggTlpxLWEC50ONNabSeYB6RhPieGr2Z8I7fdFvhr8=; b=M/Lv0CmgXJSsgZGWnFkhNSxMcR
	RoHiOPkVUjpjN6ihVZOvwci3COI53CgIE10C1RGvgx4HnPdvotjuRtWHKJhjHxnGtHTGsPta5Iosv
	lM+wt6BBBhBCB5XW6pPGwxeKlgilx+PKZzpBDE8AoqcGkIhPYliLEOS1wrI661qOrfr81o8Lv0Gkt
	l+oSsxKSvJzsDfPov0drciTGAQdwJWEj36fVOC0MVrRu1kAYj4M0XmgDL7cAWvcab/wKw+fMWE2Qe
	O+6ZcHnTL2GVNRZdawa6TZ0zJNaoj/QMHpWfELH0tQf8VUU59vttaLLyP5FqdEGlO4E0/Q0545alC
	gpE2XwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt21f-0000000DndY-2bmF;
	Fri, 14 Mar 2025 10:12:23 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1r3-0000000Dl47-1u5G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:01:26 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso21041481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946483; x=1742551283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QggTlpxLWEC50ONNabSeYB6RhPieGr2Z8I7fdFvhr8=;
        b=FRorXmRmy9bk1oky0B7ZTGwnSDiTs0fEbNIY9/XT7oQqkqsK91HTPqcHvzEsYnw5mf
         4zq8f2bBGhqEEYAAg5QdSipnhXkp0Bb8hUpWqdx+HdoBgHVSeXMIkDGreluWNvXCheYo
         giryso1OljV44huJTpom068Mf/DEMmLpvuj3mQHOn3MGIhXaQat3OOuwPiuwS8hwhmF1
         HapYBpqgbWD+mgSesPDTaseRnory/7bQYZUlmjpe4mvwFu/8QVsjQ9UUkWYhHC95XgUA
         UbmECML/rXP7NhxDBgWR7+VI9vN7bU2+JUducti0TdELMqlZeo+xItCk7j+Y/8vb3ffy
         EQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946483; x=1742551283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QggTlpxLWEC50ONNabSeYB6RhPieGr2Z8I7fdFvhr8=;
        b=BAWZ3grOAeLd8TcYlLfphfWSDDUO2VbfvSqzmNokMKrQ4YxXKrM2Nd0V8md7O4H3wj
         OGCnTKt+amGF91BoaxTtxjLFzO7yDC1WIw/cAnPmvGIXTt1mkHHu73jy6sMxBXH5z62T
         N8Px2O5ecmCduD992gmV+R9cV/HZjBDoT/v15JoP48uD7sIovCupCf2qwYiTXhURyKWX
         bWpZCZeafBd9dkBNZwh4jyPUXgGvVvJZvcuW/Wkbs7oE1e1jpllg9bnw6c+eO15HzSHK
         ASxsduv8XAvVm6rCXvXp7++nJ2hE6kkScste1/GlvqNhlAEkeIK9KrGNCal6v45ES08a
         PksQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnHT7KeKZWAphOhQg5s3TNeKQAqyS8+AkAkAw/LJpPckqSLCfpeo4ETST+b0WFlbPhasKTvr4D3L1rsTaXuDcj@lists.infradead.org
X-Gm-Message-State: AOJu0YynehorEN4GZ1hYovYt8f18j+6RmPuqSf2FFR5zUD7xMoChQGQN
	Ib88yVWBGJbj0Cj7Vj5b5uSpUXEtqnVdxyoOuzoJxkJPq1O8n+CYuA2AVpR4O2g=
X-Gm-Gg: ASbGncvjhlZsUNHF2AP3tuthmf2RYwieguhovgzNW/uBatn+1N9qJqqUg2T7g8Os9L8
	pXJ4cLYSoQDg+MqoBxFtwlpBKH0eSkuNrz3Hw7KtNne7+ti63fTmN1em5Yqdhj6LL40alNB5is6
	dys2p/VYJv4AWfscOPHLmOqm/onAayPxnmI/F0RGr2CU2SrnaUUmxTldeIrgh16rXcSyy0+bg+x
	ExE9M1yYv4oN5Z2Rsfa0vOwslQsj0aBnGuUzWxaosVuhatcRa4m34OJcyccJOOyEI+TWRXIBHIi
	c8nAY0w9KhA3nt/aBe1wjz7mD45rjqbkJzTUNI5droMhTHp+eNgfx8i3aqpFdedGFlWZZ3HviMg
	2eYRWUCh2HRuiStm8ojE=
X-Google-Smtp-Source: AGHT+IF3JWP6a57uvsfs3rKVvgBqgJHjNxLdTktMEECCgzMKQtOboYvvcrBZ2wGvWzv5dk6aRgujQw==
X-Received: by 2002:a2e:88c9:0:b0:30b:8e06:86a3 with SMTP id 38308e7fff4ca-30c4a8665c1mr5313131fa.16.1741946483423;
        Fri, 14 Mar 2025 03:01:23 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea468sm5168221fa.41.2025.03.14.03.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:01:22 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] pmdomain: core: Add residency reflection for domain-idlestates to debugfs
Date: Fri, 14 Mar 2025 11:00:58 +0100
Message-ID: <20250314100103.1294715-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314100103.1294715-1-ulf.hansson@linaro.org>
References: <20250314100103.1294715-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030125_492583_6ACECD97 
X-CRM114-Status: GOOD (  19.89  )
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

For regular cpuidle states we are reflecting over the selected/entered
state to see if the sleep-duration meets the residency for the state. The
output from the reflection is an "above" value to indicate the number of
times the state was too deep and a "below" value for the number of times it
was too shallow.

Let's implement the similar thing for genpd's domain-idlestates along with
genpd's governor and put the information in the genpd's debugfs.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c     | 40 ++++++++++++++++++++++++++++++++++---
 drivers/pmdomain/governor.c |  2 ++
 include/linux/pm_domain.h   |  4 ++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c79ef6e3ab85..3327de2f9ed2 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -304,10 +304,40 @@ static void genpd_update_accounting(struct generic_pm_domain *genpd)
 
 	genpd->accounting_time = now;
 }
+
+static void genpd_reflect_residency(struct generic_pm_domain *genpd)
+{
+	struct genpd_governor_data *gd = genpd->gd;
+	struct genpd_power_state *state, *next_state;
+	unsigned int state_idx;
+	s64 sleep_ns, target_ns;
+
+	if (!gd || !gd->reflect_residency)
+		return;
+
+	sleep_ns = ktime_to_ns(ktime_sub(ktime_get(), gd->last_enter));
+	state_idx = genpd->state_idx;
+	state = &genpd->states[state_idx];
+	target_ns = state->power_off_latency_ns + state->residency_ns;
+
+	if (sleep_ns < target_ns) {
+		state->above++;
+	} else if (state_idx < (genpd->state_count -1)) {
+		next_state = &genpd->states[state_idx + 1];
+		target_ns = next_state->power_off_latency_ns +
+			next_state->residency_ns;
+
+		if (sleep_ns >= target_ns)
+			state->below++;
+	}
+
+	gd->reflect_residency = false;
+}
 #else
 static inline void genpd_debug_add(struct generic_pm_domain *genpd) {}
 static inline void genpd_debug_remove(struct generic_pm_domain *genpd) {}
 static inline void genpd_update_accounting(struct generic_pm_domain *genpd) {}
+static inline void genpd_reflect_residency(struct generic_pm_domain *genpd) {}
 #endif
 
 static int _genpd_reeval_performance_state(struct generic_pm_domain *genpd,
@@ -982,6 +1012,9 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	if (genpd_status_on(genpd))
 		return 0;
 
+	/* Reflect over the entered idle-states residency for debugfs. */
+	genpd_reflect_residency(genpd);
+
 	/*
 	 * The list is guaranteed not to change while the loop below is being
 	 * executed, unless one of the parents' .power_on() callbacks fiddles
@@ -3517,7 +3550,7 @@ static int idle_states_show(struct seq_file *s, void *data)
 	if (ret)
 		return -ERESTARTSYS;
 
-	seq_puts(s, "State          Time Spent(ms) Usage          Rejected\n");
+	seq_puts(s, "State          Time Spent(ms) Usage      Rejected   Above      Below\n");
 
 	for (i = 0; i < genpd->state_count; i++) {
 		struct genpd_power_state *state = &genpd->states[i];
@@ -3537,9 +3570,10 @@ static int idle_states_show(struct seq_file *s, void *data)
 			snprintf(state_name, ARRAY_SIZE(state_name), "S%-13d", i);
 
 		do_div(idle_time, NSEC_PER_MSEC);
-		seq_printf(s, "%-14s %-14llu %-14llu %llu\n",
+		seq_printf(s, "%-14s %-14llu %-10llu %-10llu %-10llu %llu\n",
 			   state->name ?: state_name, idle_time,
-			   state->usage, state->rejected);
+			   state->usage, state->rejected, state->above,
+			   state->below);
 	}
 
 	genpd_unlock(genpd);
diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index d1a10eeebd16..c1e148657c87 100644
--- a/drivers/pmdomain/governor.c
+++ b/drivers/pmdomain/governor.c
@@ -392,6 +392,8 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 		if (idle_duration_ns >= (genpd->states[i].residency_ns +
 		    genpd->states[i].power_off_latency_ns)) {
 			genpd->state_idx = i;
+			genpd->gd->last_enter = now;
+			genpd->gd->reflect_residency = true;
 			return true;
 		}
 	} while (--i >= 0);
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 6e808aeecbcb..0b18160901a2 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -142,6 +142,8 @@ struct genpd_governor_data {
 	bool max_off_time_changed;
 	ktime_t next_wakeup;
 	ktime_t next_hrtimer;
+	ktime_t last_enter;
+	bool reflect_residency;
 	bool cached_power_down_ok;
 	bool cached_power_down_state_idx;
 };
@@ -153,6 +155,8 @@ struct genpd_power_state {
 	s64 residency_ns;
 	u64 usage;
 	u64 rejected;
+	u64 above;
+	u64 below;
 	struct fwnode_handle *fwnode;
 	u64 idle_time;
 	void *data;
-- 
2.43.0


