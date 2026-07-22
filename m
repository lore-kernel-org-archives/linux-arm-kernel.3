Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA91C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 04:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw+g8044aLFqtXGEWXTOBm0DvocPh9k56AtCHyZmPRw=; b=Kxx3WW/t7ohtxZi6yNpi3qp1Js
	MpvEUIFXXHqblN8eFHnAaPrSIG9VR8UQ9L51tYrXPbY6uuWfx18AOa9uQaXQJykUWjDnRxKjXgBpG
	BZSOJ2983T0e+7grbJPS1GVfYPMJ3Q43QF/duhXsZBo2hSE5GFdwaEJcK699a9QCY6wZNCIksBEqT
	DZSLJUrNhpn0xoXqwF9AP/dSs7zRSWNkeDNImIgABvXQkzQ1beAFOfSbR7nvzUV4Uft8XnRemAsBJ
	Gdx1vXBfg15SShvD+4eU5RKbnhGF0gUd5W8wK4NYZsv3dYyROyRHIlyGjViSAfNn5Ltgj9R4bwUGq
	xzw1q/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOby-0000000At90-3woB;
	Wed, 22 Jul 2026 04:31:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmObv-0000000At8N-3AEb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 04:31:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so27192205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 21:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784694669; x=1785299469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cw+g8044aLFqtXGEWXTOBm0DvocPh9k56AtCHyZmPRw=;
        b=PCGRVEiqVlOTHXnesuYDxiw746oBc8ff0FrwQka1yPLa1LIcvHnwQ2fGdBNmTYYCbw
         woLQjQxXuo+H2R/5RWg2UsnyPZSJIRhk1eBPS1uy0SPMqFQ/1RuAMA2xroCpGqsRqSwj
         WPLjak9LUiJHNtkJmZTWbaeNJm3j6LIH4KybJyb13zP/9yraicwAxWx2g3UWmvlLpbwZ
         YLX+iyc8NvyYHK9eB7Tn6/67sFpuJK8qs36n6oaGIeBrKXw9PN6879O3YZAXvbVhES8t
         iA6tix6sSRCME/GvizwB1egbJPakKQReZ2lsSBHNgV+1PvD4nmomdn5SxnKVR6xKzlN1
         JEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784694669; x=1785299469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw+g8044aLFqtXGEWXTOBm0DvocPh9k56AtCHyZmPRw=;
        b=DTFrfKrmY9HAEaAUuAA+VF61iGv6Ioi5OXDcin6hYHu0ooBkyaVnwEYk76RWrWo1EW
         tijJEl7FzhMwdhw/GQrRQ1XP3Mo8fu0WhJrkOOVGleNdDtbmzzco6erg+hTX/PlsI1/Q
         RsDl9Wipp4MevwDPfvUaTh2Fnz5xCR9QcM8DOn1W7CKYgode15E58XENmW0pU8Ukx1Dd
         hdwO79o1Efij9jvgrdz67Zfk/RU2n5i6FzjEPvGXNsEwFmT0vw8K8i6ZH86iLNxb8u7N
         QL2anKszyUYcDVDVhwii8+sVAt0tM9waBF9oa92LSXzINKr0bCbO4G4aFqQWfWjVZEx2
         bV9A==
X-Forwarded-Encrypted: i=1; AHgh+RrZ0jya81myfhfas8B/v0sTLhKcI0CRHwZqJ/+VRFaJ9my1Okmw7y5eQZNf02sJ58iohF/uDpEEFYCpCxYJKaOL@lists.infradead.org
X-Gm-Message-State: AOJu0YwlHE2wPJL6lK4fvO7jIAtgWxjZ+YbDu8epdiaNJJU1qmvqeRPL
	YUzuHzM2actmky4j+Hlqlb8fenCGdzjGg/D4dsDi1Ytl2SMtm8YqlmWF
X-Gm-Gg: AR+sD11fMd5mWaAGG/xyKjDtMLTyV6GyxeppgRFpbQ+a3SupSJnqjW2yPucQua2c4PO
	Q4GfiBP9n2slmGASj1o4bLSePDJdsbLO9Xqs8AQ15Kb4qo+nbAij5ptjODx/+Iz+5V+s7yM92ie
	yGvjFrRIKwREEseMaQyEPnVpfgb5+Om2u+EmpeFeZJdSWc767oH/L0XTRjDLdKiGp+f7JeRtO8g
	N3cIvopybX2Ig5wik0387MQf/N63pYMB7Ep7vIZn5OKzHISy5ugu86ZUipSSVBegf3bFdFVM6OQ
	6t/hucqLLaGIx7Wnv0epyFtwiLUia4R3zPVRyHkOu4h9QPIcwtbO9VMtfysGLs7RWwgypR+CuiA
	zvBxLxxSBc8AHcxubPTPa1AasZnXtqaMo37akrcCTzlE2EzzmF7fAQxo+Vd7Nsos+kMg5jbLP5G
	XnjdR2hY8q7dD2HY6Pvg8v5O57dE/Zchw1RdfI9opVkn5RJ4UfzPXpp3c70hW8Uaw=
X-Received: by 2002:a05:600c:8b16:b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-49569eb28a0mr35742605e9.11.1784694669049;
        Tue, 21 Jul 2026 21:31:09 -0700 (PDT)
Received: from localhost.localdomain ([102.187.228.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm161495895e9.7.2026.07.21.21.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 21:31:08 -0700 (PDT)
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
Subject: [PATCH v4] coresight: Fix scheduling while atomic in coresight_cpu_pm_notify()
Date: Wed, 22 Jul 2026 07:30:23 +0300
Message-Id: <20260722043023.6978-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_213111_862559_21A833BF 
X-CRM114-Status: GOOD (  17.36  )
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
cascade. On PREEMPT_RT, free_percpu() takes a sleeping spinlock_t.
Furthermore, any parent device in the release chain might also acquire
sleeping locks, causing a system crash in the atomic PM context.

Fix this by eliminating the get/put dance entirely in the PM notifier path.
Since coresight_cpu_pm_notify() runs with IRQs disabled, it is safe to
read the per-cpu source pointer directly under the coresight_dev_lock,
check the mode, and return the path without unnecessarily manipulating the
kobject refcount.

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d5..9461fac9f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1850,16 +1850,13 @@ static void coresight_release_device_list(void)
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
 
 	/*
 	 * It is expected to run in atomic context or with the CPU lock held for
@@ -1868,7 +1865,7 @@ static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
 	 * change. Since the build path has taken a reference on the component,
 	 * the path can be safely used by the caller.
 	 */
-	return is_active ? source->path : NULL;
+	return path;
 }
 
 /* Return: 1 if PM is required, 0 if skip, or a negative error */
-- 
2.34.1


