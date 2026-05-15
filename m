Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14223CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCv0CI0Kl1FuQrwuXpQdkzXigJP0ZjntJ+UDakx/svk=; b=MaM7h15Qmuisbfr7ZSOcb4Jaan
	MITuigsFFRuX+SZp+CHlZ+60j9+kNGQwR30DEJEQJsWZ/vdyB9do8+2LIhhMsr/6rTn+6gGpNMZVu
	Wwx+7ZDou/LlYp/1ZMkewDI81HverfcPPO+Z4LgzUz1VFeQJWPbsbmuimqJoGbLFIlYZmNBIep3rQ
	3NHQjA/6VuYucanpyNJjgH713UjteZdebFwVCHSzFdQbxm4xOd6hWIEgjRkMC7hpP1XTYR40q7n3x
	assAoohXoeKz1usnrAG/kiRqXtTEG98sK5TfOoFrKjLtvsuanqwOYO7NokwUJbQZzLbOHBRDkwDx7
	P5hPu63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdZ-000000097jc-36zW;
	Fri, 15 May 2026 18:51:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdX-000000097iV-2gdD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:51:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13B52938;
	Fri, 15 May 2026 11:51:44 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6644A3F836;
	Fri, 15 May 2026 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871110; bh=nEThYjxyXyykIclpWYRqGDGlNxEOL1uDXknX+lMn2DI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l4dz5ys9qLkKpB3b72+w5fvhjxIzasy7E7ZqUIS6VQZ3kd/bH81890MV1RRHtt+aP
	 kr/EGDI5ZdCdDM/rt+jWMx8M6dTGlzoT8YNXiUOTw+cSTfrha2NYxlI0d9mfu/5ig1
	 sNXnuIatlxzNZ5jFBN4+ZUS0FLI8bqO9x8Ez3ufQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:26 +0100
Subject: [PATCH v13 03/28] coresight: Extract device init into
 coresight_init_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-3-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=2118;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=nEThYjxyXyykIclpWYRqGDGlNxEOL1uDXknX+lMn2DI=;
 b=YGUh2FBeK0ULBAj6h1ZX1UB+IjCvxwjG/4hZR+Zmft0712Ddo4wQMpy9KQyUDfvy3iy5ljs6W
 ak2eEZLUfs5AnlMHOA4mO/sgv28goRdZqVnxXvceFl+l9nbfXZ9KjSs
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115151_787090_07203A32 
X-CRM114-Status: GOOD (  12.59  )
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

This commit extracts the allocation and initialization of the coresight
device structure into a separate function to make future extensions
easier.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 256f6a32621b8e086d02427317e5d35d0f29a3c9..d5d18168b48125c91f556f3867f0719592f0ccc8 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1334,20 +1334,16 @@ void coresight_release_platform_data(struct device *dev,
 	devm_kfree(dev, pdata);
 }
 
-struct coresight_device *coresight_register(struct coresight_desc *desc)
+static struct coresight_device *
+coresight_init_device(struct coresight_desc *desc)
 {
-	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc_obj(*csdev);
-	if (!csdev) {
-		ret = -ENOMEM;
-		goto err_out;
-	}
+	if (!csdev)
+		return ERR_PTR(-ENOMEM);
 
 	csdev->pdata = desc->pdata;
-
 	csdev->type = desc->type;
 	csdev->subtype = desc->subtype;
 	csdev->ops = desc->ops;
@@ -1360,6 +1356,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
 
+	return csdev;
+}
+
+struct coresight_device *coresight_register(struct coresight_desc *desc)
+{
+	int ret;
+	struct coresight_device *csdev;
+	bool registered = false;
+
+	csdev = coresight_init_device(desc);
+	if (IS_ERR(csdev)) {
+		ret = PTR_ERR(csdev);
+		goto err_out;
+	}
+
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
 		raw_spin_lock_init(&csdev->perf_sink_id_map.lock);

-- 
2.34.1


