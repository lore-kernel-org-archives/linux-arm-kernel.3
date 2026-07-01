Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI8N45gPmQ8iJjB+GBzTf6cfCJJQqV/EJ7frAbCwTn0=; b=CE8zSwjiz1KndZbzoBS/foRvA2
	/NqVpqZ1gmwB6R6rzsmGoHbcAOeAJOJ9QoJKSV6IAcqgspEjTsn8zNBEFfa6r9oFYBr1YRSULGjS4
	0JvrvUuygbqXKshsXduGa8PI4/IKV+1/Sx27wcypdSK8xTSaxikKF3syhJSBLPa6dCnazlio9+8fq
	v62qmkknogsThvfOmOmFCkjHGxzwrac9ciXgf26z+5+hXN/um5pZWL1LIyaqPwDLwlOsvTvDNJM0O
	MMmfya9fyYv8fRMrX1a58Pb8837C/tcLy8VG++gADvH0TvI3Q/VTQ13H8ljNxs7/rbydNeNAqYWsx
	otcrN6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBe-00000002b0y-2I3R;
	Wed, 01 Jul 2026 16:53:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBd-00000002b08-2Ths
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C927C60122;
	Wed,  1 Jul 2026 16:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBAB1F00A3A;
	Wed,  1 Jul 2026 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924800;
	bh=WI8N45gPmQ8iJjB+GBzTf6cfCJJQqV/EJ7frAbCwTn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G7NSELVWGhn1RRD/UspFPix48SEfW9DsnTHHdzwPeUCzJlyqr5ysZ2XwiNC/g9yjM
	 WH0TRv2ATNPdmReEyfwYqsFBxM64UNnNzkqG+QmoeI91rZk7Yira2gApWhQ9Opmr7E
	 dMpCHmiMT7kWhuklMVrGGZ8pw4RIB9B193qtG6myEVk729TU6cVRI/Me0A/WwvgBrD
	 EKyZEF7TpIb7Dad0flVx/xIzEepVldt+3n/DAcNajIDhHCL2afAJKpodkw+Hv1nEK2
	 QJ9nZmzzG46EpQEBNR0AhTO9T2Bn5xrq1FyP/zdV9bBzeDzmOaRVPbMxwrrrWjJG3T
	 tpD+HpHhkSsmg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:25 +0100
Subject: [PATCH v2 04/14] firmware: arm_scmi: Fix SCMI device destroy
 lifetimes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-4-1f5e85553f73@kernel.org>
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

scmi_child_dev_find() drops the reference returned by
device_find_child() before returning the scmi_device pointer. A
concurrent unregister can then release the device while the destroy path
is still using the returned pointer.

Make the lookup helper return the device_find_child() reference and keep
it until scmi_device_destroy() has finished unregistering the child.

Also split device_unregister() in __scmi_device_destroy() so the SCMI bus
ID is not made reusable until after device_del() has removed the old
scmi_dev.N name from sysfs. This avoids a new SCMI device reusing the
same ID while the old device is still registered.

Fixes: 46edb8d1322c ("firmware: arm_scmi: provide the mandatory device release callback")
Fixes: 9ca67840c0dd ("firmware: arm_scmi: Balance device refcount when destroying devices")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d4beefa4234f..e1deb1b3011d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -250,8 +250,9 @@ static int scmi_match_by_id_table(struct device *dev, const void *data)
 	return __scmi_dev_match_by_id_table(scmi_dev, id_table, false);
 }
 
-static struct scmi_device *scmi_child_dev_find(struct device *parent,
-					       int prot_id, const char *name)
+/* Returns a device_find_child() reference which must be dropped by caller. */
+static struct scmi_device *
+scmi_child_dev_find_get(struct device *parent, int prot_id, const char *name)
 {
 	struct scmi_device_id id_table[2] = { 0 };
 	struct device *dev;
@@ -263,9 +264,6 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	if (!dev)
 		return NULL;
 
-	/* Drop the refcnt bumped implicitly by device_find_child */
-	put_device(dev);
-
 	return to_scmi_dev(dev);
 }
 
@@ -422,8 +420,9 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
 
+	device_del(&scmi_dev->dev);
 	ida_free(&scmi_bus_id, scmi_dev->id);
-	device_unregister(&scmi_dev->dev);
+	put_device(&scmi_dev->dev);
 }
 
 static struct scmi_device *
@@ -440,9 +439,11 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	 * each DT defined protocol at probe time, and the concurrent
 	 * registration of SCMI drivers.
 	 */
-	scmi_dev = scmi_child_dev_find(parent, protocol, name);
-	if (scmi_dev)
+	scmi_dev = scmi_child_dev_find_get(parent, protocol, name);
+	if (scmi_dev) {
+		put_device(&scmi_dev->dev);
 		return scmi_dev;
+	}
 
 	/*
 	 * Ignore any possible subsequent failures while creating the device
@@ -492,8 +493,8 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	return scmi_dev;
 put_dev:
+	ida_free(&scmi_bus_id, scmi_dev->id);
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 }
 
@@ -574,9 +575,11 @@ void scmi_device_destroy(struct device *parent, int protocol, const char *name)
 {
 	struct scmi_device *scmi_dev;
 
-	scmi_dev = scmi_child_dev_find(parent, protocol, name);
-	if (scmi_dev)
+	scmi_dev = scmi_child_dev_find_get(parent, protocol, name);
+	if (scmi_dev) {
 		__scmi_device_destroy(scmi_dev);
+		put_device(&scmi_dev->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(scmi_device_destroy);
 

-- 
2.43.0


