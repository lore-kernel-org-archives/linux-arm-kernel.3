Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B700CD5BDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+Vswv1R2Tz2UKBGbYKEv/x6VkVIjOVOoaSGhBHgA4Q=; b=2ry5S8jZ8yMeGMO9eqKwAEkDRp
	TonYeJY747J/rt5ApVAg7Ee3dZi1x76eUCIzcgUujdXhz1UXYLGDBy3FacoPvbOSVE59yUtEdaond
	waLjMiv6a+hnMg6eAfCoI6nArvHLjQ+AVx8KNZnrUAKiTkYhRgRqwlIUhBhv90xb+tj76u3roAwBL
	ESPRD2sLcZTDgg/mTYO2YtF3yO4Rssu5tIkrKcl7IlnI/0xX8T+PWhda13Ac2xuTdQSQV5MF2Fo6G
	FuiFKIbi5nYnH4HT/zzS99lcL9j9A0vV2mqDOKc49xfLkVzugQYeD1iy9A3pqAJYgmvx7/7CskdFV
	hOZfWM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9w-00000000RKm-2vep;
	Mon, 25 May 2026 20:44:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9q-00000000RHZ-15zT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A5AD44360;
	Mon, 25 May 2026 20:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A21F1F00A3A;
	Mon, 25 May 2026 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741857;
	bh=Z+Vswv1R2Tz2UKBGbYKEv/x6VkVIjOVOoaSGhBHgA4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bT0Qgt0zAb0KsLCcdo3K73oAGfjqHaGzo8UpQ5WBZAr5im1Gc6TJv2Xa0+w/Nfmm0
	 44AMqqNFLReRN8zaPWC8ivEOfj0d4uofiXzrfvX8hc8SQDZHKY0WQiXRaedhCzsasM
	 jW4xgk7UtDa+VsB6/wdK66UWeaMkDn3ulpmj5ovTPec7l0pZ9RqMzR1U5xBIqwD6/O
	 tfthOCnPPgkVVzVF56zVQfT8bJck781Kl6YzXRpUqS6rqaI3eNTKjb8GKOi7wUPKrE
	 CYH7nRJauVd9aK+W6VYtt+O9YoYP8RcsPKEva1iKmmI5LWiqZ58mjtklNeDnA4xjgp
	 R01UccPls8+VA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:39 +0100
Subject: [PATCH v2 1/9] firmware: arm_scmi: Fix OF node reference handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-1-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_134418_346507_BC0C4135 
X-CRM114-Status: GOOD (  13.35  )
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

SCMI devices store the DT node in dev.of_node through
device_set_node(), but that helper only assigns the fwnode and
of_node pointers without taking an OF node reference.

Take a reference when assigning the node and release it from the
SCMI device release path. With the device owning that reference,
remove the separate channel-side get/put pair from the core driver.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c    | 3 ++-
 drivers/firmware/arm_scmi/driver.c | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..7de45533b4c7 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -395,6 +395,7 @@ static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
+	of_node_put(scmi_dev->dev.of_node);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
 }
@@ -465,7 +466,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	device_set_node(&scmi_dev->dev, of_fwnode_handle(of_node_get(np)));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f167194f7cf6..e04cb55e866a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2748,13 +2748,11 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		devm_kfree(info->dev, cinfo);
 		return -EINVAL;
 	}
-	of_node_get(of_node);
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
-		of_node_put(of_node);
 		scmi_device_destroy(info->dev, prot_id, name);
 		devm_kfree(info->dev, cinfo);
 		return ret;
@@ -2777,7 +2775,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
-			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}
@@ -2862,7 +2859,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		of_node_put(cinfo->dev->of_node);
 		scmi_device_destroy(info->dev, id, sdev->name);
 		cinfo->dev = NULL;
 	}

-- 
2.43.0


