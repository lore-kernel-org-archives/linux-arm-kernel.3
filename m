Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E457DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tyXrArSwq4oxHBw63ecbkMrREdwE/zKR5hCuoo7D8w=; b=CzonC5QUX2JwP46qdbKdL7u/kJ
	MpV3raPcmutvAMoh1Nj0dsAxrSII+d3L7QiT4smw7/kWQ48fKheLj8AAXqwIEemSGLEcq+KrfIvNq
	+JO+/CcLZfi5d+OrenCS8toQ3ZnfFb2qZMAPiX+lzuC67thBl0jXWyTaPS3X9Fqdz7JLk9Ljm5BVx
	ZscYt+t0FsezWA3En4EDcXKKoquSEIN9QEeTsbVr3Nt8fdFLqT+MVFOaEqpsR2ESb7GPeQmV8MpdE
	Gjj0LS4xjnFoTvqXFjL4JIdYPLIvWfXfail1n/HppY+n+Kl/iewUPWfu6UCLkaVDUMyi8afvxpFTK
	lONzwV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVer-00000009yJl-1cNZ;
	Mon, 12 May 2025 16:05:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVHP-00000009ubw-3fkp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:41:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 729F21F60;
	Mon, 12 May 2025 08:41:12 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 136433F63F;
	Mon, 12 May 2025 08:41:21 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 3/5] coresight: Explicitly use the parent device handler
Date: Mon, 12 May 2025 16:41:06 +0100
Message-Id: <20250512154108.23920-4-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512154108.23920-1-leo.yan@arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_084123_959914_4E04449D 
X-CRM114-Status: GOOD (  11.29  )
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

A CoreSight device is present on the CoreSight bus, and its device node
in the DT binding is assigned as the parent device.  Comments are added
to document this relationship.

The code is refined to explicitly use the parent device handle, making
it more readable and clearly indicating which device handle is being
used.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3eacdcf638df..4f51ce152ac7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1313,9 +1313,13 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->access = desc->access;
 	csdev->orphan = true;
 
+	/*
+	 * 'csdev->dev' is a device present on the CoreSight bus. The device
+	 * node in the device tree is assigned as the parent device.
+	 */
+	csdev->dev.parent = desc->dev;
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
-	csdev->dev.parent = desc->dev;
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
 
@@ -1334,7 +1338,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	 * Hold the reference to our parent device. This will be
 	 * dropped only in coresight_device_release().
 	 */
-	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
+	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(csdev->dev.parent));
 	dev_set_name(&csdev->dev, "%s", desc->name);
 
 	/*
@@ -1393,7 +1397,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 err_out:
 	/* Cleanup the connection information */
-	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
+	coresight_release_platform_data(NULL, csdev->dev.parent, desc->pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_register);
-- 
2.34.1


