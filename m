Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546CCFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMVWvA9xyXsjgbkZBaPUAoqxx3GYcECmUBRp5YX4PGA=; b=3FAUqP3gDESuJsPRe19yv+EZDS
	5jboVd22RBjIjZUMiiTfd9CR4egMoAGfQ4jNz0U9DVnrDRsA42TCP0LceTF25K6h2NpETXAWDQ6vr
	Z5zM6WLUVtcXfHLxgEfjxanTWzvtiVg8U6lIl0PLRRnj7BBFpKUW8wDFZRDwbe8UaC7JV0AWQNykK
	8bzS+ymPjE+JuwSIzwkuVCHbX1c6/hiP+6Z+U/Scg1KfbUUcyvo0I7dmPjGwMPj8vJRn60VXkkoN0
	zyJD0/LIZAfTOAv12VAk9n8ZAobKJHOU7csFYzRrZ7xcafnIUMvgIxRQT9mGK4EWZWyQAmoT4frSk
	LkUovo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHos2-00000002Pga-1h58;
	Tue, 28 Apr 2026 20:17:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHore-00000002PCY-3fLw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:17:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 943063295;
	Tue, 28 Apr 2026 13:16:55 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16B9E3F763;
	Tue, 28 Apr 2026 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407421; bh=ydGSxVs7029/nGMXlye2/Mws9V6mzCtDA5RxCjGimS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3Qh79FcFLY+WZHqhFshbyqDMI0ZEI/lttWBT2xTG/3PYcQvNakAhxiqIeYjiMCTb
	 CM9c94RV3iQrnX/hV0LEF1PLliKKXLnV1ZjnxWvTSbKpDkXNe8NW5m9UNtWwdEbQ8E
	 wxWd71AItpmxHq0RbICj7ttjf/+389AthdIPVSYE=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 09/15] firmware: arm_scmi: Refactor iterators internal allocation
Date: Tue, 28 Apr 2026 21:15:16 +0100
Message-ID: <20260428201522.903875-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_131703_146121_B22F33CF 
X-CRM114-Status: GOOD (  13.67  )
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

Use cleanup handlers to manage iterator data structures.

No functional change.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed tags
---
 drivers/firmware/arm_scmi/driver.c | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f167194f7cf6..66cb64c8ed3d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -1789,39 +1790,41 @@ static void *scmi_iterator_init(const struct scmi_protocol_handle *ph,
 				size_t tx_size, void *priv)
 {
 	int ret;
-	struct scmi_iterator *i;
 
-	i = devm_kzalloc(ph->dev, sizeof(*i), GFP_KERNEL);
+	struct scmi_iterator *i __free(kfree) = kzalloc(sizeof(*i), GFP_KERNEL);
 	if (!i)
 		return ERR_PTR(-ENOMEM);
 
+	if (!ops || !ph)
+		return ERR_PTR(-EINVAL);
+
 	i->ph = ph;
 	i->ops = ops;
 	i->priv = priv;
 
 	ret = ph->xops->xfer_get_init(ph, msg_id, tx_size, 0, &i->t);
-	if (ret) {
-		devm_kfree(ph->dev, i);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	i->state.max_resources = max_resources;
 	i->msg = i->t->tx.buf;
 	i->resp = i->t->rx.buf;
 
-	return i;
+	return no_free_ptr(i);
 }
 
 static int scmi_iterator_run(void *iter)
 {
-	int ret = -EINVAL;
+	int ret;
 	struct scmi_iterator_ops *iops;
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
-	struct scmi_iterator *i = iter;
 
-	if (!i || !i->ops || !i->ph)
-		return ret;
+	if (!iter)
+		return -EINVAL;
+
+	/* Take ownership of the iterator */
+	struct scmi_iterator *i __free(kfree) = iter;
 
 	iops = i->ops;
 	ph = i->ph;
@@ -1846,12 +1849,12 @@ static int scmi_iterator_run(void *iter)
 			break;
 		}
 
-		for (st->loop_idx = 0; st->loop_idx < st->num_returned;
-		     st->loop_idx++) {
+		for (st->loop_idx = 0; !ret && st->loop_idx < st->num_returned;
+		     st->loop_idx++)
 			ret = iops->process_response(ph, i->resp, st, i->priv);
-			if (ret)
-				goto out;
-		}
+
+		if (ret)
+			break;
 
 		st->desc_index += st->num_returned;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
@@ -1861,10 +1864,8 @@ static int scmi_iterator_run(void *iter)
 		 */
 	} while (st->num_returned && st->num_remaining);
 
-out:
 	/* Finalize and destroy iterator */
 	ph->xops->xfer_put(ph, i->t);
-	devm_kfree(ph->dev, i);
 
 	return ret;
 }
-- 
2.53.0


