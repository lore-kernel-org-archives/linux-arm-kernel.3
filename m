Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FF3CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQfOvvpVeHu2haioKIlLlNw0O7AmtYvMNB5o/K0IIVw=; b=y8UAybxlUuMkLGQIJHq1hcpgLi
	xzrriF46QC0zRJAQrZ+kxWlBAaP23tfyaCR7JfXOhO9cX9uXddOeHv+u4nHZ6tiu2wysj9sKE2kHq
	pj4NPBtxmy3R6LrnEnUkQGA1Yk3N0sLR9nErznecS3a+UaYLPZEyafFbsbqNoTp26HP+vPNFQINvL
	aFLluVxeG+b5N60pzfPdHhJ/RJCQfsXTNE/xe3t9C0ReMkzicjTvc2kQnEXtmKVYUl1na1AmPZESn
	tm8B0L442ypX8niR0/0EFcIpJLxeLIgH/iQA8jA+B2Vq+k9JZpgtJ91uIDs3OJS7t7hJvKDwJAwCV
	69dbxN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nZp-0000000ARWx-3tlW;
	Thu, 25 Sep 2025 15:08:09 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nZo-0000000ARVm-06fV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:08:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758812641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQfOvvpVeHu2haioKIlLlNw0O7AmtYvMNB5o/K0IIVw=;
	b=TEvzXx6ei1B2c2+lW41m/X5MmbR4yRgiJMJajXSQOD3eyLHfhNLjUBheaWJ4BRRgKowzCF
	6vtBucMjyQX2Wg6Okh2aoaWddHg6oh+NOENuVQ9+jXEAx8Y3kL68YL4gw7q5J1T9TZ2yeW
	P4BVhqE1ZN/ZscO/zpB7S39g2BLxpf4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 2/3] coresight: Reorder coresight_device_release to match coresight_register
Date: Thu, 25 Sep 2025 11:03:41 -0400
Message-Id: <20250925150342.1845615-3-sean.anderson@linux.dev>
In-Reply-To: <20250925150342.1845615-1-sean.anderson@linux.dev>
References: <20250925150342.1845615-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_080808_198875_ED1E38F4 
X-CRM114-Status: GOOD (  10.60  )
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

To make it easier to determine where to add new release actions, reorder
the actions in coresight_device_release to be the reverse of
coresight_register.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v5:
- New

 drivers/hwtracing/coresight/coresight-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 022c8384b98d..305b1773cfbe 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1046,8 +1046,8 @@ static void coresight_device_release(struct device *dev)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
-	fwnode_handle_put(csdev->dev.fwnode);
 	free_percpu(csdev->perf_sink_id_map.cpu_map);
+	fwnode_handle_put(csdev->dev.fwnode);
 	kfree(csdev);
 }
 
-- 
2.35.1.1320.gc452695387.dirty


