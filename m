Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BFDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gind/qhf5hn6Qe1ik1J7KKbHaCs5Ph5sXxL9/gdiW0=; b=CvyBWbc5/7Deg2t7+xsOMbozas
	soEuP9kWthK/r8oIjeFymUT8wBRizw5fZhG/YozxusqhNVIJaO6Ppv8hcL+KC9MStA+u6cf7h/q0P
	SpGo3xsxRt5CipM0TsUgemuaGet3h3fNPtjg87AsCvQFozpPRmNl7hmWosqVY9hQI0bv7L5gaAxSR
	HtseVYHLiw7vxO1Z0VlWsc6ZEyrQLfSfrKauSoc3BtrXPyL09QNUjlkcGzayx3uJyPNoc3NCOy8xQ
	wLBmr/yD78TLT/xRv6dyzsSU3ok/pgQ24s53/bVa6sDh9Atx03CBMLb+fEEHH/B8jvrre3olE+1Fy
	Frfjd2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjKv-0000000Fuop-2tl4;
	Wed, 21 May 2025 13:18:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHixg-0000000FqHY-3hq3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398F31E5E;
	Wed, 21 May 2025 05:54:06 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCE4E3F5A1;
	Wed, 21 May 2025 05:54:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 2/2] coresight: etm4x: Refactor returning TS field
Date: Wed, 21 May 2025 13:54:06 +0100
Message-Id: <20250521125406.2594620-3-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521125406.2594620-1-leo.yan@arm.com>
References: <20250521125406.2594620-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055420_961981_E6348061 
X-CRM114-Status: GOOD (  11.22  )
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

As TS == 0b00 is a valid value, this commit updates to return the value
directly instead of converting it to -1.

Currently, only the virtual timestamp (0b01) is used, and other modes
are not enabled. Therefore, this change is safe for user space tools.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 8afcc553bb97..653cb4ce17cf 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2315,23 +2315,11 @@ static ssize_t ts_source_show(struct device *dev,
 	int val;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (!has_feat_trf(drvdata)) {
+	if (!has_feat_trf(drvdata))
 		val = -1;
-		goto out;
-	}
-
-	val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
-	switch (val) {
-	case TRFCR_EL1_TS_VIRTUAL:
-	case TRFCR_EL1_TS_GUEST_PHYSICAL:
-	case TRFCR_EL1_TS_PHYSICAL:
-		break;
-	default:
-		val = -1;
-		break;
-	}
+	else
+		val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
 
-out:
 	return sysfs_emit(buf, "%d\n", val);
 }
 static DEVICE_ATTR_RO(ts_source);
-- 
2.34.1


