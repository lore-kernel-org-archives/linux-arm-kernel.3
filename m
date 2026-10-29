Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F9606AA93
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lYTLZ/PX;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gn08SL5m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rd99wj8tmmWdc/xvgPsK/cvb9mmLPaO6Jc9hvYnKyVY=; b=lYTLZ/PXn+yrl97fYXo+n0GeMT
	es7Jc5+7pom5j0JSypRV4mGrU0+tAg4y30A0ZH9KKjD88ezJlV9yVSvTkK84trEd+Ep7NX4Z8pdBo
	BPYZOMuJ1/mAggHPqURr3vMMK7vVuFCdU1WBpFb/N3mx4RL7baM4RVogrBrga2R38EVfegCzPWOu4
	LQ7ltQPwgiscXR03Cmm6GJpqwGnKkvx417H++LGcr68ySQMAKScOYUA2WAQGg8yocIy18gzEm2agn
	TobpGXMNWV4+QIuHzVOqoeXmMNoyMe94omZaYJo5ZOwUGV4uCW0wrwycryxpjuvDdldPgTBwHCKgJ
	i5f+ZjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNh-00000009B1R-43Sb;
	Thu, 29 Oct 2026 12:37:21 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNA-00000009AR3-0P6Q;
	Thu, 29 Oct 2026 12:36:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rd99wj8tmmWdc/xvgPsK/cvb9mmLPaO6Jc9hvYnKyVY=;
	b=gn08SL5miTDMU1IObTHHDjQoXKKM0BS8e1Kz873hQXSTZWfoJDSVicpzkX10YZn4m5jhxXf3g
	ACgzi6RnMZuHMpgJ2SpIzSvClsaKsBjuzDnRNe6i8UMYnOfnUuySMOBXQ3Utwk9mrC5TwroNcqY
	3rCcLXPv2KNQTqPBgXD8KkU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHn0z2GzLlT6;
	Thu, 29 Oct 2026 20:36:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C9FF40586;
	Thu, 29 Oct 2026 20:36:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 08/19] arm_mpam: resctrl: Halve the monitor counts of every resource on CDP
Date: Thu, 29 Oct 2026 20:36:00 +0800
Message-ID: <20261029123611.1108424-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053648_498509_6BBB38DE 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

CDP uses two PARTIDs per closid, which halves the number of monitoring
groups. resctrl_arch_set_cdp_enabled() only updates num_rmid and the
assignable counter count of the L3.

Update both counts for every resource that can monitor. Only the L3 has
monitors so far, so the counts do not change yet.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index abd4fbca48ab..2f1be12ec461 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -203,8 +203,7 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct rdt_resource *r;
 	int cpu;
 
 	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
@@ -238,11 +237,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
-
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
@@ -263,7 +257,14 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
 
 	resctrl_reset_task_closids();
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+
+	/* Each PARTID is split in two, which halves every monitor resource */
+	for_each_mon_capable_rdt_resource(r) {
+		r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+		if (cdp_enabled)
+			r->mon.num_rmid /= 2;
+		mpam_resctrl_monitor_sync_abmc_vals(r);
+	}
 
 	for_each_possible_cpu(cpu)
 		mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
-- 
2.34.1


