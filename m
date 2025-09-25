Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9810ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZWDr6Gtpw/LRhP/Rkvr8G9lkhbTGuisaYdyW8XHt0I=; b=FA3NT0SMWA9q39yQEWi+KKOBWr
	szwV612u2oFRFXeBNgZGY15EvqOJrATvjKAYemjV3LOSPObgmx1l15St3mYhpYoRdaJbuuD561YFg
	4jUzCrQdzjupILXp7gSdWPthr0Rrf+/icKCW0w5BaIl86BdrFUekv+eIUp062/+NHc7CGAp41DTNe
	cXnCLOT7h/EA/SrUkQiBlty63Qskc/lUIX+WHiE9jc11l4o7JOKooGQDyQRcfmz8ow71i/OymxFaE
	wDzTxCEFAM4V9eo3kojJMzeIp7ajoNGHC2X7uO6Vw15beYTqsU7etVC1VIGx6T5P4iDFJFFWhhjwJ
	bn23UibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1shx-0000000CnAP-3iVC;
	Thu, 25 Sep 2025 20:36:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1shn-0000000Cn1f-07h7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:36:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727F31C2B;
	Thu, 25 Sep 2025 13:36:34 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC06B3F694;
	Thu, 25 Sep 2025 13:36:39 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 07/10] firmware: arm_scmi: Add System Telemetry ioctls support
Date: Thu, 25 Sep 2025 21:35:51 +0100
Message-ID: <20250925203554.482371-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925203554.482371-1-cristian.marussi@arm.com>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_133643_185526_7B492962 
X-CRM114-Status: GOOD (  15.55  )
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

Extend the filesystem based interface with special 'control' file that can
be used to configure and retrieve SCMI Telemetry data in binary form using
the alternative ioctls-based ABI described in uapi/linux/scmi.h.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../firmware/arm_scmi/scmi_system_telemetry.c | 402 ++++++++++++++++++
 1 file changed, 402 insertions(+)

diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
index 2fec465b0f33..f591aad10302 100644
--- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
+++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
@@ -21,6 +21,8 @@
 #include <linux/string.h>
 #include <linux/uaccess.h>
 
+#include <uapi/linux/scmi.h>
+
 #define TLM_FS_MAGIC		0x75C01C80
 #define TLM_FS_NAME		"stlmfs"
 #define TLM_FS_MNT		"arm_telemetry"
