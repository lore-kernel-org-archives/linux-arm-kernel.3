Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC00CF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1XbsFj7d90ir1aZungdVe6VVJnJuQwyBRl+aaw601g=; b=mhnE+np0D5HtWSUiWSa4SFuqcB
	VrRPilj77N7xoAxyMMgB2MnaO6XjjkvWvLd+Fc/Gxiw104qNjex3AMRfdX4ImMuUqZ92vRCwVRcVQ
	5JTsIrwJa5c5/wub9KXGNTzQJj26L9Mq3pT6zKTDv116xJqfQaE2+YnYOlLpi9WyXQn6KwG2HJ+O5
	ufZnNsILAO5rxPKZsoeGzJ2nRYcvYZQfy/eL1P5T8hvc23Dtu24JDo2d4mN1JHReFMqx7it+oTn8l
	IIZAxUdQVr+HGnk1PMM6ICAUMpLjRILrxFtI+pm0qstXyvamnt/D93F/IZkUO2EuR4bs6PjRKGZj+
	2mmfuexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLIT-00000005mB2-25g8;
	Mon, 12 Jan 2026 17:01:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLIN-00000005m2q-0acF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:01:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A21221596;
	Mon, 12 Jan 2026 09:01:27 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4472B3F694;
	Mon, 12 Jan 2026 09:01:29 -0800 (PST)
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
Subject: [PATCH v3 19/47] arm_mpam: resctrl: Implement helpers to update configuration
Date: Mon, 12 Jan 2026 16:58:46 +0000
Message-ID: <20260112165914.4086692-20-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090135_338910_67FA9D30 
X-CRM114-Status: GOOD (  16.59  )
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

resctrl has two helpers for updating the configuration.
resctrl_arch_update_one() updates a single value, and is used by the
software-controller to apply feedback to the bandwidth controls, it has to
be called on one of the CPUs in the resctrl:domain.

resctrl_arch_update_domains() copies multiple staged configurations, it can
be called from anywhere.

Both helpers should update any changes to the underlying hardware.

Implement resctrl_arch_update_domains() to use
resctrl_arch_update_one(). Neither need to be called on a specific CPU as
the mpam driver will send IPIs as needed.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
list_for_each_entry -> list_for_each_entry_rcu
return 0
Restrict scope of local variables

Changes since v2:
whitespace fix
---
 drivers/resctrl/mpam_resctrl.c | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 25012e779509..5b73fe45b8fa 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -212,6 +212,76 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	}
 }
 
+int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
+			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
+{
+	u32 partid;
+	struct mpam_config cfg;
+	struct mpam_props *cprops;
+	struct mpam_resctrl_res *res;
+	struct mpam_resctrl_dom *dom;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_irqs_enabled();
+
+	/*
+	 * No need to check the CPU as mpam_apply_config() doesn't care, and
+	 * resctrl_arch_update_domains() relies on this.
+	 */
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	cprops = &res->class->props;
+
+	partid = resctrl_get_config_index(closid, t);
+	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r)) {
+		pr_debug("Not alloc capable or computed PARTID out of range\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Copy the current config to avoid clearing other resources when the
+	 * same component is exposed multiple times through resctrl.
+	 */
+	cfg = dom->ctrl_comp->cfg[partid];
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		cfg.cpbm = cfg_val;
+		mpam_set_feature(mpam_feat_cpor_part, &cfg);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+}
+
+int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
+{
+	int err;
+	struct rdt_ctrl_domain *d;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_irqs_enabled();
+
+	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
+		for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
+			struct resctrl_staged_config *cfg = &d->staged_config[t];
+
+			if (!cfg->have_new_ctrl)
+				continue;
+
+			err = resctrl_arch_update_one(r, d, closid, t,
+						      cfg->new_ctrl);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct mpam_resctrl_res *res;
-- 
2.43.0


