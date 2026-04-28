Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB41DFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R40TvKu4kAaBKKEQTzEO2/xBAin3Dho585lB+4zAqGA=; b=Wg7HfCKPhX+Effx6rABpRYRbvZ
	5spO2Z4z+EIg1DhEPsMtmygilD1WXe8bbWkdTuRcF9UGOKOPuVnlvjLJiR+zL6Hst0LJgdrMxJMKW
	7EGnomfIDB3D0fG96+KgY0FBGUnhIxLYt2r9udrpE7tnnHGKdAONU5mgZeZe2D3KcBWm/JNIUNLUV
	pRJHKhMoGQK69xp4P2RLKp6SH2yheeGH1QN3ifgqsJe97wtTLB+Q3kOktLUj5hPJBGy8Z9xB2VdZ4
	i90l4ZtRl4cBuviNajg2/w70WnAnYr1HmWWIHf7N9oNLzfJl3VCAqTLIdKEJidHADlUU54hT9ql1Y
	ONQTAx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeSX-000000012Nc-3XvF;
	Tue, 28 Apr 2026 09:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeSI-000000012A2-3UxZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:10:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E8CE15A1;
	Tue, 28 Apr 2026 02:10:03 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B2433F62B;
	Tue, 28 Apr 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777367408; bh=JUOAYUoA6ZULBMyS9cgEcmGlJ6DkFAap892e25+ywaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZVJraegfG9O8iooQVT2WNbzCPlvjOV49BNZvoeGwVD6sMzmVT+jAf/F2g3o2YwUqG
	 wloV5dRDS/I+bud801RIyS4/RTiRjHsV7aCccgWKMfNYVOD37FTMg2H08QieNBVgqB
	 RR283x7tkLOAU8yAgvQc2dNp353q29NPkpqORTMU=
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
Subject: [PATCH v5 12/12] powercap: arm_scmi: Synthetic zone enable/disable
Date: Tue, 28 Apr 2026 10:09:21 +0100
Message-ID: <20260428090922.346069-13-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428090922.346069-1-philip.radford@arm.com>
References: <20260428090922.346069-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_021011_116970_3F78481A 
X-CRM114-Status: GOOD (  12.57  )
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

Add functionality to disable and enable the synthetic zone which
also affects the immediate children of the synthetic zone by applying
the same command to them.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 81 ++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 81b5214acda4..1ed2949b06cb 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -270,6 +270,85 @@ static int instance_root_release(struct powercap_zone *pz)
 	return 0;
 }
 
+static int instance_root_set_enable_state(struct powercap_zone *pz, bool enable)
+{
+	struct scmi_powercap_zone *root;
+	struct scmi_powercap_root *pr;
+	struct scmi_powercap_zone *child;
+	int ret, first_err = 0;
+
+	if (!pz)
+		return -EINVAL;
+
+	root = to_scmi_powercap_zone(pz);
+	pr = container_of(root, struct scmi_powercap_root, instance_root);
+
+	list_for_each_entry(child, &pr->registered_zones[0], node) {
+		if (child == &pr->instance_root)
+			continue;
+
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+
+		if (!child->info->cpli[0].cap_config)
+			continue;
+
+		ret = powercap_ops->cap_enable_set(child->ph, child->info->id, enable);
+
+		if (ret && !first_err) {
+			first_err = ret;
+			dev_err(child->dev, "failed to %s zone %s: %d\n",
+				enable ? "enable" : "disable",
+				child->info->name, ret);
+		}
+	}
+
+	return first_err;
+}
+
+static int instance_root_set_enable(struct powercap_zone *pz, bool mode)
+{
+	return instance_root_set_enable_state(pz, mode);
+}
+
+static int instance_root_get_enable(struct powercap_zone *pz, bool *mode)
+{
+	struct scmi_powercap_zone *root;
+	struct scmi_powercap_root *pr;
+	struct scmi_powercap_zone *child;
+	bool enabled;
+	int ret;
+
+	if (!pz || !mode)
+		return -EINVAL;
+
+	root = to_scmi_powercap_zone(pz);
+	pr = container_of(root, struct scmi_powercap_root, instance_root);
+
+	*mode = true;
+
+	list_for_each_entry(child, &pr->registered_zones[0], node) {
+		if (child == &pr->instance_root)
+			continue;
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+		if (!child->info->cpli[0].cap_config)
+			continue;
+
+		ret = powercap_ops->cap_enable_get(child->ph, child->info->id, &enabled);
+
+		if (ret)
+			return ret;
+
+		if (!enabled) {
+			*mode = false;
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
 static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
 {
 	struct scmi_powercap_zone *root = to_scmi_powercap_zone(pz);
@@ -315,6 +394,8 @@ static const struct powercap_zone_ops instance_root_ops = {
 	.get_max_power_range_uw = scmi_powercap_get_max_power_range_uw,
 	.get_power_uw = instance_root_get_power_uw,
 	.release = instance_root_release,
+	.set_enable = instance_root_set_enable,
+	.get_enable = instance_root_get_enable,
 };
 
 static const struct powercap_zone_constraint_ops instance_root_const_ops = {
-- 
2.47.3


