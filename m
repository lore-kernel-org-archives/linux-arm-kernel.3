Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F50CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UpM14Ds9h7yYbvhXlbJLbQlYRqDlNERuwOIk610pBI=; b=dYLVGDo2N8m2kGMFzQTKTURS5D
	YJR7nVHJASHURDb8ghi/DK+ENJIHU9BAwKj5As1Vs/s0JNkbH8CnbSFl02NyJ588OHftrcbAKrLEp
	XaE5G2708IV0Un0NshRv3/K6F7aPhwX+E34zOlI5a+SdeYEfSTdVWM+ECgeUcvrEGlRi+2RA5jKmM
	MBY7lXldxqWcblhGVw0eI+p2QIyxjyiA4H/ZsOrQKgrsZXiwCKGt3roGcWPOi5aVTQGkEErbOJkEP
	VqcfEACiWSzPobOpI9TVDwAZT5QjHUAO0TRes4DIjGogj6va/k34vqzEoKbDgDx6ImfJxfQjIri79
	3N+P5kCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyPY-0000000FsR1-3bqe;
	Mon, 18 May 2026 13:53:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyPF-0000000Fs56-1fxX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:53:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8F451D6F;
	Mon, 18 May 2026 06:53:11 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3CF63F7B4;
	Mon, 18 May 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779112396; bh=KH0xrCitYzGGE60nSgMbouzyCYUKb4SZBjGg3aYh7pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vwH6sZ94pQKEF0AlYLVsDstC5Q2auI9r0sFzMWXvT0xWKu9VOgcmU2z2JupkhR3uX
	 6S3D5SxWStG7c2vMklwBiNIO856MlQLr0+pPBygPxq7eDaHyBA8Zylr9HeLzjreqeE
	 8HnikLFd0U9ddIVN8JJxfKL+5S19IHIYIJsFizM4=
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
Subject: [PATCH v6 12/12] powercap: arm_scmi: Synthetic zone enable/disable
Date: Mon, 18 May 2026 14:52:34 +0100
Message-ID: <20260518135234.2953532-13-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518135234.2953532-1-philip.radford@arm.com>
References: <20260518135234.2953532-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065317_514619_86C4A880 
X-CRM114-Status: GOOD (  16.23  )
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
V5->V6
- Added use of to_scmi_powercap_root macro
- Changed instance_root_set_enable_state to bail out on any error
- Changed logic in instance_root_get_enable to not check child states
---
 drivers/powercap/arm_scmi_powercap.c | 128 +++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index f1cb25a408bb..d911e623e2d7 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -36,6 +36,7 @@ struct scmi_powercap_zone {
 
 struct scmi_powercap_root {
 	unsigned int num_zones;
+	bool enabled;
 	struct scmi_powercap_zone *spzones;
 	struct list_head *registered_zones;
 	struct list_head scmi_zones;
@@ -276,6 +277,127 @@ static int instance_root_release(struct powercap_zone *pz)
 	return 0;
 }
 
+static int instance_root_read_children_enable_state(struct scmi_powercap_root *pr,
+						    bool *mode)
+{
+	struct scmi_powercap_zone *child;
+	bool enabled;
+	int i, ret;
+
+	if (!pr || !mode)
+		return -EINVAL;
+
+	*mode = true;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		child = &pr->spzones[i];
+
+		if (!child->registered || child->invalid)
+			continue;
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+
+		ret = powercap_ops->cap_enable_get(child->ph, child->info->id, &enabled);
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
+static int instance_root_set_enable_state(struct powercap_zone *pz, bool enable)
+{
+	struct scmi_powercap_zone *child;
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+	int i, ret;
+	bool *prev_state;
+
+	if (!pz)
+		return -EINVAL;
+
+	prev_state = kcalloc(pr->num_zones, sizeof(*prev_state), GFP_KERNEL);
+	if (!prev_state)
+		return -ENOMEM;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		child = &pr->spzones[i];
+
+		if (!child->registered || child->invalid)
+			continue;
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+
+		ret = powercap_ops->cap_enable_get(child->ph, child->info->id,
+						   &prev_state[i]);
+
+		if (ret)
+			goto revert;
+
+		if (prev_state[i] == enable)
+			continue;
+
+		ret = powercap_ops->cap_enable_set(child->ph, child->info->id, enable);
+
+		if (ret) {
+			dev_err(child->dev, "failed to %s zone %s: %d\n",
+				enable ? "enable" : "disable",
+				child->info->name, ret);
+			goto revert;
+		}
+	}
+
+	kfree(prev_state);
+	return 0;
+
+revert:
+	while (--i >= 0) {
+		child = &pr->spzones[i];
+
+		if (!child->registered || child->invalid)
+			continue;
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+		if (!child->info->cpli[0].cap_config)
+			continue;
+		if (prev_state[i] == enable)
+			continue;
+
+		powercap_ops->cap_enable_set(child->ph, child->info->id,
+					     prev_state[i]);
+	}
+
+	kfree(prev_state);
+	return ret;
+}
+
+static int instance_root_set_enable(struct powercap_zone *pz, bool mode)
+{
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+	int ret;
+
+	ret = instance_root_set_enable_state(pz, mode);
+	if (!ret)
+		pr->enabled = mode;
+
+	return ret;
+}
+
+static int instance_root_get_enable(struct powercap_zone *pz, bool *mode)
+{
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+
+	if (!pz || !mode)
+		return -EINVAL;
+
+	*mode = pr->enabled;
+	return 0;
+}
+
 static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
 {
 	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
@@ -324,6 +446,8 @@ static const struct powercap_zone_ops instance_root_ops = {
 	.get_max_power_range_uw = scmi_powercap_get_max_power_range_uw,
 	.get_power_uw = instance_root_get_power_uw,
 	.release = instance_root_release,
+	.set_enable = instance_root_set_enable,
+	.get_enable = instance_root_get_enable,
 };
 
 static const struct powercap_zone_constraint_ops instance_root_const_ops = {
@@ -600,6 +724,10 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 	if (ret)
 		return ret;
 
+	ret = instance_root_read_children_enable_state(pr, &pr->enabled);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(dev, pr);
 
 	return ret;
-- 
2.47.3


