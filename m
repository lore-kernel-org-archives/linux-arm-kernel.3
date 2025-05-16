Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F744C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+U2SbV6tX9mNCW8CugrsjUBwhy8AUBXb7iVTJdIbSU=; b=K4fAq3qCjwOYaUl1GMsH1ydxAG
	U2PBBHTEQ1XsTkuviyssMgPBJvFdeI9GHjiCgEhUOnEvfTZsg8r/rJv5e1MYvhOxcWJcR7wp12PHY
	AGIy5s5E+RrYiS3N9WU25yHY3/7+0WCh4tGtNf90e/otvNEmOV0ZrAeEBcrO/5hX8gXKXuwysu6es
	3zFR52zcFotNNbTPxzNL1bYaj5Sdsvxo0Zwp8Lj+irj+0n3KVaBDfaC0appkhssBStq6hfbitYHB7
	qvWJh9RCxUH6NW/un2Xhx1mEejWsSdAqzMsi8eAOM5IEZ0rqgBnEIVmbItp5O5/Ek48Gd8EaD+1m1
	SNtgyArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyEG-000000043NU-00PK;
	Fri, 16 May 2025 16:48:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbR-00000003yS2-0Yit
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:08:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 630F3169C;
	Fri, 16 May 2025 09:07:52 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 479563F63F;
	Fri, 16 May 2025 09:08:03 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 11/11] coresight: Manage activated paths during CPU hotplug
Date: Fri, 16 May 2025 17:07:42 +0100
Message-Id: <20250516160742.1200904-12-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090805_212342_A3F4EF11 
X-CRM114-Status: GOOD (  10.06  )
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

This commit handles activated paths during the CPU hotplug process.

When a CPU is hot-unplugged, and if an activated path is associated with
it, the CPU PM notifier disables the path.  This helps saving power,
especially when the CPU is expected to remain offline for long time.

Note, when disabling a path, then sink's disable() callback
automatically updates its buffer SYSFS mode.  Therefore, there is no
need to manually update the buffer.

During CPU hotplug-in, the previously active path is re-enabled
accordingly.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a1fb00dbdb55..445908e61d8a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1716,6 +1716,7 @@ static int coresight_starting_cpu(unsigned int cpu)
 		return 0;
 
 	/* Only support SYSFS mode */
+	coresight_enable_path(csdev->path, CS_MODE_SYSFS, NULL);
 	source_ops(csdev)->enable(csdev, NULL, CS_MODE_SYSFS, csdev->path);
 	return 0;
 }
@@ -1735,6 +1736,13 @@ static int coresight_dying_cpu(unsigned int cpu)
 	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);
 
 	coresight_disable_source(csdev, NULL);
+
+	/*
+	 * Here, it calls coresight_disable_path_from() instead of invoking
+	 * coresight_disable_path() to avoid cleaning up the path pointer
+	 * in the coresight_device structure.
+	 */
+	coresight_disable_path_from(csdev->path, NULL);
 	return 0;
 }
 
-- 
2.34.1


