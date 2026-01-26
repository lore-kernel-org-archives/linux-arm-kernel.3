Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D54AD13C13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEvi21V0D5eCZvB2KkX5BtkV9qH1XBQsRblLwFrrLZ4=; b=2X09R4XDmAMk4CZaUTlwC1W8q/
	Ch8LhLXIyQY31BwR8Qb40jRpuuemnCOPzgKsc2k70W22oGOWQiRNOw/D6XoCbdwqb8NzPN/gP/XhQ
	pAdi5KoKB9y7/VwMbcKsVhsxEOHZaCGR8sNDXvdDO/CKNaRFUEnTP+rREP5znIxuyJZ6eaNRTYc2f
	8decZIr4acHrlShZWGsnH8Ib7Tp1hSz9xfOUwuN8MCuPiZzmxIV68fjzP+/zeICzcQVLp/Go9+U8b
	/Tm0TwyDnhl1WAMJfAPcnbGKksDe2LfIciNnPeOPomwO1x65lB3qtyqVp2ASgLg8eNa0hPMwr5OI0
	gFZLNqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1J-0000000Ce84-2HwW;
	Mon, 26 Jan 2026 13:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1H-0000000Ce6z-34od
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B44911515;
	Mon, 26 Jan 2026 05:52:36 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FA5D3F632;
	Mon, 26 Jan 2026 05:52:41 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:02 +0000
Subject: [PATCH v2 2/8] coresight: Get parent device reference after sink
 ID map allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-2-b5a3c0441c15@arm.com>
References: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
In-Reply-To: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=1925;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sU9u6OCx/Fy2Hv6Til4Fd08SgN9HV1pojJ6aLoovuyk=;
 b=nTeSFJqqhHh7Q4Jhm630XBz7DPukiHgXZaCTrQgI4Aoosj8Dr9ElkKoO0p2xadl4zHsBT1Gw4
 WkV/K7PILW0DtJ/OE1OZLtas74C/k1I5EUxeqllmJAheGQYp+5dFNRC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055243_830991_4CB444BB 
X-CRM114-Status: GOOD (  11.74  )
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ed304f292b7b02e89c59053d43f88fbf663cc993..6f21925a4913330a27db5d5836f34f13382339e7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1346,12 +1346,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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
@@ -1363,6 +1357,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


