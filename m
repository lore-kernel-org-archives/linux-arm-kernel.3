Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AA3D132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F6dYAwZ9/bdrvlhmbF4tqEkTAK8jQxmDHhN0h53JYs4=; b=zxsoC2QVkKRt173oazSunT/qt6
	coeLSRaFQVGN8atXHZvCYAy9bEVhQ4s0RuDFSNrnEDIbDuffm/0Vu0zbGp8Gyg+pGofgCvbfkFCQ3
	qIxipKf+q+i3iHq4nKA9DgIpXASyLmXXW1X6e/3hbi71bxXk8FihxP9yBBRjrsyW4SqnpRSE2WhBX
	JWye8NAKSzTvnBSckL/nhjm3+C6RI8U9wqdK68UY0tAd1AtvaqXcdJyo0YwQz5TWG9O+0lcrkjIxJ
	lNWzIMzaXWBdgDhX30KY2ru4QD+0IYdjNlIslOtOAJfpgAC2pl9zkSVMPGnefbkA6e9w5WfnSX9Jr
	VjEi4OXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vYp-0000000Dagu-44z7;
	Mon, 04 Nov 2024 11:47:56 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vOF-0000000DYfp-0WzY;
	Mon, 04 Nov 2024 11:37:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XhqC51bcnz2Fb27;
	Mon,  4 Nov 2024 19:35:13 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id BEE361A0188;
	Mon,  4 Nov 2024 19:36:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 4 Nov
 2024 19:36:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <hector.yuan@mediatek.com>,
	<lukasz.luba@arm.com>, <qperret@google.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] PM: EM: Fix wrong return value in mtk_cpufreq_get_cpu_power()
Date: Mon, 4 Nov 2024 19:36:15 +0800
Message-ID: <20241104113615.1397410-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_033659_351884_35771E14 
X-CRM114-Status: GOOD (  13.11  )
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

mtk_cpufreq_get_cpu_power() return 0 if the policy is NULL. Then in
em_create_perf_table(), the later zero check for power is not invalid
as power is uninitialized. As Lukasz suggested, it must return -EINVAL when
the 'policy' is not found. So return -EINVAL to fix it.

Cc: stable@vger.kernel.org
Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Fix the driver instead of em_create_perf_table() as suggested.
- Update the commit message.
- Add Suggested-by.
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 8925e096d5b9..aeb5e6304542 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -62,7 +62,7 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 
 	policy = cpufreq_cpu_get_raw(cpu_dev->id);
 	if (!policy)
-		return 0;
+		return -EINVAL;
 
 	data = policy->driver_data;
 
-- 
2.34.1


