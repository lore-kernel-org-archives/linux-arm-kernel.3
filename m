Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863E2C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92gf6m9YOIPDsCP688vyQFsYfi3lwgydMZ3LqXmn3gc=; b=V93OSphCWgfeyN8mvKH4p7kh3d
	T1la7dp1SUG2TN3kWFaDBBs3Jh6XHxeL7Fpf6XdRGWVIbOLjNS9ASwGuXF+mtfe8oDH6mVFgeyvZ/
	mpp30tF4ApniOXU+STVlgvxpgGaxvOa7OHKf3sC+Cv6ZU2nM8gZlYtMEOEYK6DUoWsTWUACMGI7PB
	MsBoZsjRAmb2gbRG92cPV3SqvncNFNdLbohoc65ArdccPzTBiPX+xEltW/cqL8nYDrZgLiuaBHXub
	WTYoFCq3mM+05U2EgJCIoxXjRH8ya3ukRlRxNED1msyfhTGY5FpFexmMoXzIopTzeUosddROm6Ftm
	KajSnT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5ba-0000000DOhN-2Q2u;
	Fri, 25 Sep 2026 13:04:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5bZ-0000000DOhE-323m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:04:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 472FB40E34;
	Fri, 25 Sep 2026 13:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363181F000FF;
	Fri, 25 Sep 2026 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341485;
	bh=92gf6m9YOIPDsCP688vyQFsYfi3lwgydMZ3LqXmn3gc=;
	h=From:To:Cc:Subject:Date;
	b=SBOi/xz15oQl7twIyrtO4yKBCgAQPj6/OZhYu8U3oP8ECGc8P4+iB7/0HxtrimI+p
	 3hbKLbnScGXlW/P1Xqe7Ur17Z/p4I5GiNYK3vwCocskYglwQH70aKksT6l3enezdxh
	 1jNKFyOd0tKdt+4NQQE7fIWc5IdGoik4Vso6c8gb3sy5I2g3Iahj6SAnl61rxNAnta
	 uDqGXX6DRl2cRREfQqy/yxxeV2nfS2HZMXs0zyc8gmK1+78c854yQsdnmtMsvumQ0C
	 zrdsJo1vHOm1Zp+HrjtwzoANXNy0iFZ/L1FikLc1U6wnRpzc2bxFSmvUKcw/LzfQxV
	 G3DiELNF9IqXg==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geetha sowjanya <gakula@marvell.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Yury Norov <ynorov@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf: marvell: avoid large stack variables
Date: Fri, 25 Sep 2026 15:04:30 +0200
Message-ID: <20260925130440.4107512-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

The probe function in this driver constructs multiple large structures
on the stack, which ends up causing a size warning:

drivers/perf/marvell_cn10k_ddr_pmu.c:1168:12: error: stack frame size (1296) exceeds limit (1280) in 'cn10k_ddr_perf_probe' [-Werror,-Wframe-larger-than]
 1168 | static int cn10k_ddr_perf_probe(struct platform_device *pdev)
      |            ^

Avoid this warning and simplify the code by turning these into static
const structures and directly assigning them without the extra copy.

Fixes: 9b551a2446b2 ("perf: marvell: Add CN20K DDR PMU support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/perf/marvell_cn10k_ddr_pmu.c | 85 +++++++++++++++-------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 0a8cb6166408..9b68d6c1c31c 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -1165,6 +1165,47 @@ static const struct ddr_pmu_platform_data odyssey_ddr_pmu_pdata = {
 };
 #endif
 
