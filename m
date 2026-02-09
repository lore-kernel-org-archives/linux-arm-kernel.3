Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BBBE81BAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MVdha0LfcYaSOKTxcFYIbySA7S6FWS8Xzgq1dEeMGg=; b=JNpTM9bUwLErI1bLIfZItYFMXU
	0j8wJEO4z+Isplsx8SaPRCS/yHPUpdhGQbt3TP6M1fGzyHzrh8B55OF8KwLN1n0VkGleYvgZg7Q1h
	NXYrQ1PN9eriYXw1M+50yrhGIgfpv0ffUOFvfzNm+E73SjJQlfOgGpSOdZ/IsJFyi7Bi6iaIR95oQ
	HQxYvndHkWJg0EV6PoDJ0B52+puImTtylcfw7i7rjyIJWMlIf7qaY9DzX6CsXFgt23YxVbrvUx3lb
	03iZIkPztF9WBXE42/hGIbja+1JFAM1/X938ZvV+FXqsM8lq3Y+rixFRMV7YwRUVEbNZhjS7QdNaD
	AsBaAeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdQ-0000000FNLU-3B39;
	Mon, 09 Feb 2026 12:45:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdN-0000000FNK1-49fc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:44:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 230F3339;
	Mon,  9 Feb 2026 04:44:50 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAE913F63F;
	Mon,  9 Feb 2026 04:44:54 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:34 +0000
Subject: [PATCH v4 2/8] coresight: Get parent device reference after sink
 ID map allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-2-62d6042f76f7@arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=1976;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TEsVhJ4lI/atMUIZTzUK2SlDc8/a2LLTb/8tbDMHgnU=;
 b=EBVJjqlhh8Yi/SYaJQtiSCR5LWpixA5sij7w+Mcx1OH2Qt1s4Z3E9hOunc29mL3ay5V7t8bVo
 MYgV+09fqJhAdcXPiYR7p1zgC6wi12/j/vAKWkVApBk6uYI+LrD+aJx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044458_079769_74E75572 
X-CRM114-Status: GOOD (  11.37  )
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

The parent device's reference count is incremented before allocating the
sink ID map.  If the allocation fails, the reference count is not
decremented, preventing proper cleanup.

Fix this by incrementing the reference count only after the sink ID map
is successfully allocated.

Fixes: 5ad628a76176 ("coresight: Use per-sink trace ID maps for Perf sessions")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fe345832c4564bd55b39ca8bcde0a93afdc11a68..26e7ab4005413ab5c59f3ca663b92a681263b488 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1349,12 +1349,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->dev.parent = desc->dev;
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
-	/*
-	 * Hold the reference to our parent device. This will be
-	 * dropped only in coresight_device_release().
-	 */
-	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
-	dev_set_name(&csdev->dev, "%s", desc->name);
 
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
@@ -1366,6 +1360,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto err_out;
 		}
 	}
+
+	/*
+	 * Hold the reference to our parent device. This will be
+	 * dropped only in coresight_device_release().
+	 */
+	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
+	dev_set_name(&csdev->dev, "%s", desc->name);
+
 	/*
 	 * Make sure the device registration and the connection fixup
 	 * are synchronised, so that we don't see uninitialised devices

-- 
2.34.1


