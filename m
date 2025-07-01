Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5899EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdMf8ETlbb68upZAkXYue9saY3OH8vhTng5lSfTP1Lw=; b=OFNriCB+6d4oE0mjdrNrevRWZU
	fIVTtFYzMc8VmAMeIE8ZY7iy+Q8HCYz+ibsyrQjsyzbYzwBMw6KymZTtoPYeD/brPlEm8isKZgFkB
	MApUXlRF2sNCbkDCCtoGwnb6JWqMojNyGmizltD8GFh4a2LHe5eHGZgAQ806iw38d2bJsKIBCsK1A
	+2ux+CKpYkVGbgvzf6LgAnpImKO0nHvxCPNx95Jr2WXVTHSNabOtJ6P0cj7gnVhQiu1k47uqdMx52
	HsiVCvsV2S4uG4InqrRxTnRn1bp6D1mbcol5FC3vHv7J5imSp5SQ26IP5t8Be60ZGSdPhIGvR0cbX
	IQZMwn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaJx-00000005Mei-47xs;
	Tue, 01 Jul 2025 12:42:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZTC-00000004usV-2qWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553b60de463so3701376e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370493; x=1751975293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdMf8ETlbb68upZAkXYue9saY3OH8vhTng5lSfTP1Lw=;
        b=bqp4EN5WHkA07nVT4De3izH32yOAB80hTpD5hA2WgNIiHLEfXhZYow56l0Sxvwmx3P
         kZgE/DJk9dmVXc3lgx2qpVEanzRlT3cxUGt5oQ43JAJEHa5gn32ODhYKwxIgoqi+RYkX
         Ply+Wl28wydKjk8NhJ0LMXvuoIGM2fRD4r8TTEovc3oVmjDFjtXwGQ1NrqxIbeqIwiti
         kcShwy940JjmwUp0aAK6a/U7pFtlaCgAcZz2w4hFiDB1qi4OE/Jiuc3BK+8L4g6Q202e
         H62dRD1RkTHnwfTgB9wGZ/gXMPRsfFLR5mFeTV10o97OEwIU6kzrlm9atMeABlWx7wGp
         5zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370493; x=1751975293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdMf8ETlbb68upZAkXYue9saY3OH8vhTng5lSfTP1Lw=;
        b=JQuWdMNw6OuVKJTyCrVs2nmZHCtWkAernZ7uppvv/h0VF1SEb/Lj7rXjhAOwdRBLz6
         lPe3aGgyFQyKSrTtJU0e9sO2Tjm7ksmkLoqrosfxA1YZvFe4DYmqO28CUdZPfF2TnI5m
         lBhVod9Tln5cOsB92dDnmhP9TxeUz9+8nq73n8sGCm/m/8bEqDUaKkMWAQrBtV9R8TEh
         YTJ9/guQozSSBaoV805M4eeE73GGMxgu0ateJ2o6Zn3iPilrlUD1tK6d0k4QgX5rXLVj
         jK9j5g3hJ5HN35Fx6wHqO+64KuXtptODIGaEPqt3IMpl8Xt5NMGYp6GR7TO9l7MPrWrI
         Tl1A==
X-Forwarded-Encrypted: i=1; AJvYcCWRdziPF05A4mf0LFUGBj6ITKXUugt+ZMKjWfIss1KhLS/gtTltKmKLQGm9RJRaU/4JCrMGMYytTpyPfEF7zo0b@lists.infradead.org
X-Gm-Message-State: AOJu0YxE/0h6elq7CEQqVifG0zFtkvFkT+o2Akkg1n1GqUOon0zzEdiH
	haiBI4UG6EbbazDKN6EgdAhyYOy8G7kZ71s1cQcPAPP/dxh6H8bIs/1nda/JFLNqGqc=
X-Gm-Gg: ASbGncuTmgr+5PAulNydRrrQpXvDXjMqiCS1ES8lNa5cpu2N3tEAtdY33CIxX+MokNy
	55UM0IGe1MZOQAiK695oglzCMhQdErxaHPcGaKO2ld1YzqIzKSgQ/fC6JauwNnMyirC261/PK0p
	GloEkzMb9UNH/iv/mDSgSDToxJlOCD/eUdxtGWO/MZAUQci6vae2lrTzH9TrzAEFqYVc/H/CXKn
	b9yo21hcwWxdwIV2he6RfudOkOo+Xxp1o7BooVjxfsbttdCy5PICUAqlvv6MuGt1Thc+Ozt79ra
	N/OHuFNbtgbJNfGbwMQs8YtC+RFT4Te6E5k4EwZGvLkfLC2TcxDnC8YbMfGiqsZjlBbSBNalwjL
	/9kFH1WOH9rfG5lBH4sy0ZdOqwwQdtk7QU1zc
X-Google-Smtp-Source: AGHT+IE/SHIuzQ7rWKOlDC+9ofv3pJngxyUh6TGDzTwptTEze5aqXXTe7AIraV6bJA9jSM2HwMhMpw==
X-Received: by 2002:a05:6512:3d10:b0:553:d884:7922 with SMTP id 2adb3069b0e04-5550ba1191bmr4622940e87.48.1751370493072;
        Tue, 01 Jul 2025 04:48:13 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:12 -0700 (PDT)
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
Subject: [PATCH v3 21/24] pmdomain: core: Leave powered-on genpds on until late_initcall_sync
Date: Tue,  1 Jul 2025 13:47:23 +0200
Message-ID: <20250701114733.636510-22-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044814_731303_3F18DEC7 
X-CRM114-Status: GOOD (  19.03  )
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

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

As a step to improve this situation, let's prevent these genpds from being
powered-off until genpd_power_off_unused() gets called, which is a
late_initcall_sync().

Note that, this still doesn't guarantee that all the consumer devices has
been probed before we allow to power-off the genpds. Yet, this should be a
step in the right direction.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 10 ++++++++--
 include/linux/pm_domain.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 5cef6de60c72..18951ed6295d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -931,11 +931,12 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain is already in the "power off" state.
 	 * System suspend is in progress.
 	 * The domain is configured as always on.
+	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
 	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
-	    atomic_read(&genpd->sd_count) > 0)
+	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
 
 	/*
@@ -1346,8 +1347,12 @@ static int __init genpd_power_off_unused(void)
 	pr_info("genpd: Disabling unused power domains\n");
 	mutex_lock(&gpd_list_lock);
 
-	list_for_each_entry(genpd, &gpd_list, gpd_list_node)
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		genpd_lock(genpd);
+		genpd->stay_on = false;
+		genpd_unlock(genpd);
 		genpd_queue_power_off_work(genpd);
+	}
 
 	mutex_unlock(&gpd_list_lock);
 
@@ -2352,6 +2357,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->stay_on = !is_off;
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index d68e07dadc99..99556589f45e 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -199,6 +199,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	bool stay_on;			/* Stay powered-on during boot. */
 	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
-- 
2.43.0


