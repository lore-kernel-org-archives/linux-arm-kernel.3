Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A92CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxXrWuszmkPt9+jWh/jp7RjsQBBCWLjTzHixGfM6EZE=; b=tE1YuNfpJ9vJVwifOQJquOtHHL
	LzebJ69jvuTxGHifIHuuBuY0aWAjUjS9YRCROkFTCMOHE31hSpIjOsSnLt+H2haWuKD/dD8DTR8yn
	UyYmiwgCZvhKbTg3qyjBzTQS03bnVs3QskOQfjaCGiEiT/PQ0MJpE55pQ3oJb7FJytaSmLwSymzfp
	ejVbv34P9vygOSI0I04uaKMjlSKZiNCA1fhPSl/1kPcs/Lq7WrHfyNiwQI4fI6PiqxPwj4PTPLIQN
	l9rLU9vrSgrpZl53cPYjj3lPjHrjc3AbM7+5qNqx8qmvsjPUNQt5ANRalHkUMfQ3N76oiplrcckV6
	Em06Q7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1wi-0000000DmPo-0AqC;
	Fri, 14 Mar 2025 10:07:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1qz-0000000Dl2O-1Ius
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:01:22 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-549963b5551so1880883e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946479; x=1742551279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxXrWuszmkPt9+jWh/jp7RjsQBBCWLjTzHixGfM6EZE=;
        b=dWowXyth6zRH15jIsSaE48cvumegICj4UjhDaIlwvPBF5dDCf40S50tYfTqDYxZzLz
         HS2QGLcp1tBXpgu1dH7ITo1mFu8PlPSqCb1qlE/txf9n18EZBUsW0ozsSStIBRQtP8ua
         /PtNNPMNnwdbITXiVuUtNCTjMEUl6XicWLMmWuFjY5pfivbAiGBZ37KvK3MSIhKIuN/A
         F37hU4fFRE7dl+cpmCGWRrsOR16iNzVim8xtAlQmwikISMIEtEYY2dFn5XBSUJxJBHZl
         oJ6IWdxJcqPh84o0NjdhwYQAe5UgXxwR0fDnO9WrHnqaCf0ZtBERVlQxGovoKaFZ4CVp
         1oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946479; x=1742551279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxXrWuszmkPt9+jWh/jp7RjsQBBCWLjTzHixGfM6EZE=;
        b=jPjz+2gXFBElfOCMpx9aAU+1eg/eDMc2a5kqhjL3wHa3CjhLgq94E3lFFldvvON5yc
         n76xXCgMFrc1yLFax8spPM57hLX1/u/ETKe/OEPV/Vv0EwERb7XIMnmB/IAJSv0MHV4d
         W8pInnTn9gaJ9Q6FUmXUpE4Nw1xKcdkd9esZuN6FYRn0t51YWYoxLRS2qQiS+xiiFM8l
         Op73X7qgF+A1Hs18DOAPXXJy1KKRFsujwlqNhDhlxfmac4zgoH1WIV8Zj6YdP4E5PCW5
         5nngVGFtEkbOHFkNnwAWx6RepsHvUhLMqNWMoYiLM3RJy9GMjpogYwmomWenUhkIyYE1
         1f/g==
X-Forwarded-Encrypted: i=1; AJvYcCVvhjiW/f18aN4M63sSaJFfpJIGypLToPbee9vrqASoHSWJnYainm+tQxPcjVP5dtU5eY0oZEnfOxn6Tc1urgs1@lists.infradead.org
X-Gm-Message-State: AOJu0YwmNL45eB+w4ncSQr5WzJFDhZymaJpsMk1F7vqDcZW+43qbClQ+
	Tz45q/nSM+eGNED4+NfAq5VXcWd5sVfqgsHfot304nk37UkPyRf3kiKtT0HACA0=
X-Gm-Gg: ASbGncsEkpyUO6uO9pteAOs87NBJbYH50bFAGe2dQ/fExTi/k67PtcHRDoKEcuFyA0c
	EVLhCHFbZzRS6mQn0rSaNnzsYR8BMzwZVL7cbOJ6To37IX4rZPSR+OePmTnI8FxCe+VpEXBnLhZ
	aN2y2K1ZJJJ8+JpxFvyV4Z6SYpZs0jL24omWog0GqZK8sqD5ANPhQMIWxItZ6L2GzV0Bsp/huzY
	gGNs4JOabRRML+x/AqMfCLKApyriesEldALbW/5k8/r2eQESdhHtpYy00mRi5va9MqUqvR9Oe6b
	/5PUO9whzKuhO9e7jKpPbGaiSXHRmUaxuqbPpv6wqktUb+cLTnnGKpvNdF/J30+FjTik1hpn4Sa
	JxcVDt/++VKEo5PtIYcvacXzRTRn10w==
