Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F122C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88Y6kGcsUm5IQAmclq4tcGgR5py1qbwRn/wbmxf6FdE=; b=SjGHuLVe2nIdxTiV3N+xZzLmk9
	YgJ4hbUmtoTU4h/SEQ6M15jtAdPjBRtiA4fabFDfxxdVrgRatD3dL7lMJdc+4GtArPXTwfw393sH1
	VQz3dUaaJAK5aVGq6SgrpWPfHyjPrR2dwzUdlRXydgo6VF26iA4OQtX7R7Qoq+O2eiEW/glyUf6o+
	rMzwDMYMTUZryFYsMuPw5GLWXiKe/VPgoY0WLt94G1Xt+aGndjrX0EIpykPqwd5AszKoXuAayCZg0
	a47rcVuWCCATge7l4KhcWAa0qBJm6dSr6v2Aet5dCaBNaXDUro6gFPbxDsXSda6w3U3wXn81TtHK8
	hlzHlYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHpg-0000000B7T4-0YiM;
	Thu, 03 Jul 2025 11:10:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH9U-0000000Az6d-0CDt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B7C36141F;
	Thu,  3 Jul 2025 10:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B09C4CEEB;
	Thu,  3 Jul 2025 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538407;
	bh=Z8Ojm3tu2K7fLVQhABMYAuAVcs0eLame5+RGMEmHY/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MfnkMMKrenQurkIeFvn7yhMz17v3mJo2uhcTlhb48vr0QZ4vDkfH/WYcPYat2b5d7
	 1DD4OgEd9WIQf9NiVCuh6G2UROdmiJOwDj9SKk87THYksxXlssInNkAIlRQy9feIc9
	 zFfhvYc3poEtHswA+LscW2L3y/SEn0sZtkEOoyu+7KwDNIP635/mSYe+lgGtbjMino
	 LcDU0OO4FIPDX2GA4nVYuLwRimWEwXPsocJaTZqYBqsXTQIJ2am5GjcNCYnlIZPeKv
	 J9IzZvMVau27h6lOQYvyTpIWwO5vsc16U13/w/twAFxSWw5fqPqXQN827fbLKvByV5
	 47yl8SPH99P+Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:07 +0200
Subject: [PATCH v7 17/31] arm64: cpucaps: Add GICv5 CPU interface (GCIE)
 capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-17-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

Implement the GCIE capability as a strict boot cpu capability to
detect whether architectural GICv5 support is available in HW.

Plug it in with a naming consistent with the existing GICv3
CPU interface capability.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 42ba76b6c8cd..2fa26129762c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3061,6 +3061,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_pmuv3,
 	},
 #endif
+	{
+		.desc = "GICv5 CPU interface",
+		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
+		.capability = ARM64_HAS_GICV5_CPUIF,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index a7a4d9e6e12e..8665e4cfbeab 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -36,6 +36,7 @@ HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5
 HAS_GENERIC_AUTH_IMP_DEF
 HAS_GICV3_CPUIF
+HAS_GICV5_CPUIF
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1

-- 
2.48.0


