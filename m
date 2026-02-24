Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281FDF4BB69
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40K6MFobGyYbAnkaPfvmQwTJL8H65NUqRBywba4rod4=; b=hdgq0tAajWrTK9V6HOMDqJAn2r
	N4gw/wQ5vmwHFCVpRemJGOJPDvlIneiP7qoJqUAZVabBsIR87nUcsOyJJuH9+Veu2q+oxGILfnHzN
	CnxGGdVlm1fQSbLuN16jZ3AmObM4zw3Z0CrdSZ4DrwDVYKeDeiaYTGuXr0yjQNTnB6jcQjwrkho7l
	UCT7e7Tp4p198mvWVjxFT0rhkj+LwTTvLgIwmBZBRugp4r2XTvxoxGGMPn6ibP9B7WqKhKYzdaMO3
	e/xt1qesJTYkWFI5tlwAAxzo1TsqbAth2FU7EyxpSvuikSIN5cUXvMEB52iz0hXH+xQ6zlfKksFaU
	alow/dUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwiR-00000002aGi-2vGT;
	Tue, 24 Feb 2026 18:00:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwiQ-00000002aEV-299s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 18:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=40K6MFobGyYbAnkaPfvmQwTJL8H65NUqRBywba4rod4=; b=UvMbrx054YN5nt5mLWYMDNXOWg
	luOmu1M8I0Wi/GQWhkhLJXWPQve43Ktvrz1MwcM1VU//fvflIfi4iotBB1TaGws+JiRFQRPVsCxw8
	FyLfw5w1LwD8UpVZ6hDvfNsUnXRCgtZmijQUqkygUVsAxXEB2jmL/y9WaaFr2MGpZqnJxmZ7QUlaQ
	5p7m0HDJIvwQIXCY+N0aNDuChssNZwcFq4NM++XZTfLNvX27t4FuzhtVKPO5dfJn2it75e4WLN1Lc
	r96dd25C3qCtHjPIR7YXLZJGQ+W1YNUryTtrVfHOclwv71pahjAuZqwLA8IbR38NUlHqLFd3KOSMc
	mbEPvPVg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwiM-00000007eO0-3aNx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E12E1595;
	Tue, 24 Feb 2026 10:00:47 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 078053F59E;
	Tue, 24 Feb 2026 10:00:47 -0800 (PST)
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
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 36/41] arm_mpam: Add quirk framework
Date: Tue, 24 Feb 2026 17:57:15 +0000
Message-ID: <20260224175720.2663924-37-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_180055_278858_922856E5 
X-CRM114-Status: GOOD (  18.44  )
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

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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

Changes since v3:
Brackets in macro
---
 drivers/resctrl/mpam_devices.c  | 32 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h | 25 +++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 528936ececd9..382dc5c9b885 100644
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
@@ -1988,6 +2015,7 @@ static bool mpam_has_cmax_wd_feature(struct mpam_props *props)
  * resulting safe value must be compatible with both. When merging values in
  * the tree, all the aliasing resources must be handled first.
  * On mismatch, parent is modified.
+ * Quirks on an MSC will apply to all MSC in that class.
  */
 static void __props_mismatch(struct mpam_props *parent,
 			     struct mpam_props *child, bool alias)
@@ -2107,6 +2135,7 @@ static void __props_mismatch(struct mpam_props *parent,
  * nobble the class feature, as we can't configure all the resources.
  * e.g. The L3 cache is composed of two resources with 13 and 17 portion
  * bitmaps respectively.
+ * Quirks on an MSC will apply to all MSC in that class.
  */
 static void
 __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
@@ -2120,6 +2149,9 @@ __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
 	dev_dbg(dev, "Merging features for class:0x%lx &= vmsc:0x%lx\n",
 		(long)cprops->features, (long)vprops->features);
 
+	/* Merge quirks */
+	class->quirks |= vmsc->msc->quirks;
+
 	/* Take the safe value for any common features */
 	__props_mismatch(cprops, vprops, false);
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index a79c7670f7ae..60e445e94ee6 100644
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
+#define MPAM_IIDR_MATCH_ONE	(FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0xfff) | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0xf)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff))
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


