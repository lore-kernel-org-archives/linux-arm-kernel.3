Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B446CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylvE7Edllpe4hKT/WEebW1EKotcR3e4yYuI/L6NTjw8=; b=E/B8Hekp3g7NC/jJ/AySCZsIXh
	WbJNThmOFaGlF+/5QCTsC3SQqHmIldgMNZWV3ZVA/kRdmtp2UQQao5cW3pCgve9L3UdYPFfrnM2c7
	fb+AaHFixGUgzLefjX8sgEgt0EVc7vqXY1pAbOCU81e7zNgEoNJ932xGtNxOtDKewkG3iHeTcGZDR
	XnpF5Ub96vWOOFjab/Thmmh785tx2ewuuI/iavLng9XMXCrJKyXRZge35GJevkfMVww9+meocNXHA
	wcIZcKLNWIG5mAcf4Ej7ns8AjNd9LgaHa/ijHzpdG+bl+xUhkbDHfwMm9ybsFk2THyqmhyUsQK0QB
	r5/oFvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vx-00000008nrb-3sYu;
	Tue, 09 Sep 2025 17:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGC-00000006d76-0KQe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ylvE7Edllpe4hKT/WEebW1EKotcR3e4yYuI/L6NTjw8=; b=JZZ6ae7FoWTFO21Z3TuMWdToA/
	N+iO0cT6p1pYntHjHp5ng4hfRUC2cLmhFldeX1yU/aI999vFYgp80ZxSDeq78Cv5E/69isKWhn7Nu
	eJGwWtELv9zs4rpAAC+mrHYsK5uMn1VgvpFgVsl4kP0/gGL20CDiIWxIaSGchN0Mx2jJAW5d+cVfZ
	+ZXdiTdlqOj5I8OJWYHRPPvjWwI3bwo0zBo7VHnjhhRV+1oxqP0KpVLQZWjI4nKvszh0P1zlhKiVJ
	R9zqes0ZAiMrphL9g5wMhx+hhWlx82cDaN6ctk3TRJRICQisE1VGTrhL99rRWp/S7K1c9HC3E1yN2
	JvoAJrzg==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwG9-00000005IU1-0RHS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:11:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55f6f434c96so5194850e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416295; x=1758021095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylvE7Edllpe4hKT/WEebW1EKotcR3e4yYuI/L6NTjw8=;
        b=Qvx21jcioLUzNzi/pM3YQLLYju6HiAhx7SVzqSpF6LG2n9gP4WCXDr/NXkZWdcg/P8
         UlYHSgpR0o+HRwqnJSQgqPfpxn2nRiI8jQbxrGKn/9ugH/WfDczVOe0S7c4Nphjc6NKE
         dS0PunI7fIxWKREp1stfPCOl2w1o2wVJAVPuLm/kJZXLcg6SvUo2BS9LR8ous/zXzq76
         prqGzrroh0lyW/fyIPY6r/UydWDn4Kbuu75o/peJ7BYgxmk/KOvCu9rh3GsqaHgDeQK5
         nRTRZfpz7Yc0KmiN9aZ26VkkhFCp+iceArLHwTeJBBe0SsZKsw+yLBsje/9uIIQxqGTR
         twhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416295; x=1758021095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylvE7Edllpe4hKT/WEebW1EKotcR3e4yYuI/L6NTjw8=;
        b=n/XxW24899kkXlrIPh/ZloZePeHiTYYrobRykXp1VBuw2EpNAA6bvE4+LqaH4eIqYr
         iqlojS/ZXqXBtR5RUs9Ylc2meQqOy4Gayhyi+4vpuRyMP1glu/8gGTDhHiaDGcLM1xJ8
         /YDYbxZnHl/iqfGl95u4YLwawSCFRWG9vhmhwIRYzmSTnfZoZBiyMVSY5i0kqnHDpuat
         8qzjXOr/Y2vdRL+qLuYJYSqcQiFZhnxL2s1Y484pcvYRMGP53H/N5lH6Xs21xjVXlF1R
         DqV5l6Okauk54N0S41iEJRmxh4FT+FKcsgnfLloDUZg/mSxbxeetIj3Kt909g8QdW9sF
         bJFA==
X-Forwarded-Encrypted: i=1; AJvYcCUKVhPiHB2j7LLWwd6wmiSjXgvb6k7+kUu7XYVKSb7bjYbX/bcjLU7zpiVVCcSYLC8OIMmnr3zzUeqfWuidyTUp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0FTiR031q8uU1KuoSc71WA2dr+J7b9RbY1Kp/BR0KKJFpEuu9
	cmT/ho71h8M/6WxGRlif2Djha5wvCPhOJDCGKID3MHNYbmzUjKwY231B4a8PhoPN+To=
