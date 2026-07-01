Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7731CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPUjRkhxiwa1i2+Y0iKBSchNupNYVSRWGOd1JGMSAqI=; b=QsfWjPtdtNhU5CcRyXi86221Hy
	aR5airsoJHFdATq9HUof6rmjL1maKhn1/rBQYpiqviVShIKm7OvlpvOvM6PVNcTVXkX1Zm3BnXHlC
	FRDe8cbU4dnfcsKS+1YbU/vfwUrGp82ytynMoCgJzDtGf3rFcln/YeU5qRquxk3D129iKltdcJzR0
	MRGBTnl0eH+hBAHkgR1jSNzXp/SjIsZWa2cTQzWDXu9rAh0Fs8L6QGUtfd7YvJdV++5kAeg543uwe
	QNwtJixumtjOCRtJCp//6PNb0jaAcM0oI1GJDvs6KRibNS9+CQ/t1RgfeyTQURF88DeJ0Wc9gQ9Lq
	oQUEf3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuW4-000000025Jn-2Uqb;
	Wed, 01 Jul 2026 12:58:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuW3-000000025IW-22Jy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IPUjRkhxiwa1i2+Y0iKBSchNupNYVSRWGOd1JGMSAqI=; b=PMSJVmqfQKffC1ZtVPpsCB3Lna
	ExHZMz804fQnR+GHKlAo8wQzzLNTa895hB4DDhs4Y6usWNGjJhdr9q4QD9i6BlVNV2M0FA96uQ372
	GOCs0o3HTaxNdwpFvgN0wn98nVC/daKM6/ikIV7D4kF2b5FesEcc/7q1QC/1LNt/KW7f0NHjA88qi
	SLMeF9OISOFumAlsHze84Eaim8DyCo+L0EzBAXlq+hcBFMPceoWacWMdYk9yP+FSr9FuPOWJ5p552
	nC3rzcuHJLRwU0XXCWHiS3sJxnhkJhsfMr+kBrKTBj4Cfgqu5dQ6D9xhJc3ZV1DcEYVavn5QEGRvI
	/yda3EUQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuW0-00000002nG2-2HtP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A182237B;
	Wed,  1 Jul 2026 05:58:01 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F7CD3F85F;
	Wed,  1 Jul 2026 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782910685; bh=p3qMpjUZwo/8kPo/OA4+5ZyaP3kzjJMWb3Hdwz0VXRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iwqzG8PIXLpw+P/FqlSGAmik7W2ph1xZd9lfZFtY5vf1pb+cxax/Zb4TYerNGbIjR
	 hSmDQZKWIOp06MOyWKT8TM1EK4G2QckHEiMfy3GnDun/SUdK2ZqcFM6sbJJGnPsW/n
	 prP/Eo5OtY2yJqfe3vTxQmom0MOdefBRJGqZ50Bg=
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
Subject: [PATCH v8 01/13] powercap: Add enable disable control-type
Date: Wed,  1 Jul 2026 12:57:35 +0000
Message-Id: <20260701125747.407921-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701125747.407921-1-philip.radford@arm.com>
References: <20260701125747.407921-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135808_972492_504E3526 
X-CRM114-Status: GOOD (  16.90  )
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

