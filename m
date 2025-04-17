Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18735C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DgFXHRgSnMuDIPCx1JNgWD3fMJlP6odjvf+kJnYpPA=; b=0CDSqlahlSjt3a3pX0CdLcQL0H
	B2QqhbVDbGfarzkuG89qLLJy8hf9aAn81jTDtPYyunzAYlZWJvG4Si8FuBFC0NWSECReM3viP2QKd
	rBM1PGalJL8x9WAwasxmzlY1W7Y9fo6UghM/V4+1MeVV9QVnjPd/o7lNj26u59rbA/cfBv9lI7U+n
	DNHib8xloQLOJ9W+05EiKYheo8Z9Xgnjk8Jx/vfNnry14WyNeztpfUpZHwWtYDucQv1h29z3MQ335
	WojkQh2+vgtOx1MzC25CQTgY9GztR0BkwAhFLRNvQRTZWHUogDZhLWEUuMYKYXvkhDGJAsiaUyGBG
	k8y89eaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QUV-0000000DMx8-0wzj;
	Thu, 17 Apr 2025 14:45:23 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBW-0000000DIk2-1n39
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:47 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54c090fc7adso931553e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899945; x=1745504745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DgFXHRgSnMuDIPCx1JNgWD3fMJlP6odjvf+kJnYpPA=;
        b=mn/icSRv4DKEFNLLknOtTDef3fBbQLi+hjf7wr1hgT5/6ALeGF3znuZiU0plvRSASU
         1lXUOoXrGFSI3FOkewaPC8KAT8D+akwUUuXXenb4m6D94TC1vpuUPjLDXuvbMHQBB1u1
         c1G7uklzodnHO5qwjMM9dQBN9B8kQ5rtLIYC7yDcv9ShLyPB3bq6rL3vyriRHpRw15aY
         D7mSyDNefTIYvDZLaCYepdqUbXFMHs28n63f22dqEy5O47CFVJVNpu74jKD72JmWuglW
         SJTaTH3bKaDIunTvs3h3DpKGAaaDr/NxJUbgXhcE7xlRdfd7FgK5fWyLqJDhUhTsiaAe
         3Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899945; x=1745504745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DgFXHRgSnMuDIPCx1JNgWD3fMJlP6odjvf+kJnYpPA=;
        b=SEWSaUor3Al3l4TPn+OZU6ooA+UAZGmcFJWS6i9G56i2pPa3fWlk3Toy0vIkcS5SLF
         hbOCEXrV1gugQk6uPUfV54ZG9Mwfq1YFjjIO2foyDHD/t5IGLc+sngoAxJ/pJGoTasNn
         Y9vl8zWC0RCsRO22aBuOFOiq3sW6m/t38I/z3MN0Ix7vR10uwM5RG0bMTz5E2p/ACTdV
         pA8FQ7K2kPCRWFvDz2jSGObpofESO3py4Wq1haosQoCi3hGoeBpyekC7oX/5oZ2ssOlJ
         H0A14pmMgMSlti3saePIMFhXoaww3LoRKoDOvkGosRXcXMSp7TkRzGkGwfKNP61xJL8H
         aFTw==
X-Forwarded-Encrypted: i=1; AJvYcCXASsNlX3sS7er3x3joY8WWeNMSRW9E+/ChKbyGTNfYdMxBuEDN/ARuqFB4pWFVdaje3yWyJBdQy+LC2jPnmntt@lists.infradead.org
X-Gm-Message-State: AOJu0YwXkhYHJYLOIaHqE2oPKVoBE+n9+IOKAynxBSzLqfVLMAxOJNmb
	zAIUb/+IwBV2P+coKNz+c+W8BX80YdbdsdXBRSk0wCrMjens4CSo3ZZS4rjZYq0=
X-Gm-Gg: ASbGncstpCXWvyiqhBK1U/rzPPy1XIveXZHz7fe8ZJNIkSMBctJb3zks4LNVNoKjGBo
	EuMozF6gmWnWHo52j330Q/U+RxDEkiXv6qH9dfdpHaGaDW7ACOmhyfm0ascXdPj8Zs32LWj18NQ
	bmAfCGLqbFI7L+7xzSv/D3yNqgFoIrL15BepozrMB9pywjDvkC4R3SLsjg00avRuuHYseDGBVLl
	9OegI4QuuPzMQQn1sBNfghalEXTnZSO/zq4gt574QGe+A9/siiBt5iJrM+go5MOtWAM9zw13Jc3
	J3vL0wCYNG8B+8EEISDLTfV655IDYJIxBRlSvjs4GbZvxXDThJm1nAIpWDaLmxfkN2UeFYZtL4d
	twIuzGL5gEhoPo3o=
