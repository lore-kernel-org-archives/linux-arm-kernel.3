Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3295FCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6SNUR5udOzN8HMLcCIaxFObb70KXjg7FX5VAT1iGes=; b=FP6iFrPSQO2sALrnqd/dSWiPcn
	meX6NPSlJgfiwJnFlHv+92nFcOoGFMMWCwwLIrZ/Muj5UStAW3hMNjVM/DKuRLqwlU2dCtDhKvq9V
	MdcqzmkL56sNqpzFs9Cm/358eHskm2buLMfwrRt5olPsRH2ZI3juNCPsi/qkW7147PGpaJ5ZXEYMe
	7Cfzbgn14pVWP7+iRI5h3cq1CwJZJkvWF7/cBr2A5e0ZHZ19kCTeXfufzNFhl7EBWpXTsnfKIUXCV
	trHTQOGBlkJsq5KgQIDMoUisG5YtYCs6/O7VUcam/THORxaaN6/hccSzwoUzFRJpDlZpC+s+tcChy
	L0RYhrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSi-00000002hlR-3F8O;
	Fri, 16 Oct 2026 10:46:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSZ-00000002hcX-0g5f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so30105615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147605; x=1792752405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6SNUR5udOzN8HMLcCIaxFObb70KXjg7FX5VAT1iGes=;
        b=TQ0mVXiofTV6/pFwdiYEHe2UllN4mV8IP2duDOgzWodykkVOmYLQsDnq69lq/r0Lw/
         GwAWu4Lv/6OyA0qfdAI6sPZzMtEFNUTU+RmBOOl92f32kQFFftE01k+nxOZeKJc9hkBI
         EQYxCogTmhgCIkCmZYMjQ6de61XGkP/RzdGAVo9xH7MNXfJt8ufs9LNsdfDvnUGAJNJg
         0YjpObjCEFQbzokCmKRfIp/VerfQWlt4j34oaV72Gx/9yE7oakXq76k8kJyBoA/2v5sP
         FBm9QQUSJzVlvTTXu5gmDTqCb5/cXC0LlOEbDiy5R/XjUIzAiJzfwDz9rBEOnKDcGnF+
         8Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147605; x=1792752405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6SNUR5udOzN8HMLcCIaxFObb70KXjg7FX5VAT1iGes=;
        b=efGmWFcHWlCIPhfgx3l6YIVTiXSMGLfOyg7yQJ5N57duVLJxAWbvxzoI9DN0dElzoD
         h7yA5OVTtAc9EUaEQD4RdzqA38N8wOlghKwS9UeXJs6vKxy1mmEhIuB+WhuzwoxmOVxn
         MQq1xZzLOhwTkDDCik3CY5ibRAWP9F3dCmcTWRuo0l/O6eHFel0TcK9RzU/ce3WIXt+9
         ZOxEcqbQRGYtSDrhOy+cXjsgwpiqvyDIeUp16UrloqEAFbjaoQJMH5TH3od4w1iayAW1
         huYpaYSSVjksn/hvC5z59zJwwxrCC0Am75N/qcuGn2416VY1L8xXb9VCrnbvXhELuhgG
         IA0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjRjfbEOIVGL6PA1bKyIUizD6OKUJDPar+EC9PVhU4KTEavt1yR8sXLtx5PHelBNWqy64IWtwzKK5/Dms2iWna@lists.infradead.org
X-Gm-Message-State: AFq9FYKwa01IzthiJsUka7xP/naj+VvD+UpiVlemR5MB1HHiFPbsxY1w
	H0p39DxUGEZJU3uz59zj5TMN0HigzTfDM1hIHjehQWlNQudLCT4BA9bNyePYyGqfx5s=
X-Gm-Gg: AYBFou0SxhFvHISj6SaYpRezpWnH4786Npc8cIv3SYo3/2v7tgJhw1/KnwBzaCHlZ/l
	5ahJdxkHkGIk3+ZjShouq8G9Fko9kOIdXQHNeVAOc01XISCifJeJ6eTZGjjkxgPDUzI514NoaAQ
	gPOvioQd/DV4tbuu5JrjIBrAlPX8B8lBNRuIpFEeT4ualEqvhQfkeZsl0+GIlkPnMOoGNDsvqVW
	rQKXqsQSh6kPio27uhKlq9NuKr3vJBT+2bY4MlFDghH0hkq+2d9BAOVH4KF219cay/j7S0sRl0+
	z6z8rqdGFwIpNyMrSDBn0VIT6xCRgotgxH0JXYLru2fpkOXnn8+pZwzLI+AF8TviOLixH0KxA0d
	BnE1B6CPmx0Nhj3jCu5ir7n14HbmNma5lxPSHKolqZ3A132UdGCLw6/8coPYtQGF7kJCCCJrEAr
	9YMmY5ZyVZ4erX2hf0ginUaTjXKa1/uW/navnZQ9371E/waP8JS1eRiZVS1teVJ3Vrsh7BgAcTj
	A==
X-Received: by 2002:a05:600c:6088:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1d456dfe2mr3118645e9.7.1792147604136;
        Fri, 16 Oct 2026 03:46:44 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:13 +0100
