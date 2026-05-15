Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C2CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGKIJQb7w7xvo/TRcz5DzFYC+n4j9yCq8XYWp30aA9k=; b=aeH7jWpiArLf2F8XFryGwbOJpY
	RNWDKVhMWxK1cTqY3T76lxn4HmtNgzpUrqEAcwsByZb4rMHOtS9wVk6Uejx8i9k/TM2beXd3Ga2h1
	51VtmmQbzXjJnVAoKBdfBCXPUXxW/3NMuIGikyeRQgQp324Rw3A+dOtXvzUHuj15pAM1lLninRHbx
	TGyuCP7eWxgHRnWcMr3Mmi++TVhi1Xw5GQ99YpywFY3uXXj1v1FPos86b7tbFm27FQzX+8B8w3rzY
	//3gd7MVFzkxGcJgVqP7jl74dhBtBt1zDVYwFFhQCofgpzt8mzrA6yh1kt3pt7LL9qfnHGuIjykU7
	VYEOxZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyq3-00000009ImC-4AMh;
	Fri, 15 May 2026 20:08:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyq2-00000009IkE-0Ctk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:08:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E55735E8;
	Fri, 15 May 2026 13:08:44 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 822663F836;
	Fri, 15 May 2026 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875729; bh=Y7276TTqr81siwojCSq5dvxF2Jzo32NHuSt498CKV2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C3jToaWrJdm8ElLY794fhK6hB76aSy/IlOHkD1pX1XqPRES765dVOGY5InykSxupe
	 4uSxxntFUUT6Jb56nxHmM3JbVjXNVreUzwjcJD/FycgS7wFsK2SzpemaF35tRY19rp
	 5/8lnMPmshh/LKPQptVqLZ7N+Fum6nSAKZPCJxOE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:15 +0100
Subject: [PATCH v14 08/28] coresight: Take a reference on csdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-8-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=2651;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Y7276TTqr81siwojCSq5dvxF2Jzo32NHuSt498CKV2Y=;
 b=xxpqE+UjW9JFe4LXCs9AIpzs54FGNztS9wpH3LhdPFSIdCOClHCTDxv8QU2/soO9o8mByabAC
 i2xmZ+bQA3YAWMCO7B78YNI8iqhIJvY1yGWo8FZmZuIRTUcYwgLN9lZ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130850_217158_AF5BB117 
X-CRM114-Status: GOOD (  17.53  )
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
index 3fc6a5db778c89acad6ee05fe15ec0b8b8dab6bc..6b098c3cab0b8a710863bceb2c5f9584ad0bd8af 100644
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


