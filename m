Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7719FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOZYkNr7I7kzYLHzotIZXC0+std2hhngeKFpxYz3X8A=; b=buRjsPTa+hdKQKBfVnB8L0jbOK
	liedweVUqIvgQQtLT03ehGyFPQ1Yw/bduZOTIfvUSlAbGNG5Df5dzbJ+EY+F7qVc45z5d+Rezb2wq
	b81283m4LjQx+ewYZJW4nGe5+HPia0A5ou8q9lH2J4DGsoHvdxSCs300p2JP97XA2CUIPPR1jyfn5
	8Lw8vmOx1J12dta2XipA9Omb2Sqb5jquYiYSnZyU/6jmrl7Tj/L5tvGjZH1O31vpkXi98q6eQEI/3
	q0dExaU3TUTA6n+lTRP5ahCNrMM2w4uP38MzK7+I7KgqFFyx/hs0a0E644scbTqVqEBHbyWGDQ7XE
	YGlWji1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBta-0000000BMc7-0FoK;
	Tue, 04 Nov 2025 07:56:02 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtU-0000000BMYV-1nsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:55:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uOZYkNr7I7kzYLHzotIZXC0+std2hhngeKFpxYz3X8A=;
	b=uw1k6UfcxwHujPA5dNgdzZMMlP2fBu1GS9CVCNRspIRcsl0LRiHurN/5lWPiON3Ry49oQqsoW
	6yyKFnf5QB84WsYvaJNk4dUIdrTcfvrY3lsQkoEhbwapwmblu+taf1bjkiITZ11l6IoLyzpSon6
	yJk83TiqcB9NXNQ4LF5W3KI=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4d111c27Yvz1prKB;
	Tue,  4 Nov 2025 15:54:12 +0800 (CST)
Received: from kwepemk500012.china.huawei.com (unknown [7.202.194.97])
	by mail.maildlp.com (Postfix) with ESMTPS id 73392180493;
	Tue,  4 Nov 2025 15:55:47 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500012.china.huawei.com (7.202.194.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 15:55:46 +0800
From: Bowen Yu <yubowen8@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <beata.michalska@arm.com>,
	<ptsm@linux.microsoft.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>
CC: <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <xuwei5@huawei.com>, <zhenglifeng1@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>
Subject: [PATCH 3/3] arm64: topology: Remove redundant housekeeping_cpu() checks in arch_freq_get_on_cpu
Date: Tue, 4 Nov 2025 15:55:44 +0800
Message-ID: <20251104075544.3243606-4-yubowen8@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251104075544.3243606-1-yubowen8@huawei.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500012.china.huawei.com (7.202.194.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_235556_637207_645BEEA9 
X-CRM114-Status: GOOD (  11.49  )
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

This patch removes redundant !housekeeping_cpu() check since it is
inherently done when checking jiffies.

Signed-off-by: Bowen Yu <yubowen8@huawei.com>
---
 arch/arm64/kernel/topology.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index f1370a4a4df9..6981ef3019d3 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -310,20 +310,13 @@ int arch_freq_get_on_cpu(int cpu)
 		 * (and thus freq scale), if available, for given policy: this boils
 		 * down to identifying an active cpu within the same freq domain, if any.
 		 */
-		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
-		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
+		if (time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
 			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
 			int ref_cpu;
 
 			if (!policy)
 				return -EINVAL;
 
-			if (!cpumask_intersects(policy->related_cpus,
-						housekeeping_cpumask(HK_TYPE_TICK))) {
-				cpufreq_cpu_put(policy);
-				return -EOPNOTSUPP;
-			}
-
 			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
 				if (ref_cpu == start_cpu) {
 					/* Prevent verifying same CPU twice */
-- 
2.33.0


