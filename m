Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8026D13C16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wOgYg6dSlbF5PQOgWg2l8ztibEzT9w9d5o6FwbZtmU=; b=ip+q6jeCryFns/wrDySFb0tYx5
	Py62HNPamWf0agky4ZuyWruBHJ1HqzEHLZ9iBB1Smk3xs1ccE9D3KLD/OX+68T7oXqKU+zIl2YRWY
	otf+1v7vtDEgI3uTth2Y7O/FZKUTmSTaCe8cnfub0XvUj5IUMONFarHvnHy9s6fZxs0p8MKTcbGUB
	4eej5QSwwJ6hsn5RtxZf4me2L7aAYXjiSLWRLEg4PkyZe/tPrnQVj48fsI0uXsNjx3KEQqJQCJLgp
	vql/Wsr17aOfJRBpE326/OvNcO+hI+zNdY0zKBnQ93wkaqIhjBXGOJd+5MAuCxxV3/UURnWBWnnOV
	XSc8Pr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1T-0000000CeE1-20Qg;
	Mon, 26 Jan 2026 13:52:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1M-0000000Ce8q-0DuC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5517497;
	Mon, 26 Jan 2026 05:52:40 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DF9F3F632;
	Mon, 26 Jan 2026 05:52:45 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:04 +0000
Subject: [PATCH v2 4/8] coresight: Refactor output connection sysfs link
 cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-4-b5a3c0441c15@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=2578;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Yx67cjs2cf0XAe2qC02YFJDT5Ny84ezsmzyaa1leZa0=;
 b=Qsv0X14SF597vYl1GbtGUCKn8Zl/U+nnLWlEWitqNlHe7mEkAXDi92Sbo6Ojym0igyOwsZqLs
 HJ67qR8+9h/CT0vYNNkKo0BiK0b0HaUSrsTP0zbANzIdZduBMCt7+7q
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055248_231175_85A4FED9 
X-CRM114-Status: GOOD (  15.31  )
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b992ef5de8ddbd535e937c616bd7ab663f097f76..b4b87b3e0a608a1df19d81ba796d4db7d01290f5 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1149,7 +1149,6 @@ static int coresight_clear_filter_source(struct device *dev, void *data)
 	return 0;
 }
 
-/* coresight_remove_conns - Remove other device's references to this device */
 static void coresight_remove_conns(struct coresight_device *csdev)
 {
 	int i, j;
@@ -1159,10 +1158,6 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 		bus_for_each_dev(&coresight_bustype, NULL, csdev,
 				 coresight_clear_filter_source);
 
-	/*
-	 * Remove the input connection references from the destination device
-	 * for each output connection.
-	 */
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		conn = csdev->pdata->out_conns[i];
 		if (conn->filter_src_fwnode) {
@@ -1173,6 +1168,13 @@ static void coresight_remove_conns(struct coresight_device *csdev)
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
@@ -1303,9 +1305,6 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 	struct coresight_connection **conns = pdata->out_conns;
 
 	for (i = 0; i < pdata->nr_outconns; i++) {
-		/* If we have made the links, remove them now */
-		if (csdev && conns[i]->dest_dev)
-			coresight_remove_links(csdev, conns[i]);
 		/*
 		 * Drop the refcount and clear the handle as this device
 		 * is going away
@@ -1421,7 +1420,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	}
 
 err_out:
-	/* Cleanup the connection information */
 	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
 	return ERR_PTR(ret);
 }

-- 
2.34.1


