Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D343C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRkKt0g+cSgDRdGDbSoiCl8i8T6e0CHFYaIxU2Cv1ew=; b=SI/affTQzWUncFdkLFHOUgCPU5
	8SwGHZKcc39BL3F7WJvbZYohVj+0sc+6NZJ2BcYeH6mYJr0kTO4Qm3cfhhClUPK+V9tiMAJA4obsD
	tdq7QLwokjZouX0VNW0OSQCel0h2WwxB84onEqr1FFA38tR3aEDVk4EzO7ZHJilznlHenRZL8vZGe
	yhxhmJwsMknE8EgbuCSW4mYAn814l2OwFTz7sxOGGD+rZ+2YbwxH1cUepsWax1upT3eSSj+SAFW7y
	zi6UIQoIKgpdJBlnPLorf7F+YEEG1CBS6BMswgOFtgcCr7NtDj5ECPn8g2JN60llnDNaZyoyNZBRe
	91WljdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHgN-0000000B5KK-0YUD;
	Thu, 03 Jul 2025 11:00:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH98-0000000AyzL-0qoh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0737613B1;
	Thu,  3 Jul 2025 10:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24199C4CEE3;
	Thu,  3 Jul 2025 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538385;
	bh=UE4nEEMoVD3v/SaKmpCCe4YLHuNFyOzbWblW9VqVH1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cp0aMRMn7sx5hbAcfZjcgwh8aowL56Zl/ckK1KlpLaLeel3CaE9dodywSVW+e3dMk
	 usR0hpUzgMDAUNWpLOL/QD8AddrWE3eSMjifR1N9xZ5c6iDPQbU3V311ySDs+STz7j
	 TCIi5w0379cGYHqO+SlxbUAYWuAwzKIb5cCVxrLXaZsC1UTCMvOgg6RPVOOFoL+8un
	 EBOQBg2yVPNo4AXj23WgrnXT2+16yxfHg4YpVHqGtIKPpeC1XrCbg4CjhxJDA1L0Rr
	 MU/NPacBBJwPlTQGAbKdD2tn/cYUOIqRjZXMd/PM+eeIH1Q6jQ22oLRC/caQK/tPmL
	 WtQvNZLOm49gg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:03 +0200
Subject: [PATCH v7 13/31] arm64/sysreg: Add ICH_HFGWTR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-13-12e71f1b3528@kernel.org>
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

Add ICH_HFGWTR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0202b3bd3dda..9def240582dc 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4452,6 +4452,21 @@ Field	1	ICC_IDRn_EL1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGWTR_EL2	3	4	12	9	6
+Res0	63:21
+Field	20	ICC_PPI_ACTIVERn_EL1
+Field	19	ICC_PPI_PRIORITYRn_EL1
+Field	18	ICC_PPI_PENDRn_EL1
+Field	17	ICC_PPI_ENABLERn_EL1
+Res0	16:7
+Field	6	ICC_ICSR_EL1
+Field	5	ICC_PCR_EL1
+Res0    4:3
+Field	2	ICC_CR0_EL1
+Res0	1
+Field	0	ICC_APR_EL1
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0


