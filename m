Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E3AF4BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4utsMnQanO351wh18VC6PeXbGVzWNGEEZIvIh1PlKk=; b=NG2G9VWQj63BlDkcFoRS9wKYY7
	OJMCWydy4LEepe3PSl64BY+pUi5e7SM05s5fzULT79RKFHlSgn9tuASvWoT1XBmkSYnYWZxLs7imE
	z0eJURTIY8yPbCLTooDWJVJ13aEEhU1s5UmfLBNZZB6D87PeE32jMwKhADpcJte2BAmGWKQDjyXO/
	Z+ZGdOTKuRNyv3WnfphKETi0FPJ3H7SQJmTvO8AgPRt3KPl1DsfJc4w/ivjBhjninY+tHDtxLsdQ2
	Xoqs+FYmd+sTuj2mCL45j2Ifs99T9Zadmi303ckghVVTGlhfffsOyBkeV1szB9VS8QPExclP4PMKr
	rmU3Y9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgi-00000002Y28-2xwY;
	Tue, 24 Feb 2026 17:59:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgW-00000002XmC-406M
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 17:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=u4utsMnQanO351wh18VC6PeXbGVzWNGEEZIvIh1PlKk=; b=RZmFThLxMa9w9OtZsHJLUlfmDM
	srUvSoXnEyb6vFKxPZ0Tu4zOrHlcksc/4CN/dwwZzJo9eGormR05xB0VQl7IonzNWm8jdsdvKYviw
	eshgWPSnUsDGeA89ia1SUhw1JsLEVTlzUW1LIiJGI1NByk+NGaLn1y8ChOShXGWCJrrfvIHf4Ergi
	JqTIHIw1U5/a7bjx50unpMi7G6A8Xb4AxOIhHZVGYgkkyJIIldcRACae0MssR3aKoHbqKf6IbU3Ff
	LpemepxbEx/DSq9gvJlWaxsIzIdTu+sAq5D381cCZ9ta6t3i/e0rki/tx5rFKXSPl8oGi5ed0I6X7
	B2t/El6A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgS-00000007dld-2wRS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:58:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF251595;
	Tue, 24 Feb 2026 09:58:49 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA9273F59E;
	Tue, 24 Feb 2026 09:58:50 -0800 (PST)
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
Subject: [PATCH v5 16/41] arm_mpam: resctrl: Add resctrl_arch_get_config()
Date: Tue, 24 Feb 2026 17:56:55 +0000
Message-ID: <20260224175720.2663924-17-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175857_145301_B4A31B73 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

From: James Morse <james.morse@arm.com>

Implement resctrl_arch_get_config() by testing the live configuration for a
CPOR bitmap. For any other configuration type return the default.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5f482c6293e7..d5caab6b8545 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -168,6 +168,49 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
+			    u32 closid, enum resctrl_conf_type type)
+{
+	u32 partid;
+	struct mpam_config *cfg;
+	struct mpam_props *cprops;
+	struct mpam_resctrl_res *res;
+	struct mpam_resctrl_dom *dom;
+	enum mpam_device_features configured_by;
+
+	lockdep_assert_cpus_held();
+
+	if (!mpam_is_enabled())
+		return resctrl_get_default_ctrl(r);
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	cprops = &res->class->props;
+
+	partid = resctrl_get_config_index(closid, type);
+	cfg = &dom->ctrl_comp->cfg[partid];
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		configured_by = mpam_feat_cpor_part;
+		break;
+	default:
+		return resctrl_get_default_ctrl(r);
+	}
+
+	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r) ||
+	    !mpam_has_feature(configured_by, cfg))
+		return resctrl_get_default_ctrl(r);
+
+	switch (configured_by) {
+	case mpam_feat_cpor_part:
+		return cfg->cpbm;
+	default:
+		return resctrl_get_default_ctrl(r);
+	}
+}
+
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct mpam_resctrl_res *res;
-- 
2.43.0


