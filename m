Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B2AC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyGPsVw0MJSV96XCp7cxneDUGR8CvSyWL+Po087qX1c=; b=DRTVInCr/AbM6efJchUubQVw2/
	/IVOuCFE6on8K34N/VtV5/6yBWjL7P/DoAsV5ctH/5StImQUOlhJO0D9v2OtIkaEGFakAM4F4kQp1
	uXylpJ0Iz/4mfEwxNNyrePpTM4sdc7Z75Vy12wWaj67ayyMOKSN9FEsiVHgeQhD/6G1m/foKnBUtp
	YCiVKtTgJUKR8c9qXFElGvu2C8nKYAQTgtSZwvPyrxaABlMpygIeAM+yhw1kvbNyU/ElGhaBdUSVw
	LtQC3B+bRe6oq8m4XHG8bGqJ7VW1gmwNJz32ss3ecClGgSvxceeu/EIja7xO8GO3cbGtTPun+UXez
	w5iX+NjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTqz-00000000flW-0QWi;
	Thu, 16 Jul 2026 21:42:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTqw-00000000fko-0zxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:42:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso32042855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784238164; x=1784842964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyGPsVw0MJSV96XCp7cxneDUGR8CvSyWL+Po087qX1c=;
        b=GPLhXfYmKN0XFlKustle396iPXUW5PyMqmmN02oe4plNtOago09T7aljzkKlZKxwhj
         OmrXYK5DmIK1Fdicc9pypbty625FP77YqiIhTJ+5gSsXn8psduwn/hndC4V1Kt1Fc6HD
         XltcSvG6RZus3yRaZuW5Y8C2+fKZe91XfDYlvsL66w8+glmIwxFGmm/TNrIkMcLAAPFT
         fo7xvgIglc8+FGfu8kB4qlA53aU/gLS5IZnnxmsbp8Del+/xV+Y5JLmvPMFMjMyGfSMW
         bvJ/H4mEYCuIlYfP8RTfcbqgh6zK53t5qnnSxhzGrVpmgyEMTpbVQanreGV0crQtKRDO
         a9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784238164; x=1784842964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyGPsVw0MJSV96XCp7cxneDUGR8CvSyWL+Po087qX1c=;
        b=IxTNPcuMe7/tJkhjQG9a108Mk/X/OuH1nuVyGEmUiZAhVFbJAtJOZ0HKLleKiybpSk
         YLglkckpI/C7Pd15MliLwVUoMXho9VSQD3/RgnM4RjbXuxnTAelpzsFDuzsIm8fDzGCT
         To6iRMe00P6wVdWKQz6d6hUDfrWA8aZfp+q3j/JrgDLRIWy3fOmRhRvIkNfxEXMDOe2K
         Mw2HSFnPRDxYEYFDK3EmGYgutYxsS5c33djJkoNwjgZfqV6PjEmjb8wJStr8tLuNOMAq
         YLsxIVuBeLLsaIv0/FTHav9/YcXHdQYVwG0zkXHkzzM5PfaO0P3340QyDmEH/6r1XojT
         Fwzg==
X-Forwarded-Encrypted: i=1; AHgh+RoSHjpQvViFQCSEapFjxp01dl5UO/CZy29+Ok30WcDF4oLNmulnNTNZjngohq0kkBNOSf8WNysoxFa2fmZxJpF2@lists.infradead.org
X-Gm-Message-State: AOJu0YwKiWjo/jyUEAkMEp/rq1TmnOwMVS0AoOTzK4OH7REqk73mPH4J
	dAn+kCA7gpMCGR019GdOrZUQDtAJfBJ5Wp+tVMVCc3+caHW7FmCz7V3C
