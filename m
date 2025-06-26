Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B4AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqUm180eQDox8Xlw05sxg5F58P/BrEE00f+0gmB6rO8=; b=IEC+R3kmqb8x+EHRJP1/TXZnDQ
	wZdKeMeAq8OaSRdcZDSqqYMu8g21m3pe1XYRtOODHCmdw3MAnx/2N/SHBl6KjmRRp8WAbqL3QAC++
	jLMvaGggYQa7Q0s04fPQ4CXmQEGrKGuVGxuo3sa9h0c0VoQ50V7M/P+CpsEoxkFjEMrXXLKE9RVjP
	xpMN6Ob9XDq8zgGE0R0IfIUA3ufKeWaE0YDYltc5nD6XwVVwyCkMzCQUAQndf0pluwzU7cav6xvXL
	d4yJPLSKUCX8ddc5aQIDr0ULhM0DgmfPQeluGgi9iMUVtZ0OTIaJZKO24W6rVoAhbqk4ah/ogsbMw
	vzq0Ng+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwOE-0000000D6b6-00cv;
	Thu, 26 Jun 2025 23:52:22 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUud7-0000000CtL2-3CBb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 21:59:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1707950a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975177; x=1751579977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqUm180eQDox8Xlw05sxg5F58P/BrEE00f+0gmB6rO8=;
        b=RXA07lMqSm7hHGOVHg60IAyu9tH55jVDzeKoBRtc0s5iRuNeR4RA2WOYoc8Dl9oqrt
         hjemczRhi767l8sKM6w5FpUrspvH4MUuwtEqxaMVDshXzbov/oNZNL0+Z2zD4kgOxTQA
         c4jinvv3TRRXpAelPgpU+ejP0srlLUsBUm0zNcYLBnYl3eAU3n61zrcTbnS3ffGQ/JwR
         P4He5sXiiRM6w2hfKBi9G18cLwmxCB3ALlBVledZuSiyTCcOGyw2UP+JW/EgonVZu5Ol
         seh2xssYaNDd6xeUXFdR+fHjPZzSCuFXi8Fe5MXQ6E04LiqGZpCDnAK1o4baOmuVhzoj
         f64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975177; x=1751579977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqUm180eQDox8Xlw05sxg5F58P/BrEE00f+0gmB6rO8=;
        b=ojjBkxqqLRkDrhRU+J1SLCsrpOeSXesXYY2gZWEULEdA//49NlZa+iE0Ucg8MeEPFb
         94dRaudNjQB1JL61DcfCxR+K0NmQb2EsLr5pf2hdIiC0TEV09pPh7RrfGwOb+cJzeKFn
         VGLei9cpJUAN8HM4iAnUdirID8ACqLI9OJPezqsivB3NCFOfgyy354U0Mdd2oU+mcS7Z
         j7m0oq3c/vCBYtL132qqThrgkIu8XJXC7seUGauo3bus+7wSwbVjSU2tgTAh4y7XVpaA
         M7rYJ5gTOQJMlxdX3ugkWEK1i1sy1d5F7bfWipHvbU3jiZoHWlNi/Uffoz1c0lSa3tts
         84Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWHMojL8tvsYJ6g9DblhLCZJ6oDrAD64RMfDK6QFu2TRt+qEshUOxSYlKaMWcGY7PzMdDFxtN35U9mHD1YG7/eP@lists.infradead.org
X-Gm-Message-State: AOJu0YyJRvY7yc8R6/f7gpBHrQrMf7wl+CrBRxgCq8jGU99prZ8BLff/
	4vj64UgEVzlOv7beRfaNYJSGA8GDlAsg9mNZb6jlsi8weYy5Z0b3/UrE
