Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50CAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do+WrCyUk54RUggZsmiUqY5/C6vOQx+Ug7MOVtvuvcQ=; b=PYj9rSs/aDexT5vNeFQcTVlfmg
	yKFLEas2IpD2DxNkq24J+f3mixSOPhSiKtVSpU/lZitpHu1aoNHDZ420euTu2gf145OucUqhz+bRu
	V2GCSodvYLoNV/QDKLpCKiTz0NQNa0VpJE2TvsspILy12rO+yqo7tXuw03Gva6xLwtspIsvZhDVOM
	cuibnf0etLdAVfnIeiNdb1zEam6FsmuBLA/5ydziOiQ7kFEFHCyxQNdg8VP+mS3C3fC2ExhZu1O5k
	mBmPFbzxMyrR9i5jwEBGUuczXgvrbQdxOQCiESGYdi1boYBlIlglo46lwQ1KbyfdF9CC3OkS4ME2l
	UfChKEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvsj-00000000WMw-2cCb;
	Sun, 29 Jun 2025 17:31:57 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvma-00000000Vad-2rSd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 17:25:37 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a43d2d5569so19845151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217936; x=1751822736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=do+WrCyUk54RUggZsmiUqY5/C6vOQx+Ug7MOVtvuvcQ=;
        b=lJMJsmi5G9i2CAR0jkX8G2X1lIfTG/oZnyNSGn974i6g+t/a8Y1jqe4Gg+8F/QC/4D
         4BKCb8eJ4cQ7YKtpU482rr8e5TcYQ4OEoxTGZJudRd1QMG/q34LJEfWJE4uixMLI45u+
         b7aqZY6FYt5asPI45Bevvleg/ONA7gvT1oU1vwRMiGK9wzsiKZOoMZxjatVk7Fg/Hw9m
         2AWhswFQoF7V6H1FsRdmzUZfbvusWpcnLeGvZToW/BQk8egOb+uraAcEd70P+q8LIjvc
         Zjt07sdt6jNYneRGXTpxiu8qjrgMXhhBpG0mfFnjvCjDrSROlFThSuMxw/QEwqcN5PdQ
         qAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217936; x=1751822736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=do+WrCyUk54RUggZsmiUqY5/C6vOQx+Ug7MOVtvuvcQ=;
        b=XLqDQMKT4WjegqSTHi4hkDeOk2V45BgvCUwXgG9wZGq3S2ev4spcdsryK0p23lRx6R
         4aHOoudnNVGH0TnUQUAZ5YEQg74PL8mSlFHbuKVYxHVr/thUfCvq6pmQebynIZrbhFZB
         0Pl0Dd0KI55ZGLLs8CXUUSP7JP4+foYhOSX42AOqwt9B7pPMCcupAk09SxirWJqPgf3h
         JmFrrSbIsf/VkWG25d4pYmNMeZEL6Yp1ueA4jDBfeGPln+9cY/EX56yCHL6VffUhWwL6
         uCiDiJInCiZnDqDm92eqf+S/LF1kxgCiEyZLsu8O2WyAI6s5p+PC2yOwLbc8cfl/esxZ
         hbug==
X-Forwarded-Encrypted: i=1; AJvYcCWL2Jk9tgbjrZ4JQ6kCU7XhA5LiPO8RreRr8EXksfzM82PjpUtp+pxnYIokqjHFx19JxVeP2+SisH9+j24SggV4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy5ERg1wnmUWbEyCrpd3Mz/IVkrYcFl10IppDjz2t+eyvWxUPf
	s56GPBYF0SzZDgIQtckDTuBCn2LtP0iyGhvWgvfwAxO/zfcgE3nrNmZg
X-Gm-Gg: ASbGnctzZyZPDt6M85lDVvtJf/JuEaZNlQVWZh4ElRr9fq+aRkAcACaze5FeUNvhwq1
	1Zv6pk2wJNNDJQABQap9mquS7qw2y7GcqHvLr/UnIPdYJYNMwrhL2DpNTa6L83SMFy+unnBYcRN
	cLK4iD89e03kqJTBounIakXJ8oScIU7/wvdVhngg49U435PbxxsrBVqgdshTUv3AVhDxiyMxu/C
	yv5P+UzIHaOMCZw6ZPLDmrAMSuoEPeQXN0GbdKPVmQTC7EAsY1mUi/4dNon2JAAEbzbxwPDbge/
	g26j2D5eRjDTTXMO3pycQNa09IG4x5Ej58maod+1YSR8eUZ1XbauP4cxGACvSptn+TRXnqZEFMj
	9KY4=
X-Google-Smtp-Source: AGHT+IEtbacLnJPOYdFPR4Qbf+3fCv4tbuGcOhmfcatWVey4R8ndXu0J2Fw9Zxydr+PjYKNsz5WN+A==
X-Received: by 2002:ac8:7c4c:0:b0:4a5:98ad:5640 with SMTP id d75a77b69052e-4a7fca4e44cmr189456211cf.23.1751217935798;
        Sun, 29 Jun 2025 10:25:35 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:35 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v7 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Date: Sun, 29 Jun 2025 14:25:10 -0300
Message-Id: <20250629172512.14857-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_102536_721215_79CC3692 
X-CRM114-Status: GOOD (  17.13  )
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v6 -> v7:
- Added Peng reviewed-by.
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


