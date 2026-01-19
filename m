Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D47D29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jObY0CxQBZKbycpkPqiQaIebxzWVFrjrCXXvaXSeJs8=; b=FrQLYWseByktZMNA9nxpkMjiit
	2w/Ja4G8cXhhjVsoOXttLMVmB/b6G5GyvuwbEvl48WhyfFkH9pq4paqYzBmhE+IW/zodKsRF2Z5IW
	H3bCq2i+uQgL6lVHnVYdQ4v57xGh+Ls2gJH1GbXgZxcQcSuRa0RN/QQh9dCTM3GpO6D1jP5YDCRUS
	XOg73LGTvCFj4glUx6bvyIfjOy66AalZW5/sCm0OUP06f4FktsAXXweYKCxubKdJLGRj2CvAKt4Z8
	oe0LU6c5f/39k2ZGC7IZBTHJbJkwUiVu5kJPVTK5TBDgyexNaUXxChVmYgvUcVjtz8K4BCPwsXmv7
	yP07hwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI2-00000002GSK-3l5s;
	Mon, 19 Jan 2026 14:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI2-00000002GRM-17Ae
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 14:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jObY0CxQBZKbycpkPqiQaIebxzWVFrjrCXXvaXSeJs8=; b=f+p+aXz+5GpN8NkvjLBKfW7io7
	peYsLOcOmGvpiD3fumj5H8fo6CibxdJBtIycFf+rLAd5mPPip2DZb0uQpRsce7Dc1CVXxnL9mhjKB
	inpKITQXnpGKmyuywWhLlE2T8fJepRZr55ODX4PfF2+4IFjunMhjqGrUzKBI1xhTsRSuXYYoewFSQ
	f2dvy+pDP0gVJ3eDl6xUS5w97/RiyxEzv7Mui3tFF8TBkvZ+Ogc5i+giOSI4U4T/oWar7c9a4upb4
	kscbCMu0dixV0LI0rL1Kp3G8r6AyLRSO32WH1JkoRp8bf1eySy08X4No7v6pI8c1oe23Uqea4RXQq
	Yjo/imaw==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqHz-0000000CH8e-0L1w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:31:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so4515189e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768833088; x=1769437888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jObY0CxQBZKbycpkPqiQaIebxzWVFrjrCXXvaXSeJs8=;
        b=ZaDFodnnn8Yx2XBzC6ptpwUMQ+QJyip9TlU9HLGt1F1g6faGIAG/2a/WwyuOXkxwh3
         eBk1wSqLZIrpolElifcCxOWbHn+3oLZz8agLuBN1UbkyfdC/IKNVGieWC2eiciGizDe6
         Xb0UGDW98Km6Ny+ipD9d3FRBUNE8nBUMzAYM44XNTs9iKoHT4ZypwcilHBmU6ubNvBVv
         o9luK2O6nMXOsyQzrzdNfkvvghgQ+q/sc0fygUTstU2aXWVtRI0pHM/QKB64RttWfTjv
         K8SUO+0hQIHGYLmmH/Uh5YPjD+hG3uz/Tt1L39pnJXd7Mxb6MviXsDAXswsoIhNVkAWD
         WTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833088; x=1769437888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jObY0CxQBZKbycpkPqiQaIebxzWVFrjrCXXvaXSeJs8=;
        b=lsztq2/GPFRAtZ3aiDZRxcmsYSZyX1FW2jC17IvJ4NfgJq5G68UtUih6l/4FJl/GEz
         8Nf/LvDcNpVzJwA1jTBEVI0L5/111O1IwkbY5Dj7xOx6+nPRKxByBJfrLZLs4VTSE6a4
         jImMQ1iJUiuFZ0s0UuxHDgV2s+jteiZakg1AI4/fugYp8H2K6kkAyf0wWlFZ+2Z6hjI1
         /6KTIR5cIjHT0MgmQNB+TL1CQVO4oHP4Bhv7VdEfEnZEvgvx4dol/AdqjYZ2jsqDI9vc
         +JLC0iSUw3KOTKxLZdsxS5FvwK2eSMmS4J0nYePFknto+SLUCHrXz3JEQiJmNrsNgsKu
         rVBA==
X-Forwarded-Encrypted: i=1; AJvYcCVaK57IDDSqf4qu/gsmDvo//eWUMiMMBhSSpJmWaPVVCbH303/sLO3UvtOG6MDaL6B/SMD+5tplPMrPWATNz04Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4uDuiTC3S4mxLXAUp0lxKwhQK5YFcR7z66mUNs6NclSna4Uih
	3TwhtxWNOMl456kM8NetRF9LKB61DZLZrnx/py1fzNCwp31jtqmD2YhtpvYipwQ5RHDSVcjATUQ
	HbxWK
