Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801AAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs1DiDLKgL3lDGnxl5GpSbOlFK1Fei/oMNx+3W/PVKs=; b=tJ9ALdzeuH8Rw8MIIcjE0mRFoD
	3iMhjMYcPqfvuE27qI6wzDYUysgBU37F1AaYUNXnGvlGMe1mjLTnwgFOloM/JEEt48BXEwiqQle26
	5bPL3EE1GXmgMTxTiNpymVC+fRQmp+rN6Ir1qwWx1sw1P972BDjmDsW2fDzMQZ2Scnij/a8Tx0tW5
	dk8ZYplgoaafW3IAJQCDJwqN8NW2EvFkV0fgJoHa9jGE6w98T55LZlQFdaAcfpFUwKUbmvXyTpbL3
	DUUG6MTuLQ00pLcu9FuDB2i2YF2HyIZumZluY69PX4ftJE3Zh9tOGOyzKRgdcftpEzP38EA85I/jT
	s6eA7jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QSf-0000000DMgn-1MOu;
	Thu, 17 Apr 2025 14:43:29 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBU-0000000DIjE-43Z1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:46 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1013771e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899943; x=1745504743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs1DiDLKgL3lDGnxl5GpSbOlFK1Fei/oMNx+3W/PVKs=;
        b=HdPNjphnUtnwYnoPngk0bY2TZdw6W0kx/kBq86QYAk8eg1xNN/p7CTy5u+qdDatW5y
         tVreuKTyHdwu4dftz1EPSNk/QSHFNdxbA9nOCfYOmeG6Y6dQsYTT19BS/4ObSDFkXhTu
         C+lyVmYYCNQVPInlfr7e61xBcSVce1+xXUGc+3cdcf3ApoSrKJ4IB0IJD92G0sCNOo7A
         4xy7jKUPCHo2kXTmO2Jfrxiz38rbx06i/qDiJni99j8vw08SEPp0tTB2D3CzONWYt/8+
         /UhRHVQQjbtwr4PFp00K05P4m3LF5oxerovvv+u4qstG7NZMjbREthUoYn5jW2AMVfJO
         3aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899943; x=1745504743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs1DiDLKgL3lDGnxl5GpSbOlFK1Fei/oMNx+3W/PVKs=;
        b=RFcRpaH2g9y2eV5rumK6dnypmj1GQU6PcLlnZ1xMAuRdp0Vbq2pCVjB+jpstM9z9pF
         Mu/ycmomJbM+yHlaHxlDvhYbEnMjDiJkFPA0OnE6ASaxq0SNyD7xU/ns+VBVMMjzo1cc
         0FerwDqTK+z3luz6hLhB2SjD8snv/PlhpCy6QD0tOr8zkCHfpknBSlbvmyZeViNCb9ij
         KKFnY4tm8hkktjqZh/15NqP8QWVWMRL/DDMpI0DsIr8ngfuW4L0zu9iESHMEbwQvj07l
         vw/Jz4O//4/BiVIWKR8i4Tq+Lw14xQwc5j3LJ5fZBtNoOoHrhRzEFNErZ9NmxvqNVWJW
         5ckQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVQCiieDv9N1khg9azOL2mrYbLxqrUjWsvlIvOIkrfjFMIcQ7aUaTGAm/Y+KMCcRZMb1d5UJf3v5tmW6irXOZb@lists.infradead.org
X-Gm-Message-State: AOJu0YwWnpHVFdfqgH6GbG+41P1eScux6sPxaQhq+Ykccwl9mWP5Nupi
	FysDJ/7qyQlcNBUJDNhawPDjLExTmjGOipM6e1mkLtez4uxy8AQ172Sy25WWqFg415trp7tWUtX
	2
X-Gm-Gg: ASbGncsC0n1A+7R1eAwWbdukVTwAO1kPtJUaw397sWyM265nmUgDf58+q0dDVA8stNn
	CE2wBfP1uCktoPLLf5+MI0qK0aoDIUT/SyefYx7z7K3VNbfilZTF51bsQXgxJERI1QGVuK/yqxs
	rpoCLQ3VfUm52TBVrVDlc9w+NDDGA8eex8CEZV0aJ/0qGfiWbuwknRW+VYVF5lAyDS0ksHQm5Vk
	XIuwQgxExG28DPhmRAjcQECiNOu9n5BcTcvzt9P0zLR85S+5Qj0jMZJuPeVjtdhkGBCdgxpcRZl
	V9IladwQqKXq06z7onXb8Asz3UbGsz5yoFcc3/UsSuDzDSmIY6yijsObGLIdqNfwzDL65yaHLJZ
	+WRtZcjYnGUakSlU=
X-Google-Smtp-Source: AGHT+IFUfAkPBWbRU7FiTAZgfCwrsStrMYMu+aAN9vO0F45zoHnvuEwiowloBQTqx+0Po2lAcPUf0g==
X-Received: by 2002:a05:6512:3d0d:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-54d64af049dmr2076429e87.48.1744899943408;
        Thu, 17 Apr 2025 07:25:43 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:42 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] pmdomain: core: Export a common ->sync_state() helper for genpd providers
Date: Thu, 17 Apr 2025 16:25:05 +0200
Message-ID: <20250417142513.312939-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072545_008336_C5A303F4 
X-CRM114-Status: GOOD (  15.39  )
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

In some cases the typical platform driver that act as genpd provider, may
need its own ->sync_state() callback to manage various things. In this
regards, the provider most likely wants to allow its corresponding genpds
to be powered-off.

For this reason, let's introduce a new genpd helper function,
of_genpd_sync_state() that helps genpd provider drivers to achieve this.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 28 ++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 5aba66ac78f1..512f89e6d302 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2619,6 +2619,34 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+/**
+ * of_genpd_sync_state() - A common sync_state function for genpd providers
+ * @dev: The device the genpd provider is associated with.
+ *
+ * The @dev that corresponds to a genpd provider may provide one or multiple
+ * genpds. This function makes use of the device node for @dev to find the
+ * genpds that belongs to the provider. For each genpd we try a power-off.
+ */
+void of_genpd_sync_state(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *genpd;
+
+	if (!np)
+		return;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == &np->fwnode) {
+			genpd_lock(genpd);
+			genpd_power_off(genpd, false, 0);
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+}
+EXPORT_SYMBOL_GPL(of_genpd_sync_state);
+
 /**
  * of_genpd_add_provider_simple() - Register a simple PM domain provider
  * @np: Device node pointer associated with the PM domain provider.
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..e9a1f8975c4f 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -418,6 +418,7 @@ struct genpd_onecell_data {
 };
 
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+void of_genpd_sync_state(struct device *dev);
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd);
 int of_genpd_add_provider_onecell(struct device_node *np,
@@ -438,6 +439,8 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
 struct device *genpd_dev_pm_attach_by_name(struct device *dev,
 					   const char *name);
 #else /* !CONFIG_PM_GENERIC_DOMAINS_OF */
+static inline void of_genpd_sync_state(struct device *dev) {}
+
 static inline int of_genpd_add_provider_simple(struct device_node *np,
 					struct generic_pm_domain *genpd)
 {
-- 
2.43.0


