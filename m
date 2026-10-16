Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B0CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wO+17NEba/w0ERuX9KRmgugMa3iVrliIVyTSmSc/FkA=; b=NYiEjuL4vXGx18TgcwIo//z3r2
	r5b7h1q6UfGCvSoyjCIGguO9pbvsZVUcc/VzpbWFSmqpDU7slTTTc8I6NxQ5yaIKn4LkEVhABLErq
	A6O8VqJ6Pk0Jery5ZrfXM9vfslwhTQT1x3SOLn3CGHqFpaMeWv75bkAsIMG2FuLKCZ+kUOL5ESeo5
	Mv60wfmMOcZPUhb5+43YIB50Mo4Hi/eRJ0mfZ54K43O6uedGLqyHQ3bC+dye0OgVw8vUNM3eDsgDc
	8WC7nxUtZOHonhMfutlu5tDXiqRxaK9gGII4KF5bz+UViz/u9OdJq4ylzEjfIzDINKBGjkBpxPK8l
	AWkDayEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7B-00000003kCX-3Qmg;
	Fri, 16 Oct 2026 18:57:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn78-00000003k8o-3Jdk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9D4214BF;
	Fri, 16 Oct 2026 11:57:06 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4B883F7B4;
	Fri, 16 Oct 2026 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177030; bh=Pg0Kkrt38JbQ+jnbQMME/VJfwfO9clPsJospolzHTc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXOOhKVYlh5Bs1xeCIlPg3JbpFx52nAC3/RV+E1AQYwDPg75Lg4b0p05GbjGcRQEG
	 t6fCsKgK5SAbiaupE4s5+gbU4ol3izafihnZ2ekbtpqFk/N8490FrKmZKq8ZBhANXF
	 C3cGXgKavIuAknPX0GW++ALNWBHy8NUGqbDzACVU=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v14 09/32] firmware: arm_scmi: Add Telemetry groups initialization
Date: Fri, 16 Oct 2026 19:55:30 +0100
Message-ID: <20261016185553.2794459-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_115710_935806_9B77AF1E 
X-CRM114-Status: GOOD (  21.92  )
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

Allocate and initialize Telemetry Groups from base DataEvent data.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
- splitted out of the old Basic Telemetry patch, contains the
  groups initialization code.
---
 drivers/firmware/arm_scmi/telemetry.c | 149 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |  20 ++++
 2 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 87ff75805935..9e3dc2c2cc4b 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -123,6 +123,7 @@ struct telemetry_info {
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_de *tdes;
+	struct scmi_telemetry_group *grps;
 	struct xarray xa_des;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
@@ -321,6 +322,7 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 {
 	const struct scmi_de_desc *desc = *next;
 	size_t payld_sz = sizeof(*desc);
+	unsigned int grp_id;
 
 	lockdep_assert_held(&tde->mtx);
 
@@ -328,7 +330,22 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 		return -ENOSPC;
 
 	tde->de.info->id = le32_to_cpu(desc->de_id);
-	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
+	grp_id = le32_to_cpu(desc->group_id);
+	if (grp_id != SCMI_TLM_GRP_INVALID) {
+		struct scmi_telemetry_res_info *rinfo;
+
+		/* Get rinfo without triggering a recursive enumeration */
+		rinfo = __scmi_telemetry_resources_get(ti);
+
+		/* Group descriptors are empty but allocated at this point */
+		if (grp_id >= ti->info.base.num_groups)
+			return -EINVAL;
+
+		/* Link to parent group */
+		tde->de.grp = &rinfo->grps[grp_id];
+	}
+
+	tde->de.info->grp_id = grp_id;
 	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
 	tde->de.info->type = GET_DE_TYPE(desc);
 	tde->de.info->unit = GET_DE_UNIT(desc);
@@ -459,6 +476,96 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	if (tde->de.fc_support)
 		list_add(&tde->item, &ti->fcs_des);
 
+	/* Account for this DE in group num_de counter */
+	if (tde->de.grp)
+		tde->de.grp->info->num_des++;
+
+	return 0;
+}
+
+static int
+scmi_telemetry_de_groups_init(struct device *dev, struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_groups = 0;
+
+	/* Get rinfo without triggering a recursive enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	/* Allocate all groups DEs IDs arrays at first ... */
+	for (int i = 0; i < ti->info.base.num_groups; i++, num_groups++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+		size_t des_str_sz;
+
+		unsigned int *des __free(kfree) =
+			kzalloc_objs(unsigned int, grp->info->num_des);
+		if (!des)
+			break;
+
+		/*
+		 * Max size 32bit ID string in Hex: 0xCAFECAFE
+		 *  - 10 digits + ' '/'\n' = 11 bytes per  number
+		 *  - terminating NUL character
+		 */
+		des_str_sz = grp->info->num_des * 11 + 1;
+		char *des_str __free(kfree) = kzalloc_objs(*des_str, des_str_sz);
+		if (!des_str)
+			break;
+
+		grp->des = no_free_ptr(des);
+		grp->des_str = no_free_ptr(des_str);
+		/* Reset group DE counter */
+		grp->info->num_des = 0;
+	}
+
+	/* Unroll on failure... */
+	if (num_groups < ti->info.base.num_groups) {
+		for (int i = num_groups - 1; i >= 0; i--) {
+			kfree(rinfo->grps[i].des);
+			rinfo->grps[i].des = NULL;
+			kfree(rinfo->grps[i].des_str);
+			rinfo->grps[i].des_str = NULL;
+		}
+
+		return -ENOMEM;
+	}
+
+	/* Scan DEs and populate DE IDs arrays for all groups */
+	for (int i = 0; i < rinfo->num_des; i++) {
+		struct scmi_telemetry_group *grp;
+
+		grp = rinfo->des[i]->grp;
+		if (!grp)
+			continue;
+
+		/*
+		 * Note that, at this point, num_des is guaranteed to be
+		 * sane (in-bounds) by construction.
+		 */
+		grp->des[grp->info->num_des++] = i;
+	}
+
+	/* Build composing DES string */
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+		size_t bufsize = grp->info->num_des * 11 + 1;
+		char *buf = grp->des_str;
+
+		for (int j = 0; j < grp->info->num_des; j++) {
+			char term = j != (grp->info->num_des - 1) ? ' ' : '\0';
+			int len;
+
+			len = scnprintf(buf, bufsize, "0x%08X%c",
+					rinfo->des[grp->des[j]]->info->id, term);
+
+			buf += len;
+			bufsize -= len;
+		}
+	}
+
+	/* Expose all groups once all fully initialized */
+	rinfo->num_groups = num_groups;
+
 	return 0;
 }
 