+static const struct pmu cn10k_pmu = {
+	.module	      = THIS_MODULE,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
+	.task_ctx_nr = perf_invalid_context,
+	.attr_groups = cn10k_attr_groups,
+	.event_init  = cn10k_ddr_perf_event_init,
+	.add	     = cn10k_ddr_perf_event_add,
+	.del	     = cn10k_ddr_perf_event_del,
+	.start	     = cn10k_ddr_perf_event_start,
+	.stop	     = cn10k_ddr_perf_event_stop,
+	.read	     = cn10k_ddr_perf_event_update,
+	.pmu_enable  = cn10k_ddr_perf_pmu_enable,
+	.pmu_disable = cn10k_ddr_perf_pmu_disable,
+};
+
+static const struct pmu ody_pmu = {
+	.module       = THIS_MODULE,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
+	.task_ctx_nr = perf_invalid_context,
+	.attr_groups = odyssey_attr_groups,
+	.event_init  = cn10k_ddr_perf_event_init,
+	.add         = cn10k_ddr_perf_event_add,
+	.del         = cn10k_ddr_perf_event_del,
+	.start       = cn10k_ddr_perf_event_start,
+	.stop        = cn10k_ddr_perf_event_stop,
+	.read        = cn10k_ddr_perf_event_update,
+};
+
+static const struct pmu cn20k_pmu = {
+	.module       = THIS_MODULE,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
+	.task_ctx_nr = perf_invalid_context,
+	.attr_groups = cn20k_attr_groups,
+	.event_init  = cn10k_ddr_perf_event_init,
+	.add         = cn10k_ddr_perf_event_add,
+	.del         = cn10k_ddr_perf_event_del,
+	.start       = cn10k_ddr_perf_event_start,
+	.stop        = cn10k_ddr_perf_event_stop,
+	.read        = cn10k_ddr_perf_event_update,
+};
+
 static int cn10k_ddr_perf_probe(struct platform_device *pdev)
 {
 	const struct ddr_pmu_platform_data *dev_data;
@@ -1202,56 +1243,20 @@ static int cn10k_ddr_perf_probe(struct platform_device *pdev)
 		/* Setup the PMU counter to work in manual mode */
 		writeq_relaxed(OP_MODE_CTRL_VAL_MANUAL, ddr_pmu->base +
 			       ddr_pmu->p_data->cnt_op_mode_ctrl);
+		ddr_pmu->pmu = cn10k_pmu;
 
-		ddr_pmu->pmu = (struct pmu) {
-			.module	      = THIS_MODULE,
-			.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
-			.task_ctx_nr = perf_invalid_context,
-			.attr_groups = cn10k_attr_groups,
-			.event_init  = cn10k_ddr_perf_event_init,
-			.add	     = cn10k_ddr_perf_event_add,
-			.del	     = cn10k_ddr_perf_event_del,
-			.start	     = cn10k_ddr_perf_event_start,
-			.stop	     = cn10k_ddr_perf_event_stop,
-			.read	     = cn10k_ddr_perf_event_update,
-			.pmu_enable  = cn10k_ddr_perf_pmu_enable,
-			.pmu_disable = cn10k_ddr_perf_pmu_disable,
-		};
 	}
 
 	if (silicon_flags & IS_ODY) {
 		ddr_pmu->ops = &ddr_pmu_ody_ops;
-
-		ddr_pmu->pmu = (struct pmu) {
-			.module       = THIS_MODULE,
-			.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
-			.task_ctx_nr = perf_invalid_context,
-			.attr_groups = odyssey_attr_groups,
-			.event_init  = cn10k_ddr_perf_event_init,
-			.add         = cn10k_ddr_perf_event_add,
-			.del         = cn10k_ddr_perf_event_del,
-			.start       = cn10k_ddr_perf_event_start,
-			.stop        = cn10k_ddr_perf_event_stop,
-			.read        = cn10k_ddr_perf_event_update,
-		};
+		ddr_pmu->pmu = ody_pmu;
 	}
 
 	if (silicon_flags & IS_CN20K) {
 		ddr_pmu->ops = &ddr_pmu_ody_ops;
-
-		ddr_pmu->pmu = (struct pmu) {
-			.module       = THIS_MODULE,
-			.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
-			.task_ctx_nr = perf_invalid_context,
-			.attr_groups = cn20k_attr_groups,
-			.event_init  = cn10k_ddr_perf_event_init,
-			.add         = cn10k_ddr_perf_event_add,
-			.del         = cn10k_ddr_perf_event_del,
-			.start       = cn10k_ddr_perf_event_start,
-			.stop        = cn10k_ddr_perf_event_stop,
-			.read        = cn10k_ddr_perf_event_update,
-		};
+		ddr_pmu->pmu = cn20k_pmu;
 	}
+
 	/* Choose this cpu to collect perf data */
 	ddr_pmu->cpu = raw_smp_processor_id();
 
-- 
2.53.0


