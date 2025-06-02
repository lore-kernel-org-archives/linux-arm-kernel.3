Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA35C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ6sDs0ap5mby7PucN1jBOGKcXROdaugyvIe6KS1zRU=; b=wmsxsuKvpZr7mmM9yAtFyyh+nB
	H6qyn4Oz0CDBYZd1EJJZhHs/sacr2lExeAv9+RB++wOk06zWlp/5LlblwzK/9o5sU+TqXNd7qBtJh
	abj1qKxi4BMRgPE/ZuwE20g72LSamFhIShwacUTErIlzWSorIWTbMno82cwrHMoRI0LUHj03K8KBq
	rnDrGTqHTolh5Q238K+MAjD0iVd5a2xfUKFLG8F0yWwm38kXNYIIJx89V+mp/I5B+C2qijhj1m3Ss
	XvIfWa6scE28QcFC+wGYm32St0VnkWbitQppd/nXH6hzNPtTOa548lDetLwchYvkngEwSHCSNSNZ/
	qLV11rdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM59H-00000007SPe-2GIL;
	Mon, 02 Jun 2025 13:24:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM54y-00000007RuA-2sYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:19:53 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30e5430ed0bso4338815a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870392; x=1749475192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ6sDs0ap5mby7PucN1jBOGKcXROdaugyvIe6KS1zRU=;
        b=FDvI2gY7NnJsgkIueAXAEUmwjmNMUO+5aqMc2l8bBzy1UvJ56YpMibPqj+Spd8D0Ez
         wJlkWCd4K61DwWzpE7IqU/d0QkMojCr51TLLjc+o5JO1PfxUJhOf+l9eTf/7qdPBDi9R
         faZd5SjLVcegjebP8kEHidRASRgrtJQoboNxtvwikSRc70gwYfcp6kOb4Z6m+xMMGxNp
         qClMCaoqz0UGwT5KoLFa69Aw+14qGV8iH9fwxOlizWaME78op2YkkqeDrnKY6mPRPZDe
         NkMIWvaezEQP0kneZcBKmvX8sM/aovZcxMnwxJ9kT4Hv+IUYMeFB8ZsNE1fBRVmOLWDO
         6q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870392; x=1749475192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ6sDs0ap5mby7PucN1jBOGKcXROdaugyvIe6KS1zRU=;
        b=h7gvjqnDHC7KdIsM3dNZE0+eKF3WDIxpQlHyLyOabjppUC0pyyB60/MjyoQxxWsztQ
         9158+Umc0MLwHoj+7aGFQtOaE8ZOnljTGsFpHSQCKQQPni7PZVEDIZhr0axVBZsXA2Hj
         t8Eaq8WI0v0oatTdNnZ6QahgPQo9fBtfi9HSFR9bEmHwwPdCtIUI88j0znh/YfAWoEn4
         wcsBsCFj8l4GnzVQfgf6fcazyzQDwdzSwWbiZI2+h5F1BDT7WdZT8EjW3ryj+ciu7OdI
         NeJBsD5HnNkpSk1w80oqxA42PdW0uGBPt82Y5KBpv0Z1Fube03iUeUP2Di1eWjatUJ5a
         WLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzm6nPRqyaMhcS0dzRxIpihEupKhJ1RG6zPmOTgUpGuJ81dvXwWXfXclNeU6fgIY4Tj55yLzMBpxFOpfSQyiJY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8I5sIrFtEnzywhncB/vqEsPRnCWNhrVsW2bdDGlTJepqOz+9t
	KiGEAC9pFUy3j6Q3rMJmYB9N88FI75o5zIyQT9gjvD/iZuXBw6+rqHsH
X-Gm-Gg: ASbGncs3x5QQxkk+YwJNT/Ty2bAZeu8+2xkCBZJIq+Hmb8RQNB7zs+NAHmJunVXv/Rt
	XrCoQkkaKmd/rAu3HbGtK52wRkSy8Y1C04Fs3l9Pkb9upl9CuoHFw1eDOZQ8r55UjpbJ7VZkEAe
	2sduGoStzEj2+ln1s/fEuPDK5iPskpO1k/3Qqehdxw1O+enr5kt3AwhOU56O2OkGLCpDIf/kJ9A
	zqMNNxG5xkPYU8nkv/UyDUpVwNZmtWg3GKJ5qblUjofxQUJ720EGQPegpT2naq3VmiCfWa3jDhJ
	Q1Q2vJfogiJVXLYMRxAYX1pYWI8GSy9NRb0XimCmsNmILCSJ/cX5alxuaT+9IIRqXeyaE0GlOgq
	/QPPSAFcM
X-Google-Smtp-Source: AGHT+IErgHS5snsVnZ//qcUNKvfllIsynXPhb7js8d1BuZtiwj0gMVWZpcbDBi6UEa1UGSsp0FKEfg==
X-Received: by 2002:a17:90b:268f:b0:311:a314:c2d9 with SMTP id 98e67ed59e1d1-31250357f1bmr19303166a91.9.1748870391611;
        Mon, 02 Jun 2025 06:19:51 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:19:50 -0700 (PDT)
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
Subject: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
Date: Mon,  2 Jun 2025 10:19:03 -0300
Message-Id: <20250602131906.25751-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_061952_731677_7EF941CB 
X-CRM114-Status: GOOD (  12.56  )
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
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v4: New patch.
---
 drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
 include/linux/pm_domain.h |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ff5c7f2b69ce..bcb74d10960c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
 
+/**
+ * dev_pm_genpd_is_on - Get device's power status
+ *
+ * @dev: Device to get the current power status
+ *
+ * This function checks whether the generic power domain is on or not by
+ * verifying if genpd_status_on equals GENPD_STATE_ON.
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