@@ -491,7 +598,7 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	if (ret)
 		return ret;
 
-	return 0;
+	return scmi_telemetry_de_groups_init(ph->dev, ti);
 }
 
 static const struct scmi_telemetry_info *
@@ -561,6 +668,18 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 	if (!dei_store)
 		return -ENOMEM;
 
+	/* Array to hold descriptors of discovered GROUPs */
+	struct scmi_telemetry_group *grps __free(kfree) =
+		kzalloc_objs(*grps, ti->info.base.num_groups);
+	if (!grps)
+		return -ENOMEM;
+
+	/* Allocate a set of contiguous Group info descriptors. */
+	struct scmi_telemetry_grp_info *grps_store __free(kfree) =
+		kzalloc_objs(*grps_store, ti->info.base.num_groups);
+	if (!grps_store)
+		return -ENOMEM;
+
 	struct scmi_telemetry_res_info *rinfo __free(kfree) =
 		kzalloc_obj(*rinfo);
 	if (!rinfo)
@@ -577,12 +696,20 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 		scmi_telemetry_free_tde_put(ti, &tdes[i]);
 	}
 
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		grps_store[i].grp_id = i;
+		/* Bind contiguous Group info struct */
+		grps[i].info = &grps_store[i];
+	}
+
 	INIT_LIST_HEAD(&ti->fcs_des);
 
 	ti->tdes = no_free_ptr(tdes);
 
 	rinfo->des = no_free_ptr(des);
 	rinfo->dei_store = no_free_ptr(dei_store);
+	rinfo->grps = no_free_ptr(grps);
+	rinfo->grps_store = no_free_ptr(grps_store);
 
 	/* Ensure all of the above assignments are visible */
 	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
@@ -611,6 +738,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	kfree(rinfo->des);
 	kfree(rinfo->dei_store);
 
+	kfree(rinfo->grps);
+	kfree(rinfo->grps_store);
+
 	kfree(rinfo);
 
 	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
@@ -632,10 +762,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 	xa_destroy(&ti->xa_des);
 }
 
+static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
+{
+	/* Cannot be NULL here by construction, make sure it remains like that */
+	if (WARN_ON(!rinfo))
+		return;
+
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+
+		kfree(grp->des);
+		kfree(grp->des_str);
+	}
+}
+
 static void scmi_telemetry_instance_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
 
+	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 018427daf55f..51d4cbfc0969 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -826,6 +826,22 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+#define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
+
+struct scmi_telemetry_grp_info {
+	unsigned int grp_id;
+	unsigned int num_des;
+	unsigned int num_intervals;
+};
+
+struct scmi_telemetry_group {
+	bool enabled;
+	bool tstamp_enabled;
+	unsigned int *des;
+	char *des_str;
+	struct scmi_telemetry_grp_info *info;
+};
+
 struct scmi_telemetry_de_info {
 	unsigned int id;
 	unsigned int grp_id;
@@ -846,6 +862,7 @@ struct scmi_telemetry_de {
 	bool fc_support;
 	bool name_support;
 	struct scmi_telemetry_de_info *info;
+	struct scmi_telemetry_group *grp;
 	bool enabled;
 	bool tstamp_enabled;
 };
@@ -855,6 +872,9 @@ struct scmi_telemetry_res_info {
 	unsigned int num_des;
 	struct scmi_telemetry_de **des;
 	struct scmi_telemetry_de_info *dei_store;
+	unsigned int num_groups;
+	struct scmi_telemetry_group *grps __counted_by_ptr(num_groups);
+	struct scmi_telemetry_grp_info *grps_store;
 };
 
 struct scmi_telemetry_base_info {
-- 
2.54.0


