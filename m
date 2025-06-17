Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+Jp9u/wRva4rrnrWzobzjZRnSw87IvFwB/n0IWH6u8=; b=K/mv/CkWjHy6gNEXzbCJl+ppAI
	5GzsFwz+522m9U2QI6ocnkVOBkt2x9w3Yb7+3PgtrWXcS96OzkYuXLEFNbeHNBRglgom4pH8KXFf+
	QcxIRS0l+RZxf/TjnukoAcQtq0xVd8+5E8h9ufbF69yTbijB6In4Z/WcR8E1+ez7q0jqQ2iUv0xk5
	oIHD3G9QHH8/YZWc6KOT7lZHBZHvKNsnQWr1ObMdqINJST0YKJkpZ+8AQ5lo6CUaRY0AumzOzQMF/
	g3L6gHg92GEAtHPJqy+njabMRQhfokjrjnp21xslFvc+44ucE79PxOdCQMh0HcEDh2CgCLtOxUpvp
	p3BG+aGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcAa-00000008Gcg-1h85;
	Tue, 17 Jun 2025 19:40:32 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRc6G-00000008GBC-2CYP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 19:36:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7489addd403so2368066b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188964; x=1750793764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+Jp9u/wRva4rrnrWzobzjZRnSw87IvFwB/n0IWH6u8=;
        b=dBBpnXkyA+JIdEyw4VpNwYKTuftmRoZCMYgBvz6Ghsp3nlJgZCux2z55PCzJxswC/d
         xEmws+74CAJRzycVpaMoPz9bYS676yB5DPv/plaTtnol/Z6lS0sf7/pNlCQ5/NN3godF
         PSvrqHP9HElAMiZVlOSApar5CwCZstfatXFnU1h6WnbkLge4VQ7tCdSHugbWKbUto2eO
         +aSFjSRx5eqvgT1sbyKPSfj8IVEzS8ELoJYVmQ/Nz8xw/SHFcR4rW9zVnpAxpImVUSOd
         KDm+s0vWv5JP7sWHUdW6GFJb/fDFOzs1YcUJ05hg0w+dY348Pul/nqsxWwvi813zCoQ4
         dXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188964; x=1750793764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+Jp9u/wRva4rrnrWzobzjZRnSw87IvFwB/n0IWH6u8=;
        b=mxZIOy5BgJiQhdDo6oOvHNrMcL06LgMy1ufNFVZnhOMAZvHT8hUGi17tFiBdsIlkVI
         pkfnpxUWS8D2awfayhxSXezFP2ukhyOtHkxnRyjvxRjX2lB4HbZN3exSIH3o6yHsUATo
         l5LRYSpX1hsAl1giigsPqTfnesEbrS2vgyyDeGOT3xPrrpoSEbsyAF7BHq94Wg04O87n
         wJsfL8oVdlg+IuBeymf5xmGX8liSa3TG7colLmSYs4/dHKbtvQZYSHMPy6eyZrpjwbPv
         gSUTLFIJoSCSaPUixrQsbbFAYRY47dCEK/EGPn/C0oZXoNqXe2F+13aq3QuennCfDQJU
         KBsg==
X-Forwarded-Encrypted: i=1; AJvYcCUBHB0rwQ6p5EzQ52qZJ3Zx9y2uMCZzMZ/q6xT290EqIV7lfx9rX9gGUb004XZBoH/MJRqteifOQjeWWxn9TeMv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1m3UFgvgnhMRea+8SW0jfkFXEvhcExjGtgtGXCjDviUHYl4py
	WWmSGZ31XU3r+huczn4/9jUw5THqLZZ7a1hLiENOGnIv+MjveA+yCmGh
X-Gm-Gg: ASbGncuVbAfsbqto/7cNI5ZfmDANA5Aa3a7YZITPvY0GqOwwuLRLEvJy+p0a1cH1YTO
	3sgrnsw2j+/El/f4tmxKp3YaBl2zvzWWuUy/r5MZFedrAKUsGU6Ynyh6zcWvJkugdecir5nZYca
	TOZGIHjZP28As9UuveBIVgzfoyzz1fEdupi+taR8XxP1d864cU84/Ua4zRe0TuGJVwQkC8XjIuB
	zwd0CYrUXQOZtPEAS5kq9C4NuJawT50y2E7lX6lP+IK6zL1g84HzPXlgXZ5bJmcoPp5n/Rfhot6
	8qcood9iAh7KmXCYqzMMlm8sNaXtLW6kHGrK53YNXoir+ATk/MNxUruBudw0oiGr6tUV/KDK+/k
	o35hmzhhg0En9eRtK5PU=
X-Google-Smtp-Source: AGHT+IGcDSspfVbPpwb0f/ablI94JBqFeuuwuuxpXOVNcm2A90uM3TKWTA7DXqp9K6lERbNZaC1dhg==
X-Received: by 2002:a05:6a00:2d06:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-7489cf62aa3mr20044531b3a.3.1750188963855;
        Tue, 17 Jun 2025 12:36:03 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:36:03 -0700 (PDT)
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
Subject: [PATCH v5 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Date: Tue, 17 Jun 2025 16:34:48 -0300
Message-Id: <20250617193450.183889-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_123604_565140_5514C193 
X-CRM114-Status: GOOD (  16.76  )
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


