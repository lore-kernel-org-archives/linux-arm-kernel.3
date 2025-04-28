Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F0C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xt1rbRXU40eBeYFqn5S5410daeID7AsrUbw+WPHynno=; b=JM1G6l1n8sHPZ54zFELi7sTPfG
	E/0eTebzxOp/wNAvT7p+oP4o1Ds8/O4lvkTmWbfl5AYcM8fSCez3CuGx5jxaXgP3v0iNXqkCk67rz
	+adBNArxqgP/Gltjz6b4TYGR4TgjeGE6rJy/btpj/UhIdkCchh/ny9hNf7Z30jWF1X30iwn6qr0K6
	giec3fl//Rs030v4OybiJ6fXVmM/d3ML7v0RmIz8OCGdxWAZIbbOmkwO1aj3XsQvjWyKWxQRY/Wqv
	WXVnBDxLJYCU3AtWlUig6sfQ835TxxTPOxz31qM93KJFZB8SBmVVv04G3YrOmvSjaZ51OxyFW9gwK
	9PsLBtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VvE-00000007bfa-29AU;
	Mon, 28 Apr 2025 21:21:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vhl-00000007ZHj-1XOx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 21:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xt1rbRXU40eBeYFqn5S5410daeID7AsrUbw+WPHynno=; b=KJpfl/LUTh85Xln4UmFoBh+JrW
	tGoxyuluCsCRaQQLc3P9xx9VTsCy0wzI2HyA9yiEyymV3Vr08m8rvrZsQ8dEXPpPdU9RemKGpkVTk
	XRLcEBimK9ksbKfejWDMgb2snmkC4FyZeC06S2OHJWAaGZG7s0TlOsqQz7sKypfcDO3p+V8NxDcHu
	ffIsSzpM92dQeg0QzyPH8sAnCp4lG442NpaKoXFwi1n76lvVbHhZPsYwwgu6qmkHUhnBTazJXkp/d
	rZCafYLasbCbidMMglYhOJUodjoNWdfQp1FUEGTELYQLn5iFb2E5Fk8LKUM29VFVfOmO7kQCrOccs
	fZPiC0+Q==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Vhf-0000000D3Bl-0IHC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 21:07:53 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 06B0A211AD28;
	Mon, 28 Apr 2025 14:07:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 06B0A211AD28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1745874466;
	bh=xt1rbRXU40eBeYFqn5S5410daeID7AsrUbw+WPHynno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ILeQxzGcrqOI4PpdKoj7u5guh0X0UX9/VyUrwB0JxYD13NsGVGsLZHHEMhXrkz1XI
	 T1m7CheHstc2Y2+zmY8+VfPt0ye9i1Hv2lytSJggpw039jJ4ClPFk/GxeLHaKmFhPC
	 X8uoP1iwndOfYCt6dIZggjhIHT+M1l89I3vcvyzU=
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
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	linux-hyperv@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v9 06/11] arm64, x86: hyperv: Report the VTL the system boots in
Date: Mon, 28 Apr 2025 14:07:37 -0700
Message-ID: <20250428210742.435282-7-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428210742.435282-1-romank@linux.microsoft.com>
References: <20250428210742.435282-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_220752_241428_EFDCF8EA 
X-CRM114-Status: GOOD (  12.94  )
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

The hyperv guest code might run in various Virtual Trust Levels.

Report the level when the kernel boots in the non-default (0)
one.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/arm64/hyperv/mshyperv.c | 2 ++
 arch/x86/hyperv/hv_vtl.c     | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 43f422a7ef34..4fdc26ade1d7 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -118,6 +118,8 @@ static int __init hyperv_init(void)
 	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
 		hv_get_partition_id();
 	ms_hyperv.vtl = get_vtl();
+	if (ms_hyperv.vtl > 0) /* non default VTL */
+		pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
 
 	ms_hyperv_late_init();
 
diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
index 582fe820e29c..038c896fdd60 100644
--- a/arch/x86/hyperv/hv_vtl.c
+++ b/arch/x86/hyperv/hv_vtl.c
@@ -55,7 +55,12 @@ static void  __noreturn hv_vtl_restart(char __maybe_unused *cmd)
 
 void __init hv_vtl_init_platform(void)
 {
-	pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
+	/*
+	 * This function is a no-op if the VTL mode is not enabled.
+	 * If it is, this function runs if and only the kernel boots in
+	 * VTL2 which the x86 hv initialization path makes sure of.
+	 */
+	pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
 
 	x86_platform.realmode_reserve = x86_init_noop;
 	x86_platform.realmode_init = x86_init_noop;
-- 
2.43.0


