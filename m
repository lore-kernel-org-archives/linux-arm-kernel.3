Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0CFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKCu+PYcgJkSg1JMnJ2Tzl4HnJfoedyvK0J5G8oSbPk=; b=YgMNeca+lX21xfkZUKpMKs9/T8
	G897OdqdeTpFOe3LbLvhR9GYjHx/DoGpQSPdpYbQuTeKX7FIuqUwMaQEbaR+l6mo9n2+F3bx7zKCB
	3J3BMEqQddZOfzkcnWQMgxKeNHycC9FA1HTJbIar+XFNJQo8ylvkhq7ov9bmGb/ReyerBy/+9EVlG
	r7Bzm/VG1K0vfahDAdDgp1eHqg9g6ow/XOGrBx3AybbPSFMznELOh9q30IEVJHhXbu4GS7WHcvjSa
	MVwUbzCNhIBacHnCHzp1tI20eJQWRLihi7Kz6Z4F12bfsKAiH4N7QK5Yg8Gz042u1VTmoAUrkDevh
	QespsjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBk-00000002bAi-3T4H;
	Wed, 01 Jul 2026 16:53:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBj-00000002b7t-22Cm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40E3743A4E;
	Wed,  1 Jul 2026 16:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919991F00ACF;
	Wed,  1 Jul 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924807;
	bh=QKCu+PYcgJkSg1JMnJ2Tzl4HnJfoedyvK0J5G8oSbPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QG45kKGniYzG0ldpN/80pDDz8V5sohuZyH65/PwXU1Labu8X1pwkgFnFztBaz1ymv
	 PiZNvlZqT0HmfCwwl6s9dug1mK8/NtRve7nqH2kuymgcGCnyi5aOJu7Q0yeO9szImA
	 By3cYoqf3qdAckTL5CfhuOoSB0p4ATZU4uaAxNlWcV6w2fUczSPcAvEAOadmqcXanJ
	 h3seFnnP1NSl7kKnCRM+07Lna+UOJS7XlLr6DTjD9OlE9WcxNZk4YmJb5J5nL1OISh
	 I8ahvARVUekKi9T845yu1FeOXrqi3rpgZ9T8UcvdtHrnlGlf/QL71tnEMIf6HTavmP
	 iKaGhrYSz1RpQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:32 +0100
Subject: [PATCH v2 11/14] firmware: arm_scmi: Clear SystemPower flag on
 create failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-11-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

__scmi_device_create() reserves the singleton SystemPower protocol
device by setting scmi_syspower_registered before allocating and
registering the SCMI device.

If any later step fails, the function returns NULL but leaves the flag
set. A subsequent retry, for example after probe deferral, then observes
the stale reservation and rejects creation of the SystemPower protocol
device permanently.

Route all failures after the successful reservation through a common
unwind path which clears scmi_syspower_registered again. Keep the
duplicate-device rejection path unchanged because that path did not acquire
the reservation.

Fixes: 2c3e674465e7 ("firmware: arm_scmi: Refactor device create/destroy helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e1deb1b3011d..cdfcd8e96e93 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -431,6 +431,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 {
 	int id, retval;
 	struct scmi_device *scmi_dev;
+	bool syspower = (protocol == SCMI_PROTOCOL_SYSTEM);
 
 	/*
 	 * If the same protocol/name device already exist under the same parent
@@ -446,14 +447,12 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	}
 
 	/*
-	 * Ignore any possible subsequent failures while creating the device
-	 * since we are doomed anyway at that point; not using a mutex which
-	 * spans across this whole function to keep things simple and to avoid
-	 * to serialize all the __scmi_device_create calls across possibly
-	 * different SCMI server instances (parent)
+	 * Reserve the singleton SystemPower protocol device before
+	 * allocation and registration. This keeps creation simple without
+	 * a mutex spanning the whole function; error paths after the
+	 * reservation must drop it again.
 	 */
-	if (protocol == SCMI_PROTOCOL_SYSTEM &&
-	    atomic_cmpxchg(&scmi_syspower_registered, 0, 1)) {
+	if (syspower && atomic_cmpxchg(&scmi_syspower_registered, 0, 1)) {
 		dev_warn(parent,
 			 "SCMI SystemPower protocol device must be unique !\n");
 		return NULL;
@@ -461,19 +460,19 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	scmi_dev = kzalloc_obj(*scmi_dev);
 	if (!scmi_dev)
-		return NULL;
+		goto clear_syspower;
 
 	scmi_dev->name = kstrdup_const(name ?: "unknown", GFP_KERNEL);
 	if (!scmi_dev->name) {
 		kfree(scmi_dev);
-		return NULL;
+		goto clear_syspower;
 	}
 
 	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
 	if (id < 0) {
 		kfree_const(scmi_dev->name);
 		kfree(scmi_dev);
-		return NULL;
+		goto clear_syspower;
 	}
 
 	scmi_dev->id = id;
@@ -495,6 +494,9 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 put_dev:
 	ida_free(&scmi_bus_id, scmi_dev->id);
 	put_device(&scmi_dev->dev);
+clear_syspower:
+	if (syspower)
+		atomic_set(&scmi_syspower_registered, 0);
 	return NULL;
 }
 

-- 
2.43.0