X-Google-Smtp-Source: AGHT+IGI4U+6gFVGvMxY7c2ZChVVcSTAYz3qWc9D46+/1FYmNXR+U/zCzRxHxW++97VulyB6QhEBRA==
X-Received: by 2002:a05:6512:238d:b0:549:8d8d:2c62 with SMTP id 2adb3069b0e04-549c396e3d9mr653362e87.36.1741946479167;
        Fri, 14 Mar 2025 03:01:19 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea468sm5168221fa.41.2025.03.14.03.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:01:18 -0700 (PDT)
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
Subject: [PATCH 1/4] pmdomain: core: Add genpd helper to correct the usage/rejected counters
Date: Fri, 14 Mar 2025 11:00:55 +0100
Message-ID: <20250314100103.1294715-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314100103.1294715-1-ulf.hansson@linaro.org>
References: <20250314100103.1294715-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030121_350486_07DE538D 
X-CRM114-Status: GOOD (  15.17  )
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

In the cpuidle-psci-domain case the ->power_off() callback is usually
returning zero to indicate success. This is because the actual call to the
PSCI FW to enter the selected domain-idlestate, needs to be done after the
->power_off() callback has returned.

When the call to the PSCI FW fails, this leads to receiving an incorrect
tracking of the usage/rejected counts for the selected domain-idlestate.
In other words, the presented debug-statistics for genpd may look better
than what the actually are.

To allow a better correctness of the data, let's add a new genpd helper
function, which enables the caller adjust the usage/rejected counters for a
domain-idlestate, in cases of errors during power-off.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 25 +++++++++++++++++++++++++
 include/linux/pm_domain.h |  6 ++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9b2f28b34bb5..c79ef6e3ab85 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -728,6 +728,31 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
 
+/**
+ * pm_genpd_inc_rejected() - Adjust the rejected/usage counts for an idle-state.
+ *
+ * @genpd: The PM domain the idle-state belongs to.
+ * @state_idx: The index of the idle-state that failed.
+ *
+ * In some special cases the ->power_off() callback is asynchronously powering
+ * off the PM domain, leading to that it may return zero to indicate success,
+ * even though the actual power-off could fail. To account for this correctly in
+ * the rejected/usage counts for the idle-state statistics, users can call this
+ * function to adjust the values.
+ *
+ * It is assumed that the users guarantee that the genpd doesn't get removed
+ * while this routine is getting called.
+ */
+void pm_genpd_inc_rejected(struct generic_pm_domain *genpd,
+			   unsigned int state_idx)
+{
+	genpd_lock(genpd);
+	genpd->states[genpd->state_idx].rejected++;
+	genpd->states[genpd->state_idx].usage--;
+	genpd_unlock(genpd);
+}
+EXPORT_SYMBOL_GPL(pm_genpd_inc_rejected);
+
 static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 {
 	unsigned int state_idx = genpd->state_idx;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index d56a78af4af1..6e808aeecbcb 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -285,6 +285,8 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
 int pm_genpd_init(struct generic_pm_domain *genpd,
 		  struct dev_power_governor *gov, bool is_off);
 int pm_genpd_remove(struct generic_pm_domain *genpd);
+void pm_genpd_inc_rejected(struct generic_pm_domain *genpd,
+			   unsigned int state_idx);
 struct device *dev_to_genpd_dev(struct device *dev);
 int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state);
 int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
@@ -336,6 +338,10 @@ static inline int pm_genpd_remove(struct generic_pm_domain *genpd)
 	return -EOPNOTSUPP;
 }
 
+static inline void pm_genpd_inc_rejected(struct generic_pm_domain *genpd,
+					 unsigned int state_idx)
+{ }
+
 static inline struct device *dev_to_genpd_dev(struct device *dev)
 {
 	return ERR_PTR(-EOPNOTSUPP);
-- 
2.43.0


