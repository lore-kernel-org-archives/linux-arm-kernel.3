Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F14CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IQCEDN+vpOj7MgsSzd1KHKQQ45Dw4FSuMf8xEfKc3c=; b=2N5kyNU6387fBp+UO+JAvZcQS8
	pNAeOHoiYR4bnVtoosKXq9MtxrKPX4shJENRFsTjmXHwIT6mHQGUmjp6ZI28p9uGb4z/0L4XU571N
	mCBuZSBcp8P0up9NcWSBIyB7eLvOkl6sNzv2Ot6ggmtBgw+MbNeNY1uGy9DIvjwF+a/Qj3pocHZgL
	clAO+GHIkK4ASiWBnqdCMqaCF0iiSF/Qq3fE89Z4rGcOSlwOlTmD033/T6VEo6Nt3pdsnp6ue3XlM
	iZJi2lxKp5NJAQ4z8bB2oIufgF3G/MsEgOcenbN9PZyZRqJv2Pvm8rJCXSr9DaBIDyrClXpJSFn5i
	2Fl2iirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY2-0000000DFKA-2k8c;
	Mon, 11 May 2026 11:11:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXs-0000000DF4u-1if3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7IQCEDN+vpOj7MgsSzd1KHKQQ45Dw4FSuMf8xEfKc3c=; b=jjxnfW1mifDikKuXSfpsTdIZ44
	Yq8usIrfQBwvuyrML88zXhoYAJmVgsqpHHwsZ7pfoTmjww+uQJkAWgSiO0AuMHn8KpRDK2Zq/rQoc
	dyKGhXwbMBbr8Q4oxFBHuSarKnc6Yr3FLmNvvwiXC2lUStaBlGF2BKjKv8VrCjgSPE60YaDeHnztk
	LPeDk4l7jBfYtGVlrJyJMrkgP0WnKcnt6dZXPZPV7ah9r0Fs51SIIUoWd5qmlHJO3xwfL83YWW31Q
	M2Pak90tTE74NXPq4YgapPU7yZNXdnm1ifwnio0wuAvAeUpCTTWOGZ5iUbW1oSXsBbfR1ANL8Hnrj
	YFaHjQJg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXo-0000000BQhX-3lUi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E281D1713;
	Mon, 11 May 2026 04:11:22 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321893F85F;
	Mon, 11 May 2026 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497888; bh=ZIYUWyLbTnydRrT9g6J/NVQmEZCFKZdcw8+ro+sH3MM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g3Sx9wHeAZ8s5wUD+TbB2KKr5/b7rTBIsVlkw/ryY3GpTZ6GEy5f/7MCPf2bpgxAQ
	 js1/qxV1hdu55eTKgeOQwK8zlx9j6ffa9hmWYTu9KIzBjrit8bjg/ExcVAPreKQixR
	 y6s6U3d2Ff2qcbEs7WUc0bl0trwDxU1sDzJ2UD6Y=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:52 +0100
Subject: [PATCH v12 08/28] coresight: Take a reference on csdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-8-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=2651;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZIYUWyLbTnydRrT9g6J/NVQmEZCFKZdcw8+ro+sH3MM=;
 b=ej2oYvS4p+r8w0Q21Xmb/SlqDYgvzJqW3jI1WPQvOFCZvwqX+R420SDvo3UichdCMck1DGiOe
 sSDv0v0f25LC2h5s+/JZZUWPN3lj411/F7w05+fpe9yAF7ICqWhs6bw
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121129_578240_F9970A0C 
X-CRM114-Status: GOOD (  17.35  )
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
reference on the parent device, but it does not pin &csdev->dev. Take a
reference on &csdev->dev when grabbing a CoreSight device and drop it in
coresight_put_ref().

Reorder the sequence to follow child-to-parent dependencies: first take
a reference on csdev, then on the parent device and grab the driver
module. Once the data and module are pinned, take a PM runtime
reference to power on the hardware.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 36 +++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5519d323f21f38d719b9030c7d77a9a61948ba1d..a3a03356c4e3729c530cd274f071500c4ae8d490 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -651,15 +651,29 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  */
 static bool coresight_get_ref(struct coresight_device *csdev)
 {
-	struct device *dev = csdev->dev.parent;
+	struct device *dev = &csdev->dev;
+	struct device *parent = csdev->dev.parent;
+	struct device_driver *drv;
 
-	/* Make sure the driver can't be removed */
-	if (!try_module_get(dev->driver->owner))
-		return false;
-	/* Make sure the device can't go away */
+	/* Make sure csdev can't go away */
 	get_device(dev);
-	pm_runtime_get_sync(dev);
+
+	/* Make sure parent device can't go away */
+	get_device(parent);
+
+	/* Make sure the driver can't be removed */
+	drv = parent->driver;
+	if (!drv || !try_module_get(drv->owner))
+		goto err_module;
+
+	/* Make sure the device is powered on */
+	pm_runtime_get_sync(parent);
 	return true;
+
+err_module:
+	put_device(parent);
+	put_device(dev);
+	return false;
 }
 
 /**
@@ -670,11 +684,15 @@ static bool coresight_get_ref(struct coresight_device *csdev)
  */
 static void coresight_put_ref(struct coresight_device *csdev)
 {
-	struct device *dev = csdev->dev.parent;
+	struct device *dev = &csdev->dev;
+	struct device *parent = csdev->dev.parent;
+	struct device_driver *drv = parent->driver;
 
-	pm_runtime_put(dev);
+	pm_runtime_put(parent);
+	if (drv)
+		module_put(drv->owner);
+	put_device(parent);
 	put_device(dev);
-	module_put(dev->driver->owner);
 }
 
 /*

-- 
2.34.1


