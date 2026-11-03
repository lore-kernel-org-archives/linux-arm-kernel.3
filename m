Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AB606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TCrif8PS;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SuPpvCBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t6vdaU/yxePrUrRWUghg3cmrLMnFFTUJ28tlNRYh1tg=; b=TCrif8PSu5QdIj
	b++GD6dV8NBQMXEx19JtLVyb0TdF+/GEDQUO+04vCVRN7pDF0pzbamUWPZioRBb2eo6fyeDdcqdc3
	gCb8ohXwRyNVm/hheHUaBAXULr/qF7vpZjMA+1YAyXJW9mtIMtNGzWl4IMQotNTvNkDkUv7SZ9na0
	EtqB6piHfc02Ae5U2iOwPLDvUBu6uB1aoL3BOxyy6fwOHKAX7V3lvnP7Nv20ypPAd5Fs4NBJsf3mC
	tNb5xum/aaTkWQzLuWgaobNRWzb6DW9HgcKwLAcRXIw4XNupxrfA/tRI/263IHX1HlNb2L5IWvhJv
	P5NmnqTy0M+UlXQh0WiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONe7-00000003un1-1cUh;
	Tue, 03 Nov 2026 23:10:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONe5-00000003umH-0i7S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87D11650;
	Tue,  3 Nov 2026 15:10:20 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44EDF3F673;
	Tue,  3 Nov 2026 15:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747423; bh=lSnoEjxkr8+bXgJvQDCUdnuOVMPOKr7qwpgfoczF5wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SuPpvCBpFfk5cYB+bazpJbkD+cL53FvqkjnJGH9Bk2XI/MRjHAERJNu3L2dOtTCyj
	 NPiJo1xNcO7sNDsPWz1FrW0kjZ/1393Nz6RhdJZsgxlVqI1jdi0WyvV5V+rpFadvUo
	 7X964iWl/ezCUZNnfC4/2v3fV2YE9AZCsfk1/uyw=
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
Subject: [PATCH v10 01/13] powercap: Add enable disable control-type
Date: Tue,  3 Nov 2026 23:09:55 +0000
Message-Id: <20261103231007.537082-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151025_302468_00CB99B0 
X-CRM114-Status: GOOD (  17.55  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add functionality to disable or enable the Powercap control-type by writing
directly into sys/class/powercap/arm-scmi/enabled.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- changed control-type enable writes to snapshot per-zone state instead of
  aggregate
- cancel enable/disable writes if a root child zone is not configurable
- roll back changed zones on failure
- changed control-type enable reads to report enabled if any root child zone
  is enabled
---
 drivers/powercap/arm_scmi_powercap.c | 175 ++++++++++++++++++++++++++-
 1 file changed, 174 insertions(+), 1 deletion(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..ba398048bf21 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -33,13 +33,171 @@ struct scmi_powercap_zone {
 
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
+	*mode = false;
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
+		if (enabled) {
+			*mode = true;
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
+struct scmi_powercap_zone_state {
+	struct scmi_powercap_zone *spz;
+	bool prev_enabled;
+	bool changed;
+};
+
+static int
+scmi_powercap_control_type_set_enable(struct powercap_control_type *pct, bool mode)
+{
+	struct scmi_powercap_zone_state *states;
+	struct scmi_powercap_root *pr;
+	struct scmi_powercap_zone *spz;
+	int num_zones = 0, nr_states = 0;
+	int i, ret = 0;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_for_each_entry(pr, &scmi_powercap_roots, node) {
+		for (i = 0; i < pr->num_zones; i++) {
+			spz = &pr->spzones[i];
+
+			if (scmi_powercap_is_control_type_child(spz))
+				num_zones++;
+		}
+	}
+
+	states = kcalloc(num_zones, sizeof(*states), GFP_KERNEL);
+	if (!states) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	list_for_each_entry(pr, &scmi_powercap_roots, node)	{
+		for (i = 0; i < pr->num_zones; i++) {
+			spz = &pr->spzones[i];
+
+			if (!scmi_powercap_is_control_type_child(spz))
+				continue;
+
+			if (!spz->info->powercap_cap_config) {
+				ret = -EOPNOTSUPP;
+				goto out_free;
+			}
+
+			states[nr_states].spz = spz;
+
+			ret = powercap_ops->cap_enable_get(spz->ph, spz->info->id,
+				&states[nr_states].prev_enabled);
+
+			if (ret)
+				goto out_free;
+
+			nr_states++;
+		}
+	}
+
+	for (i = 0; i < nr_states; i++) {
+		spz = states[i].spz;
+
+		if (states[i].prev_enabled == mode)
+			continue;
+
+		ret = powercap_ops->cap_enable_set(spz->ph, spz->info->id, mode);
+		if (ret)
+			goto revert;
+
+		states[i].changed = true;
+	}
+
+	goto out_free;
+
+revert:
+	while (i--) {
+		spz = states[i].spz;
+
+		if (!states[i].changed)
+			continue;
+
+		powercap_ops->cap_enable_set(spz->ph, spz->info->id,
+			states[i].prev_enabled);
+	}
+
+out_free:
+			kfree(states);
+
+out_unlock:
+			mutex_unlock(&scmi_powercap_roots_lock);
+
+			return ret;
+}
+
+static int
+scmi_powercap_control_type_get_enable(struct powercap_control_type *pct, bool *mode)
+{
+	struct scmi_powercap_root *pr;
+	int ret = 0;
+
+	*mode = false;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_for_each_entry(pr, &scmi_powercap_roots, node) {
+		ret = scmi_powercap_read_root_children_enable_state(pr, &pr->enabled);
+
+		if (ret)
+			break;
+		if (pr->enabled) {
+			*mode = true;
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
@@ -495,6 +653,16 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
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
@@ -505,6 +673,10 @@ static void scmi_powercap_remove(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct scmi_powercap_root *pr = dev_get_drvdata(dev);
 
+	mutex_lock(&scmi_powercap_roots_lock);
+	list_del(&pr->node);
+	mutex_unlock(&scmi_powercap_roots_lock);
+
 	scmi_powercap_unregister_all_zones(pr);
 }
 
@@ -525,7 +697,8 @@ static int __init scmi_powercap_init(void)
 {
 	int ret;
 
-	scmi_top_pcntrl = powercap_register_control_type(NULL, "arm-scmi", NULL);
+	scmi_top_pcntrl = powercap_register_control_type(NULL, "arm-scmi",
+							 &scmi_powercap_control_type_ops);
 	if (IS_ERR(scmi_top_pcntrl))
 		return PTR_ERR(scmi_top_pcntrl);
 
-- 
2.34.1