@@ -953,6 +955,404 @@ DEFINE_TLM_CLASS(grp_available_interval_tlmo, "available_update_intervals_ms",
 DEFINE_TLM_CLASS(grp_intervals_discrete_tlmo, "intervals_discrete",
 		 TLM_IS_GROUP, 0400, &intrv_discrete_fops, NULL);
 
+static long
+scmi_tlm_info_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_telemetry_info *info = tlmi->priv;
+	void * __user uptr = (void * __user)arg;
+
+	if (copy_to_user(uptr, &info->base, sizeof(info->base)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_intervals_get_ioctl(const struct scmi_tlm_inode *tlmi,
+			     unsigned long arg, bool is_group)
+{
+	struct scmi_tlm_intervals ivs, *tlm_ivs;
+	void * __user uptr = (void * __user)arg;
+
+	if (copy_from_user(&ivs, uptr, sizeof(ivs)))
+		return -EFAULT;
+
+	if (!is_group) {
+		const struct scmi_telemetry_info *info = tlmi->priv;
+
+		tlm_ivs = info->intervals;
+	} else {
+		const struct scmi_telemetry_group *grp = tlmi->priv;
+
+		tlm_ivs = grp->intervals;
+	}
+
+	if (ivs.num != tlm_ivs->num)
+		return -EINVAL;
+
+	if (copy_to_user(uptr, tlm_ivs,
+			 sizeof(*tlm_ivs) + sizeof(u32) * ivs.num))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_de_config_set_ioctl(const struct scmi_tlm_inode *tlmi,
+			     unsigned long arg, bool all)
+{
+	const struct scmi_telemetry_info *info = tlmi->priv;
+	const struct scmi_tlm_setup *tsp = tlmi->tsp;
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_de_config tcfg = {};
+	int ret;
+
+	if (copy_from_user(&tcfg, uptr, sizeof(tcfg)))
+		return -EFAULT;
+
+	if (!all)
+		return tsp->ops->state_set(tsp->ph, false, tcfg.id,
+					   (bool *)&tcfg.enable,
+					   (bool *)&tcfg.t_enable);
+
+	for (int i = 0; i < info->base.num_des; i++) {
+		const struct scmi_telemetry_de *de = info->des[i];
+
+		ret = tsp->ops->state_set(tsp->ph, false, de->info->id,
+					  (bool *)&tcfg.enable,
+					  (bool *)&tcfg.t_enable);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static long
+scmi_tlm_de_config_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_tlm_setup *tsp = tlmi->tsp;
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_de_config tcfg = {};
+	int ret;
+
+	if (copy_from_user(&tcfg, uptr, sizeof(tcfg)))
+		return -EFAULT;
+
+	ret = tsp->ops->state_get(tsp->ph, tcfg.id,
+				  (bool *)&tcfg.enable, (bool *)&tcfg.t_enable);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uptr, &tcfg, sizeof(tcfg)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_config_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg,
+			  bool is_group)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_config cfg;
+
+	if (!is_group) {
+		const struct scmi_telemetry_info *info = tlmi->priv;
+
+		cfg.enable = !!info->enabled;
+		cfg.current_update_interval = info->active_update_interval;
+	} else {
+		const struct scmi_telemetry_group *grp = tlmi->priv;
+
+		cfg.enable = !!grp->enabled;
+		cfg.t_enable = !!grp->tstamp_enabled;
+		cfg.current_update_interval = grp->active_update_interval;
+	}
+
+	if (copy_to_user(uptr, &cfg, sizeof(cfg)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_config_set_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg,
+			  bool is_group)
+{
+	const struct scmi_tlm_setup *tsp = tlmi->tsp;
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_config cfg = {};
+	bool grp_ignore;
+	int res_id;
+
+	if (copy_from_user(&cfg, uptr, sizeof(cfg)))
+		return -EFAULT;
+
+	if (!is_group) {
+		res_id = SCMI_TLM_GRP_INVALID;
+		grp_ignore = true;
+	} else {
+		const struct scmi_telemetry_group *grp = tlmi->priv;
+		int ret;
+
+		res_id = grp->info->id;
+		grp_ignore = false;
+		ret = tsp->ops->state_set(tsp->ph, true, res_id,
+					  (bool *)&cfg.enable,
+					  (bool *)&cfg.t_enable);
+		if (ret)
+			return ret;
+	}
+
+	return tsp->ops->collection_configure(tsp->ph, res_id, grp_ignore,
+					      (bool *)&cfg.enable,
+					      &cfg.current_update_interval,
+					      NULL);
+}
+
+static long
+scmi_tlm_de_info_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_tlm_setup *tsp = tlmi->tsp;
+	void * __user uptr = (void * __user)arg;
+	const struct scmi_tlm_de_info *de_info;
+	struct scmi_tlm_de_info dei;
+
+	if (copy_from_user(&dei, uptr, sizeof(dei)))
+		return -EFAULT;
+
+	de_info = tsp->ops->de_info_get(tsp->ph, dei.id);
+	if (!de_info)
+		return -EINVAL;
+
+	if (copy_to_user(uptr, de_info, sizeof(*de_info)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_des_list_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_telemetry_info *info = tlmi->priv;
+	void * __user uptr = (void * __user)arg;
+	int num_des = info->base.num_des;
+	struct scmi_tlm_des_list dsl;
+
+	if (copy_from_user(&dsl, uptr, sizeof(dsl)))
+		return -EFAULT;
+
+	if (dsl.num_des < num_des)
+		return -EINVAL;
+
+	if (copy_to_user(uptr, &num_des, sizeof(num_des)))
+		return -EFAULT;
+
+	if (copy_to_user(uptr + sizeof(num_des), info->des_store,
+			 info->base.num_des * sizeof(*info->des_store)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_de_value_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_tlm_setup *tsp = tlmi->tsp;
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_de_sample sample;
+	int ret;
+
+	if (copy_from_user(&sample, uptr, sizeof(sample)))
+		return -EFAULT;
+
+	ret = tsp->ops->de_data_read(tsp->ph,
+				     (struct scmi_telemetry_de_sample *)&sample);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uptr, &sample, sizeof(sample)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_grp_info_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_telemetry_group *grp = tlmi->priv;
+	void * __user uptr = (void * __user)arg;
+
+	if (copy_to_user(uptr, grp->info, sizeof(*grp->info)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_grp_desc_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_telemetry_group *grp = tlmi->priv;
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_grp_desc grp_desc;
+	unsigned int num_des = grp->info->num_des;
+
+	if (copy_from_user(&grp_desc, uptr, sizeof(grp_desc)))
+		return -EFAULT;
+
+	if (grp_desc.num_des < num_des)
+		return -EINVAL;
+
+	if (copy_to_user(uptr, &num_des, sizeof(num_des)))
+		return -EFAULT;
+
+	if (copy_to_user(uptr + sizeof(num_des), grp->des,
+			 sizeof(*grp->des) * num_des))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_grps_list_get_ioctl(const struct scmi_tlm_inode *tlmi, unsigned long arg)
+{
+	const struct scmi_telemetry_info *info = tlmi->priv;
+	void * __user uptr = (void * __user)arg;
+	int num_grps = info->base.num_groups;
+	struct scmi_tlm_grps_list gsl;
+
+	if (copy_from_user(&gsl, uptr, sizeof(gsl)))
+		return -EFAULT;
+
+	if (gsl.num_grps < num_grps)
+		return -EINVAL;
+
+	if (copy_to_user(uptr, &num_grps, sizeof(num_grps)))
+		return -EFAULT;
+
+	if (copy_to_user(uptr + sizeof(num_grps), info->grps_store,
+			 info->base.num_groups * sizeof(*info->grps_store)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long scmi_tlm_des_read_ioctl(const struct scmi_tlm_inode *tlmi,
+				    unsigned long arg, bool single,
+				    bool is_group)
+{
+	const struct scmi_tlm_setup *tsp = tlmi->tsp;
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_data_read bulk, *bulk_ptr;
+	int ret, grp_id = SCMI_TLM_GRP_INVALID;
+
+	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
+		return -EFAULT;
+
+	bulk_ptr = kzalloc(struct_size(bulk_ptr, samples, bulk.num_samples),
+			   GFP_KERNEL);
+	if (!bulk_ptr)
+		return -ENOMEM;
+
+	if (is_group) {
+		const struct scmi_telemetry_group *grp = tlmi->priv;
+
+		grp_id = grp->info->id;
+	}
+
+	bulk_ptr->num_samples = bulk.num_samples;
+	if (!single)
+		ret = tsp->ops->des_bulk_read(tsp->ph, grp_id,
+					      &bulk_ptr->num_samples,
+			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
+	else
+		ret = tsp->ops->des_sample_get(tsp->ph, grp_id,
+					       &bulk_ptr->num_samples,
+			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
+	if (ret)
+		goto out;
+
+	if (copy_to_user(uptr, bulk_ptr, sizeof(*bulk_ptr) +
+			 bulk_ptr->num_samples * sizeof(bulk_ptr->samples[0])))
+		ret = -EFAULT;
+
+out:
+	kfree(bulk_ptr);
+
+	return ret;
+}
+
+static long scmi_tlm_unlocked_ioctl(struct file *filp, unsigned int cmd,
+				    unsigned long arg)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
+	bool is_group = IS_GROUP(tlmi->cls->flags);
+
+	switch (cmd) {
+	case SCMI_TLM_GET_INFO:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_info_get_ioctl(tlmi, arg);
+	case SCMI_TLM_GET_CFG:
+		return scmi_tlm_config_get_ioctl(tlmi, arg, is_group);
+	case SCMI_TLM_SET_CFG:
+		return scmi_tlm_config_set_ioctl(tlmi, arg, is_group);
+	case SCMI_TLM_GET_INTRVS:
+		return scmi_tlm_intervals_get_ioctl(tlmi, arg, is_group);
+	case SCMI_TLM_GET_DE_CFG:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_de_config_get_ioctl(tlmi, arg);
+	case SCMI_TLM_SET_DE_CFG:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_de_config_set_ioctl(tlmi, arg, false);
+	case SCMI_TLM_GET_DE_INFO:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_de_info_get_ioctl(tlmi, arg);
+	case SCMI_TLM_GET_DE_LIST:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_des_list_get_ioctl(tlmi, arg);
+	case SCMI_TLM_GET_DE_VALUE:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_de_value_get_ioctl(tlmi, arg);
+	case SCMI_TLM_SET_ALL_CFG:
+		return scmi_tlm_de_config_set_ioctl(tlmi, arg, true);
+	case SCMI_TLM_GET_GRP_LIST:
+		if (is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_grps_list_get_ioctl(tlmi, arg);
+	case SCMI_TLM_GET_GRP_INFO:
+		if (!is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_grp_info_get_ioctl(tlmi, arg);
+	case SCMI_TLM_GET_GRP_DESC:
+		if (!is_group)
+			return -EOPNOTSUPP;
+		return scmi_tlm_grp_desc_get_ioctl(tlmi, arg);
+	case SCMI_TLM_SINGLE_SAMPLE:
+		return scmi_tlm_des_read_ioctl(tlmi, arg, true, is_group);
+	case SCMI_TLM_BULK_READ:
+		return scmi_tlm_des_read_ioctl(tlmi, arg, false, is_group);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations scmi_tlm_ctrl_fops = {
+	.owner = THIS_MODULE,
+	.open = nonseekable_open,
+	.unlocked_ioctl = scmi_tlm_unlocked_ioctl,
+};
+
+DEFINE_TLM_CLASS(ctrl_tlmo, "control", 0, 0600, &scmi_tlm_ctrl_fops, NULL);
+DEFINE_TLM_CLASS(grp_ctrl_tlmo, "control", TLM_IS_GROUP, 0600,
+		 &scmi_tlm_ctrl_fops, NULL);
+
 static int scmi_telemetry_groups_initialize(struct device *dev,
 					    struct scmi_tlm_instance *ti)
 {
@@ -989,6 +1389,7 @@ static int scmi_telemetry_groups_initialize(struct device *dev,
 		TLM_INODE_SETUP(ti, tsp, &grp_composing_des_tlmo, grp_dir_inode,
 				grp->des_str);
 
+		TLM_INODE_SETUP(ti, tsp, &grp_ctrl_tlmo, grp_dir_inode, grp);
 		TLM_INODE_SETUP(ti, tsp, &grp_data_tlmo, grp_dir_inode, grp);
 		TLM_INODE_SETUP(ti, tsp, &grp_single_sample_tlmo, grp_dir_inode, grp);
 
@@ -1050,6 +1451,7 @@ static int scmi_tlm_root_instance_initialize(struct device *dev,
 	TLM_INODE_SETUP(ti, tsp, &version_tlmo, NULL, &ti->info->base.version);
 	TLM_INODE_SETUP(ti, tsp, &data_tlmo, NULL, ti->info);
 	TLM_INODE_SETUP(ti, tsp, &single_sample_tlmo, NULL, ti->info);
+	TLM_INODE_SETUP(ti, tsp, &ctrl_tlmo, NULL, ti->info);
 
 	return 0;
 }
-- 
2.51.0


