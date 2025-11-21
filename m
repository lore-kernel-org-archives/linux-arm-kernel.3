Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B3CCFA761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP4T9Ux78gNIlOGmGsvDsFgk5odPVemp6LKwfalw7UY=; b=SjXVX9YLqjxq7U4R3c0Y9E6RVF
	KzaMcij8hi7fkEAyH0SUwpinXhSk2upxF+kRqlC0j+wJCICaN3nlMXOr+mV9DTyesmQsc14rMd+eH
	HhijzXsAwbSvxk06ITK4xtxQB20zxjIU2xTW2P7VTs74hPQIKjjE/q+kFuasyvn4yijI0a5Pp8fXg
	3UKlZDkgiES+xr9W+Udr8VLC8d/8eRWvqHezkrbviL2hSa3EtLgNM+2nmUCB5g1K5JZ1I9/I+HJfa
	c+YsisvM2xCgOCBiUCagNIVrrr17blAOuGiUyb6mfoRqSFnAdvJuto+g2Z6IKuuw0UBlqNLqP8Ihk
	nvEDzp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMy-000000088jp-1oeA;
	Fri, 21 Nov 2025 09:23:56 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMu-000000088hj-3wTW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:23:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HP4T9Ux78gNIlOGmGsvDsFgk5odPVemp6LKwfalw7UY=;
	b=5adxCFnYtZP2WE1LbfvuKRRXT1JiztDVoW03rbWUI/v5H9cGRx+kWCpAgaUfizgE9Y6O2HdUE
	TpGdLfyM9yjlcDiwechxX0z6rWUmBv/yUFhVPOQh75CmwUzlgaQTVHp3gSmbuKwQkJ1SVDidL9w
	y23dAw0NO6DZhA4Gwb18TsU=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dCV916Swqz1prkV;
	Fri, 21 Nov 2025 17:21:57 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id B0F5018048D;
	Fri, 21 Nov 2025 17:23:43 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 21 Nov
 2025 17:23:43 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <zhengtian10@huawei.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v2 1/5] arm64/sysreg: Add HDBSS related register information
Date: Fri, 21 Nov 2025 17:23:38 +0800
Message-ID: <20251121092342.3393318-2-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251121092342.3393318-1-zhengtian10@huawei.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012353_431051_0EF655A0 
X-CRM114-Status: UNSURE (   8.74  )
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

From: eillon <yezhenyu2@huawei.com>

The ARM architecture added the HDBSS feature and descriptions of
related registers (HDBSSBR/HDBSSPROD) in the DDI0601(ID121123) version,
add them to Linux.

Signed-off-by: eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/esr.h     |  2 ++
 arch/arm64/include/asm/kvm_arm.h |  1 +
 arch/arm64/tools/sysreg          | 28 ++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index e1deed824464..a6f3cf0b9b86 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -159,6 +159,8 @@
 #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)

 /* ISS2 field definitions for Data Aborts */
+#define ESR_ELx_HDBSSF_SHIFT	(11)
+#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
 #define ESR_ELx_TnD_SHIFT	(10)
 #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
 #define ESR_ELx_TagAccess_SHIFT	(9)
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..b71122680a03 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -124,6 +124,7 @@
 			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)

 /* VTCR_EL2 Registers bits */
+#define VTCR_EL2_HDBSS		(1UL << 45)
 #define VTCR_EL2_DS		TCR_EL2_DS
 #define VTCR_EL2_RES1		(1U << 31)
 #define VTCR_EL2_HD		(1 << 22)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1c6cdf9d54bb..f489703338b5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4408,6 +4408,34 @@ Sysreg	GCSPR_EL2	3	4	2	5	1
 Fields	GCSPR_ELx
 EndSysreg

+Sysreg	HDBSSBR_EL2	3	4	2	3	2
+Res0	63:56
+Field	55:12	BADDR
+Res0	11:4
+Enum	3:0	SZ
+	0b0001	8KB
+	0b0010	16KB
+	0b0011	32KB
+	0b0100	64KB
+	0b0101	128KB
+	0b0110	256KB
+	0b0111	512KB
+	0b1000	1MB
+	0b1001	2MB
+EndEnum
+EndSysreg
+
+Sysreg	HDBSSPROD_EL2	3	4	2	3	3
+Res0	63:32
+Enum	31:26	FSC
+	0b000000	OK
+	0b010000	ExternalAbort
+	0b101000	GPF
+EndEnum
+Res0	25:19
+Field	18:0	INDEX
+EndSysreg
+
 Sysreg	DACR32_EL2	3	4	3	0	0
 Res0	63:32
 Field	31:30	D15
--
2.33.0


