Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F02CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BK4wBQ8VTG5a4IrHwT1dI5i7K42pvKSxS3bq5lY6bkk=; b=3o/9MGsYwNgI381kzpFlZtW9gh
	aNu+ke4Al2n1W56g1fNy6wjUNwO+lAg2Pyv1EdEIoHcvXImWZSzdx0kY1CCMCVmxlZrLVFnuuQjc8
	ElJA7uqdGvUEfPYcGihL+/aHf/ESegFsIaQniRVrcx0UiPaTUvjPBK2CejJf5KBVLEZsRbdtIo6EK
	Snc00IsMi0U2/52bIMrvGGWMZHW2twMgnLA/uD5zeKhAqv68NF+xEN5VySglPchP/smOk5HmqISzn
	/onDRuApjdYAJGtIFfXgbhygiL9+ymDdQj4KUr7X9RYQli1ICuyKKRJBtRAKsxB7Dnui4kkw3c/27
	w8Rp/heQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2X-00000007R4w-036D;
	Fri, 01 May 2026 16:48:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2T-00000007R0z-44C4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFA81692;
	Fri,  1 May 2026 09:48:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09CAB3F7B4;
	Fri,  1 May 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654108; bh=10/aYKaIleOdJEK3jx78UJpGfEngf8thScNNkOludWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f96ScrJhKARSCye5aImSGfqrmTIyUHgCLGqxHv6HwUFnffY1Ja8pkvryfA1ezJPjD
	 f3WUhbh7xylNWZH+nmdwbKT/U9lrkM/xGqkevjhXJSvGAdvGUBq+2sOMCp+qLl8Ua4
	 yKe5s97Ak2KMz/43SXKKfPoA+WVpl1duKkdPny/Y=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:48 +0100
Subject: [PATCH v11 07/27] coresight: Take a reference on csdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-7-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=2134;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=10/aYKaIleOdJEK3jx78UJpGfEngf8thScNNkOludWQ=;
 b=vYXcVcSCAXvkfEYD0QZpyKIwfTEAbXDORlbk89JoIeTQDRjFG+OCC0R3LXzEcgwVa0kOK/YRd
 6/MwM2d3TqABgh+owGf0wBCcQerRwhi9UqS6ibCM6eZarSgKGeJAUR0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094830_139011_97604FE4 
X-CRM114-Status: GOOD (  15.90  )
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

coresight_get_ref() currently pins the provider module and takes a
reference on the parent device. That does not pin the CoreSight device
itself.

A driver can still be unbound while the CoreSight device is part of an
active trace path. In that case coresight_unregister() may release the
coresight_device while the path still holds its csdev pointer.

Take a reference on &csdev->dev when grabbing a CoreSight device and drop
it in coresight_put_ref().

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5519d323f21f38d719b9030c7d77a9a61948ba1d..1a389f63ed006e054dc6bc9764f8be8c1def9da1 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -651,14 +651,18 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  */
 static bool coresight_get_ref(struct coresight_device *csdev)
 {
-	struct device *dev = csdev->dev.parent;
+	struct device *parent = csdev->dev.parent;
 
 	/* Make sure the driver can't be removed */
-	if (!try_module_get(dev->driver->owner))
+	if (!try_module_get(parent->driver->owner))
 		return false;
-	/* Make sure the device can't go away */
-	get_device(dev);
-	pm_runtime_get_sync(dev);
+
+	/* Make sure parent device can't go away and is powered on */
+	get_device(parent);
+	pm_runtime_get_sync(parent);
+
+	/* Make sure csdev can't go away */
+	get_device(&csdev->dev);
 	return true;
 }
 
@@ -670,11 +674,12 @@ static bool coresight_get_ref(struct coresight_device *csdev)
  */
 static void coresight_put_ref(struct coresight_device *csdev)
 {
-	struct device *dev = csdev->dev.parent;
+	struct device *parent = csdev->dev.parent;
 
-	pm_runtime_put(dev);
-	put_device(dev);
-	module_put(dev->driver->owner);
+	put_device(&csdev->dev);
+	pm_runtime_put(parent);
+	put_device(parent);
+	module_put(parent->driver->owner);
 }
 
 /*

-- 
2.34.1


