Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99040F55458
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvq/O+R+y6qCmOEUVjR2PUgdD2ilp/5PaX6r9kRJGgc=; b=nMR/TQkQ/Vz6BWRsQE+dVG7sYf
	OwCY7djTIm60J9d2a/5oT3TrKK4mawXouqxm6BOZ3mNyLEiJmVq5NQvCrSAQJ1hXjpC8JUteU8T3A
	O6f2UQmcpB6MwpCKkVp1P4NBAcjeGuxztHSG88yKOkMwtxmy02y1fSgeK+dsY/a4gbMka0CE0Lvoh
	S0+cke9i5/xRKQxnPnitLAySSCVfdzUulBGwdAifz7c2SqB1PthO9qyK4nOUZ+6q1VEJmusQ8sY9h
	82wCCc7pZQcJFIgk6WwKbszDRhmPUUNUeeUkJi1jvFzVuNfHT/9Oavfsgndedw5dJtZlYLaGdnRx0
	32BkUFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68d-00000003Aqk-1DRA;
	Wed, 25 Feb 2026 04:04:39 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68Z-00000003Ank-0HEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:04:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lvq/O+R+y6qCmOEUVjR2PUgdD2ilp/5PaX6r9kRJGgc=;
	b=iJbwssONMnPTRBgo5fw1t6+rLsbPEMOcqvZPDl2ktV9XH7Kf26BtkeotL5os9jUmfXVD/ezk5
	YwA7byABP7pxRQ9yfdlnqIAlzDD9ze6AwIYfP09dDFKaLIhN6ZECjyvQWl0RtgMlbKV8AhdTkhs
	CtMZYK070yqV7n0l4XDFoV4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fLLSn6sNVzRhRJ;
	Wed, 25 Feb 2026 11:59:37 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 021D640569;
	Wed, 25 Feb 2026 12:04:24 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 25 Feb
 2026 12:04:23 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<zhengtian10@huawei.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<liuyonglong@huawei.com>, <Jonathan.Cameron@huawei.com>,
	<yezhenyu2@huawei.com>, <linuxarm@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>
Subject: [PATCH v3 1/5] arm64/sysreg: Add HDBSS related register information
Date: Wed, 25 Feb 2026 12:04:17 +0800
Message-ID: <20260225040421.2683931-2-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260225040421.2683931-1-zhengtian10@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_200435_250984_56E96430 
X-CRM114-Status: UNSURE (   8.65  )
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
 arch/arm64/include/asm/esr.h |  2 ++
 arch/arm64/tools/sysreg      | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index 7e86d400864e..81c17320a588 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -160,6 +160,8 @@
 #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)

 /* ISS2 field definitions for Data Aborts */
+#define ESR_ELx_HDBSSF_SHIFT	(11)
+#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
 #define ESR_ELx_TnD_SHIFT	(10)
 #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
 #define ESR_ELx_TagAccess_SHIFT	(9)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9d1c21108057..e166ab322de2 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4528,6 +4528,35 @@ Sysreg	GCSPR_EL2	3	4	2	5	1
 Fields	GCSPR_ELx
 EndSysreg

+Sysreg	HDBSSBR_EL2	3	4	2	3	2
+Res0	63:56
+Field	55:12	BADDR
+Res0	11:4
+Enum	3:0	SZ
+	0b0000	4KB
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