X-Gm-Gg: AY/fxX5HwWCck5rbwoJPdwBQVEni8vFGPj6mdiSslB/0Cd+gifzU8lQ5fG7+PXJVaw9
	BpAZDGyQmPR0qUEELL8yPX07j+7paf3cNEyASsNciKFJim+Ev7ufiTQ5+ZIY/3pp0xhymBL4jcj
	KsdT4Kw7jRTZ3vqhltbYcvzAywmB+57S9gdYehw/DlwFTVkZRURyknXWsgvnE5IWT1X/a7wulqu
	GQSMs08U10GT2irjZEHRUrvjM6flSdy03o7q59ACZGa8+yFGoppgu7RA4ga440kEb0ACHAQugMf
	KouVLq4hK2ZS/rJXw4btWk6lQ6QqmYnyn2h5qOm/MbIkyP09MLtX7ENxWGz7t4R5Q6UMz/kHSX1
	3fWewYX/QTGOWti1zJHvy8UqslHQOpFcVzpajBQFAXqrvR487CvO3l+uvmgVBJq72uyXKb5jahH
	Lq0FClkHMFlBv0g12pOO72A7+3saSvbJbWPp9geGPiWlFY97MZe+uZ4aZIEeN3
X-Received: by 2002:a05:6512:b95:b0:59b:7e2b:33db with SMTP id 2adb3069b0e04-59baeef6d5bmr3309809e87.28.1768833088255;
        Mon, 19 Jan 2026 06:31:28 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm3407211e87.20.2026.01.19.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:31:27 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Dhruva Gole <d-gole@ti.com>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pmdomain: core: Restructure domain idle states data for genpd in debugfs
Date: Mon, 19 Jan 2026 15:31:13 +0100
Message-ID: <20260119143121.161583-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119143121.161583-1-ulf.hansson@linaro.org>
References: <20260119143121.161583-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_143131_210846_DC0789FC 
X-CRM114-Status: GOOD (  14.51  )
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

To prepare for additional information to be added for the domain idle
states in genpd's debugfs, let's make the existing information denser. To
allow that, let's move the static information of the domain idle states
into a separate debugfs file.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 43 ++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index bf82775f6a67..919dff2081d6 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3772,11 +3772,11 @@ static int idle_states_show(struct seq_file *s, void *data)
 	if (ret)
 		return -ERESTARTSYS;
 
-	seq_puts(s, "State          Time Spent(ms) Usage      Rejected   Above      Below\n");
+	seq_puts(s, "State  Time(ms)       Usage      Rejected   Above      Below\n");
 
 	for (i = 0; i < genpd->state_count; i++) {
 		struct genpd_power_state *state = &genpd->states[i];
-		char state_name[15];
+		char state_name[7];
 
 		idle_time += state->idle_time;
 
@@ -3788,14 +3788,36 @@ static int idle_states_show(struct seq_file *s, void *data)
 			}
 		}
 
-		if (!state->name)
-			snprintf(state_name, ARRAY_SIZE(state_name), "S%-13d", i);
-
+		snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
 		do_div(idle_time, NSEC_PER_MSEC);
-		seq_printf(s, "%-14s %-14llu %-10llu %-10llu %-10llu %llu\n",
-			   state->name ?: state_name, idle_time,
-			   state->usage, state->rejected, state->above,
-			   state->below);
+		seq_printf(s, "%-6s %-14llu %-10llu %-10llu %-10llu %llu\n",
+			   state_name, idle_time, state->usage, state->rejected,
+			   state->above, state->below);
+	}
+
+	genpd_unlock(genpd);
+	return ret;
+}
+
+static int idle_states_desc_show(struct seq_file *s, void *data)
+{
+	struct generic_pm_domain *genpd = s->private;
+	unsigned int i;
+	int ret = 0;
+
+	ret = genpd_lock_interruptible(genpd);
+	if (ret)
+		return -ERESTARTSYS;
+
+	seq_puts(s, "State  Name\n");
+
+	for (i = 0; i < genpd->state_count; i++) {
+		struct genpd_power_state *state = &genpd->states[i];
+		char state_name[7];
+
+		snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
+		seq_printf(s, "%-6s %s\n",
+			   state_name, state->name ?: "N/A");
 	}
 
 	genpd_unlock(genpd);
@@ -3891,6 +3913,7 @@ DEFINE_SHOW_ATTRIBUTE(summary);
 DEFINE_SHOW_ATTRIBUTE(status);
 DEFINE_SHOW_ATTRIBUTE(sub_domains);
 DEFINE_SHOW_ATTRIBUTE(idle_states);
+DEFINE_SHOW_ATTRIBUTE(idle_states_desc);
 DEFINE_SHOW_ATTRIBUTE(active_time);
 DEFINE_SHOW_ATTRIBUTE(total_idle_time);
 DEFINE_SHOW_ATTRIBUTE(devices);
@@ -3911,6 +3934,8 @@ static void genpd_debug_add(struct generic_pm_domain *genpd)
 			    d, genpd, &sub_domains_fops);
 	debugfs_create_file("idle_states", 0444,
 			    d, genpd, &idle_states_fops);
+	debugfs_create_file("idle_states_desc", 0444,
+			    d, genpd, &idle_states_desc_fops);
 	debugfs_create_file("active_time", 0444,
 			    d, genpd, &active_time_fops);
 	debugfs_create_file("total_idle_time", 0444,
-- 
2.43.0


