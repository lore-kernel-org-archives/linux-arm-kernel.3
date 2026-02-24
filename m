Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20C1F4BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRvhDUKg2vW7IHwXLzAT/t0LC070u0QMVaUxleTcqpM=; b=nuyRzfek3mBHTckr3Um4ZF0rMg
	BJn9nTyqbnqheoof5fZbSmqhF/ZSpF1mTZnEKnBTlyo8OUCwG5h/epuDBMmmurwCVAMUwkj3627Hq
	+CG3m8/KGRscHXXtyWUkYC6c2AnZKN+gbb8wKVBayljtRv/NzvcNtoZnkvoc/nxfS4NJCq+mfLF81
	4bH92ggfiwWKonkXsyISLMI7nvVYRq2ZjyPPzCBlS4Yk755w3REPwWDuJvpewgzfqCQLAQ2iJyUg1
	fav8bTUBVK2e9VHlhxnmhN8nTQfhxlSS4xIbPhLMZGk3l/PJO/AhBL0vWGulBD27Pa1eynEch+lfB
	bT/Szxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgf-00000002XyH-2CIi;
	Tue, 24 Feb 2026 17:59:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgU-00000002Xir-1N9e
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 17:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SRvhDUKg2vW7IHwXLzAT/t0LC070u0QMVaUxleTcqpM=; b=edChZ1Fr9BxdFukHUS2ZZVASaf
	R1g5snHJ3LStKK4GAFFk9pvdiFYDcOL11gPthLJfxZu8SMAlSSvOEVX/M4CJnvDIS3uy8qJsESoeZ
	3ED61fXPVlweGQ+dXJM1tQm81VWV0ukpACt266hcdZ4KVPDWvT5Q039Rq0dx96+NY2UrHBVAVhWU0
	qm2ofjEgbXyE4Ss59BlGvJIUKoN31xnF53UyKXDzJ3Jz5LArTBDMDsBfEdUVmRvoIxGQjDjnZdCxE
	T8EUqI//WkotBnTz1mBBhXGPTMe/gqSn+08fnhz04smHS7xu/48lCl3XkGblghmIGGRrMpQ3dHP+S
	YeWrxTBw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgN-00000007djC-38ux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:58:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 415D0165C;
	Tue, 24 Feb 2026 09:58:44 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A26D53F59E;
	Tue, 24 Feb 2026 09:58:45 -0800 (PST)
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
Subject: [PATCH v5 15/41] arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
Date: Tue, 24 Feb 2026 17:56:54 +0000
Message-ID: <20260224175720.2663924-16-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175852_142165_CF7BB009 
X-CRM114-Status: GOOD (  11.65  )
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

We already have a helper for resetting an mpam class and component.  Hook
it up to resctrl_arch_reset_all_ctrls() and the domain offline path.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Don't expose unlocked reset

Changes since v3:
Don't use or expose mpam_reset_component_locked()
---
 drivers/resctrl/mpam_devices.c  |  2 +-
 drivers/resctrl/mpam_internal.h |  3 +++
 drivers/resctrl/mpam_resctrl.c  | 13 +++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b45743c5fb46..e4a302a53991 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2567,7 +2567,7 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
 	}
 }
 
-static void mpam_reset_class_locked(struct mpam_class *class)
+void mpam_reset_class_locked(struct mpam_class *class)
 {
 	struct mpam_component *comp;
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 28ac501e1ac3..e2704f678af5 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -392,6 +392,9 @@ extern u8 mpam_pmg_max;
 void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
+/* Reset all the RIS in a class under cpus_read_lock() */
+void mpam_reset_class_locked(struct mpam_class *class);
+
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg);
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index fe566e39aa4d..5f482c6293e7 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -168,6 +168,19 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
+{
+	struct mpam_resctrl_res *res;
+
+	lockdep_assert_cpus_held();
+
+	if (!mpam_is_enabled())
+		return;
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	mpam_reset_class_locked(res->class);
+}
+
 static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
 					 enum resctrl_res_level rid,
 					 struct rdt_domain_hdr *hdr)
-- 
2.43.0