X-Gm-Gg: AfdE7ckMykcFzYvZBwP9z1CH2kq7EdsnazNL4DQQFXJ7sktuNqmksGOdqa3/JfrxoWN
	ZCVdHDmGpc0BFY7R2ugDWB+z0QzS5wq3RnFYnxSvZgmqmTpcP2KnGSa8ThN58csISyn2Gr7xbHF
	QO6fBLjK2x0t9qVIYhUWstMKgZISFbZp8gDxsPmuVvl48NKRpvoV0X1pcHVIREJyDmjOQo7Exny
	8GgDbUPdJz0nTQu8f8O9VTGjyZ2uhx4GKFXb3VDxtEf+Md9n78fge79mBPSc55jWSEz0/A2ABjb
	JT1GA8gLw+BGQw+LfthPoUC1bbK7QyIDE7GujEL8iAh5af+N3ckeUjH7Qz0VM7xFvlVZTTAB9aR
	YfDfT4hR3lHmCqAqWIt75coiZtdf0JPRK/vvv8rPw1hofHQ/p1LOyktFd5J8Ky1sJBEMDT1LJMk
	RkLtyFxipLH2Z6WPqlH4wxMIjZ4k0VBewmiE9IV/KQDxmUr+mqhzi3Iedaer8Brfk=
X-Received: by 2002:a05:600c:b8d:b0:493:bcef:565c with SMTP id 5b1f17b1804b1-49548391e68mr12720315e9.1.1784238164132;
        Thu, 16 Jul 2026 14:42:44 -0700 (PDT)
Received: from localhost.localdomain ([102.184.143.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47de7sm2280035e9.7.2026.07.16.14.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:42:43 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	coresight@lists.linaro.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	coresight@lists.linaro.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Subject: [PATCH v3] coresight: Fix scheduling while atomic in coresight_cpu_pm_notify()
Date: Fri, 17 Jul 2026 00:41:54 +0300
Message-Id: <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_144246_292769_2353787F 
X-CRM114-Status: GOOD (  18.20  )
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

Dropping the last reference to a coresight_device can trigger a kernel
panic on PREEMPT_RT builds due to a "scheduling while atomic" violation.

When the CPU enters an idle state, coresight_cpu_pm_notify() is invoked
with local interrupts disabled. It calls coresight_cpu_get_active_path(),
which currently uses coresight_get_percpu_source_ref() to get a kobject
reference, and then immediately drops it with coresight_put_percpu_source_ref().

If this put_device() call drops the very last reference (e.g., due to a
concurrent device unregistration), it synchronously triggers the release
cascade. On PREEMPT_RT, free_percpu() takes a sleeping rt-mutex.
Furthermore, any parent device in the release chain might also acquire
sleeping locks, causing a system crash in the atomic PM context.

Fix this by eliminating the get/put dance entirely in the PM notifier path.
Since coresight_cpu_pm_notify() runs with IRQs disabled, it is safe to
read the per-cpu source pointer directly under the coresight_dev_lock,
check the mode, and return the path without unnecessarily manipulating the
kobject refcount.

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 22 ++++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d5..713bcff53 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1850,25 +1850,15 @@ static void coresight_release_device_list(void)
 static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
 {
 	struct coresight_device *source;
-	bool is_active = false;
+	struct coresight_path *path = NULL;
 
-	source = coresight_get_percpu_source_ref(smp_processor_id());
-	if (!source)
-		return NULL;
-
-	if (coresight_get_mode(source) & mode)
-		is_active = true;
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
 
-	coresight_put_percpu_source_ref(source);
+	source = per_cpu(csdev_source, smp_processor_id());
+	if (source && (coresight_get_mode(source) & mode))
+		path = source->path;
 
-	/*
-	 * It is expected to run in atomic context or with the CPU lock held for
-	 * sysfs mode, so it cannot be preempted to disable the path. Here
-	 * returns the active path pointer without concern that its state may
-	 * change. Since the build path has taken a reference on the component,
-	 * the path can be safely used by the caller.
-	 */
-	return is_active ? source->path : NULL;
+	return path;
 }
 
 /* Return: 1 if PM is required, 0 if skip, or a negative error */
-- 
2.34.1


