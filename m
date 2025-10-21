Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79384CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYnZ5rl8ra5LMmp0nS6khBlS0UWmleV+sVAGtX9r6VA=; b=La6iFrldja0VSDuMLa6mkR6q+d
	CTTi2R0hurYmBxNxk7KOGOoPlJTMGD5/tN876CC3zNRnVP8mCj8HyG2Ag/P5+15HWxQcx5DO9l7ls
	F/ACsWJKSF10jQEbzENdTqri/ujvXVqNMdZ/g4uPhOgrNoW6bgeaZ8xRNzfWsNEt2jahunh2O41y1
	yXZz4+Il1w+utZx0LKLbb7Eol8a2cKGETdKUwCsiyiweEZWJIGqnhnr368Oeh5MTUMRBn826XBpTd
	5cPi71h3DpNW1vEfZSfK90PD1VgSFlNHMORPjV2LKObB2B3LoJcaD9IQ4fSwTthcwBGL1dRTIuhx/
	bkCMwKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBEa-0000000GvAa-2OmW;
	Tue, 21 Oct 2025 12:13:00 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBEW-0000000Gv8X-1Fee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:12:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZYnZ5rl8ra5LMmp0nS6khBlS0UWmleV+sVAGtX9r6VA=;
	b=qpJz1HmD7inbH6v+Umr1oyzEbNOvum+nx9YHpWOIidwVrx8FLHIgwb1TEuXSPWfAScqYLEgSF
	cWJeZgZJpW58BVuq09wwW8yTA8HXdMaykH/g+hkkOPsl114ujhRKr2WbsUlmmccLGYS3I+9Uu2C
	pXwGmNGbmwyaCiZ25QuS08o=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4crWP073JKzcZyT;
	Tue, 21 Oct 2025 20:11:32 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B5DF18006C;
	Tue, 21 Oct 2025 20:12:42 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Oct 2025 20:12:42 +0800
Received: from huawei.com (10.67.174.28) by kwepemq200011.china.huawei.com
 (7.202.195.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Oct
 2025 20:12:41 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<pawan.kumar.gupta@linux.intel.com>, <mingo@kernel.org>, <bp@alien8.de>,
	<kees@kernel.org>, <arnd@arndb.de>, <fvdl@google.com>, <maz@kernel.org>,
	<broonie@kernel.org>, <oliver.upton@linux.dev>, <yeoreum.yun@arm.com>,
	<yangyicong@hisilicon.com>, <james.morse@arm.com>, <ardb@kernel.org>,
	<hardevsinh.palaniya@siliconsignals.io>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses to IMPDEF regs
Date: Tue, 21 Oct 2025 11:54:28 +0000
Message-ID: <20251021115428.557084-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.28]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_051256_978110_4BF1FD30 
X-CRM114-Status: GOOD (  12.75  )
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

Add kernel parameter to allow system-wide EL0 access to IMPDEF system
regregisters and instructions without trapping to EL1/EL2. Since trap
overhead will compromises benefits, and it's even worse in
virtualization on CPU where certain IMPDEF registers and instructions
are designed for EL0 performance use.

More early discussion could be found from link below.

Link: https://lore.kernel.org/all/24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com/
Tested-by: Xinyu Zheng <zhengxinyu6@huawei.com>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
 arch/arm64/kernel/cpufeature.c                  | 14 +++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5a7a83c411e9..11ffa9f7b972 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -326,6 +326,15 @@
 			See Documentation/arch/arm64/asymmetric-32bit.rst for more
 			information.
 
+	no_trap_el0_impdef [Arm64,EARLY]
+			Allow system-wide EL0 access to IMPDEF system registers
+			and instructions without trapping to EL1/EL2.
+			Since trap overhead compromises benefits, and it's even
+			worse in virtualization on CPU where certain IMPDEF
+			registers and instructions are designed for EL0
+			performance use. This assumes the kernel adds the
+			support for Armv8.8 extension FEAT_TIDCP1.
+
 	amd_iommu=	[HW,X86-64]
 			Pass parameters to the AMD IOMMU driver in the system.
 			Possible values are:
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index ef269a5a37e1..d12e35d799ee 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2459,9 +2459,21 @@ static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, in
 }
 #endif /* CONFIG_KVM */
 
+static bool no_trap_el0_impdef;
+
+static int __init parse_no_trap_el0_impdef(char *p)
+{
+	no_trap_el0_impdef = true;
+	return 0;
+}
+early_param("no_trap_el0_impdef", parse_no_trap_el0_impdef);
+
 static void cpu_trap_el0_impdef(const struct arm64_cpu_capabilities *__unused)
 {
-	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
+	if (no_trap_el0_impdef)
+		sysreg_clear_set(sctlr_el1, SCTLR_EL1_TIDCP, 0);
+	else
+		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
 }
 
 static void cpu_enable_dit(const struct arm64_cpu_capabilities *__unused)
-- 
2.34.1


