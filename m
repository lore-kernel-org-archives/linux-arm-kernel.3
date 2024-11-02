Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08A0E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38WHBRoFeB8fVIm0CW/kySFCfKVsfj6VyEKuQ6wh8BM=; b=TuBRDJHkurudqqbClfFzdH76T5
	RISwucJEMMgqHI59EO6JvbTDUsOehl3JfLZ4akIHWjL1Abdep1v3ryYLu2gJF7yfG1Jvwb0DTv5Ir
	rOMKWUyAoLJXMPxW88z2zpOxJ4RwWVK/wbmJqXQJbf5G0YxvwNz0RTwtYT7dTxBUl1MNCTs25kejp
	7UgMrm7SPOkuQdlB28wcUZuHH8ZkaF7TOp5mB2T3V/ytAFXL28r+f0N2aWobUWnsiOYu0oG6G6Xet
	YIlPib3bl06MG4R2Jrn2ue8xyOqRyOyvfr2YUDsmaxlXTts+vgLp64tDoBbnsyngVP6MYMDeyXRL0
	IHgBce+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bg5-00000009WhI-34PA;
	Sat, 02 Nov 2024 10:48:21 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bb8-00000009W2V-32W7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:43:18 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XgZ5J2QNxz1T94D;
	Sat,  2 Nov 2024 18:40:52 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 16EB41401F3;
	Sat,  2 Nov 2024 18:43:07 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 2 Nov 2024 18:43:06 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v4 2/5] arm64: setup: name 'tcr2' register
Date: Sat, 2 Nov 2024 18:42:32 +0800
Message-ID: <20241102104235.62560-3-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20241102_034314_950157_141DA9CC 
X-CRM114-Status: UNSURE (   9.15  )
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

TCR2_EL1 introduced some additional controls besides TCR_EL1. Currently
only PIE is supported and enabled by writing TCR2_EL1 directly if PIE
detected.

Introduce a named register 'tcr2' just like 'tcr' we've already had.
It'll be initialized to 0 and updated if certain feature detected and
needs to be enabled. Touch the TCR2_EL1 registers at last with the
updated 'tcr2' value if FEAT_TCR2 supported by checking
ID_AA64MMFR3_EL1.TCRX. Then we can extend the support of other features
controlled by TCR2_EL1.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/mm/proc.S | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 8abdc7fed321..ccbae4525891 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -465,10 +465,12 @@ SYM_FUNC_START(__cpu_setup)
 	 */
 	mair	.req	x17
 	tcr	.req	x16
+	tcr2	.req	x15
 	mov_q	mair, MAIR_EL1_SET
 	mov_q	tcr, TCR_T0SZ(IDMAP_VA_BITS) | TCR_T1SZ(VA_BITS_MIN) | TCR_CACHE_FLAGS | \
 		     TCR_SHARED | TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
 		     TCR_TBI0 | TCR_A1 | TCR_KASAN_SW_FLAGS | TCR_MTE_FLAGS
+	mov	tcr2, xzr
 
 	tcr_clear_errata_bits tcr, x9, x5
 
@@ -525,11 +527,16 @@ alternative_else_nop_endif
 #undef PTE_MAYBE_NG
 #undef PTE_MAYBE_SHARED
 
-	mov	x0, TCR2_EL1x_PIE
-	msr	REG_TCR2_EL1, x0
+	orr	tcr2, tcr2, TCR2_EL1x_PIE
 
 .Lskip_indirection:
 
+	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
+	ubfx	x1, x1, #ID_AA64MMFR3_EL1_TCRX_SHIFT, #4
+	cbz	x1, 1f
+	msr	REG_TCR2_EL1, tcr2
+1:
+
 	/*
 	 * Prepare SCTLR
 	 */
@@ -538,4 +545,5 @@ alternative_else_nop_endif
 
 	.unreq	mair
 	.unreq	tcr
+	.unreq	tcr2
 SYM_FUNC_END(__cpu_setup)
-- 
2.24.0


