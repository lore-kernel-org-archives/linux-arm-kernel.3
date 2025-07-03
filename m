Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B226C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lqwk899m7bjekDFuWk2Qz9G77QeT0HBAgeLAE/za1s4=; b=1lFgUWI9n6s5vLiSMXA5W3dxcm
	xlST45Bie96ifvaE+c/PxQjKnFktB34pnjxVyiLCovCF8p2kNsF6jLCxFq2DdCBPJ1qmrCp2fjYl0
	nf4vW6FaDg7aFjj43aiYOsFv5HVxBH+rS/dOALbpofHt05T+9UIOezXm0SmtFWwngb+QQE3DVs2U1
	EhjbRWN+9aIfhnHcfTEvgvvop1bJrpz0rVDU9ZjG1T18JgusrqEqPvRF0dXe73aSADSwV+D3bbAN3
	2ayqflPbvnyYabgT7VUjyANEiFHF/9bv2V5vjcFvjFiSg1c+mcWm0RGHydMvj666c8nzskWzMV7Ab
	0n7WRRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXITK-0000000BDol-2IiL;
	Thu, 03 Jul 2025 11:51:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH8P-0000000Ayky-2el7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 141715C4464;
	Thu,  3 Jul 2025 10:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD56C4CEE3;
	Thu,  3 Jul 2025 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538340;
	bh=cHsJXMhOTfVZkuFAf0l6aQWEcs6MpJ4efXvwjlVJcKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G0amZSU1a8GM156F9LfGG6AaTBkba7mVaz29G51OO7jsNQhASyT0AsvU7daQzZBpd
	 RyOF3P2EBD7mdgNQcgDHKSqjczJxkjUZTnkiNrOOW5hT1JXilIrIgQnfSGpVxeqzbT
	 Gdwe6XNv8mj/YYYEkPN38UouE7RhxH2dJuOi6rGF1k0hJGNDnDYVKfRRHAhfr7WUEj
	 Ry5OlupBmLccs0Wrj3mpO97VPobvmpDoLRDocmu7wYzy6E5ihNmZ9iiXIPNlEld8qw
	 fvLFEwNcXSosyuznoY8bbe6tq2dE4XFGSvI6xBIGbGWqmIg4FRgSRwHr/PHuDZR+7m
	 NCEXAevuoCdyg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:24:55 +0200
Subject: [PATCH v7 05/31] arm64/sysreg: Add ICC_PPI_HMR<n>_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-5-12e71f1b3528@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032541_757017_C85406BD 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

Add ICC_PPI_HMR<n>_EL1 registers sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 81b32f567ce3..7f096efee4e7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3024,6 +3024,81 @@ Sysreg	PMIAR_EL1	3	0	9	14	7
 Field	63:0	ADDRESS
 EndSysreg
 
+SysregFields	ICC_PPI_HMRx_EL1
+Field	63	HM63
+Field	62	HM62
+Field	61	HM61
+Field	60	HM60
+Field	59	HM59
+Field	58	HM58
+Field	57	HM57
+Field	56	HM56
+Field	55	HM55
+Field	54	HM54
+Field	53	HM53
+Field	52	HM52
+Field	51	HM51
+Field	50	HM50
+Field	49	HM49
+Field	48	HM48
+Field	47	HM47
+Field	46	HM46
+Field	45	HM45
+Field	44	HM44
+Field	43	HM43
+Field	42	HM42
+Field	41	HM41
+Field	40	HM40
+Field	39	HM39
+Field	38	HM38
+Field	37	HM37
+Field	36	HM36
+Field	35	HM35
+Field	34	HM34
+Field	33	HM33
+Field	32	HM32
+Field	31	HM31
+Field	30	HM30
+Field	29	HM29
+Field	28	HM28
+Field	27	HM27
+Field	26	HM26
+Field	25	HM25
+Field	24	HM24
+Field	23	HM23
+Field	22	HM22
+Field	21	HM21
+Field	20	HM20
+Field	19	HM19
+Field	18	HM18
+Field	17	HM17
+Field	16	HM16
+Field	15	HM15
+Field	14	HM14
+Field	13	HM13
+Field	12	HM12
+Field	11	HM11
+Field	10	HM10
+Field	9	HM9
+Field	8	HM8
+Field	7	HM7
+Field	6	HM6
+Field	5	HM5
+Field	4	HM4
+Field	3	HM3
+Field	2	HM2
+Field	1	HM1
+Field	0	HM0
+EndSysregFields
+
+Sysreg	ICC_PPI_HMR0_EL1	3	0	12	10	0
+Fields ICC_PPI_HMRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
+Fields ICC_PPI_HMRx_EL1
+EndSysreg
+
 Sysreg	ICC_ICSR_EL1	3	0	12	10	4
 Res0	63:48
 Field	47:32	IAFFID

-- 
2.48.0


