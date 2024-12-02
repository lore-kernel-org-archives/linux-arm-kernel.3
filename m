Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E929D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JriKXcXHZR6sY6kwBfx3+SIYeQ6XkHuxv1ivyjaLBN4=; b=xpQpzCaxLNGRex0qe+8UPqwG7P
	1KvMlztVe5+x4IEdufZ/ybo2HypbHi18SxJ3G+U8p+GoA2KHCpaio2ZDK9ZFFJh1QVioGDmASlu2L
	I6+HQjOVl8QhGOWN4obDqcGe5EMY9SskbC/kjbqA0raS94SYDQm92+8UzVkOxMxa5Wxar86LtYOhw
	bIcvrrebw+jVSzGhvfG6dGrhUWTc90dIOIC7bs8JOjl7p2mQ6F+Cp+ihexHzzYrb4L85fgddywZAl
	xwrKslifCshhLF3DpWHqPXMspImUEWUCt2rGgJG3+JHV1omXE3lkXZ0z4LML85/n5Pxc7ykXXkRbJ
	rzYLmV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6zb-00000006Kg7-3N96;
	Mon, 02 Dec 2024 14:01:39 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6uA-00000006JZV-3Eac
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:56:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y24xx2ZZ4z1T65k;
	Mon,  2 Dec 2024 21:53:41 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 64E80140135;
	Mon,  2 Dec 2024 21:55:56 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 21:55:55 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 1/5] arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V, LS64_ACCDATA} usage at EL0/1
Date: Mon, 2 Dec 2024 21:55:00 +0800
Message-ID: <20241202135504.14252-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241202135504.14252-1-yangyicong@huawei.com>
References: <20241202135504.14252-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_055603_012537_25EC22F0 
X-CRM114-Status: GOOD (  10.29  )
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

Instructions introduced by FEAT_{LS64, LS64_V, LS64_ACCDATA} is
controlled by HCRX_EL2.{EnALS, EnASR, EnAS0}. Additionally
access of ACCDATA_EL1 for FEAT_LS64_ACCDATA is also affected by
FGT. Configure all of these to allow usage at EL0/1.

This doesn't mean these instructions are always available in
EL0/1 if provided. The hypervisor still have the control at
runtime.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/include/asm/el2_setup.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 85ef966c08cd..446d3663840b 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -31,9 +31,22 @@
         /* Enable GCS if supported */
 	mrs_s	x1, SYS_ID_AA64PFR1_EL1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
-	cbz	x1, .Lset_hcrx_\@
+	cbz	x1, .Lskip_gcs_hcrx_\@
 	orr	x0, x0, #HCRX_EL2_GCSEn
 
+.Lskip_gcs_hcrx_\@:
+	/* Enable LS64, LS64_V, LS64_ACCDATA if supported */
+	mrs_s	x1, SYS_ID_AA64ISAR1_EL1
+	ubfx	x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
+	cbz	x1, .Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_EnALS
+	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
+	b.lt	.Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_EnASR
+	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA
+	b.lt	.Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_EnAS0
+
 .Lset_hcrx_\@:
 	msr_s	SYS_HCRX_EL2, x0
 .Lskip_hcrx_\@:
@@ -211,12 +224,21 @@
 	/* GCS depends on PIE so we don't check it if PIE is absent */
 	mrs_s	x1, SYS_ID_AA64PFR1_EL1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
-	cbz	x1, .Lset_fgt_\@
+	cbz	x1, .Lskip_gcs_fgt_\@
 
 	/* Disable traps of access to GCS registers at EL0 and EL1 */
 	orr	x0, x0, #HFGxTR_EL2_nGCS_EL1_MASK
 	orr	x0, x0, #HFGxTR_EL2_nGCS_EL0_MASK
 
+.Lskip_gcs_fgt_\@:
+	mrs_s	x1, SYS_ID_AA64ISAR1_EL1
+	ubfx	x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
+	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA
+	b.ne	.Lset_fgt_\@
+
+	/* Disable the trapping of ACCDATA_EL1 */
+	orr	x0, x0, #HFGxTR_EL2_nACCDATA_EL1
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0
-- 
2.24.0


