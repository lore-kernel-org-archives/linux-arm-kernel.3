Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0A1CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8knHxrK/oRl6yteYe7uLtMAo/Nl8dG6L8yKajqRG5k=; b=MpuVmdWz2kYgokeqvOCpATkEMJ
	gWXjnYhf+LD3yt7Kz3Ls6eD3m6DukqOUdPl4u4g5ddtTtG/jrmfhJLEddAZtn09bHxClKE5u/OlQJ
	7AzuGCnQ4PQzT4gDN7HzKC0ypKHKI5ocV6wcqdKteV7jA4wtw+KpL9hTErr9xa8jXq1WJ8LjMSKSH
	EAnR3lTDkgpGtKY+zUc8R7T/hdnjJ0YCeJPW+GAs/LuIdDumVlpXenTFLzOSxDGU8jPpUIiVmqqlH
	wFDMs8ofK8unEAkvfVzXEeoRmhowgiNoCjuHb6Td7c8N3kZH94XuGesdgkQFffOTbDNB/jeVSZIVn
	tE4vQpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSYe-0000000G7Gw-2FdD;
	Thu, 14 Aug 2025 07:39:32 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSOu-0000000G5IG-38Rl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:29:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c2cHj12wdz2Dc1W;
	Thu, 14 Aug 2025 15:26:41 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 00CAA140293;
	Thu, 14 Aug 2025 15:29:22 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemh100008.china.huawei.com (7.202.181.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 15:29:21 +0800
From: Lifeng Zheng <zhenglifeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <beata.michalska@arm.com>, <sudeep.holla@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>, <zhenglifeng1@huawei.com>
Subject: [PATCH v4 1/3] arm64: topology: Set scale freq source only for the CPUs that have not been set before
Date: Thu, 14 Aug 2025 15:28:51 +0800
Message-ID: <20250814072853.3426386-2-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250814072853.3426386-1-zhenglifeng1@huawei.com>
References: <20250814072853.3426386-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_002928_977903_0D28E436 
X-CRM114-Status: GOOD (  12.01  )
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


