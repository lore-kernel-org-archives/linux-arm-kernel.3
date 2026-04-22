Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF7F9B604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KzG7QVIK5yv7fWAWvRb7Qe0WGjsIK4KIw8WxnQ1m/wg=; b=qdS2QxfBfPAJXJxXjGDX+0iITj
	DhB2v2V0MJhc53OJoSVGx2iu7z/A1aV4u00J0P5NXWSGTlWeZQ7OQgrpGjasiV5HvYfXRXG3RJjnl
	sWF/dgxZhBtiUfVMCHi2rDg8B4J+1vByFoTm3hY5qIcOfYRsG3SF9vxMotIP3d2Cw+WzGqqvyXNbc
	XJmBVqimSf3bf75H0NvHzLfhZrgwfRSAY4ihOLrbql77zRlL9c+SRmKQIpoNkofjgYYcyeARzs9hj
	cLgV+9eAWfjGs9ejtJ5fphcTgytvjwyEUlGXRWPf1UZnQzlA8+VdhOfONUGAGjePW/VAHG4yDpsyK
	XhiSl4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUM3-00000009u1Q-2NFh;
	Wed, 22 Apr 2026 09:58:47 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUM0-00000009u0l-1HJZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:58:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KzG7QVIK5yv7fWAWvRb7Qe0WGjsIK4KIw8WxnQ1m/wg=;
	b=TBXFRhCn3vDzNvumDZ+tzrNu5Uawfe48uLVgCB8TbKWR52dvlRYTnOHBnlvOMbcikpIfVTy19
	u3LwlZzhxYyMVD4TdESAT9MFHbDSQVYd90ClsKqduXLPWKpSuSL0RCtS7B7jLiVdSyYCE/s3Uf+
	rCYLrb/tj03+l5zD5gj21Bc=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4g0vdt6bhgznTVg;
	Wed, 22 Apr 2026 17:52:18 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id CBBBC4056C;
	Wed, 22 Apr 2026 17:58:32 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 22 Apr
 2026 17:58:32 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>, <linuxarm@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH] arm64: smp: Limit nr_cpu_ids under nosmp
Date: Wed, 22 Apr 2026 17:58:31 +0800
Message-ID: <20260422095831.2926775-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_025844_815883_2274BBF9 
X-CRM114-Status: GOOD (  10.10  )
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

Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.

However, arm64 still enumerates firmware-described CPUs during SMP
initialization, so secondary CPUs can remain visible to
for_each_possible_cpu() users even though they never reach the
bringup path in this configuration.

This is not just a cosmetic mask mismatch: code iterating over
possible CPUs may observe secondary CPU per-CPU state that is never
fully initialized under nosmp.

Limit nr_cpu_ids to 1 in arch_disable_smp_support() so that
secondary CPUs are not set up on arm64 when nosmp/maxcpus=0 is in
effect.

Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
 arch/arm64/kernel/smp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..cc34c68871e9 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -435,6 +435,15 @@ static void __init hyp_mode_check(void)
 	}
 }
 
+void __init arch_disable_smp_support(void)
+{
+	/*
+	 * Under nosmp/maxcpus=0, only the boot CPU can ever be brought up.
+	 * Limit nr_cpu_ids so that secondary CPUs are never set up.
+	 */
+	set_nr_cpu_ids(1);
+}
+
 void __init smp_cpus_done(unsigned int max_cpus)
 {
 	pr_info("SMP: Total of %d processors activated.\n", num_online_cpus());
-- 
2.33.0


