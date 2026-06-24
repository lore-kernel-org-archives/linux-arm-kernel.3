Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C5ACDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuIHUavUzhyt/C6rQx8OpYKtXN7bn3za9grEbqeMnzo=; b=J1bCSu/FtjzMwU60FzXMeJ9A2T
	zvfIUTNgvKnimy89HNiVUz9Kz4k7tUlvyT31uZ4HouOGQrrfxB3Jh0C99BjYjZXEh/iUXSq6ZWJ2A
	i/IKNglUvenfx4aKekDdBqOcyotTdv6/lfzggMIF/VKcnfyKYxxfAQ6lSZe3CSueHZXkdjRD3PWLl
	D5excrhIrvaj2N4p2xppyV6lFMf8XZVeUL2F7VrtP5L8C6uQ2gFByk2y5+hN9St4kqb+Tpat2uiTu
	wpjUjeNE6VsBxblKBHBvVIgHfQfJN3Vl505PAGks0faNmglaD4HYw/VZgzNj9F/NzweJzkNOji2Tf
	7Zc4Feqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJrv-00000007Uis-1srO;
	Wed, 24 Jun 2026 09:26:03 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJrr-00000007UgZ-2DPb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uuIHUavUzhyt/C6rQx8OpYKtXN7bn3za9grEbqeMnzo=;
	b=enxJSVfC9LiH4Y+dT+G/S2D94z7Dr6pXIahi1+GYklbX25doXvQefgoSHtbXgcCvPoPkIFUUB
	ctA58VRp1/unD68P0rnXpOGmByvrJoOx6WiXUc3KnASoYDXp+5+JehC8x4KOMW4DT9nsN5u/m0B
	PBW4ysVB5DaZFW43EeRhcXE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4glbtm4Sj7zpSvJ;
	Wed, 24 Jun 2026 17:17:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B56240537;
	Wed, 24 Jun 2026 17:25:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 01/12] cpu/hotplug: Introduce CONFIG_HOTPLUG_PARALLEL_SMT
Date: Wed, 24 Jun 2026 17:25:26 +0800
Message-ID: <20260624092537.2916971-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022559_904865_62113264 
X-CRM114-Status: GOOD (  12.80  )
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

During parallel CPU bringup, x86 requires primary SMT threads to boot
first to avoid siblings stopping during microcode updates. This constraint
is architecture-specific and unnecessary for other platforms
like arm64.

Introduce CONFIG_HOTPLUG_PARALLEL_SMT to decouple this constraint.
Platforms requiring this temporal order (e.g., x86) can select it
in Kconfig. Other architectures (e.g., arm64) can leave it unselected
to entirely bypass the SMT branch.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/Kconfig      | 5 +++++
 arch/mips/Kconfig | 3 +--
 arch/x86/Kconfig  | 2 +-
 kernel/cpu.c      | 4 ++--
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..d25b61dc03b2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,11 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config HOTPLUG_PARALLEL_SMT
+	bool
+	select HOTPLUG_PARALLEL
+	select HOTPLUG_SMT
+
 config GENERIC_IRQ_ENTRY
 	bool
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..8d9c57f3df23 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -660,7 +660,7 @@ config EYEQ
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
-	select HOTPLUG_PARALLEL if HOTPLUG_CPU
+	select HOTPLUG_PARALLEL_SMT if HOTPLUG_CPU
 	help
 	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
 
@@ -2301,7 +2301,6 @@ config MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPS_PM if HOTPLUG_CPU
 	select SMP
-	select HOTPLUG_SMT if HOTPLUG_PARALLEL
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..2ea80da1e4f8 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -305,7 +305,7 @@ config X86
 	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_GENERIC_VDSO
 	select VDSO_GETRANDOM			if X86_64
-	select HOTPLUG_PARALLEL			if SMP && X86_64
+	select HOTPLUG_PARALLEL_SMT		if SMP && X86_64
 	select HOTPLUG_SMT			if SMP
 	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
 	select IRQ_FORCED_THREADING
diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e..5a90f60ff60e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1792,7 +1792,7 @@ static int __init parallel_bringup_parse_param(char *arg)
 }
 early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
-#ifdef CONFIG_HOTPLUG_SMT
+#ifdef CONFIG_HOTPLUG_PARALLEL_SMT
 static inline bool cpuhp_smt_aware(void)
 {
 	return cpu_smt_max_threads > 1;
@@ -1811,7 +1811,7 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
 {
 	return cpu_none_mask;
 }
-#endif
+#endif /* CONFIG_HOTPLUG_PARALLEL_SMT */
 
 bool __weak arch_cpuhp_init_parallel_bringup(void)
 {
-- 
2.34.1


