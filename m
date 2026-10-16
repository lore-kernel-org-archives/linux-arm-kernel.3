Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F37CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0OY13du8CSykj1rk4KeOXIR2Ct1uKCdfrHBYl2Ej1o=; b=iZ2K4iLyWohHHhqHFpxYpDeX6p
	BlIR72XvB3mUbSlRzRadqHaZ+y/Ef5IKKTNLkwpkRQs00dQeQLYaDUIQFziZCVzh3Z0Iuhc29YKaG
	4KbnRgXRO+AHIQZFI0wAwY+ff46aKUYsDZFMu4bLIT1KMzTf+w/fQ7S866GIQsjEoTYC+iSpeiZtw
	vFexqJUGK8cHZZgFd3RlIifpU7Gh5G7MacqPhZOdCskjoXPNY7aBUje+cTf/JqoM74dnx8nIPRsqZ
	K3/RSNAAqdSPPzwWYpKz3FmCXJNxrndph4WxM2hoqrfGbuP1b7rSBr04I+iD7nVu2mhTyy4uU7tbK
	TmpfUB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfT7-00000002i80-22Na;
	Fri, 16 Oct 2026 10:47:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSj-00000002hl8-1St8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O0OY13du8CSykj1rk4KeOXIR2Ct1uKCdfrHBYl2Ej1o=; b=fShFt4vJKL9X7Jxbms17drnZK3
	sbUPZoVvigqzDJM6NvQD2rc+7IT0YN36eboDsuMQ1Pkl0qwMu68kaR9nQY5jT8TsNw7FwdE3ctyWH
	/XVNbYTiSxje1rnIDmU271Eli6llDmI6F58IfpL8PNnOcOeA+UCz8G0LvESDn/+MRl+w/4bnebPlx
	/e53WL+2+FqGTfsxKtr1KXhJXWr6JftR2evJzihAw63QfSKCvONGRzYyWJ7HeGZ7rfp7kStr9ybuU
	fIcH/13IErIrlLkpMbQ/ELpnntfbrVw1cEE2lJ/h85Pim/w9chOTkwXSEs0zC9EyWNmHiAzeOOTWe
	oNP8gQMg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfSe-00000001PIQ-1YUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a17baef589so27132495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147611; x=1792752411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0OY13du8CSykj1rk4KeOXIR2Ct1uKCdfrHBYl2Ej1o=;
        b=uY0ZamG80aYRANCGqbwKRqsc3ZnmRewxDtke8vQPuF4cPVyPfZhJ9haF+6aiTdWFY0
         xbJ+hNIOrAbjoxBR8CfgEWu3TDbtHEkWx39TqKb++TwWPwkDXUtMc8+ZWjZr7hdJ/NOP
         nEbsA1A6NmpZmMaYh6Z6I2nSjOdz2uQX5ajkoQhJAxLhEwX3LOPYRn6JyicGPkTn9kgy
         jGUrNID3CjzQ8BISJi1e4ihF0O6OWHSMmdAOHKAbUC/tqiC+XeQbaDHKozcvuHPbIwbZ
         iFJfVVQtkGs8U2lChWL9Z4CMD4exYAnU3uCsSdFMHp3+NzlFf8+s0fgKn/j0gGiVnxsP
         3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147611; x=1792752411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0OY13du8CSykj1rk4KeOXIR2Ct1uKCdfrHBYl2Ej1o=;
        b=uSof6iboC7VA0lXekW7mN3V+nANLQlv+IgZn1NeNQ46WkAYQXNfpZkKsIMJ3Z/Rlq1
         rmIDQmua9L+btTghILqtKNg9WccqwZFMWrt90WEEuaviak0lBqPOhQtmxRIu0mKI2HEj
         1UWDvHcT6Boui+SZSChdBG/Ti/c6x09e3mg3o5k1nIYz55f9nDXVq+XvcIpetN6CjSuX
         ItVXmWhByFilMX9rv7lxakAmn32xToF9oZh3tdk/+Cw6JbYGiwHQbLqyEtTIy+XQuxVy
         RRCjeCpwLdIRISark/Rb0SMshun3Lu9f77nakg2eAnXFjtpXt24HHe2vqxsW1EQmpgQC
         XuoQ==
X-Forwarded-Encrypted: i=1; AKwUvBybbHdig9jrK7SosIqh+fcIM9mcwvAVLuw0mcYL+P5zKba5SxvCZLjcwjtoeitzWeyzcGjlV19CvwBevG1YTK10@lists.infradead.org
X-Gm-Message-State: AFq9FYJHeibEwdccf846IQun6syGGGbHfxDYgtV50aZBPlqpnvfVlee0
	KJW1YVQ/3qj/md2TbQnUoL+2PRgq/iViAl6WNfmwMZiQZi83SgLkbrxvB1/j8NuDpAs=
