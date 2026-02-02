Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3C2E7314F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAvmKi3hsvzW6nv7LkB68RadxFUbuCEDMZYs46lHvL0=; b=Y70/Yc7Sg2AC2loKDMr8R1Gltv
	wqdEjlEkmcJEHEaPW3Q3VSZ0slD7CZe+GAJ7dAD7TjaQUq2wo6AznBbCOLYz4l0HUyBROR+McJaYW
	F4TXUwwUg0bzhM4x+IfhlzvQZtzqbffVAB6Ts/g6iz44K1HaEkWrv7Us8Wh8ULoBi7PbDi/E82y27
	fTJOU5sIwn3CxK8c/VLRsamEp7mFt80Ei04A71muTDLeOlojwUjwPnRLtyb410Tx/0i/4aeI/EFwN
	bocjBRfNz48ZSayciQIhK4KD59NQL0rm9TvCWANjpynzN47ccZd04hRyiNwzftyYFuS9YNaDpL5Rv
	dHXPnVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKG-00000004iD9-2C6V;
	Mon, 02 Feb 2026 09:34:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKE-00000004iBX-0e9N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:34:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29F111042;
	Mon,  2 Feb 2026 01:34:22 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D10323F740;
	Mon,  2 Feb 2026 01:34:26 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 02 Feb 2026 09:33:58 +0000
Subject: [PATCH v3 2/8] coresight: Get parent device reference after sink
 ID map allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-arm_coresight_refactor_dev_register-v3-2-03292470c48c@arm.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
In-Reply-To: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770024862; l=1925;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=v8hOuJQdDEBlD38eo0j6UUmixknMHjP9NrjDN5honac=;
 b=39gG8zfb/u0JQBGcXycJFnHkZSrdZIxTXtEGyVbFS9tF1UoGCLnXJmORQz4LWcCynvinC2KsA
 d3f5ZaKXiz7AepG8eMGypxPTDNSwGEtImjS40+PYO61YNho7+bjEx+i
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013430_241227_5D5D5401 
X-CRM114-Status: GOOD (  11.88  )
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
index fe345832c4564bd55b39ca8bcde0a93afdc11a68..26e7ab4005413ab5c59f3ca663b92a681263b488 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1349,12 +1349,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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
@@ -1366,6 +1360,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


