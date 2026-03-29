Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4835FF3D611
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4S08prD3FsKoqgrkfvs4+wkCnuuCxKGRsZPuCqUOnZI=; b=sxw9GPNohc9SeTCLZPv85uuJo4
	q3Q1JY0VNZ9s3REvTX5gMk/nBmQt7HDK5n/FQLKfkqxNVGWCgIT19LkujZQSmq4jP6jbeSt21sL+R
	vpFlpRidJ7hMgKaa2EYMbYnnbP4pX2rfgELREsos7/0z/YK1v9neGdG2aedeNjYYvMe5sj7UUPoXV
	ACA307hHVUvbymvTYi7YVjfsGif2nQ+R9YtAujZR/lL4krPaIn3F4lfxc0CSQ3DavJd8Lt4iVPPWs
	CqFHx1q6cPeYTTKLXs+c2CQMVMuR9JV8njWhJdlwjEyKPZ7aBCAdXh8yvYBvDFdOm6WgN9TpAOanc
	SSYa2K5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t65-0000000A81n-35da;
	Sun, 29 Mar 2026 16:34:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t5r-0000000A7t8-12Vm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:34:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE112A31;
	Sun, 29 Mar 2026 09:34:23 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AA2E3F915;
	Sun, 29 Mar 2026 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802069; bh=fnXhKVdhlY/emgRar6UTkKK8jLufTrQGSkiiNKTy9CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l8qWKYlczfaOXWs4RZZHRS9JREnbz6EEWo3rrdnG59I3dIUiCRqherz1qzVnmV9/O
	 zxlgWL5BUtAZo7/pPLDcqKHOsOhyj9DKFYtS+Gzc8lJqNc/eR79IVxEYhxZVM6oM4o
	 EKTSKUpSH6kwQGVyqUOLN7smvJIJi4eL+NH1iFYo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 05/24] uapi: Add ARM SCMI definitions
Date: Sun, 29 Mar 2026 17:33:16 +0100
Message-ID: <20260329163337.637393-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093431_403085_7EFAE0FF 
X-CRM114-Status: GOOD (  16.71  )
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

Add a number of structures and ioctls definitions used by the ARM
SCMI Telemetry protocol.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - Change tstamp_exp tp ts_rate
 - renamed num -> num_intervals in scmi_tlm_interval
 - added padding in scmi_tlm_de_sample to avoid packing issues on 32bit
v1 --> v2
 - Added proper __counted_by marks
 - Fixed a few dox comments
 - Renamed reserved[] fields to pad[]
---
 MAINTAINERS               |   1 +
 include/uapi/linux/scmi.h | 289 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 290 insertions(+)
 create mode 100644 include/uapi/linux/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d10988cbc62..dcf2c97e4e5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25708,6 +25708,7 @@ F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
+F:	include/uapi/linux/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
 
 SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX Extension Message Protocol drivers
diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
new file mode 100644
index 000000000000..abf68bb99960
--- /dev/null
+++ b/include/uapi/linux/scmi.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+#ifndef _UAPI_LINUX_SCMI_H
+#define _UAPI_LINUX_SCMI_H
+
+/*
+ * Userspace interface SCMI Telemetry
+ */
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define SCMI_TLM_DE_IMPL_MAX_DWORDS	4
+
+#define SCMI_TLM_GRP_INVALID            0xFFFFFFFF
+
+/**
+ * scmi_tlm_base_info - Basic info about an instance
+ *
+ * @version: SCMI Telemetry protocol version
+ * @de_impl_version: SCMI Telemetry DE implementation revision
+ * @num_de: Number of defined DEs
+ * @num_groups Number of defined DEs groups
+ * @num_intervals: Number of update intervals available (instance-level)
+ * @flags: Instance specific feature-support bitmap
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_INFO
+ *
+ * Supported by:
+ *	control/
+ */
+struct scmi_tlm_base_info {
+	__u32 version;
+	__u32 de_impl_version[SCMI_TLM_DE_IMPL_MAX_DWORDS];
+	__u32 num_des;
+	__u32 num_groups;
+	__u32 num_intervals;
+	__u32 flags;
+#define SCMI_TLM_CAN_RESET	(1 << 0)
+};
+
+/**
+ * scmi_tlm_config  - Whole instance or group configuration
+ *
+ * @enable: Enable/Disable Telemetry for the whole instance or the group.
+ * @t_enable: Enable/Disable timestamping for all the DEs belonging to a group.
+ * @pad: Padding fields to enforce alignment.
+ * @current_update_interval: Get/Set currently active update interval for the
+ *			     whole instance or a group.
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_CFG
+ *	WO - SCMI_TLM_SET_CFG
+ *
+ * Supported by:
+ *	control/
+ *	groups/<N>/control
+ */
+struct scmi_tlm_config {
+	__u8 enable;
+	__u8 t_enable;
+	__u8 pad[2];
+	__u32 current_update_interval;
+};
+
+/**
+ * scmi_tlm_intervals  - Update intervals descriptor
+ *
+ * @discrete: Flag to indicate the nature of the intervals described in
+ *	      @update_intervals.
+ *	      When 'false' @update_intervals is a triplet: min/max/step
+ * @pad: Padding fields to enforce alignment.
+ * @num_intervals: Number of entries of @update_intervals
+ * @update_intervals: A variably-sized array containing the update intervals
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_INTRVS
+ *
+ * Supported by:
+ *	control/
+ *	groups/<N>/control
+ */
+struct scmi_tlm_intervals {
+	__u8 discrete;
+	__u8 pad[3];
+	__u32 num_intervals;
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
+	__u32 update_intervals[] __counted_by(num_intervals);
+};
+
+/**
+ * scmi_tlm_de_config  - DE configuration
+ *
+ * @id: Identifier of the DE to act upon (ignored by SCMI_TLM_SET_ALL_CFG)
+ * @enable: A boolean to enable/disable the DE
+ * @t_enable: A boolean to enable/disable the timestamp for this DE
+ *	      (if supported)
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_CFG
+ *	RW - SCMI_TLM_SET_DE_CFG
+ *	WO - SCMI_TLM_SET_ALL_CFG
+ *
+ * Supported by:
+ *	control/
+ */
+struct scmi_tlm_de_config {
+	__u32 id;
+	__u32 enable;
+	__u32 t_enable;
+};
+
+/**
+ * scmi_tlm_de_info  - DE Descriptor
+ *
+ * @id: DE identifier
+ * @grp_id: Identifier of the group which this DE belongs to; reported as
+ *	    SCMI_TLM_GRP_INVALID when not part of any group
+ * @data_sz: DE data size in bytes
+ * @type: DE type
+ * @unit: DE unit of measurements
+ * @unit_exp: Power-of-10 multiplier for DE unit
+ * @ts_rate: Clock rate in kHz used to generate the DE timestamp
+ * @instance_id: DE instance ID
+ * @compo_instance_id: DE component instance ID
+ * @compo_type: Type of component which is associated to this DE
+ * @persistent: Data value for this DE survives reboot (non-cold ones)
+ * @name: Optional name of this DE
+ *
+ * Used to get the full description of a DE: it reflects DE Descriptors
+ * definitions in 3.12.4.6.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_INFO
+ *
+ * Supported by:
+ *	control/
+ */
+struct scmi_tlm_de_info {
+	__u32 id;
+	__u32 grp_id;
+	__u32 data_sz;
+	__u32 type;
+	__u32 unit;
+	__s32 unit_exp;
+	__s32 ts_rate;
+	__u32 instance_id;
+	__u32 compo_instance_id;
+	__u32 compo_type;
+	__u32 persistent;
+	__u8 name[16];
+};
+
+/**
+ * scmi_tlm_des_list  - List of all defined DEs
+ *
+ * @num_des: Number of entries in @des
+ * @des: An array containing descriptors for all defined DEs
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_LIST
+ *
+ * Supported by:
+ *	control/
+ */
+struct scmi_tlm_des_list {
+	__u32 num_des;
+	struct scmi_tlm_de_info des[] __counted_by(num_des);
+};
+
+/**
+ * scmi_tlm_de_sample - A DE reading
+ *
+ * @id: DE identifier
+ * @pad: Padding fields to enforce alignment.
+ * @tstamp: DE reading timestamp (equal 0 is NOT supported)
+ * @val: Reading of the DE data value
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_VALUE
+ *
+ * Supported by:
+ *	control/
+ */
+struct scmi_tlm_de_sample {
+	__u32 id;
+	__u32 pad;
+	__u64 tstamp;
+	__u64 val;
+};
+
+/**
+ * scmi_tlm_data_read - Bulk read of multiple DEs
+ *
+ * @num_samples: Number of entries returned in @samples
+ * @samples: An array of samples containing an entry for each DE that was
+ *	     enabled when the single sample read request was issued.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_SINGLE_SAMPLE
+ *	RW - SCMI_TLM_BULK_READ
+ *
+ * Supported by:
+ *	control/
+ *	groups/<N>/control
+ */
+struct scmi_tlm_data_read {
+	__u32 num_samples;
+	struct scmi_tlm_de_sample samples[] __counted_by(num_samples);
+};
+
+/**
+ * scmi_tlm_grp_info  - DE-group descriptor
+ *
+ * @id: Group ID number
+ * @num_des: Number of DEs part of this group
+ * @num_intervals: Number of update intervals supported. Zero if group does not
+ *		   support per-group update interval configuration.
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_GRP_INFO
+ *
+ * Supported by:
+ *	groups/<N>control/
+ */
+struct scmi_tlm_grp_info {
+	__u32 id;
+	__u32 num_des;
+	__u32 num_intervals;
+};
+
+/**
+ * scmi_tlm_grps_list  - DE-groups List
+ *
+ * @num_grps: Number of entries returned in @grps
+ * @grps: An array containing descriptors for all defined DE Groups
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_GRP_LIST
+ *
+ * Supported by:
+ *	control/
+ */
+struct scmi_tlm_grps_list {
+	__u32 num_grps;
+	struct scmi_tlm_grp_info grps[] __counted_by(num_grps);
+};
+
+/**
+ * scmi_tlm_grp_desc  - Group descriptor
+ *
+ * @num_des: Number of DEs part of this group
+ * @composing_des: An array containing the DE IDs that belongs to this group.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_GRP_DESC
+ *
+ * Supported by:
+ *	groups/<N>control/
+ */
+struct scmi_tlm_grp_desc {
+	__u32 num_des;
+	__u32 composing_des[] __counted_by(num_des);
+};
+
+#define SCMI 0xF1
+
+#define SCMI_TLM_GET_INFO	_IOR(SCMI,  0x00, struct scmi_tlm_base_info)
+#define SCMI_TLM_GET_CFG	_IOR(SCMI,  0x01, struct scmi_tlm_config)
+#define SCMI_TLM_SET_CFG	_IOW(SCMI,  0x02, struct scmi_tlm_config)
+#define SCMI_TLM_GET_INTRVS	_IOWR(SCMI, 0x03, struct scmi_tlm_intervals)
+#define SCMI_TLM_GET_DE_CFG	_IOWR(SCMI, 0x04, struct scmi_tlm_de_config)
+#define SCMI_TLM_SET_DE_CFG	_IOWR(SCMI, 0x05, struct scmi_tlm_de_config)
+#define SCMI_TLM_GET_DE_INFO	_IOWR(SCMI, 0x06, struct scmi_tlm_de_info)
+#define SCMI_TLM_GET_DE_LIST	_IOWR(SCMI, 0x07, struct scmi_tlm_des_list)
+#define SCMI_TLM_GET_DE_VALUE	_IOWR(SCMI, 0x08, struct scmi_tlm_de_sample)
+#define SCMI_TLM_SET_ALL_CFG	_IOW(SCMI,  0x09, struct scmi_tlm_de_config)
+#define SCMI_TLM_GET_GRP_LIST	_IOWR(SCMI, 0x0A, struct scmi_tlm_grps_list)
+#define SCMI_TLM_GET_GRP_INFO	_IOR(SCMI,  0x0B, struct scmi_tlm_grp_info)
+#define SCMI_TLM_GET_GRP_DESC	_IOWR(SCMI, 0x0C, struct scmi_tlm_grp_desc)
+#define SCMI_TLM_SINGLE_SAMPLE	_IOWR(SCMI, 0x0D, struct scmi_tlm_data_read)
+#define SCMI_TLM_BULK_READ	_IOWR(SCMI, 0x0E, struct scmi_tlm_data_read)
+
+#endif /* _UAPI_LINUX_SCMI_H */
-- 
2.53.0


