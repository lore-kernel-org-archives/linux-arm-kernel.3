Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF3DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8snE3wteaj05up9xuc38N+GpWHiyr4TVp4DRKu79Vw=; b=T0i3zsVMF0vxmzo+lMh5gHfXtK
	fbT+4QgH6+7oJL74wsSjdzX6Yf+DSisQVIdXdFy42jw9kkxPNLf+wWXCBsPj0wmaKj5DYEHWRmild
	cSjDCljGPeOkx9q+cKOd+BvZvKOqewJIgTbdpw5n2wNHTrdtYdfoY5AxIt4PE9hnYZJpEOKbi+Bej
	kWQnlMMVMR4ubep44aWFjb1M4fwGM4KlrU2nvlRotesFShzqAvoitB2MiEQBJn67EqZgoij8z1gm2
	Gs0LESnn1ySJ917BcVS7iyfEiY6Gb1/qLNchV47eWE5sMm0NZvSvA2k/Q1EgGxoX4qQEMKBG8B3br
	VDi3ktXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa98-00000005Jxa-0mT7;
	Tue, 01 Jul 2025 12:31:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSt-00000004ueh-1UJ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:56 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so3582420e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370474; x=1751975274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8snE3wteaj05up9xuc38N+GpWHiyr4TVp4DRKu79Vw=;
        b=S5eHttpBZj/2u9dyGG09g7CxBjt57w8+lkMieNtil1ovkVXDAWFTDU6EYx7nMBEbbu
         xNGUXkBuhs+nmooKKOKhXRyjTnleRYq/JrU3EgUwypEgm1NLsxyO7XLUbEz/u9U07GbV
         TLKLVj+6/nCaHw/vmAgvW5sMho9Nl1a2snzGvx52ul2NQRjr8YXcW6fcbvr7uZhkCNqt
         N2faYRikgcKGLI+tLS+VZAOS8N0xwQaNTL/hVm6dA72SWoclqF2rVfEVcO3BgiWe9JVG
         OP40LaYdyAGISMqZkfnEYdriZ5LRL76Y0tqPxiEZX+lR/KrTk/xgwUroETWD9H5ksoAE
         iBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370474; x=1751975274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8snE3wteaj05up9xuc38N+GpWHiyr4TVp4DRKu79Vw=;
        b=JQh/Qjq83PaOWOMWNX7S+dhsADp0zmyfpGzKZv+LaO2hDiFCkS26hNgYzU7aMcJnV2
         1DPqKYgX4dyCaCNlLEQYf+8y/7P6C0ZLRre+oA/X1Q7N73CPsUQlV6F96LwrN9EHFE9b
         UFIel0iO0mhlQNEkV2TEdRAQ4qoneGmeQUwiNxIrrBFT0mxk0enLZ7mCMMQm0/RtppBE
         uOfXszgbs5UUHW0TTB4piwteNbtNTSFvOenUTgmomTBQPA5jR0YcTAH8hD+jju7GBmsK
         SWD07dykm0BHhFPW+rgEUbNmr7SEZSOVb/ign8orhvhUhCXXYJ+kj05M+VARVTSJueZW
         jIiw==
X-Forwarded-Encrypted: i=1; AJvYcCXLwUqGiV/gjU6cAuUvsNY6SDcvsTuQQKc2oZRiCY5Vdyq9q4f5eCOgDPltVu7L6TCdkg27ICRC15w6ocmwd5uX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+rFtEr51sLQluC7kSgJYotYuOf/3XtrQODbm1ueFqRyuy/Tet
	qhaSRpuqh0S3VCd3SthsPU8E8SXWxwCONgUul8KRsIBC+joBj8M9UVK7pZO5n7EJowE=
X-Gm-Gg: ASbGncsi7V7k0UlodvsIW0UwEKp+H4IgKw/Aj4O9AZvzExbxJ5T6Nu8EFvpTZfe9nK5
	P+6wSNm7pynjFg7fl16xElsF6hdQ8I0dwy5a1XTSYS9mbNiE37hLlmQywHRoR1sYfPM9lPF9/xY
	+bILLdVSoUzZmHspX0rDGqOSFemxI7CnjdRa9MDsM1DzTkvYEsrFSgkUae/0SEaZxOR0MZmEHgR
	Qs9srs0+FNg8imJzykKZ700r5oll4WpXpahBqD/4C5iCmpCw6244WCqcpkcGGrYOyB8RW2Zw8fg
	RAGaKKiDxtd5tW5qoCFg1Jq58fz/2nR7uCDWudE05C8eN4A98syyke9hu6zxPGMbFJ/zDU3Y/j/
	GcCq71+8dHUp0saD8ZQbgQoq4B4JrW/in1Uy/
X-Google-Smtp-Source: AGHT+IGHOXSS3IfRhKJLvej9F7sNLg96swujqTnE5kCTQPPh6ovfx1jtoUYgG1FeyEuKZgdZjCc4VA==
X-Received: by 2002:a05:6512:1590:b0:553:3073:c38b with SMTP id 2adb3069b0e04-5550b8293fbmr5034875e87.1.1751370473628;
        Tue, 01 Jul 2025 04:47:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:53 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/24] pmdomain: core: Export a common ->sync_state() helper for genpd providers
Date: Tue,  1 Jul 2025 13:47:09 +0200
Message-ID: <20250701114733.636510-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044755_393154_5CACEF88 
X-CRM114-Status: GOOD (  15.77  )
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

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
 include/linux/pm_domain.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 79dc0bf406f0..0a6593a1b1c8 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3396,6 +3396,33 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+/**
+ * of_genpd_sync_state() - A common sync_state function for genpd providers
+ * @np: The device node the genpd provider is associated with.
+ *
+ * The @np that corresponds to a genpd provider may provide one or multiple
+ * genpds. This function makes use @np to find the genpds that belongs to the
+ * provider. For each genpd we try a power-off.
+ */
+void of_genpd_sync_state(struct device_node *np)
+{
+	struct generic_pm_domain *genpd;
+
+	if (!np)
+		return;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == of_fwnode_handle(np)) {
+			genpd_lock(genpd);
+			genpd_power_off(genpd, false, 0);
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+}
+EXPORT_SYMBOL_GPL(of_genpd_sync_state);
+
 static int genpd_provider_probe(struct device *dev)
 {
 	return 0;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..3578196e6626 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -431,6 +431,7 @@ int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
+void of_genpd_sync_state(struct device_node *np);
 
 int genpd_dev_pm_attach(struct device *dev);
 struct device *genpd_dev_pm_attach_by_id(struct device *dev,
@@ -476,6 +477,8 @@ static inline int of_genpd_parse_idle_states(struct device_node *dn,
 	return -ENODEV;
 }
 
+static inline void of_genpd_sync_state(struct device_node *np) {}
+
 static inline int genpd_dev_pm_attach(struct device *dev)
 {
 	return 0;
-- 
2.43.0


