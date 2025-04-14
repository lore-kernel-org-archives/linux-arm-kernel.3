Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2853FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEqY+MizYE3Tuj7oGWh4pKfuLIDZLrhKXP4HN0AHPSc=; b=GyHkiF71+pGtGoBuYIiLSbIvVF
	63Chki42pDT7Rl5CIEtzYI8lDziyB1HF8RzEkLKReFEsVa9jGlF4trgj+90iHVoTsAZjQkHI962bX
	k+da7tmJ/KzIA0YWUri7J6i2HoGKJsjs93DQAGROi4XSkHevMKfrYJ38mF7VnhZJFxzOUPVdbcvSy
	X/PAtAZKfQ/8CTKL7V8y4+t49AetFqw8fcwP6Ed3y0yXEdZkadwUJWVuIHDuEhwFWRKrzU9T3i65X
	K4FYSBsDr7DK3k27tjA2t/jPB7oRGDT9f/wZ/nckwQoMU8Uwd47i3l1XOmCxELHVNGJQ3EJimqQcT
	Hc+nEhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SiU-00000003mwx-0pvf;
	Mon, 14 Apr 2025 22:55:50 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SaE-00000003l2u-0Ggb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 22:47:20 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.159.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 06388210C42F;
	Mon, 14 Apr 2025 15:47:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 06388210C42F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744670836;
	bh=dEqY+MizYE3Tuj7oGWh4pKfuLIDZLrhKXP4HN0AHPSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OCOZ3GA6nVfz8WTUjRiC9l/nPq9iNgoU4Kaj5eQYMvW8zp+l4EPbz3OFB8Z8Wz8pP
	 70qoG5Jv/1edPOrd4bHuVmOim6jqSofgyJctkvxRGzq1twAaLCD4HIw/S2DGnV5jNm
	 mtBcJm2aHM2xjTXIl2elIG7zErzoO7YjbfgA3mfQ=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	rafael.j.wysocki@intel.com,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v8 03/11] Drivers: hv: Enable VTL mode for arm64
Date: Mon, 14 Apr 2025 15:47:05 -0700
Message-ID: <20250414224713.1866095-4-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414224713.1866095-1-romank@linux.microsoft.com>
References: <20250414224713.1866095-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_154718_131405_8B7815F3 
X-CRM114-Status: GOOD (  13.53  )
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

Kconfig dependencies for arm64 guests on Hyper-V require that be
ACPI enabled, and limit VTL mode to x86/x64. To enable VTL mode
on arm64 as well, update the dependencies. Since VTL mode requires
DeviceTree instead of ACPI, don’t require arm64 guests on Hyper-V
to have ACPI unconditionally.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/hv/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 6c1416167bd2..eefa0b559b73 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -5,7 +5,7 @@ menu "Microsoft Hyper-V guest support"
 config HYPERV
 	tristate "Microsoft Hyper-V client drivers"
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
-		|| (ACPI && ARM64 && !CPU_BIG_ENDIAN)
+		|| (ARM64 && !CPU_BIG_ENDIAN)
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
@@ -15,7 +15,7 @@ config HYPERV
 
 config HYPERV_VTL_MODE
 	bool "Enable Linux to boot in VTL context"
-	depends on X86_64 && HYPERV
+	depends on (X86_64 || ARM64) && HYPERV
 	depends on SMP
 	default n
 	help
@@ -31,7 +31,7 @@ config HYPERV_VTL_MODE
 
 	  Select this option to build a Linux kernel to run at a VTL other than
 	  the normal VTL0, which currently is only VTL2.  This option
-	  initializes the x86 platform for VTL2, and adds the ability to boot
+	  initializes the kernel to run in VTL2, and adds the ability to boot
 	  secondary CPUs directly into 64-bit context as required for VTLs other
 	  than 0.  A kernel built with this option must run at VTL2, and will
 	  not run as a normal guest.
-- 
2.43.0


