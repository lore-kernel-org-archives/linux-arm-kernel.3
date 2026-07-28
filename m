Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A64C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OIGrkyqw2d+yA5TQnxK038Gqg7KBP2CiYzY7FjV1z8=; b=EqMtoJJHI1O5E1veLkyxLq6tsz
	w9Y9oQtAFPdDerJfKVYftfOF+bh6w4wELVNWX6Uux9W+RbEjzaVHdcHudSntQYy1F8rE1M6PMOJUM
	+448Z5kN4+6Yf4LRgNjzx1G6vl6sBxkiPNFL40AnY2uf8U8H0PnbakbT5mzgtc4gZ7iey9r4fp4Rq
	am3HKfQ+w9SDQHilcUtiL39oq1qV9QCIOBma7jEDnxdPwnaj0X3BP0nuxRTWy63LYaqM/dr30DNiF
	ksARDqgDjeUcBnSJ68eY1igJnVmfu+7JiQeTqMENymAxE5A1yYpyREMpc1XD+5rIy70WqiJdRoQ80
	bU609Aow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIu-00000005Zfp-3FYo;
	Tue, 28 Jul 2026 15:01:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIo-00000005Zbb-0HLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49553515a8bso49143595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250864; x=1785855664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OIGrkyqw2d+yA5TQnxK038Gqg7KBP2CiYzY7FjV1z8=;
        b=Be7yD8L06adVhgZMWON7ynE5L0U9sKGWWG6+OY4zIjB6YQwYS/1h9VcdZ8O8TIy1jE
         0vcFwY9ayhUkwFtLUHtRXlQGznlsMl5HoT/GtfQHjFfEC7msXGek3PLmCDvryNgcMIpb
         /croqRk2E8/Ij32N19eUPf4h3fyhOqAsErGvhh63x4SwxlV2o4CLezixueOgKHa/mI2N
         wNDTqL+ojUMuULQPL/kY7I7b/mNtWHZx+a+QlpOqSsIupqVCZPCjvSs3w2g6tQCEO1as
         dSfX8/IDq7769wYuO1AS33TmT6Yt811S8ZKH8WVVlrYsvLDLCJCklNTgqP/OTDMforLY
         w6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250864; x=1785855664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OIGrkyqw2d+yA5TQnxK038Gqg7KBP2CiYzY7FjV1z8=;
        b=Qh+EXth/EntF3VBJYUXjWlfDqJI+bn1DiTOFS86DarOATYQjex5ndo8Idpz7Wz8irT
         nSkwlQb7sbHSRUnP7QE2hpxVheurUk3xu0WWdy7wzDxIkoBVzDbv3CiEqZNZ96iYlPXI
         4XEUq2Hq8QEPAtL38VOlZU8cvCF2GUltjSqlGELX3ssf9kbK/XDP8IpHvW3nAq4630rw
         jCbQkbEoikGRWHVBHUSjzIJzUPe7YzGB3EMDmch+Hm7B/2zT7V6DIdjXwPk7F/qHcHuh
         F++xoJYQA95VSUP7SdJ6PmHYIxaTlK/rZ8xP7z/dfIfsLw86cjv+KZGu0irfDVQ+rgUg
         37ZA==
X-Forwarded-Encrypted: i=1; AHgh+RrKhtxP5hP3xW5Vn0Pa8KCtyXy13ZAktXOSiL/jjo8OYRJZhSsvA7OfUdMPMotnEU75JCwEmO0DI7A+BaLgKn8R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7SZd+DWW5c/aTFx0K9cAx8Hmc7tSpdGW25zc0olIR4vKc6okD
	j5Tfp2DIkiaLwLwAXxlyAG9lAGFwVmdpKQrnh1TaNf4fCjglpaIG2pg8Ryxh4CKkDUk=
X-Gm-Gg: AR+sD11Doj44pVHOneo6zg82iZvjHyQSAnUUJqMNNkJNxU9Mfk/1AW4rkGQpKRqt6ad
	nPQXG+PputfGv/y67t8zuw96zsGTmpGonc8qp9Ogclk9PyLArBmboXDOvmrNe3mGE6JXTbG/Dwn
	dMmSPRj1jI1Wsgigvo7gW1mrkFLxBWV4leOJh/e/+U/pWs1506oa/WEGHDHkBAmdh99gA0fI4/7
	fSu9YEaQ9fpsnt/TXCSFmlvgaMSDzTCkxAuM7v0A7W0YEKJH2Bws4MpxhFQ9yQiyo2hQJsMML0V
	XbM7gVBiuqDWWtetxA7c3eToFbOguZMPBErvQOyQG4HLA9bIfVo+IGI6YWI4CGZcTdIYJ5FUnpC
	/tjQ/PgP4uWH9k3AIEJ+bgFLMfgvH+tFf8aRMqWYTnXKT3Th9xxem06sD6hGUhVaWIUwSwxZuhL
	VYZhTTHrk=
