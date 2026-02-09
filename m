Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EABE81BAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxF41h1xL8BNS5PlAMbDTGKdL4PHxrgmoHAK71Y+Wtw=; b=kA5wqFKgiPsri09wTPgVf1ZjmI
	WxCWuVQLqqay6do0J35lXaMKNcATbyXfapnt748uaoZFg9SnRdxxJ0HLJ+ePjarnO/vXBmmNmgCIR
	pHH3dApBkFMrX3ZFGRmkujzwUTsPFP/e69Y/TeY1qpZRVN/gVNv2lkbrHUaHXLZVjyIHQ5Q6xUqf+
	EUFTTohQ+eNuIoeOuhquMfWuTgdtmyzL+6EiEERJ5da7N/Et/L21W7j3SdE7lEGUZbOcewu8TunZV
	qn+nIoZ3Iop1wKoEp+ZcOx0r4EvNIDe3U6F33QRCUmNsExAjWxB4t0OtecaISX34ET5QBXIcFD1JP
	FX65GkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdV-0000000FNOc-1jkk;
	Mon, 09 Feb 2026 12:45:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdR-0000000FNLm-0e8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:45:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44176339;
	Mon,  9 Feb 2026 04:44:54 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8F233F63F;
	Mon,  9 Feb 2026 04:44:58 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:36 +0000
Subject: [PATCH v4 4/8] coresight: Refactor output connection sysfs link
 cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-4-62d6042f76f7@arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=2629;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0BVGBg6d33Awn2mw01YUWbBB/6WKd5fYtSeWWsOZfMQ=;
 b=FiSSHlFmany0fDyo3NevpVBqNw1wgU2jrjaesLo+t9Iu8DZBxT7Eq364TSWKFokt5JzO5eQKj
 XczHH9VKczZBE0dknYSCNs67NjpoOQaOnrZxo65O3wWgIF2le1x1I9Y
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044501_390403_A7DD0B49 
X-CRM114-Status: GOOD (  14.85  )
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

To use a central place for releasing connections, move the output
connection sysfs link cleanup into coresight_remove_conns().

Also update the comments accordingly.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5aa178b4def336770ae2b7647372174345564776..4b2cc1806c4f9cdd8a22dbce930973aef41f00c6 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1152,7 +1152,6 @@ static int coresight_clear_filter_source(struct device *dev, void *data)
 	return 0;
 }
 
-/* coresight_remove_conns - Remove other device's references to this device */
 static void coresight_remove_conns(struct coresight_device *csdev)
 {
 	int i, j;
@@ -1162,10 +1161,6 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 		bus_for_each_dev(&coresight_bustype, NULL, csdev,
 				 coresight_clear_filter_source);
 
-	/*
-	 * Remove the input connection references from the destination device
-	 * for each output connection.
-	 */
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		conn = csdev->pdata->out_conns[i];
 		if (conn->filter_src_fwnode) {
@@ -1176,6 +1171,13 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 		if (!conn->dest_dev)
 			continue;
 
+		/* Remove sysfs links for the output connection */
+		coresight_remove_links(csdev, conn);
+
+		/*
+		 * Remove the input connection references from the destination
+		 * device for each output connection.
+		 */
 		for (j = 0; j < conn->dest_dev->pdata->nr_inconns; ++j)
 			if (conn->dest_dev->pdata->in_conns[j] == conn) {
 				conn->dest_dev->pdata->in_conns[j] = NULL;
@@ -1306,9 +1308,6 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 	struct coresight_connection **conns = pdata->out_conns;
 
 	for (i = 0; i < pdata->nr_outconns; i++) {
-		/* If we have made the links, remove them now */
-		if (csdev && conns[i]->dest_dev)
-			coresight_remove_links(csdev, conns[i]);
 		/*
 		 * Drop the refcount and clear the handle as this device
 		 * is going away
@@ -1424,7 +1423,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	}
 
 err_out:
-	/* Cleanup the connection information */
 	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
 	return ERR_PTR(ret);
 }

-- 
2.34.1


