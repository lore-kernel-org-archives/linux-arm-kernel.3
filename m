Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77732CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8knHxrK/oRl6yteYe7uLtMAo/Nl8dG6L8yKajqRG5k=; b=tiAlFnDTm1EG20eo75ZVlsWJYl
	ZZElmi16ZBDrzPrMGUuIj4R82CDOh9zjrk4wC/Z+MEf3N5SWU9tiEFI9xKPklJgR7hNYEV7l2b5t0
	mtBnTYmBUc2yaaIIr1ZdNvRJCRtmSkS+H+Zb5xPhC7c48mAV6RfxuhwT6c1//WKBGMj3Hmd5qz//b
	ImHAA1na7IKUa+VDOONp75J1jLO7wh8PzjS3S4oUQVCM+2Zo9hVvCE1leZSabum3TOGDTeSYQodmx
	t9tu5rjK4mLDJ8MDP7DxnsHRULpBiz50IkhASHPATvpC8Gdi2Q48DhmkeEi8o9QabQvDvZFD0g1P4
	hm97uGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH8o-00000009jLy-0KHs;
	Tue, 19 Aug 2025 07:52:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGnH-00000009g7i-0GyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:30:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c5h383K2cz13Mgm;
	Tue, 19 Aug 2025 15:26:28 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 4F6A6140275;
	Tue, 19 Aug 2025 15:30:00 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemh100008.china.huawei.com (7.202.181.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 15:29:59 +0800
From: Lifeng Zheng <zhenglifeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <beata.michalska@arm.com>, <sudeep.holla@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<linhongye@h-partners.com>, <zhenglifeng1@huawei.com>
Subject: [PATCH v5 1/3] arm64: topology: Set scale freq source only for the CPUs that have not been set before
Date: Tue, 19 Aug 2025 15:29:29 +0800
Message-ID: <20250819072931.1647431-2-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_003007_326816_9FDDD50A 
X-CRM114-Status: GOOD (  12.84  )
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

The scale freq source of the CPUs in 'amu_fie_cpus' mask are already set to
AMU tick before, so in amu_fie_setup(), only the CPUs in the 'cpus' mask
should be set.

Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
---
 arch/arm64/kernel/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..9317a618bb87 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -373,7 +373,7 @@ static void amu_fie_setup(const struct cpumask *cpus)
 
 	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
 
-	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
+	topology_set_scale_freq_source(&amu_sfd, cpus);
 
 	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
 		 cpumask_pr_args(cpus));
-- 
2.33.0


