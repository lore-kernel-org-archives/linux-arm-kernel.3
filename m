Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAF6C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAZd/a36HARyHdp+510YAxs0/PoFjrLrLsZ3rfIrEhE=; b=U/bJniUUJFkZtpFkVPjZPNId/9
	KhA9jaBZ4CYQpCWX1dwVJQzITccfgMVJ6PXs1+5y/cNwVgTOPYKUUU6/Jwq2nL5ybr+Pao9o+BrEG
	MLGOO3KpIebafhTH6zasjiX8GbTGYq9Naeq6Tb842BEv8cFwKUNi1jyA88kxjNzsWNNCMJsClXT2F
	Rs168ms6/ivqHay248uJ4L2HKgnSMkKi2oyuClPeUltqKNsjN2Kl7XoW8iZoknmrLWDOPRQ4741Ec
	QcQXyZ8FwVaBAGzRvI0ae714ndTTxZxLgwIyOd/seOt3iS6EPFjMLFORn3RlHOEEuEaIH9OlbJ1z2
	gKd1zNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1o5-00000005rXK-1l17;
	Wed, 12 Feb 2025 01:44:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1mf-00000005r3r-2sN8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:43:26 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id D69412107AB9;
	Tue, 11 Feb 2025 17:43:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D69412107AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739324604;
	bh=AAZd/a36HARyHdp+510YAxs0/PoFjrLrLsZ3rfIrEhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DRazXyTkBQM8jzof7aBxhuYIn9yf6y5Uw4Ucf1WNgwMy8MWhti7O4mWwec00Eh/4B
	 S075Q4SOZR42Uzp41zFF8I0iJgdMqcSBeob1cw8rKc9sXGkT5LzlmEDefc6Ssz/0Ao
	 rIC8G8gG/Zzljm3g63sidPg3YQLjY6SaLnfWm70I=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mingo@redhat.com,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v4 2/6] Drivers: hv: Enable VTL mode for arm64
Date: Tue, 11 Feb 2025 17:43:17 -0800
Message-ID: <20250212014321.1108840-3-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212014321.1108840-1-romank@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174325_755814_F5E303C5 
X-CRM114-Status: GOOD (  13.89  )
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
 drivers/hv/Kconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 862c47b191af..db9912ef96a8 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -5,18 +5,20 @@ menu "Microsoft Hyper-V guest support"
 config HYPERV
 	tristate "Microsoft Hyper-V client drivers"
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
-		|| (ACPI && ARM64 && !CPU_BIG_ENDIAN)
+		|| (ARM64 && !CPU_BIG_ENDIAN)
+	depends on (ACPI || HYPERV_VTL_MODE)
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
-	select OF_EARLY_FLATTREE if OF
 	help
 	  Select this option to run Linux as a Hyper-V client operating
 	  system.
 
 config HYPERV_VTL_MODE
 	bool "Enable Linux to boot in VTL context"
-	depends on X86_64 && HYPERV
+	depends on (X86 || ARM64)
 	depends on SMP
+	select OF_EARLY_FLATTREE
+	select OF
 	default n
 	help
 	  Virtual Secure Mode (VSM) is a set of hypervisor capabilities and
@@ -31,7 +33,7 @@ config HYPERV_VTL_MODE
 
 	  Select this option to build a Linux kernel to run at a VTL other than
 	  the normal VTL0, which currently is only VTL2.  This option
-	  initializes the x86 platform for VTL2, and adds the ability to boot
+	  initializes the kernel to run in VTL2, and adds the ability to boot
 	  secondary CPUs directly into 64-bit context as required for VTLs other
 	  than 0.  A kernel built with this option must run at VTL2, and will
 	  not run as a normal guest.
-- 
2.43.0