Add functionality to disable or enable the Powercap control-type by writing
directly into sys/class/powercap/arm-scmi/enabled.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 155 ++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..e33829d5c551 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -33,13 +33,151 @@ struct scmi_powercap_zone {
 
 struct scmi_powercap_root {
 	unsigned int num_zones;
+	bool enabled;
+	struct list_head node;
 	struct scmi_powercap_zone *spzones;
 	struct list_head *registered_zones;
 	struct list_head scmi_zones;
 };
 
+static LIST_HEAD(scmi_powercap_roots);
+static DEFINE_MUTEX(scmi_powercap_roots_lock);
+
 static struct powercap_control_type *scmi_top_pcntrl;
 
+static bool scmi_powercap_is_control_type_child(const struct scmi_powercap_zone *spz)
+{
+	return spz->registered && !spz->invalid &&
+	       spz->info->parent_id == SCMI_POWERCAP_ROOT_ZONE_ID;
+}
+
+static int
+scmi_powercap_read_root_children_enable_state(struct scmi_powercap_root *pr, bool *mode)
+{
+	struct scmi_powercap_zone *spz;
+	bool enabled;
+	int i, ret;
+
+	*mode = true;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		spz = &pr->spzones[i];
+
+		if (!scmi_powercap_is_control_type_child(spz))
+			continue;
+
+		ret = powercap_ops->cap_enable_get(spz->ph, spz->info->id, &enabled);
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
+static int
+scmi_powercap_set_root_children_enable_state(struct scmi_powercap_root *pr, bool enable)
+{
+	struct scmi_powercap_zone *spz;
+	bool *prev_state;
+	int i, ret;
+
+	prev_state = kcalloc(pr->num_zones, sizeof(*prev_state), GFP_KERNEL);
+	if (!prev_state)
+		return -ENOMEM;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		spz = &pr->spzones[i];
+
+		if (!scmi_powercap_is_control_type_child(spz))
+			continue;
+
+		ret = powercap_ops->cap_enable_get(spz->ph, spz->info->id,
+						   &prev_state[i]);
+
+		if (ret)
+			goto revert;
+
+		if (prev_state[i] == enable)
+			continue;
+
+		ret = powercap_ops->cap_enable_set(spz->ph, spz->info->id, enable);
+		if (ret)
+			goto revert;
+	}
+
+	pr->enabled = enable;
+	kfree(prev_state);
+	return 0;
+
+revert:
+	while (--i >= 0) {
+		spz = &pr->spzones[i];
+
+		if (!scmi_powercap_is_control_type_child(spz))
+			continue;
+		if (!spz->info->powercap_cap_config)
+			continue;
+		if (prev_state[i] == enable)
+			continue;
+
+		powercap_ops->cap_enable_set(spz->ph, spz->info->id, prev_state[i]);
+	}
+
+	kfree(prev_state);
+	return ret;
+}
+
+static int
+scmi_powercap_control_type_set_enable(struct powercap_control_type *pct, bool mode)
+{
+	struct scmi_powercap_root *pr;
+	int ret = 0;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_for_each_entry(pr, &scmi_powercap_roots, node) {
+		ret = scmi_powercap_set_root_children_enable_state(pr, mode);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&scmi_powercap_roots_lock);
+
+	return ret;
+}
+
+static int
+scmi_powercap_control_type_get_enable(struct powercap_control_type *pct, bool *mode)
+{
+	struct scmi_powercap_root *pr;
+	int ret = 0;
+
+	*mode = true;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_for_each_entry(pr, &scmi_powercap_roots, node) {
+		ret = scmi_powercap_read_root_children_enable_state(pr, &pr->enabled);
+
+		if (ret)
+			break;
+		if (!pr->enabled) {
+			*mode = false;
+			break;
+		}
+	}
+	mutex_unlock(&scmi_powercap_roots_lock);
+
+	return ret;
+}
+
+static const struct powercap_control_type_ops scmi_powercap_control_type_ops = {
+	.set_enable = scmi_powercap_control_type_set_enable,
+	.get_enable = scmi_powercap_control_type_get_enable,
+};
+
 static int scmi_powercap_zone_release(struct powercap_zone *pz)
 {
 	return 0;
@@ -495,6 +633,16 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 	if (ret)
 		return ret;
 
+	INIT_LIST_HEAD(&pr->node);
+
+	ret = scmi_powercap_read_root_children_enable_state(pr, &pr->enabled);
+	if (ret)
+		return ret;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_add_tail(&pr->node, &scmi_powercap_roots);
+	mutex_unlock(&scmi_powercap_roots_lock);
+
 	dev_set_drvdata(dev, pr);
 
 	return ret;
@@ -505,6 +653,10 @@ static void scmi_powercap_remove(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct scmi_powercap_root *pr = dev_get_drvdata(dev);
 
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_del(&pr->node);
+	mutex_unlock(&scmi_powercap_roots_lock);
+
 	scmi_powercap_unregister_all_zones(pr);
 }
 
@@ -525,7 +677,8 @@ static int __init scmi_powercap_init(void)
 {
 	int ret;
 
-	scmi_top_pcntrl = powercap_register_control_type(NULL, "arm-scmi", NULL);
+	scmi_top_pcntrl = powercap_register_control_type(NULL, "arm-scmi",
+							 &scmi_powercap_control_type_ops);
 	if (IS_ERR(scmi_top_pcntrl))
 		return PTR_ERR(scmi_top_pcntrl);
 
-- 
2.25.1


