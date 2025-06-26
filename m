Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3608C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2tG/E+OaNYCzvkkJRIbervB8pIvTFkGroCidIOBi7I=; b=GLlJRopnZ5CBcb42Z+ecoNiqk9
	iTsR4DQ8Xaa0THSdgqcZUC6Mx85LVTnqH2zae6WgrqUYqBF8TfSz4LCqKOFsup7ZxMJILyW5cSHJm
	tWQBjJjVCw/u2buMJC2Dr6m8gilaUl6nB+2XFGecfzg3PZwLrCFduopPDSLJzNACa6kRzeL97YUQs
	RFLedSgOO7ALlheJuMuHTCa7zFrznUu1Xw4sL4kfRZsr2wZgRgEbVmV1bGfnYtV6AjmMu+Sf0hoOE
	OOnsD/JCTbz6CZ49HaG9eBzJsOlEMUQPO9ujuMHqjn7Im0SGAi7uj1uqgiqZryWqfQn8PxwGA/FKP
	RkCxBWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUi1o-0000000Ayah-3J4N;
	Thu, 26 Jun 2025 08:32:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhg1-0000000AuAU-0ygk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Jun 2025 08:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e2tG/E+OaNYCzvkkJRIbervB8pIvTFkGroCidIOBi7I=; b=Ake9AJHW3TPScCyCEbwRuPOQMe
	j4g0zYeew1J+qoQFHVkSxjOpZk2ux7ZJk+CcuVDsksPulSFiT76g+vxtCvYx/5YdKIwrNNQXu+cZx
	C3mi+abt1Z52RvAAvTwo2hB7tJWpzM9vYVjofdxTVnxwj2aQJBHLz6UsIQWmJ3tY3x/r8acwGzOti
	JEa1w4x3+AYnxoiDx3ZIsBdJWIRPAS8JW/lxhzsn3dMxZ92dKAipxAD+LgaVLMRTujdTRWKkGuuY+
	X89UfoB5U4KmJIA4grlN+kiHOKUzJBPDS5ReDrGrYs44HS24OWHDJNPGpDU714+vFUnMbzY2/LT7q
	9HjJDKDQ==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhfy-000000063W4-0YZB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:09:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bSWZd3pBtz27hmb;
	Thu, 26 Jun 2025 16:10:17 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 3939814027A;
	Thu, 26 Jun 2025 16:09:22 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 16:09:21 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 16:09:20 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: [PATCH v3 5/7] arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
Date: Thu, 26 Jun 2025 16:09:04 +0800
Message-ID: <20250626080906.64230-6-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250626080906.64230-1-yangyicong@huawei.com>
References: <20250626080906.64230-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_090942_768023_32701E07 
X-CRM114-Status: UNSURE (   8.91  )
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

Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
at EL0/1.

This doesn't mean these instructions are always available in
EL0/1 if provided. The hypervisor still have the control at
runtime.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
For note, Will raise the question HCRX setting here won't retain after a
world switch. This is fine now after commit ffea7c73d181 ("KVM: arm64: Properly save/restore HCRX_EL2")

 arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ba5df0df02a4..9a0ab7dc9db1 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -57,9 +57,19 @@
         /* Enable GCS if supported */
 	mrs_s	x1, SYS_ID_AA64PFR1_EL1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
-	cbz	x1, .Lset_hcrx_\@
+	cbz	x1, .Lskip_gcs_hcrx_\@
 	orr	x0, x0, #HCRX_EL2_GCSEn
 
+.Lskip_gcs_hcrx_\@:
+	/* Enable LS64, LS64_V if supported */
+	mrs_s	x1, SYS_ID_AA64ISAR1_EL1
+	ubfx	x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
+	cbz	x1, .Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_EnALS
+	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
+	b.lt	.Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_EnASR
+
 .Lset_hcrx_\@:
 	msr_s	SYS_HCRX_EL2, x0
 .Lskip_hcrx_\@:
-- 
2.24.0


