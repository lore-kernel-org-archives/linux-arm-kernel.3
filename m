Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349D6109C021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnVn1/UelPfQQ/cXU4e4iD3eF88+guYCCQIhBrlqIxc=; b=zQlWzX/vxrJyYnjzda+3R2fwTG
	d8ahdtFGqysT5KrwnifIE9sUoJ9ewbUJa1Chs7RgDAjPIRTtB1KvD5N+5/I5Ryha8w1j6eKhsPktC
	QED/fk2A52s/PFAb5Wx9d6ulkEO5FJDjfn/LZnLjeRonkrk6pib6n3riFL051TPy2YTMH137p3iZj
	5LMlw+4/OLuTh5dhLElB/6cGYQPyTqJxo7i5WyuQML7eYwE77JIupLxD462oCu6rAZ22JCtzQo9vB
	SPLazfAHkoU89Y5u+x69bBv/HeJnEs1XxqE1WWY93lXxD7g8TcMB2hz+venA1tQl2+0Mpe78tpTD6
	HyrpbNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCK-00000003ZZc-3hsM;
	Wed, 25 Mar 2026 14:27:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCI-00000003ZY3-0Jcz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 693ED1F91;
	Wed, 25 Mar 2026 07:26:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 783373F836;
	Wed, 25 Mar 2026 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448821; bh=CXxPMbkuhATk7HA5wuKJKDvEUXhBsXiCKogSkd2polc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h8awNPBRELrZAIqNgQkYjEvDbKPLz3EDndjOLSGOeedtkXurri/em2HyGqnItDg9y
	 vZg/dMrO0/kE7l3qBnkANXE1Vensjh5pyE/OBbvWUtOT9FPlORuvLO7qHn+3NB1yrv
	 LUJuR6UQ46M6gi0rnW6JLgoALSg2cuB/ayZrDRPc=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:38 +0000
Subject: [PATCH v8 01/23] coresight: Extract device init into
 coresight_init_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-1-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=1956;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CXxPMbkuhATk7HA5wuKJKDvEUXhBsXiCKogSkd2polc=;
 b=VA5yTYnMOLtkBwz3h47MzjVfAhl+QH99e50R5SuF41lWIRGjjZg2SbPE1ccJqe1ujBJi15JzG
 F8nti+xdKq2B6o5KH9MX60PowbFaOXijRX4KioLS0chjKojRRLdYUe0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072702_243169_37C01433 
X-CRM114-Status: GOOD (  12.75  )
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

Use a new function coresight_init_dev() for device structure allocation
and initialization.  This makes it easier to extend with additional
initialization operations in the future.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf64a97b9353b84ba5b76b991676f5f..5452de9367d450de399a2107016c3fddb894fc82 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1322,20 +1322,16 @@ void coresight_release_platform_data(struct device *dev,
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
@@ -1348,6 +1344,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


