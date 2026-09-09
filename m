Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41C5C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U14ZbKYeNhbE6svMGmqc17q+buoq9GEtciEeaNhJkHU=; b=cwHfX1z56o1QTRY7O4kj/rOqJL
	sJ5vuJtjLOnME9de9ckakVwLE8dXq7kzjkJzmLGFSMwGC69BaBoGBo1aiFFUOiH2TDLECMhM147fp
	u/vZCUGx3/IimFeNdGajS6I3xFuh5I1bxBnjLZeSbAT3Xt5uJ+7g7RIET1QYF9Hyn7fIqQvY/8Vx6
	ywBTtM2Wx75rgXsOyiyYeJQopNcCml+8JHXF2ecOq7vQAZTSPsgY424Olz82y1xyxxrZOxLUj3Moy
	2PyGcA44Y5a0JcavYlGDtMucc9fcsSf/CQ/IgzfWoQ34DzA2lPnFE7vM7tmyLA7cjgP5dDf5yaQZG
	DMfGGL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPt-0000000CyFL-3zlr;
	Wed, 09 Sep 2026 22:05:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPr-0000000CyBl-3Mn3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:05:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88A79169C;
	Wed,  9 Sep 2026 15:05:11 -0700 (PDT)
Received: from oss-apollo7005.lab.cambridge.arm.com (oss-apollo7005.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18D433F7D8;
	Wed,  9 Sep 2026 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788991515; bh=ovY3D17i0dzC62cyd/v0yJIlVY4EtK0/HjoZ47MH1Xc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SenWt2diybd3TLYBfG9DVki/PK1URuv757wNGaKuBsoiZ8ft9KhLUN4O3YfuLgIG+
	 YdnoTd1UdgqeaPsMfW/Aq85Xp1Zh2JZM7BX/RoJRzwwT/jXMf16Enr8fwC0qzbmghP
	 khyHAO4LhvFNdIxeNYG9hxrBLfDiNwBQktV9R/yI=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	philip.radford@arm.com
Subject: [PATCH v9 11/13] powercap: arm_scmi: Create synthetic parent node for multi-instance
Date: Wed,  9 Sep 2026 22:04:35 +0000
Message-Id: <20260909220437.1254412-12-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909220437.1254412-1-philip.radford@arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150515_953686_3878251A 
X-CRM114-Status: GOOD (  20.04  )
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

An SCMI powercap instance may expose a hierarchy of domains, or even a
forest of multiple domain trees rooted at SCMI_POWERCAP_ROOT_ZONE_ID.
Those hierarchies are valid within the namespace of a single SCMI instance.

Currently, the powercap framework has no notion of SCMI instances. If root
domains from multiple SCMI instances are registered directly under the same
Linux powercap control type, the per-instance boundaries are lost and the
resulting Linux hierarchy becomes a merge of otherwise independent SCMI
topologies.

Add a synthetic top-level powercap zone per SCMI instance and register that
instance's SCMI root domains beneath it. This keeps each instance's SCMI
hierarchy grouped together.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V8->V9
- Removed redundant scmi_powercap_get_zone_height
- Added scmi_powercap_parent_name helper
- Replaced tiernary operator that checked empty parent->info->name
---
 drivers/powercap/arm_scmi_powercap.c | 110 +++++++++++++++++++++++----
 1 file changed, 96 insertions(+), 14 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index bcd1ba0bde8c..b5397d7675e6 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -38,6 +38,7 @@ struct scmi_powercap_root {
 	struct scmi_powercap_zone *spzones;
 	struct list_head *registered_zones;
 	struct list_head scmi_zones;
+	struct scmi_powercap_zone instance_root;
 };
 
 static LIST_HEAD(scmi_powercap_roots);
@@ -443,29 +444,75 @@ static const struct powercap_zone_constraint_ops constraint_ops  = {
 	.get_name = scmi_powercap_get_name,
 };
 
+/*
+ * Multi-instance constraints to meet driver requrements due to the fact
+ * that full zone semantics aren't available for the synthetic zone.
+ */
+static int instance_root_release(struct powercap_zone *pz)
+{
+	return 0;
+}
+
+static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
+{
+	*v = 0;
+	return 0;
+}
+
+static int instance_root_set_constraint(struct powercap_zone *pz, int cid, u64 v)
+{
+	return -EOPNOTSUPP;
+}
+
+static int instance_root_get_constraint(struct powercap_zone *pz, int cid, u64 *v)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct powercap_zone_ops instance_root_ops = {
+	.get_max_power_range_uw = scmi_powercap_get_max_power_range_uw,
+	.get_power_uw = instance_root_get_power_uw,
+	.release = instance_root_release,
+};
+
+static const struct powercap_zone_constraint_ops instance_root_const_ops = {
+	.set_power_limit_uw = instance_root_set_constraint,
+	.get_power_limit_uw = instance_root_get_constraint,
+	.set_time_window_us = instance_root_set_constraint,
+	.get_time_window_us = instance_root_get_constraint,
+};
+
 static void scmi_powercap_unregister_all_zones(struct scmi_powercap_root *pr)
 {
 	int i;
 
 	/* Un-register children zones first starting from the leaves */
-	for (i = pr->num_zones - 1; i >= 0; i--) {
+	for (i = pr->num_zones; i >= 0; i--) {
 		if (!list_empty(&pr->registered_zones[i])) {
 			struct scmi_powercap_zone *spz;
 
-			list_for_each_entry(spz, &pr->registered_zones[i], node)
+			list_for_each_entry(spz, &pr->registered_zones[i], node) {
+				if (!spz->registered)
+					continue;
+
+				spz->registered = false;
 				powercap_unregister_zone(scmi_top_pcntrl,
 							 &spz->zone);
+			}
 		}
 	}
 }
 
-static inline unsigned int
-scmi_powercap_get_zone_height(struct scmi_powercap_zone *spz)
+static const char *scmi_powercap_parent_name(struct scmi_powercap_root *pr,
+					     struct scmi_powercap_zone *parent)
 {
-	if (spz->info->parent_id == SCMI_POWERCAP_ROOT_ZONE_ID)
-		return 0;
+	if (!parent)
+		return "ROOT";
 
-	return spz->spzones[spz->info->parent_id].height + 1;
+	if (parent == &pr->instance_root)
+		return "INSTANCE ROOT";
+
+	return parent->info->name;
 }
 
 static inline struct scmi_powercap_zone *
@@ -493,11 +540,14 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
 				   parent ? &parent->zone : NULL,
 				   &zone_ops, spz->info->num_cpli, &constraint_ops);
 	if (!IS_ERR(z)) {
-		spz->height = scmi_powercap_get_zone_height(spz);
+		if (parent)
+			spz->height = parent->height + 1;
+		else
+			spz->height = 0;
 		spz->registered = true;
 		list_move(&spz->node, &pr->registered_zones[spz->height]);
 		dev_dbg(spz->dev, "Registered node %s - parent %s - height:%d\n",
-			spz->info->name, parent ? parent->info->name : "ROOT",
+			spz->info->name, scmi_powercap_parent_name(pr, parent),
 			spz->height);
 	} else {
 		list_del(&spz->node);
@@ -505,7 +555,7 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
 		dev_err(spz->dev,
 			"Error registering node:%s - parent:%s - h:%d - ret:%d\n",
 			spz->info->name,
-			parent ? parent->info->name : "ROOT",
+			scmi_powercap_parent_name(pr, parent),
 			spz->height, ret);
 	}
 
@@ -564,6 +614,8 @@ static int scmi_zones_register(struct device *dev,
 		struct scmi_powercap_zone *parent;
 
 		parent = scmi_powercap_get_parent_zone(spz);
+		if (!parent)
+			parent = &pr->instance_root;
 		if (parent && !parent->registered) {
 			zones_stack[sp++] = spz;
 			spz = parent;
@@ -604,8 +656,11 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 	int ret, i;
 	struct scmi_powercap_root *pr;
 	struct scmi_powercap_zone *spz;
+	struct scmi_powercap_zone *ir;
 	struct scmi_protocol_handle *ph;
 	struct device *dev = &sdev->dev;
+	char *instance_name;
+	struct powercap_zone *z;
 
 	if (!sdev->handle)
 		return -ENODEV;
@@ -633,7 +688,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return -ENOMEM;
 
 	/* Allocate for worst possible scenario of maximum tree height. */
-	pr->registered_zones = devm_kcalloc(dev, pr->num_zones,
+	pr->registered_zones = devm_kcalloc(dev, pr->num_zones + 1,
 					    sizeof(*pr->registered_zones),
 					    GFP_KERNEL);
 	if (!pr->registered_zones)
@@ -641,6 +696,9 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 
 	INIT_LIST_HEAD(&pr->scmi_zones);
 
+	for (i = 0; i <= pr->num_zones; i++)
+		INIT_LIST_HEAD(&pr->registered_zones[i]);
+
 	for (i = 0, spz = pr->spzones; i < pr->num_zones; i++, spz++) {
 		/*
 		 * Powercap domains are validate by the protocol layer, i.e.
@@ -660,7 +718,6 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		spz->ph = ph;
 		spz->spzones = pr->spzones;
 		INIT_LIST_HEAD(&spz->node);
-		INIT_LIST_HEAD(&pr->registered_zones[i]);
 
 		list_add_tail(&spz->node, &pr->scmi_zones);
 		/*
@@ -678,19 +735,44 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		}
 	}
 
+	ir = &pr->instance_root;
+	ir->dev = dev;
+	INIT_LIST_HEAD(&ir->node);
+	instance_name = devm_kasprintf(dev, GFP_KERNEL, "instance_%s", dev_name(dev));
+	if (!instance_name)
+		return -ENOMEM;
+
+	z = powercap_register_zone(&ir->zone, scmi_top_pcntrl,
+				   instance_name, NULL, &instance_root_ops, 0,
+				   &instance_root_const_ops);
+
+	if (IS_ERR(z)) {
+		ret = PTR_ERR(z);
+		dev_err(dev, "Failed to register sysnthetic instance root: %d\n", ret);
+		return ret;
+	}
+
+	ir->registered = true;
+	ir->height = 0;
+	list_add_tail(&ir->node, &pr->registered_zones[0]);
+
 	/*
 	 * Scan array of retrieved SCMI powercap domains and register them
 	 * recursively starting from the root domains.
 	 */
 	ret = scmi_zones_register(dev, pr);
-	if (ret)
+	if (ret) {
+		scmi_powercap_unregister_all_zones(pr);
 		return ret;
+	}
 
 	INIT_LIST_HEAD(&pr->node);
 
 	ret = scmi_powercap_read_root_children_enable_state(pr, &pr->enabled);
-	if (ret)
+	if (ret) {
+		scmi_powercap_unregister_all_zones(pr);
 		return ret;
+	}
 
 	mutex_lock(&scmi_powercap_roots_lock);
 	list_add_tail(&pr->node, &scmi_powercap_roots);
-- 
2.25.1


