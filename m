Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D62CF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uMg09ugtRS6jGSfazNPs1XLjURYa1PLl9GnzNWeZGA=; b=HC1uHEDw9womUwz9l2OBJjCaVc
	+Yf0FnzwT+bInVu7l6mNklyExDR3V1hssms+vfWq3cDn5PqZ+MNUIFuljbN8Lg2KrDfjGzl9MBTIz
	Gu3w6R2RwTgcsCd4ZtufzGr82wQ1NPtpeUvsSeXaNQilrTQTfjSHpTAzvNfEAMjx005gbU7SznE1q
	oInmTXSksx25RXGQcXrtCtkslnCpFTVzmZZHSW24kbTRQl7MZQ2D7F+vsNP+BpHZN4MnYXn97WFGy
	2z0c8BTyv69RIbk5KnfCaIjyoKHR+74u4kLfx5JSo8YKHbK2mv+/T0XZVC3/GCbjyL1XVAyCgvnwU
	eeii4kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKY-00000005oQl-2UFK;
	Mon, 12 Jan 2026 17:03:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKU-00000005oMg-2kMz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:03:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58CCC1516;
	Mon, 12 Jan 2026 09:03:39 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F04043F694;
	Mon, 12 Jan 2026 09:03:40 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 43/47] arm_mpam: Add quirk framework
Date: Mon, 12 Jan 2026 16:59:10 +0000
Message-ID: <20260112165914.4086692-44-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090346_797708_24AB06AB 
X-CRM114-Status: GOOD (  18.80  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM specification includes the MPAMF_IIDR, which serves to uniquely
identify the MSC implementation through a combination of implementer
details, product ID, variant, and revision. Certain hardware issues/errata
can be resolved using software workarounds.

Introduce a quirk framework to allow workarounds to be enabled based on the
MPAMF_IIDR value.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Co-developed-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Co-developed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes by James:
Stash the IIDR so this doesn't need an IPI, enable quirks only
once, move the description to the callback so it can be pr_once()d, add an
enum of workarounds for popular errata. Add macros for making lists of
product/revision/vendor half readable

Changes since rfc:
remove trailing commas in last element of enums
Make mpam_enable_quirks() in charge of mpam_set_quirk() even if there
is an enable.
---
 drivers/resctrl/mpam_devices.c  | 32 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h | 25 +++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 37bd8efc6ecf..5f741df9abcc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -630,6 +630,30 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
 	return ERR_PTR(-ENOENT);
 }
 
+static const struct mpam_quirk mpam_quirks[] = {
+	{ NULL } /* Sentinel */
+};
+
+static void mpam_enable_quirks(struct mpam_msc *msc)
+{
+	const struct mpam_quirk *quirk;
+
+	for (quirk = &mpam_quirks[0]; quirk->iidr_mask; quirk++) {
+		int err = 0;
+
+		if (quirk->iidr != (msc->iidr & quirk->iidr_mask))
+			continue;
+
+		if (quirk->init)
+			err = quirk->init(msc, quirk);
+
+		if (err)
+			continue;
+
+		mpam_set_quirk(quirk->workaround, msc);
+	}
+}
+
 /*
  * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
  * of NRDY, software can use this bit for any purpose" - so hardware might not
@@ -864,8 +888,11 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	/* Grab an IDR value to find out how many RIS there are */
 	mutex_lock(&msc->part_sel_lock);
 	idr = mpam_msc_read_idr(msc);
+	msc->iidr = mpam_read_partsel_reg(msc, IIDR);
 	mutex_unlock(&msc->part_sel_lock);
 
+	mpam_enable_quirks(msc);
+
 	msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
 
 	/* Use these values so partid/pmg always starts with a valid value */
@@ -1993,6 +2020,7 @@ static bool mpam_has_cmax_wd_feature(struct mpam_props *props)
  * resulting safe value must be compatible with both. When merging values in
  * the tree, all the aliasing resources must be handled first.
  * On mismatch, parent is modified.
+ * Quirks on an MSC will apply to all MSC in that class.
  */
 static void __props_mismatch(struct mpam_props *parent,
 			     struct mpam_props *child, bool alias)
@@ -2112,6 +2140,7 @@ static void __props_mismatch(struct mpam_props *parent,
  * nobble the class feature, as we can't configure all the resources.
  * e.g. The L3 cache is composed of two resources with 13 and 17 portion
  * bitmaps respectively.
+ * Quirks on an MSC will apply to all MSC in that class.
  */
 static void
 __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
@@ -2125,6 +2154,9 @@ __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
 	dev_dbg(dev, "Merging features for class:0x%lx &= vmsc:0x%lx\n",
 		(long)cprops->features, (long)vprops->features);
 
+	/* Merge quirks */
+	class->quirks |= vmsc->msc->quirks;
+
 	/* Take the safe value for any common features */
 	__props_mismatch(cprops, vprops, false);
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 69cb75616561..d60a3caf6f6e 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -85,6 +85,8 @@ struct mpam_msc {
 	u8			pmg_max;
 	unsigned long		ris_idxs;
 	u32			ris_max;
+	u32			iidr;
+	u16			quirks;
 
 	/*
 	 * error_irq_lock is taken when registering/unregistering the error
@@ -216,6 +218,28 @@ struct mpam_props {
 #define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
 #define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
 
+/* Workaround bits for msc->quirks */
+enum mpam_device_quirks {
+	MPAM_QUIRK_LAST
+};
+
+#define mpam_has_quirk(_quirk, x)	((1 << (_quirk) & (x)->quirks))
+#define mpam_set_quirk(_quirk, x)	((x)->quirks |= (1 << (_quirk)))
+
+struct mpam_quirk {
+	int (*init)(struct mpam_msc *msc, const struct mpam_quirk *quirk);
+
+	u32 iidr;
+	u32 iidr_mask;
+
+	enum mpam_device_quirks workaround;
+};
+
+#define MPAM_IIDR_MATCH_ONE	FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0xfff)	| \
+				FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0xf)	| \
+				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf)	| \
+				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff)
+
 /* The values for MSMON_CFG_MBWU_FLT.RWBW */
 enum mon_filter_options {
 	COUNT_BOTH	= 0,
@@ -259,6 +283,7 @@ struct mpam_class {
 
 	struct mpam_props	props;
 	u32			nrdy_usec;
+	u16			quirks;
 	u8			level;
 	enum mpam_class_types	type;
 
-- 
2.43.0


