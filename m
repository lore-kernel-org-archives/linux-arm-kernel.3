Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B1DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 03:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAHH9KrMEobkIlXW9ZawD+0mGx69oP+FIw5ULlaz1RU=; b=e2pXigIUfYZsvSYQ3vlPEY3Foh
	7NEGGkjlHrb+9ngvpJIIacrSnQWhcJFQjzcFd96YcUSKvEQf78P9lf7+yXzl+EiYs3O8K6Y1XgE2/
	xSG4UOcOIFZHitSD4GDAB8ZKGKbDlj14Xtyu9uT0ALyS3udVXwh5djt2AeEPFGqf99rvSh/OWgtW2
	2w4ZPST8mXmKDwQ1AjyvOwSMoQrA3oEwAZhpLhZ7SSPnF7v9ejd8XkGaY6jlmsjh2lcAoXyH5aILZ
	MHBeJ45Phh4X1u93m6XUt9cB/xS9WSrJC8rQo7THRpDbjJ4PXcSszKuCtUWxDAwXYOkMR2T5v2K9i
	+U3hHLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyN8r-0000000Eez2-2JGU;
	Sat, 29 Mar 2025 03:45:53 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyN76-0000000Eeuv-3SqS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 03:44:06 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZPjmw5W58z1jBWW;
	Sat, 29 Mar 2025 11:39:12 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 7528A14013B;
	Sat, 29 Mar 2025 11:43:55 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 11:43:54 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>
Subject: [PATCH 1/3] arm64/cpufeature: Add missing id_aa64mmfr4 feature reg update
Date: Sat, 29 Mar 2025 11:44:07 +0800
Message-ID: <20250329034409.21354-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250329034409.21354-1-yangyicong@huawei.com>
References: <20250329034409.21354-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_204405_046617_6D1C77A0 
X-CRM114-Status: UNSURE (   8.15  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add missing id_aa64mmfr4 feature register check and update in
update_cpu_features(). Update the taint status as well.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/cpufeature.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..75ef319c1ef8 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1403,6 +1403,8 @@ void update_cpu_features(int cpu,
 				      info->reg_id_aa64mmfr2, boot->reg_id_aa64mmfr2);
 	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR3_EL1, cpu,
 				      info->reg_id_aa64mmfr3, boot->reg_id_aa64mmfr3);
+	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR4_EL1, cpu,
+				      info->reg_id_aa64mmfr4, boot->reg_id_aa64mmfr4);
 
 	taint |= check_update_ftr_reg(SYS_ID_AA64PFR0_EL1, cpu,
 				      info->reg_id_aa64pfr0, boot->reg_id_aa64pfr0);
-- 
2.24.0


