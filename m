Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58950D0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBwSR2rtuqv+NAM5OYtNOv2Wezl+99eQ+pwqmjOxO1Y=; b=Hu2DJX5HovdlklyrkTQhlsFIuj
	4cQDOxCZgRIP/oSkDeWzwUrsY+yOjSGs8uis9qnYX9+FdnDHPsTlgAmtk7aE+FX1mDxInZxn468k9
	h0JMTD4nfrSyMYgSkslCEy+T22kS3m/8oaL51xhxZ3OcYwPCi4KrsQqUKIe4hvLmvlp1HKf64gr24
	kOqCKV5KA+sd5uyawi2lJUC0QuA1M4XQF4Lg0gwkCDiK62+WILy+UBuf6fJSzYoUmgO8nQLnE1xDl
	mPVgEQYQvH7FZO9PIoGnuIuDeoR845kVDeLtRfgldQMJAb65NVQV8yG1XMTkTZJYTIDduKddmg85L
	Yw3XZt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwR1-0000000DdZ9-3V2Q;
	Tue, 25 Nov 2025 17:02:35 +0000
Received: from sender3-of-o54.zoho.com ([136.143.184.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwQz-0000000DdYV-3hwb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:02:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764090117; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=brjEjmCljmQHQjaqGseBvjhrAdmgYR0JW+VWIzmFbj7ej9Lf6SMJcRNgVpDgcrjy6T7Ogo2aLhMZjYa5dEFXnoIBcu/owVMBnErOwHEls6icrs7xfTiaPGAjLc3AN0i58LmJPchtmywZQWPkDNRp3OW/87uZFIZlO+Mu+00U09s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764090117; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=HBwSR2rtuqv+NAM5OYtNOv2Wezl+99eQ+pwqmjOxO1Y=; 
	b=icX1bJa2yU+XpJtDhzLGB9mSD63PZR2xKz6iNFsyC2TqhcA0G8z0ZhAaoolJ3biccOZLtw05D1ql6vHy3+DU4+Mgv23REDDdn/URRhJaOHB4IEd6fqxuLDyiaieq5MhBUoe2kq3JBFmCgyOa/i+CSkHP+gmvZqUfb7BjNl1RZ94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764090117;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To:Cc;
	bh=HBwSR2rtuqv+NAM5OYtNOv2Wezl+99eQ+pwqmjOxO1Y=;
	b=nIgDYdj2N3/IpkoVx5vS+TtkYsQ2tgL3dUgTBKumVVJODLT5POaOriBZTHwBNdXL
	6w5qpDplWJdzjWhrMKnvKEBAi6SGJx0vekehb0bYgMKBMMLmH5MU1uBWwj1bBomJBvI
	ihlO8J4EMFDaUW2BQYh9GnQXoV0wSOlOpVKda47U=
Received: by mx.zohomail.com with SMTPS id 1764090116327797.2261256804017;
	Tue, 25 Nov 2025 09:01:56 -0800 (PST)
From: Anirudh Raybharam <anirudh@anirudhrb.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org,
	anirudh@anirudhrb.com,
	agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com,
	osandov@fb.com,
	bsz@amazon.de,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/3] arm64: hyperv: move hyperv detection earlier in boot
Date: Tue, 25 Nov 2025 17:01:22 +0000
Message-Id: <20251125170124.2443340-2-anirudh@anirudhrb.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125170124.2443340-1-anirudh@anirudhrb.com>
References: <20251125170124.2443340-1-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090234_005989_A9BE6986 
X-CRM114-Status: GOOD (  16.69  )
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

From: Anirudh Rayabharam <anirudh@anirudhrb.com>

From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>

Move hyperv detection earlier in the boot. The goal is to detect hyperv
and the type of partition we're running in before the GICv3 setup.

This will be used in the subsequent patches to allocate an SGI for use
by the hyperv subsystem.

Signed-off-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
---
 arch/arm64/hyperv/mshyperv.c      | 18 ++++++++++++++----
 arch/arm64/include/asm/mshyperv.h |  2 ++
 arch/arm64/kernel/setup.c         |  6 ++++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d7..cc443a5d6c71 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -17,6 +17,7 @@
 #include <linux/cpuhotplug.h>
 #include <asm/mshyperv.h>
 
+static bool hyperv_detected;
 static bool hyperv_initialized;
 
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
@@ -70,20 +71,21 @@ static bool __init hyperv_detect_via_smccc(void)
 	return arm_smccc_hypervisor_has_uuid(&hyperv_uuid);
 }
 
-static int __init hyperv_init(void)
+void __init hyperv_early_init(void)
 {
 	struct hv_get_vp_registers_output	result;
 	u64	guest_id;
-	int	ret;
 
 	/*
 	 * Allow for a kernel built with CONFIG_HYPERV to be running in
 	 * a non-Hyper-V environment.
 	 *
-	 * In such cases, do nothing and return success.
+	 * In such cases, do nothing and return.
 	 */
 	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
-		return 0;
+		return;
+
+	hyperv_detected = true;
 
 	/* Setup the guest ID */
 	guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
@@ -103,6 +105,14 @@ static int __init hyperv_init(void)
 		ms_hyperv.misc_features);
 
 	hv_identify_partition_type();
+}
+
+static int __init hyperv_init(void)
+{
+	int	ret;
+
+	if (!hyperv_detected)
+		return 0;
 
 	ret = hv_common_init();
 	if (ret)
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d3134ab6..58fde70c2e39 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -53,6 +53,8 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 	return hv_get_msr(reg);
 }
 
+void hyperv_early_init(void);
+
 /* SMCCC hypercall parameters */
 #define HV_SMCCC_FUNC_NUMBER	1
 #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..eccf5f19da6b 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -54,6 +54,7 @@
 #include <asm/efi.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/mmu_context.h>
+#include <asm/mshyperv.h>
 
 static int num_standard_resources;
 static struct resource *standard_resources;
@@ -354,6 +355,11 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	else
 		psci_acpi_init();
 
+	/*
+	 * This must come after psci init since Hyper-V detection uses SMCCC
+	 */
+	hyperv_early_init();
+
 	arm64_rsi_init();
 
 	init_bootcpu_ops();
-- 
2.34.1


