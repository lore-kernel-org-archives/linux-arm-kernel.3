Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D1FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ojc02aemqoLwNxvvZsv+b8G2yi1V858/hEEaqJeGoY=; b=lbzo7Nd/npeFOga2tqCCWwCF+4
	djlUh37Z1IIh62gmVRGA/dVyLagozxZf8irvgYyteWxmgyXLLA6XHNSAqmm/8CY+ORzOXkZlM55xk
	yI4GSaWCrNThT3lIDIOELu4r4jk1KqWAv17SJUa+luAnHnm+b4Y9otZvs7RS51Szg3ar6uiMgeeS7
	kZ9Rpuxk3Xnds7CkWSfASizcTcw2VvFoCOd8Cl0bkDC2MuoZACazZdbbo1e19yA4xaJm3zBggvgUh
	zHth5CBwYZYV0jRf4EHOPrQAXF/w090vWz1EL2qWl9tedOiSkSU4J6rJTX/HHH3nCNEjuK3eYFNSp
	V+xOJfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zy9-0000000EnD9-24wH;
	Fri, 18 Sep 2026 14:53:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zxa-0000000EmjH-2V25
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:53:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 068C36022B;
	Fri, 18 Sep 2026 14:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1478C1F000FF;
	Fri, 18 Sep 2026 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743185;
	bh=4ojc02aemqoLwNxvvZsv+b8G2yi1V858/hEEaqJeGoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WvLj/88Ac8AnU5yMp8ElZgGdcWNko+AR8s1xotTG/QtyLGZ8hdyhjlM/gI6Qax3W6
	 QiH8qK79Q4fJPl6a9WD+2h079wY9BFb23wxcwm11+pY2JSCqmUCOSadQXY5x+6/6Kq
	 w5Fc3/HwGp8yuvQojwzsXytalEhBmpPC3wtakK/4szdOMI5/CGmf20XXGwyO4ceD+v
	 TYtxh44DL4nQBC1W2QsThi/EJpGRGP9T5FmNn/cfJp8b4xsnT/CFxkH/IEenf2F0YU
	 wSMKB0JtXQpcqibfQK9MCh6tN1uvreg5AggNolcfXMkdy3HdApn4LX+JVDrWCqGXCi
	 2+6Dw/+Aun/zw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v3 13/13] drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN
Date: Fri, 18 Sep 2026 15:52:15 +0100
Message-ID: <20260918145217.1669-14-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now that arm64 no longer supports a big-endian kernel, simplify some
driver Kconfig entries so that the dependency on a little-endian kernel
no longer needs to be called out explicitly.

Reviewed-by: Michael Kelley <mhklinux@outlook.com> # Hyper-V
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/hv/Kconfig                     | 3 +--
 drivers/misc/vmw_vmci/Kconfig          | 2 +-
 drivers/net/ethernet/microsoft/Kconfig | 2 +-
 drivers/soc/tegra/Kconfig              | 5 -----
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index aa11bcefddf2..36445c2619ed 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -4,8 +4,7 @@ menu "Microsoft Hyper-V guest support"
 
 config HYPERV
 	bool "Microsoft Hyper-V core hypervisor support"
-	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
-		|| (ARM64 && !CPU_BIG_ENDIAN)
+	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) || ARM64
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
diff --git a/drivers/misc/vmw_vmci/Kconfig b/drivers/misc/vmw_vmci/Kconfig
index b6d4d7fd686a..ca03cbfdab1e 100644
--- a/drivers/misc/vmw_vmci/Kconfig
+++ b/drivers/misc/vmw_vmci/Kconfig
@@ -5,7 +5,7 @@
 
 config VMWARE_VMCI
 	tristate "VMware VMCI Driver"
-	depends on (X86 || ARM64) && !CPU_BIG_ENDIAN && PCI
+	depends on (X86 || ARM64) && PCI
 	help
 	  This is VMware's Virtual Machine Communication Interface.  It enables
 	  high-speed communication between host and guest in a virtual
diff --git a/drivers/net/ethernet/microsoft/Kconfig b/drivers/net/ethernet/microsoft/Kconfig
index e9be18c92ca5..c4ad3d85875a 100644
--- a/drivers/net/ethernet/microsoft/Kconfig
+++ b/drivers/net/ethernet/microsoft/Kconfig
@@ -18,7 +18,7 @@ if NET_VENDOR_MICROSOFT
 config MICROSOFT_MANA
 	tristate "Microsoft Azure Network Adapter (MANA) support"
 	depends on PCI_MSI
-	depends on X86_64 || (ARM64 && !CPU_BIG_ENDIAN)
+	depends on X86_64 || ARM64
 	depends on PCI_HYPERV
 	select AUXILIARY_BUS
 	select DIMLIB
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 8b6fdb9ad1ea..318e7b604342 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -102,7 +102,6 @@ config ARCH_TEGRA_210_SOC
 config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select PINCTRL_TEGRA186
 	select MAILBOX
 	select SOC_TEGRA_PMC
@@ -117,7 +116,6 @@ config ARCH_TEGRA_186_SOC
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
 	select SOC_TEGRA_PMC
@@ -127,7 +125,6 @@ config ARCH_TEGRA_194_SOC
 config ARCH_TEGRA_234_SOC
 	bool "NVIDIA Tegra234 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
 	select SOC_TEGRA_PMC
@@ -137,7 +134,6 @@ config ARCH_TEGRA_234_SOC
 config ARCH_TEGRA_238_SOC
 	bool "NVIDIA Tegra238 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC
 	help
@@ -152,7 +148,6 @@ config ARCH_TEGRA_241_SOC
 config ARCH_TEGRA_264_SOC
 	bool "NVIDIA Tegra264 SoC"
 	default ARCH_TEGRA
-	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC
 	help
-- 
2.55.0.1082.g2b9226bbc0-goog