X-Google-Smtp-Source: AGHT+IHdJaQxomsfYSS+f0K9itIKdmZijhFhwWEW6ghpA5npqy5MAC8rCQkmORhb5jt3ng77hEg7hw==
X-Received: by 2002:a05:6512:3055:b0:54b:117c:a070 with SMTP id 2adb3069b0e04-54d64af157dmr2157090e87.57.1744899944885;
        Thu, 17 Apr 2025 07:25:44 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:44 -0700 (PDT)
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
Subject: [PATCH 08/11] pmdomain: core: Add internal ->sync_state() support for genpd providers
Date: Thu, 17 Apr 2025 16:25:06 +0200
Message-ID: <20250417142513.312939-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072546_466737_45A8DC31 
X-CRM114-Status: GOOD (  18.37  )
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

If the genpd provider's fwnode doesn't have an associated struct device
with it, we can make use of the generic genpd->dev and it corresponding
driver internally in genpd to manage ->sync_state().

More precisely, while adding a genpd OF provider let's check if the fwnode
has a device and if not, make the preparation to handle ->sync_state()
internally through the genpd_provider_driver and the genpd_provider_bus.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  7 +++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 512f89e6d302..9c5a77bf59d2 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2374,6 +2374,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
@@ -2656,6 +2657,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
 	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret;
 
 	if (!np || !genpd)
@@ -2665,6 +2667,10 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		return -EINVAL;
 
 	fwnode = &np->fwnode;
+	dev = fwnode->dev;
+
+	if (!dev)
+		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 
 	device_set_node(&genpd->dev, fwnode);
 
@@ -2718,8 +2724,10 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 {
 	struct generic_pm_domain *genpd;
 	struct fwnode_handle *fwnode;
+	struct device *dev;
 	unsigned int i;
 	int ret = -EINVAL;
+	bool sync_state = false;
 
 	if (!np || !data)
 		return -EINVAL;
@@ -2728,6 +2736,10 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		data->xlate = genpd_xlate_onecell;
 
 	fwnode = &np->fwnode;
+	dev = fwnode->dev;
+
+	if (!dev)
+		sync_state = true;
 
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
@@ -2737,6 +2749,11 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		if (!genpd_present(genpd))
 			goto error;
 
+		if (sync_state) {
+			genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
+			sync_state = false;
+		}
+
 		device_set_node(&genpd->dev, fwnode);
 
 		ret = device_add(&genpd->dev);
@@ -3453,6 +3470,25 @@ static void genpd_provider_remove(struct device *dev)
 
 static void genpd_provider_sync_state(struct device *dev)
 {
+	struct generic_pm_domain *genpd = container_of(dev, struct generic_pm_domain, dev);
+
+	switch (genpd->sync_state) {
+	case GENPD_SYNC_STATE_OFF:
+		break;
+
+	case GENPD_SYNC_STATE_ONECELL:
+		of_genpd_sync_state(dev);
+		break;
+
+	case GENPD_SYNC_STATE_SIMPLE:
+		genpd_lock(genpd);
+		genpd_power_off(genpd, false, 0);
+		genpd_unlock(genpd);
+		break;
+
+	default:
+		break;
+	}
 }
 
 static struct genpd_provider_drv genpd_provider_drv = {
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index e9a1f8975c4f..2185ee9e4f7c 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -127,6 +127,12 @@ enum genpd_notication {
 	GENPD_NOTIFY_ON,
 };
 
+enum genpd_sync_state {
+	GENPD_SYNC_STATE_OFF = 0,
+	GENPD_SYNC_STATE_SIMPLE,
+	GENPD_SYNC_STATE_ONECELL,
+};
+
 struct dev_power_governor {
 	bool (*power_down_ok)(struct dev_pm_domain *domain);
 	bool (*suspend_ok)(struct device *dev);
@@ -187,6 +193,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
 	struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
-- 
2.43.0


