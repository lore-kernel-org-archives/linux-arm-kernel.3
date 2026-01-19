Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CD8D29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64A4cniu7Nu112V7CHRL//FijlPeEL9Dny3BjkKYjlY=; b=hOxdLZ6LJIxR81AEDdBQeJAcuK
	I0NBKsbCGFwkCaL+lc/oCoKexGpoXdSnyt0MYBOxUdCdtyaql+RBcNG1UxwkEzNitiGXYITLClQ2l
	qLs3Zk3F3kUxp6kKKXX+aff3T76TTo4TIsZb47AQPrey0uqdwZutZzkm358YVLd89ykQ206OmgtnB
	bBCEySs/2a3OFR3HTG7uJoRkLiPOXqxp3xEZ06msx/k42fv2dGx7CuoLH5J7hpDmBAQLOe678tvgC
	gSTfHuFDecBd9RjAFaKcNCAy2YaiBfdZYQSC9sZFsBlNtinx3b1/E1y4bqxwD5zYaGFFjoKLRULCN
	5TgCYeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqIE-00000002GUm-1sYT;
	Mon, 19 Jan 2026 14:31:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI3-00000002GSd-3jHQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 14:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=64A4cniu7Nu112V7CHRL//FijlPeEL9Dny3BjkKYjlY=; b=NIAoThtDktiYPE2JFPQKvQEbzf
	NyXemzuWvTy/PG34HYkOtVEElYue8yoa3W98qGJBTvOrFm9ZQigmMrCvsTA5gMHYz3X5MnViCuDx6
	XkqEs8JVcDRzz5Aalgo9PA68l0EDCCpDNqWmOej3j+Xw//9PgCc8iRzT49FAi3a4i03l5/UPRmrMT
	c8JqJzoo/ryy7Yp3eCBwWk5OO9FPbmXs49DT7B5aSCWjTIraRzrncyqga+hwQWZUmNChwU/A5eT5s
	RI/LI19/RuUjp2/4JnUFpF5Kg13CFf9yZ8ZDCtKeTlflvT93H2hXbFyl4FdJioGacJnJZMqjl/aly
	59Cej07w==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI0-0000000CH9P-1f9A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:31:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59b30275e69so5473496e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768833090; x=1769437890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64A4cniu7Nu112V7CHRL//FijlPeEL9Dny3BjkKYjlY=;
        b=bA3XhkgPhRilN8QW18mo7Dtkxdcf8BVYkdWHLkiBb5jIAkhmpC5ie/I8vfYkB2Zwe/
         7oOxdlSuvlbcyMmJ12k9urLQDpGEhf4gN9HKoQcBzsl7pU9JGsSTrpOnTtO8DAIWP91p
         svUlExI3d+fRZ+ahriMnuEgcColDSdYSJ/6lgE4cz3k+rCwlgtaC9wgF27oR5wVCuI/h
         WgJhqj03SvZ1A2u18ufi2PEvKGca6e7MZSWJSpB8DkSbsI2/gVssqCTyB9/eQL0S6Ps/
         WzzLoG2RTR0ghSEceVTxbFmLSVW3HF36tkBGtCvHfcGqP30ObQTWaKCB7wPvPAlxb0Kl
         Kx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833090; x=1769437890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=64A4cniu7Nu112V7CHRL//FijlPeEL9Dny3BjkKYjlY=;
        b=jspTfVWE0T+g70zfSor5n4Tzu89mvAWJ7lA7IBw3rRCqFNdnoHIZwUBm/+iiw5dXvH
         46zPWDoWBtpRR9Vzb51j0C3Uera8gRY10SCGh8Z2EI0lw9Up9vx6oTiTZh+sYdXfhgC/
         i/kLP7WlI3ygpcPkLidyQXaEtfKcnA8VwwDsydKq9+H01qQWzYgyQ04ibA2JvdtF+66p
         jf9Uyn0egAjQxgH45UX4amfJkdNrSx/S2EIcB9+/DOjMCs2WznCDdZ9/lpD8m19xtAh4
         FjuZgMKwhLrGGg+yrTJWU4k+LVFUqkksFvqlHAISfZXstqjDCGdE91lLT3mFARheK4Qp
         sYnw==