Subject: [PATCH v4 03/10] coresight: etm-perf: Serialize AUX topology
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034647_277818_F24D0AA9 
X-CRM114-Status: GOOD (  21.16  )
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

Perf AUX setup walks the CoreSight connections to select a sink, build
paths and acquire references to the devices and their helpers. Unlike
sysfs tracing, it does not hold coresight_mutex. Driver registration and
removal can therefore change or free connections while setup walks them.
Adding a CTI helper can also reallocate an existing device's output
connection array even when the device is already referenced by a path.

Hold coresight_mutex from sink selection through buffer allocation.
The allocation must also be protected because ETR buffers can look up a
connected CATU. Release the mutex before calling etm_free_aux() on error.

AUX cleanup walks helper connections again when releasing paths. Add a
locking coresight_release_path() wrapper and use
coresight_release_path_locked() for sysfs and setup error paths which
already hold the mutex. Leave sink buffer freeing and configuration
deactivation outside the mutex. AUX cleanup runs in sleepable context
following the preceding workqueue removal.

Add lockdep assertions to path construction and release to document the
existing sysfs locking contract and enforce it for perf as well. This
protects sleepable AUX topology walks; connection reads in atomic path
enable/disable callbacks need a separate solution.

Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 20 ++++++++++++++++----
 drivers/hwtracing/coresight/coresight-etm-perf.c | 11 +++++++----
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 drivers/hwtracing/coresight/coresight-sysfs.c    |  4 ++--
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..c05d657cde73 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -30,8 +30,8 @@
 #include "coresight-trace-id.h"
 
 /*
- * Mutex used to lock all sysfs enable and disable actions and loading and
- * unloading devices by the Coresight core.
+ * Mutex used to serialize device registration and removal, sysfs enable and
+ * disable actions, and perf AUX setup and path release.
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
@@ -910,6 +910,8 @@ static void coresight_drop_device(struct coresight_device *csdev)
 {
 	int i;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	coresight_put_ref(csdev);
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		struct coresight_device *child;
@@ -1046,6 +1048,8 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 	struct coresight_path *path;
 	int rc;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	if (!sink)
 		return ERR_PTR(-EINVAL);
 
@@ -1065,17 +1069,19 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 }
 
 /**
- * coresight_release_path - release a previously built path.
+ * coresight_release_path_locked - release a path with coresight_mutex held.
  * @path:	the path to release.
  *
  * Go through all the elements of a path and 1) removed it from the list and
  * 2) free the memory allocated for each node.
  */
-void coresight_release_path(struct coresight_path *path)
+void coresight_release_path_locked(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 	struct coresight_node *nd, *next;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	list_for_each_entry_safe(nd, next, &path->path_list, link) {
 		csdev = nd->csdev;
 
@@ -1087,6 +1093,12 @@ void coresight_release_path(struct coresight_path *path)
 	kfree(path);
 }
 
+void coresight_release_path(struct coresight_path *path)
+{
+	guard(mutex)(&coresight_mutex);
+	coresight_release_path_locked(path);
+}
+
 /* return true if the device is a suitable type for a default sink */
 static bool coresight_is_def_sink_type(struct coresight_device *csdev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 2323a68584d4..faec4c7bb83d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -402,7 +402,7 @@ etm_event_build_path(struct perf_event *event, int cpu,
 	/* ensure we can allocate a trace ID for this CPU */
 	ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
 	if (ret) {
-		coresight_release_path(path);
+		coresight_release_path_locked(path);
 		path = NULL;
 		goto out;
 	}
@@ -428,6 +428,9 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data)
 		return NULL;
 
+	/* Protect sink selection, path construction and buffer allocation. */
+	mutex_lock(&coresight_mutex);
+
 	/* First get the selected sink from user space. */
 	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
 	if (sink_hash)
@@ -498,13 +501,13 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data->snk_config)
 		goto err;
 
-out:
+	mutex_unlock(&coresight_mutex);
 	return event_data;
 
 err:
+	mutex_unlock(&coresight_mutex);
 	etm_free_aux(event_data);
-	event_data = NULL;
-	goto out;
+	return NULL;
 }
 
 static int etm_event_resume(struct coresight_path *path)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..edec5a7d2be3 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -143,6 +143,7 @@ coresight_find_default_sink(struct coresight_device *csdev);
 struct coresight_path *coresight_build_path(struct coresight_device *csdev,
 					    struct coresight_device *sink);
 void coresight_release_path(struct coresight_path *path);
+void coresight_release_path_locked(struct coresight_path *path);
 int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 75000fe64fda..5dd4e9b0426e 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -230,7 +230,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	coresight_disable_path(path);
 
 err_path:
-	coresight_release_path(path);
+	coresight_release_path_locked(path);
 	goto out;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
@@ -256,7 +256,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		goto out;
 
 	coresight_disable_path(path);
-	coresight_release_path(path);
+	coresight_release_path_locked(path);
 
 out:
 	mutex_unlock(&coresight_mutex);

-- 
2.43.0


