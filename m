Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBBE677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppKZtN94MgWti1aXMdij+YDrHwoBKLCtQ26idNNZZSU=; b=menoU51x8JwZ6lgBAQGKhRWhAF
	LCfapMzawXFoZjKTyYPMqKsZoEVJX+RNAwjtObMNa9f8GcFoWWwIZi4otTSJkAXu6d414yv3HltFY
	yLt1q78X+KxRHvrMP/nadmvH+1XqtBkQQ/TvMGGWX0Lx4W6G5EbH/28+Fd/LvYm5QtKzqvsKW5bG9
	mTWf/V+ypEvq2tsehi3hN4xBPay19NrYOtoJOFqhKeBhUsDBqgaVNdCS6V6jY3rgwWpcDZLni8dh8
	IxJwUiNqWVtjJygPU1ZGKmLhIoVRpNW4Y0boKfvmyg++GWhbY4O+MfLaHgXOoxFjMa7PVQf//lBcc
	1Pf+uOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bcp-00000009WDB-0WYW;
	Sat, 02 Nov 2024 10:44:59 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bb8-00000009W2X-31cZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:43:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XgZ6g6bssz20rGl;
	Sat,  2 Nov 2024 18:42:03 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F70118002B;
	Sat,  2 Nov 2024 18:43:06 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 2 Nov 2024 18:43:05 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v4 1/5] arm64/sysreg: Update ID_AA64MMFR1_EL1 register
Date: Sat, 2 Nov 2024 18:42:31 +0800
Message-ID: <20241102104235.62560-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241102104235.62560-1-yangyicong@huawei.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_034314_948453_81456848 
X-CRM114-Status: UNSURE (   7.03  )
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

Update ID_AA64MMFR1_EL1 register fields definition per DDI0601 (ID092424)
2024-09. ID_AA64MMFR1_EL1.ETS adds definition for FEAT_ETS2 and
FEAT_ETS3. ID_AA64MMFR1_EL1.HAFDBS adds definition for FEAT_HAFT and
FEAT_HDBSS.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/tools/sysreg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8d637ac4b7c6..ae64ba810298 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1648,6 +1648,8 @@ EndEnum
 UnsignedEnum	39:36	ETS
 	0b0000	NI
 	0b0001	IMP
+	0b0010	ETS2
+	0b0011	ETS3
 EndEnum
 UnsignedEnum	35:32	TWED
 	0b0000	NI
@@ -1688,6 +1690,8 @@ UnsignedEnum	3:0	HAFDBS
 	0b0000	NI
 	0b0001	AF
 	0b0010	DBM
+	0b0011	HAFT
+	0b0100	HDBSS
 EndEnum
 EndSysreg
 
-- 
2.24.0


