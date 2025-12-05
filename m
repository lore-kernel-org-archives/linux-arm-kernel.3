Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE524D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RITj9sqxABVEOfScRNfViPst7aXao94YisTkC1vBYE=; b=erTMdMPyOHCeb/e2U0ExlruGzG
	mG/bjc2atN+3YbmyC2Blc1X7nykgT9/KIJ4WE8nSmBRYbq/On2a+fxVUPY41N6uJhs10Lyzx/GUuR
	RFd8dnp++A8rHZqYF9O6NMVJrGO29/l40PF/nzjnjCGfEn/6opM5+EEULNGvv4/wp7VJuNMVgKB/j
	jtYQxFPZmK7StgxtSrQVXEM4ki3MFExVI3b5eFK5kqHmhtZ8/T9nEJ760cJQFo7KniAmaSNekoBYr
	ipHM/flpBrAZ6vDBEKP5RZ5tae4gksGDiXDAFckNcwoHRT+KB6X/9ltyqGMQGucIq4HrbHgLCM3y7
	+OpLmIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdsH-0000000A7P7-0Q2J;
	Fri, 05 Dec 2025 22:02:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdsF-0000000A7ND-3GlQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9RITj9sqxABVEOfScRNfViPst7aXao94YisTkC1vBYE=; b=RK9wittVtI4xWkwm0NEPyccNZW
	2XNooKSqLuMA7SsGTxu+WG9mJviTNKenbyhfyQVxXcx09zrg+nv1qJvU/6hZ7lE0pG8obk9df1J4Y
	hJyv8xZclmarQ70o2Yp0nCaPXU3ROjisupuN/NPGcxSH6xt5cWxhp/axjyTcMuRt7WC7LKE60EzBa
	DGmbrP9Bm6SM1eJD0oiyVHOvJihj+cIH15L5u1ue6O/SDptQIkLWvjnKkvGsyc7yuaTw3AfU32/aC
	pAqo0qVDgwj+mXPw86IEzZ1y+eGdM1shOCn9ZeaUBhgvavPzKfr5w1pQ4YBt7/loRBbWRC9HfSgGs
	wYlCaAVQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRd0X-00000006sww-0nri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:06:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 482581BCB;
	Fri,  5 Dec 2025 14:01:39 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA59E3F740;
	Fri,  5 Dec 2025 14:01:42 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 34/38] arm_mpam: Add quirk framework
Date: Fri,  5 Dec 2025 21:58:57 +0000
Message-Id: <20251205215901.17772-35-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210630_785272_26A68C2D 
X-CRM114-Status: GOOD (  17.52  )
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

The MPAM specification includes the MPAMF_IIDR, which serves to
uniquely identify the MSC implementation through a combination of
implementer details, product ID, variant, and revision. Certain
hardware issues/errata can be resolved using software workarounds.

Introduce a quirk framework to allow workarounds to be enabled based
on the MPAMF_IIDR value.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: Stash the IIDR so this doesn't need an IPI, enable quirks only
  once, move the description to the callback so it can be pr_once()d, add
  an enum of workarounds for popular errata. Add macros for making lists
  of product/revision/vendor half readable ]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 27 +++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h | 26 ++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 741e14e1e6cf..f0f6f9b55ad4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -630,6 +630,25 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
 	return ERR_PTR(-ENOENT);
 }
 
+static const struct mpam_quirk mpam_quirks[] = {
+	{ NULL }, /* Sentinel */
+};
+
+static void mpam_enable_quirks(struct mpam_msc *msc)
+{
+	const struct mpam_quirk *quirk;
+
+	for (quirk = &mpam_quirks[0]; quirk->iidr_mask; quirk++) {
+		if (quirk->iidr != (msc->iidr & quirk->iidr_mask))
+			continue;
+
+		if (quirk->init)
+			quirk->init(msc, quirk);
+		else
+			mpam_set_quirk(quirk->workaround, msc);
+	}
+}
+
 /*
  * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
  * of NRDY, software can use this bit for any purpose" - so hardware might not
@@ -864,8 +883,11 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	/* Grab an IDR value to find out how many RIS there are */
 	mutex_lock(&msc->part_sel_lock);
 	idr = mpam_msc_read_idr(msc);
+	msc->iidr = mpam_read_partsel_reg(msc, IIDR);
 	mutex_unlock(&msc->part_sel_lock);
 
+	mpam_enable_quirks(msc);
+
 	msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
 
 	/* Use these values so partid/pmg always starts with a valid value */
@@ -1987,6 +2009,7 @@ static bool mpam_has_cmax_wd_feature(struct mpam_props *props)
  * resulting safe value must be compatible with both. When merging values in
  * the tree, all the aliasing resources must be handled first.
  * On mismatch, parent is modified.
+ * Quirks on an MSC will apply to all MSC in that class.
  */
 static void __props_mismatch(struct mpam_props *parent,
 			     struct mpam_props *child, bool alias)
@@ -2106,6 +2129,7 @@ static void __props_mismatch(struct mpam_props *parent,
  * nobble the class feature, as we can't configure all the resources.
  * e.g. The L3 cache is composed of two resources with 13 and 17 portion
  * bitmaps respectively.
+ * Quirks on an MSC will apply to all MSC in that class.
  */
 static void
 __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
@@ -2119,6 +2143,9 @@ __class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
 	dev_dbg(dev, "Merging features for class:0x%lx &= vmsc:0x%lx\n",
 		(long)cprops->features, (long)vprops->features);
 
+	/* Merge quirks */
+	class->quirks |= vmsc->msc->quirks;
+
 	/* Take the safe value for any common features */
 	__props_mismatch(cprops, vprops, false);
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index d381906545ed..de3e5faa12b2 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -88,6 +88,8 @@ struct mpam_msc {
 	u8			pmg_max;
 	unsigned long		ris_idxs;
 	u32			ris_max;
+	u32			iidr;
+	u16			quirks;
 
 	/*
 	 * error_irq_lock is taken when registering/unregistering the error
@@ -215,6 +217,29 @@ struct mpam_props {
 #define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
 #define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
 
+/* Workaround bits for msc->quirks */
+enum mpam_device_quirks {
+	MPAM_QUIRK_LAST,
+};
+
+#define mpam_has_quirk(_quirk, x)	((1 << (_quirk) & (x)->quirks))
+#define mpam_set_quirk(_quirk, x)	((x)->quirks |= (1 << (_quirk)))
+
+struct mpam_quirk {
+	void (*init)(struct mpam_msc *msc, const struct mpam_quirk *quirk);
+
+	u32 iidr;
+	u32 iidr_mask;
+
+	enum mpam_device_quirks workaround;
+};
+
+#define MPAM_IIDR_MATCH_ONE	FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0xfff) | \
+				FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0xf  ) | \
+				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf  ) | \
+				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff)
+
+
 /* The values for MSMON_CFG_MBWU_FLT.RWBW */
 enum mon_filter_options {
 	COUNT_BOTH	= 0,
@@ -258,6 +283,7 @@ struct mpam_class {
 
 	struct mpam_props	props;
 	u32			nrdy_usec;
+	u16			quirks;
 	u8			level;
 	enum mpam_class_types	type;
 
-- 
2.39.5