X-Gm-Gg: ASbGnctc+w/81bSeZHqbuIwp1b03/6kJCOUoCKl95/0VYNNokEHLzmc0do4YlQeVCLs
	ptzp6zzBi6USSyyE3McQFb4BxVIZsGuHj9VJzsyXWuhaHkOfm+IjJ03bL40JNPgT5GWbTCm8m/J
	LJoIxKdIMETaEYM2a7YrJ6ekmEBgVowEdZmeRBmsGiLN4oh4DFNilzsPbRMOrtBAqS7G341XFDu
	JZGEBHBqnaLZei5XKojRE+XhmvCh2JiRo/0uC4pjMhDvsrjsKVP+1M5bOZc93tmhdoaTo8GFUlQ
	YKynlCqyao4R2v3Bdz/wk5btfJerIvQLI2Vb8cF6OXFKENcspP5w6gdGHQwISReMbwQ7b9U7jSl
	VHnU=
X-Google-Smtp-Source: AGHT+IEj6BGM+Mz3MmkFvPoHUKb7LLDLDubf4oTZNcLqHe+6ea1uskvJ137D58tQnmG8MNIGyCBZFg==
X-Received: by 2002:a17:90b:1643:b0:311:abba:53d2 with SMTP id 98e67ed59e1d1-318c92ec11amr909084a91.17.1750975176799;
        Thu, 26 Jun 2025 14:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:36 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v6 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Date: Thu, 26 Jun 2025 18:59:09 -0300
Message-Id: <20250626215911.5992-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_145937_800656_65138D23 
X-CRM114-Status: GOOD (  17.10  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

This helper function returns the current power status of a given generic
power domain.

As example, remoteproc/imx_rproc.c can now use this function to check
the power status of the remote core to properly set "attached" or
"offline" modes.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v5 -> v6:
- Added Bjorn reviewed-by.
v4 -> v5:
- s/dev_pm_genpd_is_on/dev_pm_genpd_is_on()/ in function description.
- Updated function description to be explicit the function reflects the
  current power status and that this might change after the function
  returns, especially if the genpd is shared.

v3 -> v4:
- New patch.
---
 drivers/pmdomain/core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  6 ++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ff5c7f2b69ce..2f387e15cb75 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -758,6 +758,39 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
 
+/**
+ * dev_pm_genpd_is_on() - Get device's current power domain status
+ *
+ * @dev: Device to get the current power status
+ *
+ * This function checks whether the generic power domain associated with the
+ * given device is on or not by verifying if genpd_status_on equals
+ * GENPD_STATE_ON.
+ *
+ * Note: this function returns the power status of the genpd at the time of the
+ * call. The power status may change after due to activity from other devices
+ * sharing the same genpd. Therefore, this information should not be relied for
+ * long-term decisions about the device power state.
+ *
+ * Return: 'true' if the device's power domain is on, 'false' otherwise.
+ */
+bool dev_pm_genpd_is_on(struct device *dev)
+{
+	struct generic_pm_domain *genpd;
+	bool is_on;
+
+	genpd = dev_to_genpd_safe(dev);
+	if (!genpd)
+		return false;
+
+	genpd_lock(genpd);
+	is_on = genpd_status_on(genpd);
+	genpd_unlock(genpd);
+
+	return is_on;
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
+
 /**
  * pm_genpd_inc_rejected() - Adjust the rejected/usage counts for an idle-state.
  *
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..c12580b6579b 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -301,6 +301,7 @@ void dev_pm_genpd_synced_poweroff(struct device *dev);
 int dev_pm_genpd_set_hwmode(struct device *dev, bool enable);
 bool dev_pm_genpd_get_hwmode(struct device *dev);
 int dev_pm_genpd_rpm_always_on(struct device *dev, bool on);
+bool dev_pm_genpd_is_on(struct device *dev);
 
 extern struct dev_power_governor simple_qos_governor;
 extern struct dev_power_governor pm_domain_always_on_gov;
@@ -393,6 +394,11 @@ static inline int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 	return -EOPNOTSUPP;
 }
 
+static inline bool dev_pm_genpd_is_on(struct device *dev)
+{
+	return false;
+}
+
 #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
 #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
 #endif
-- 
2.39.5


