Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F37CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r58PifJ+YkfL5Im2AVWKaoNoOzTZzDOWfPzCP2YVjBU=; b=JUm+QEnUMTjEth89T1aMqpzdNj
	IObxz/7i+Kh4xEA+Cd2xm8yutDt2Gfl/H8XZSdusOcatPk931LcrRB9Q+nd9zRvKeJ5UgBNMFDhS/
	ps3NRrjO8vNc5nz1QqH3iEBjSoE99azleO3MKRknr9jhLxxD0ErDgFsxW9dx8IFMC2DRqez3Jz0SJ
	FGHUrRLoYPbQDVgnJkhd3JdgWcKoX2kiI0yX4S3FRuHRKnZvzx8AGfRPl76l06knhrLIQgjIyhkB0
	QCCwmoNIbIwiu6SSVQBiz8efD0lBTLtnFsKCaOqCm65e6EGPwoUEJViHu1KwgR0u5kgiUrPTBl5zM
	rzLoOkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2I-00000007Qqi-13Sh;
	Fri, 01 May 2026 16:48:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2F-00000007QoZ-0UVr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2BF11692;
	Fri,  1 May 2026 09:48:08 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19E23F7B4;
	Fri,  1 May 2026 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654094; bh=G34i7Yc69gRZN4Tqzu1iY8qu2CzYPW3lOWWICcWvd7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZmRDc8YS4gSPSV5psKI/q6922lhNrNrbs7UEif6rnbEm/bSXuEexZZwbe1Clbcj4P
	 nPzvpaODNByVwSlV4/pqXHgsNJsnD5AvnWkO+QeGLZiot3lhPfSHmA8aC6DFhPkURE
	 F5uigy0qjGn1wd9thXF4X8XOO7PasiH7mz0hRPcA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:43 +0100
Subject: [PATCH v11 02/27] coresight: Extract device init into
 coresight_init_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-2-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=2118;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=G34i7Yc69gRZN4Tqzu1iY8qu2CzYPW3lOWWICcWvd7M=;
 b=nd4CopGuwq52qRudYVT02oBT6aBgnI6sJXoA/fkOWAGnAtAnoy2DL2KpLJZ6tmroLx8wmjSFc
 dm3aMQCVTokAfWPmdUKlgT1FTRsdk6kTuh0UIn4y/3mFEbwIRtux615
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094816_592711_56C7F2DF 
X-CRM114-Status: GOOD (  12.71  )
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
index ed17c36ad46ac4270abdfdf2a1a742faa6273097..48ea882bd10870a6be253ecf0b58860d7a4a0bb0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1331,20 +1331,16 @@ void coresight_release_platform_data(struct device *dev,
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
@@ -1357,6 +1353,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


