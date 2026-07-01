Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801DAC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qSROqYDGkpns5E2VEmfhbUoR9cndYj5RZthvlIKdnk=; b=GNkLb/89g7VLVVTwykc9uQW5Ky
	3XM8mMdBBN3hJycEnaP3hmg2p2vukF4++SCRHqkbUeZOOVI4bvI3L7awdqnX/0qs1tjVJ8+eLZS0v
	hsMh9SUl9XKPk4cDoOTBIDq+svU5LrESY3wZNPooxaExmoyWKjYoF4TNONVa9/7/t0eRPx8XIGVDC
	9xl2iDcvr7Y/+fZXiyIp9S4u60svh8oKxwd4IGmpdU8ZQoVxupncSRArpYHSyqmuBAkbmRtmwUMTF
	nbWD+GTAfGxA1F8pCdkU9C39LgUNZDKWvSVsZDH0EX/0j2NeybtI32st92+Lpw+koN2nJ7wOnkSAL
	SsyHV5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuWS-000000025lJ-0X3Q;
	Wed, 01 Jul 2026 12:58:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuWP-000000025gn-0sFp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:58:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 382A52309;
	Wed,  1 Jul 2026 05:58:28 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B9603F85F;
	Wed,  1 Jul 2026 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782910712; bh=IpajwW90TFhzLm7CIEz4I/kLHZAruC0mrJ5gleyLDy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbOmZqRr6498OQ7dzzUkqx7jkXLJl+xK7ZohBwN8Rc1ZRJ5H/UigTuDOrUOZuGkAr
	 zP6DH/3P9Xw18jXi5coYR1PBlhdSPc3tkl28bixq01cQx8gPE0EdFePQnVoq/YZ0Bu
	 2eONaP0pmbG+wm2jGLmH1bKkIBtNEuWCrycEAFFM=
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
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v8 11/13] powercap: arm_scmi: Create synthetic parent node for multi-instance
Date: Wed,  1 Jul 2026 12:57:45 +0000
Message-Id: <20260701125747.407921-12-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701125747.407921-1-philip.radford@arm.com>
References: <20260701125747.407921-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_055833_339981_307B3D73 
X-CRM114-Status: GOOD (  19.02  )
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
 drivers/powercap/arm_scmi_powercap.c | 93 +++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 7 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 2f8a1e0ecccf..d45e4af0cdc7 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -38,6 +38,7 @@ struct scmi_powercap_root {
 	struct scmi_powercap_zone *spzones;
 	struct list_head *registered_zones;
 	struct list_head scmi_zones;
+	struct scmi_powercap_zone instance_root;
 };
 
 static LIST_HEAD(scmi_powercap_roots);
@@ -401,18 +402,61 @@ static const struct powercap_zone_constraint_ops constraint_ops  = {
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
@@ -451,7 +495,10 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
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
@@ -522,6 +569,8 @@ static int scmi_zones_register(struct device *dev,
 		struct scmi_powercap_zone *parent;
 
 		parent = scmi_powercap_get_parent_zone(spz);
+		if (!parent)
+			parent = &pr->instance_root;
 		if (parent && !parent->registered) {
 			zones_stack[sp++] = spz;
 			spz = parent;
@@ -562,8 +611,11 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
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
@@ -591,7 +643,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return -ENOMEM;
 
 	/* Allocate for worst possible scenario of maximum tree height. */
-	pr->registered_zones = devm_kcalloc(dev, pr->num_zones,
+	pr->registered_zones = devm_kcalloc(dev, pr->num_zones + 1,
 					    sizeof(*pr->registered_zones),
 					    GFP_KERNEL);
 	if (!pr->registered_zones)
@@ -599,6 +651,9 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 
 	INIT_LIST_HEAD(&pr->scmi_zones);
 
+	for (i = 0; i <= pr->num_zones; i++)
+		INIT_LIST_HEAD(&pr->registered_zones[i]);
+
 	for (i = 0, spz = pr->spzones; i < pr->num_zones; i++, spz++) {
 		/*
 		 * Powercap domains are validate by the protocol layer, i.e.
@@ -611,7 +666,6 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		spz->ph = ph;
 		spz->spzones = pr->spzones;
 		INIT_LIST_HEAD(&spz->node);
-		INIT_LIST_HEAD(&pr->registered_zones[i]);
 
 		list_add_tail(&spz->node, &pr->scmi_zones);
 		/*
@@ -629,19 +683,44 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
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