X-Gm-Gg: ASbGncsoceoD6U95aa77eOLP3gWZ6mKrhIzn1773HxjIxf98TOI1QOd3npUopnY/NPq
	ddVYTfXfy8dGsj9pDvhWvZJvlIrLi8mM8iwDbIKLXd0SGJ/mRzZEMIyoSl6ipHsAyMO5oyT5iEE
	uPaN9iqXzWOqRZpWkz1KhuAlYPQZ1IdEvWpkc/wHRneXsdVW/T6AUjdMWGyYSqegUU2fHBXQPvR
	ClUSGFTjUk575/DWwoIJ7OCq2gOqTzbX9K8WBWkMPQ6YUXRkI1z2JfKXXsFObUgmYXCP4QFuj1W
	zl4YV5aTvQcSGfVnt45BCqVlwOCNf9YYRheOXyx8sRKODoKeJHiFWKFBFH+mbBeletupdwQSKwp
	fHhLvoXZv9ZMwKB9Myt9fFGHsvkIURuKezkVMDktp7gbnU5wxfSqr5uwFmzf8YaPHUuj6J1ru
X-Google-Smtp-Source: AGHT+IF4O1xigAj0FDirxpcdFMfAw0PezfxnC2jHlhfrcwTgbFgAxA7QwQSCR2UAHH35xR2kprU3qA==
X-Received: by 2002:a05:6512:3c98:b0:560:84bf:7bc with SMTP id 2adb3069b0e04-56263c9897fmr3225878e87.56.1757416295035;
        Tue, 09 Sep 2025 04:11:35 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f8040sm445440e87.148.2025.09.09.04.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:11:34 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-pm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] pmdomain: core: Restore behaviour for disabling unused PM domains
Date: Tue,  9 Sep 2025 13:11:20 +0200
Message-ID: <20250909111130.132976-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909111130.132976-1-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_121137_239493_C31A8AF7 
X-CRM114-Status: GOOD (  18.01  )
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

Recent changes to genpd prevents those PM domains being powered-on during
initialization from being powered-off during the boot sequence. Based upon
whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relies
on the sync_state mechanism or the genpd_power_off_unused() (which is a
late_initcall_sync), to understand when it's okay to allow these PM domains
to be powered-off.

This new behaviour in genpd has lead to problems on different platforms.
Let's therefore restore the behavior of genpd_power_off_unused().
Moreover, let's introduce GENPD_FLAG_NO_STAY_ON, to allow genpd OF
providers to opt-out from the new behaviour.

Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9daeb00@collabora.com/
Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 20 ++++++++++++++------
 include/linux/pm_domain.h |  7 +++++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 0006ab3d0789..61c2277c9ce3 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -187,6 +187,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_opp_table_fw(genpd)	(genpd->flags & GENPD_FLAG_OPP_TABLE_FW)
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
+#define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -1357,7 +1358,6 @@ static int genpd_runtime_resume(struct device *dev)
 	return ret;
 }
 
-#ifndef CONFIG_PM_GENERIC_DOMAINS_OF
 static bool pd_ignore_unused;
 static int __init pd_ignore_unused_setup(char *__unused)
 {
@@ -1382,9 +1382,6 @@ static int __init genpd_power_off_unused(void)
 	mutex_lock(&gpd_list_lock);
 
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
-		genpd_lock(genpd);
-		genpd->stay_on = false;
-		genpd_unlock(genpd);
 		genpd_queue_power_off_work(genpd);
 	}
 
@@ -1393,7 +1390,6 @@ static int __init genpd_power_off_unused(void)
 	return 0;
 }
 late_initcall_sync(genpd_power_off_unused);
-#endif
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -2367,6 +2363,18 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
 	}
 }
 
+#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
+{
+	genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
+}
+#else
+static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
+{
+	genpd->stay_on = false;
+}
+#endif
+
 /**
  * pm_genpd_init - Initialize a generic I/O PM domain object.
  * @genpd: PM domain object to initialize.
@@ -2392,7 +2400,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
-	genpd->stay_on = !is_off;
+	genpd_set_stay_on(genpd, is_off);
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index c84edf217819..f67a2cb7d781 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -115,6 +115,12 @@ struct dev_pm_domain_list {
  *				genpd provider specific way, likely through a
  *				parent device node. This flag makes genpd to
  *				skip its internal support for this.
+ *
+ * GENPD_FLAG_NO_STAY_ON:	For genpd OF providers a powered-on PM domain at
+ *				initialization is prevented from being
+ *				powered-off until the ->sync_state() callback is
+ *				invoked. This flag informs genpd to allow a
+ *				power-off without waiting for ->sync_state().
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -126,6 +132,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_OPP_TABLE_FW	 (1U << 7)
 #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
 #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
+#define GENPD_FLAG_NO_STAY_ON	 (1U << 10)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0