X-Received: by 2002:a05:600c:8b55:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-496c9775067mr16629755e9.12.1785250863749;
        Tue, 28 Jul 2026 08:01:03 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:15 +0100
Subject: [PATCH v3 3/8] coresight: etm-perf: Flush workqueue before
 unloading module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-3-6aee7579f1dc@linaro.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080106_298306_DAE6F108 
X-CRM114-Status: GOOD (  20.68  )
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

The work queue is never flushed on module unload, so pending work items
can run after coresight-config is cleaned up or the .text section is
unloaded. The global workqueue also can't be flushed manually, so change
it to a local workqueue and flush it on exit.

The init function needs to be rearranged to fix a similar problem. The
Perf PMU can be used as soon as registration succeeds, so move it as
late as possible so that the only failure that can follow is coresight-
config. Failing to register coresight-config means no flush dependency
between coresight-config and the Perf PMU will exist, so it doesn't need
to be done.

Assisted-by: Codex:GPT-5.6-Sol
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 28 ++++++++++++++----------
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 +++++++++++++++----
 drivers/hwtracing/coresight/coresight-etm-perf.h |  1 +
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f7b1308a759c..5e653b08a83d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -2094,31 +2094,31 @@ static int __init coresight_init(void)
 	if (ret)
 		return ret;
 
-	ret = etm_perf_init();
-	if (ret)
-		goto exit_bus_unregister;
-
 	/* Register function to be called for panic */
 	ret = atomic_notifier_chain_register(&panic_notifier_list,
 					     &coresight_notifier);
 	if (ret)
-		goto exit_perf;
+		goto exit_bus_unregister;
 
-	/* initialise the coresight syscfg API */
-	ret = cscfg_init();
+	ret = coresight_pm_setup();
 	if (ret)
 		goto exit_notifier;
 
-	ret = coresight_pm_setup();
+	ret = etm_perf_init();
+	if (ret)
+		goto exit_pm;
+
+	/* initialise the coresight syscfg API */
+	ret = cscfg_init();
 	if (!ret)
 		return 0;
 
-	cscfg_exit();
+	etm_perf_exit();
+exit_pm:
+	coresight_pm_cleanup();
 exit_notifier:
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
-exit_perf:
-	etm_perf_exit();
 exit_bus_unregister:
 	bus_unregister(&coresight_bustype);
 	return ret;
@@ -2127,6 +2127,12 @@ static int __init coresight_init(void)
 static void __exit coresight_exit(void)
 {
 	coresight_pm_cleanup();
+	/*
+	 * Flush Perf workqueue before the rest of Coresight is torn down
+	 * because work items touch coresight-config and also require the .text
+	 * to remain loaded.
+	 */
+	etm_perf_flush_workqueue();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..7fb5c3d18bd5 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -27,6 +27,7 @@
 #include "coresight-trace-id.h"
 
 static struct pmu etm_pmu;
+static struct workqueue_struct *etm_free_wq;
 static bool etm_perf_up;
 
 /*
@@ -292,7 +293,7 @@ static void etm_free_aux(void *data)
 {
 	struct etm_event_data *event_data = data;
 
-	schedule_work(&event_data->work);
+	queue_work(etm_free_wq, &event_data->work);
 }
 
 /*
@@ -1034,6 +1035,10 @@ int __init etm_perf_init(void)
 {
 	int ret;
 
+	etm_free_wq = alloc_workqueue("coresight_etm_free", WQ_UNBOUND, 0);
+	if (!etm_free_wq)
+		return -ENOMEM;
+
 	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
 					   PERF_PMU_CAP_AUX_PAUSE);
@@ -1054,13 +1059,22 @@ int __init etm_perf_init(void)
 	etm_pmu.module			= THIS_MODULE;
 
 	ret = perf_pmu_register(&etm_pmu, CORESIGHT_ETM_PMU_NAME, -1);
-	if (ret == 0)
-		etm_perf_up = true;
+	if (ret) {
+		destroy_workqueue(etm_free_wq);
+		return ret;
+	}
 
-	return ret;
+	etm_perf_up = true;
+	return 0;
 }
 
 void etm_perf_exit(void)
 {
 	perf_pmu_unregister(&etm_pmu);
+	destroy_workqueue(etm_free_wq);
+}
+
+void etm_perf_flush_workqueue(void)
+{
+	flush_workqueue(etm_free_wq);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 24d929428633..86e259cc1adf 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -116,5 +116,6 @@ int etm_perf_add_symlink_cscfg(struct device *dev,
 void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc);
 int __init etm_perf_init(void);
 void etm_perf_exit(void);
+void etm_perf_flush_workqueue(void);
 
 #endif

-- 
2.34.1


