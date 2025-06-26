Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpHYUn5vqIoafjVYs+Iwklgczox5NAJvmO+KriVUiDo=; b=SN7Te/hDi1vVJmmHprcTGuSGjz
	8m9dVwEk/n+0zsslGMvNHUb77r8Qk/eLwAnVa9lUPA36cpitqshVYf9gaOYehBOPHw0OPZpJcnrew
	pp8gagtDPaSuKEHIyn1I0vVmI6V1KMU6yW6X0cShLnKBMCdEhBtraVxT0T3+v46EymFfv3ngxllK8
	cHur75wr1+CEikEq/ovnfuI5cKmdCsHhwfQ01lUKjYj7q8eQEst9p+IH/7gwt7F5bwRbf0APAV5O6
	cQX7tYby7X3tm8ECJjVVoM7fg6aYJK4VM+Dce6hMn53LN/nnCu9Yq7Msnij19aPYoPvfb2x6VP1a7
	mFjRyQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkhY-0000000BOw8-2rwZ;
	Thu, 26 Jun 2025 11:23:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjpB-0000000BH70-06dg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D5E161AE0;
	Thu, 26 Jun 2025 10:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C79C4CEEB;
	Thu, 26 Jun 2025 10:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933639;
	bh=GGu0BlNfPd3BbcRNatWFSy8vlHfdSkuub7faaglQhI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HAOzJllViCYWot+JHa3B0k0EHoJXl9Z+gzgwCMcC3s2jUjuNk+4aAr1W/t4ip1piw
	 lyzvUY2N8SKbGwURb92uyQX9r7TD9NVO7w6mG7lUCJfSbap7yCx7tSYlqxWBdM7gQw
	 aC1i5P7UJhN6Jh4+y0BPBp3CB3UNPWuIurfb0kT+0Fs3ognzQhKvlqRO1imv6dpFJw
	 HccfWH9de83UllAE6xu/rIHSFNlSwGG8cHlu83xbemVHl18Sibesio0J8d/neiDy6h
	 UspheVl98rbG/WS4eEMF+/LBth56e6oibgNrI+fjGKd0ehjDZOfxSjigeSPib5zeFV
	 /MR8bOt2xb1tQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:01 +0200
Subject: [PATCH v6 10/31] arm64/sysreg: Add ICC_PCR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-10-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ebbb22ed2301..5e15d69093d1 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3527,6 +3527,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


