Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D22CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCw2DCxw7VUMNeDpXVyedCQSwbLk1u31mhAx4aA3DsM=; b=s+lkEUftppZtsMddKwnA61XEdu
	oiMe3/uPuBMSAZekZanuCYUbMlCz32BVTAiV6y+xiWZEOegy2HGgoGf94a/yYBCF6OT0hX3Jm8p+K
	ZtalmB8ovNayCU+6tXN/m7TQeIhRR0ZpTYlB9t+/Q/GwrlylM1acXp+4OJOtd7nxfLzwNdoiPMitQ
	McHfPYJ4NgUKEwXvCVjL4gfmhluIcW15/uDmpQOWWXEIu+mR3HqABzaQcL7DlbEx9N1MNHUIpwsse
	ZoP2stXDA/ZhuX7WQSxg9tNQnDMoXhC6UH/4hCfT7iLxceh4tsmMkdLRSzP7Lpsd7H15UTgfCG08f
	ed+ETEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueD-00000006pDT-16Zu;
	Mon, 18 Aug 2025 07:51:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untfU-00000006hy3-0SQz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 06:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iCw2DCxw7VUMNeDpXVyedCQSwbLk1u31mhAx4aA3DsM=; b=TMAcBojGdfpAxSSfqu93NUWRr9
	nBThKoljjIVIjhL+5pkCLngcQrIni0/sk+sPcW12MtmYPdMcv/o6iTdJL3KZWuo5HFtM125mtKvDn
	hSqHqGIrgtGjsmWFt2wL3wExayhIpYCcrLiMHi/qLoIWNcLChx1ZHtPKOdluv7FE+vAYWPVa8HJlO
	N1SfZx3ojjsC0y9xjnBPZvfB5NMm0yp/4jp2mSjY+Wf1kRIaDX0N77qo3Mxfjbyq+4Y5E87ElgOGZ
	oQqTtH0NolTF2HOMPfa31tKH+mFx31WqxOl74ey04C99fpVSMR0eE4S6eoXefhApHFOLyEiImA2FH
	jORGcysA==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untfQ-0000000HI24-3j6r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:48:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c53BF2Zbpz2Dc6y;
	Mon, 18 Aug 2025 14:45:25 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E3C41400CB;
	Mon, 18 Aug 2025 14:48:11 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 14:48:11 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 14:48:10 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerkolothum@gmail.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: [PATCH v5 4/7] arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
Date: Mon, 18 Aug 2025 14:48:03 +0800
Message-ID: <20250818064806.25417-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250818064806.25417-1-yangyicong@huawei.com>
References: <20250818064806.25417-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_074829_489747_19AC4882 
X-CRM114-Status: UNSURE (   8.90  )
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
 arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..e48be0afe536 100644
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