X-Gm-Gg: AYBFou1dpnllgzVVgXRUhufyzx4G3zjaPwDDcuQzp4KG10Tr9z44Svk2D1WfimL+FxB
	ueWEIB6+2stGOqc4saLVpD4JpY62uywPLUAxoc69FrYnBqrTs8Adw0pDX39ZVoQABUgYyn6fBUa
	xDdTAldaaLQO8FTivaA+NB+VcpiLqh/qOzH4Eo3t2NZ2R91Bansq75p1HmKj49WbimWh8QZmUZ0
	aeHy2WCmCA+QXpzIZsudWNYSB/PJ6V7tpziUVsdduPNLyxP0Iegk6uCX1I7i3fIU+7j8ClSfJlz
	4IiG10VKaMnjnUQYn2c9lPIdG10QQRxE8ISZiU4/trr6a9LUN6Ctaz2LRVgD43vKmLcg1SMWFCm
	3xKz7ShMO6wAsCNeko3yA9bFIlaHwKhMEGqlvhdnJtRPSgimcmObd8B4W4vi4NMPUfwTMhpSv5F
	WxQ44x301qCD6Q3CffYYBbezHVhSGoBdoVPHVujNBzwUx8z3zWHx0P3cdHddyV3eRaAqqqOfRL1
	Q==
X-Received: by 2002:a05:600c:1389:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d307b5d9mr8341635e9.0.1792147610795;
        Fri, 16 Oct 2026 03:46:50 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:17 +0100
Subject: [PATCH v4 07/10] coresight: tmc-etr: Remove sharing guards from
 ETR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-7-dedf961aca0e@linaro.org>
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
X-CRM114-CacheID: sfid-20261016_114652_672959_825BBE7A 
X-CRM114-Status: GOOD (  20.77  )
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

Potential sink sharing is now identified during AUX setup. Now sinks only
need to refcount and use the buffer provided by the event, which is
guaranteed to be valid and shareable.

Mismatched buffers seem very unlikely now, so remove the WARN_ON() to
reduce how much state is stored in the sink.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 39 ++-----------------------
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 --
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b4b186c605c6..a2768f5bbfbc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -36,8 +36,6 @@ struct etr_buf_hw {
  * etr_perf_buffer - Perf buffer used for ETR
  * @drvdata		- The ETR drvdaga this buffer has been allocated for.
  * @etr_buf		- Actual buffer used by the ETR
- * @pid			- The PID of the session owner that etr_perf_buffer
- *			  belongs to.
  * @snaphost		- Perf session mode
  * @nr_pages		- Number of pages in the ring buffer.
  * @pages		- Array of Pages in the ring buffer.
@@ -45,7 +43,6 @@ struct etr_buf_hw {
 struct etr_perf_buffer {
 	struct tmc_drvdata	*drvdata;
 	struct etr_buf		*etr_buf;
-	pid_t			pid;
 	bool			snapshot;
 	int			nr_pages;
 	void			**pages;
@@ -1508,7 +1505,6 @@ static void *tmc_alloc_etr_buffer(struct coresight_device *csdev,
 		return NULL;
 	}
 
-	etr_perf->pid = task_pid_nr(event->owner);
 	etr_perf->snapshot = snapshot;
 	etr_perf->nr_pages = nr_pages;
 	etr_perf->pages = pages;
@@ -1622,12 +1618,6 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 		goto out;
 	}
 
-	if (WARN_ON(drvdata->perf_buf != etr_buf)) {
-		lost = true;
-		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		goto out;
-	}
-
 	CS_UNLOCK(drvdata->base);
 
 	tmc_flush_and_stop(drvdata);
@@ -1707,7 +1697,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int rc = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
@@ -1720,35 +1709,15 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 		goto unlock_out;
 	}
 
-	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
-		rc = -EINVAL;
-		goto unlock_out;
-	}
-
-	/* Get a handle on the pid of the session owner */
-	pid = etr_perf->pid;
-
-	/* Do not proceed if this device is associated with another session */
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
-
-	/*
-	 * No HW configuration is needed if the sink is already in
-	 * use for this session.
-	 */
-	if (drvdata->pid == pid) {
+	/*  No HW configuration is needed if the sink is already in use. */
+	if (csdev->refcnt) {
 		csdev->refcnt++;
 		goto unlock_out;
 	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
 		coresight_set_mode(csdev, CS_MODE_PERF);
-		drvdata->perf_buf = etr_perf->etr_buf;
 		csdev->refcnt++;
 	}
 
@@ -1792,11 +1761,7 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
-	/* Reset perf specific data */
-	drvdata->perf_buf = NULL;
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95e5623ea881..d63fa60ecce8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -237,7 +237,6 @@ struct tmc_resrv_buf {
  * @shared_perf_buf: CPU-wide perf buffer shared by this ETR's owner.
  * @perf_buf_mutex: Protects shared_perf_buf and its reference count.
  * @sysfs_buf:	SYSFS buffer for ETR.
- * @perf_buf:	PERF buffer for ETR.
  * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
  *		retention (after crash) only when ETR_MODE_RESRV buffer
  *		mode is enabled. Used by ETF for trace data retention
@@ -272,7 +271,6 @@ struct tmc_drvdata {
 	/* Protects shared_perf_buf and its reference count. */
 	struct mutex		perf_buf_mutex;
 	struct etr_buf		*sysfs_buf;
-	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 };

-- 
2.43.0