X-Forwarded-Encrypted: i=1; AJvYcCXvh1ds2bKqH6jpt+wAxF0e/19bnJ4mb/8cYyBI0mxWQ7kW8IgnftOjqbiOeGCqEAwa1uQqnL2gAjKv0OI3Moc+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpmg7GV+cKbv4OgYaeFQnLEiX5sHLlT/0g3yEYshoGucAHgbyy
	aMszaVKfdVhx4QnK1vvxuV7LofvKErBtnbf4lNGNCAiv4yD6Wxc9piRKTL6EicrGMII=
X-Gm-Gg: AY/fxX6am8wcS+Hd/q4s6/Q0NPeR5i6NJuGISUK4RYB/SQ1eckPIdtCD5qjgvwsnV8a
	yVJd8/Tt/d58/mLboPlbwtGQaEA6emSPmesFS6Uz9x3He9ggTnK3v3xVmpw7QhqUIjiltqzI+78
	A9/N2/BPtwxDbvBcLZz+mMIlAADHoUOZcTlfY8dgaG/ntseHMRFGsHM0yTg39F3YRlyJhOjXVHf
	nbtkAz8eKxDTepSyhNQza2XDJnijiAFdCNNMlu5DT90HixWxogfYNiBA96Yg6vsHgQz0SQo3dGY
	mVivoMMwz4mCVVyqHtlp9jb1KC+e0FssTWn7bZF3wAHfsSJTsgA+aHPdsfEubpbGr41XFr9FABM
	H/7a3LXBGQyp8aA4aVVcJjJ2kI1tXRG1BbigzeF37ybieIhUxkG5zaGM0n2prz0k9wOwgIEO2pQ
	kn2J1YPPGwmlz7PF4TCN+cmYrt2Ts7E6A8FBBW84H5dL2JzkSitfaXujhZos5/
X-Received: by 2002:a05:6512:b1a:b0:59c:ba5a:c085 with SMTP id 2adb3069b0e04-59cba5ac2d3mr1685282e87.0.1768833090357;
        Mon, 19 Jan 2026 06:31:30 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm3407211e87.20.2026.01.19.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:31:29 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Dhruva Gole <d-gole@ti.com>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pmdomain: core: Extend statistics for domain idle states with s2idle data
Date: Mon, 19 Jan 2026 15:31:15 +0100
Message-ID: <20260119143121.161583-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119143121.161583-1-ulf.hansson@linaro.org>
References: <20260119143121.161583-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_143132_543152_EF604DA7 
X-CRM114-Status: GOOD (  16.98  )
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

To allow user space to monitor the selection of the domain idle state
during s2idle for a CPU PM domain, let's extend the debugfs support in
genpd with this information.

Suggested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 13 ++++++++++---
 include/linux/pm_domain.h |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index bf512ff0857d..bb04cb7ccdcd 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1438,6 +1438,13 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 		return;
 	} else {
 		genpd->states[genpd->state_idx].usage++;
+
+		/*
+		 * The ->system_power_down_ok() callback is currently used only
+		 * for s2idle. Use it to know when to update the usage counter.
+		 */
+		if (genpd->gov && genpd->gov->system_power_down_ok)
+			genpd->states[genpd->state_idx].usage_s2idle++;
 	}
 
 	genpd->status = GENPD_STATE_OFF;
@@ -3772,7 +3779,7 @@ static int idle_states_show(struct seq_file *s, void *data)
 	if (ret)
 		return -ERESTARTSYS;
 
-	seq_puts(s, "State  Time(ms)       Usage      Rejected   Above      Below\n");
+	seq_puts(s, "State  Time(ms)       Usage      Rejected   Above      Below      S2idle\n");
 
 	for (i = 0; i < genpd->state_count; i++) {
 		struct genpd_power_state *state = &genpd->states[i];
@@ -3790,9 +3797,9 @@ static int idle_states_show(struct seq_file *s, void *data)
 
 		snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
 		do_div(idle_time, NSEC_PER_MSEC);
-		seq_printf(s, "%-6s %-14llu %-10llu %-10llu %-10llu %llu\n",
+		seq_printf(s, "%-6s %-14llu %-10llu %-10llu %-10llu %-10llu %llu\n",
 			   state_name, idle_time, state->usage, state->rejected,
-			   state->above, state->below);
+			   state->above, state->below, state->usage_s2idle);
 	}
 
 	genpd_unlock(genpd);
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 93ba0143ca47..f6f6d494f728 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -183,6 +183,7 @@ struct genpd_power_state {
 	u64 rejected;
 	u64 above;
 	u64 below;
+	u64 usage_s2idle;
 	struct fwnode_handle *fwnode;
 	u64 idle_time;
 	void *data;
-- 
2.43.0


