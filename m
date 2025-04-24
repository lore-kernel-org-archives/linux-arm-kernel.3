Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CD5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hKZIA+D2QHChYlx8x2iKgNjsn6+0BDfx+Ur4DoIGak=; b=CPp4N86AncUz7TsAaFmfby079L
	R7V1yrPf0/BHySkB2gL/IjcazI3Jf/umdW35HSsIRNWlkyowlXG886aapy8QX9y4obaj34Arjkdgx
	mnJ21BSpsiBzGdNA/ANvQwitNOJwxl0k17Ow9dfwd/pMFHBShgg38LVe2nj7qG0WVN8fPZAEfK7Af
	qLlCvivDiQ3L10DMKEOwj6DRBnncmXD/j0zsgnrfztTiiVrUdqTH5NhYIVbV9gg6ZCyMZAzJNFM7L
	8qPyaZeULl9OSrw8DXRoKuBq760W3yustHzyPAqxRo9bbtfEqVHw6LwEgK0GahZM++RlEkMX4Po4J
	NsggZZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vDa-0000000DwHx-3bk6;
	Thu, 24 Apr 2025 11:58:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tna-0000000Dfwp-05JS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9745368455;
	Thu, 24 Apr 2025 10:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2020C4CEEB;
	Thu, 24 Apr 2025 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490437;
	bh=dDrbPic70xFVMnGI2U6eslEy81yc+v4juJuGar89STY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D0pECic4PC1ECNiE9KxvONqdcV7iY4sJIJDtHj4rLRslWAbzxGFs1oSYxsOKXkGms
	 gnUL05IYWX76PpfA5m7tbErBTnee48PVME5h2C96Hv5w8XM7orAu5i06X5DCV42pdA
	 7Ar+43dQ7dwnqFEZfFlrm/0aterhtNk29pEOpy0dq5H4beeh2XwllciYhTvZhqccyh
	 yWP9AHiJdCzt5mKle4W45rOs7rndYEAsLuImHz3XErx6sY8Mm5+pqiHIQ9EIq5OGID
	 u4vDHKRRHcUN72uzu+QVJP3qZkkqMmlhWUGoDstbyXwId/MiPNGOgtomsyJ8RGCAgO
	 jXhRJoznbcp6A==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:28 +0200
Subject: [PATCH v2 17/22] arm64: cpucaps: Add GICv5 CPU interface (GCIE)
 capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-17-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index cbb49de451f45fbee3100ea01e77b06352bd55ac..4d5163a20ee0fb09380ea5f1f2d37afb7257edfb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index 860ec49cc0530885c138b7dc7f67d58cd69b2593..c36f4165e2bb460abde81baf453199f62dd265b0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -35,6 +35,7 @@ HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5
 HAS_GENERIC_AUTH_IMP_DEF
 HAS_GICV3_CPUIF
+HAS_GICV5_CPUIF
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1

-- 
2.48.0


