Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713E6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWjdOX2b6nCEvV6otLRk9XBMfiJdwuZ3izATbMjcg00=; b=uwoUBl1LNm4Q6o8Zpa39/ZNusa
	34HsA2mONf9cu1zPbO6iwpGdUrKDe2l4C8Zz2XD9x7aPdMNUMz4WWIb+8B1rnxY8RBL+F1/Zg73rp
	tu9flN/k7xr2JORbsxOIX5jOfQSmuv2Gmn8qXr/xGIUxEUt5fYqcs+OshwcuwxAqQSZe9Y6Y/XD14
	JkzDq9OdyR95O0BicO6+EK9AWZ66I4HIq5OYhSxD5CJ6PhGNCepYbb3tcdwJXhkgFBtgewBWqxtZq
	DsjcYfeObzTTNi22AJfz1z0ZE2ZC3KHLLt9Y7J4zEYmhCubwTWm+j6VNlX1o5d3Ch0KlPJKVX9GBd
	ZDmb0Wug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w3v-0000000E61c-3uB6;
	Thu, 24 Apr 2025 12:52:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tnC-0000000Dfqs-1YpA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kWjdOX2b6nCEvV6otLRk9XBMfiJdwuZ3izATbMjcg00=; b=OiHUE2TNp+2QPlOMds9B02nwzv
	atnAIwypdWlnWQiCeaT0kcwt9MoOQN8FDOuQyjlkuK4GjaEgx3AwQyDBr+g75vjvSX6G6xYZD2TDE
	NQeh40GjMPZVEgkpT1eE7NI2YWqxm9ckjV451tk2odiiH75GfX2lx8pQcJmn2l5g5xDL0RyUwBRxx
	K0UtK9/hkyCQ8bI4jXGSU/nqlmUvSoflBVC0oKxWb265mz381xnBoX/4yzGtrlXkLevE8CUeOIwEj
	Jc3Ia6l5I5GoiGuQurVbM9u2ga0mc261fwbQ4U9D77mmadvoxSTddBsQcCY1OLI9Ug5OHwM36RZyh
	gCV3Q6Ag==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tn9-0000000Bjaa-2JXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2D075C06B1;
	Thu, 24 Apr 2025 10:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E84C4CEE3;
	Thu, 24 Apr 2025 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490409;
	bh=jtBNyXLItJhfIxTK4Pp6vzdTvnQztzIAhQqNSaBxo3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X0lL+Alhg7F5HZy+FTpyT9n0TCzhkIOLCSMBG+n0pgEhSuE2cvEyzb0kyM/gj+LTk
	 tdd0Z89BO4OdQKZC9Feg1mrqRZipgSZJ+5hRxyFifVk0Uokd1wT93Our4CiX2SknND
	 9vD4JprQYgrgaff91AQOSHr6O47gwqlmNpRHrooiMFjKpm9516deNcls/9B2KmsgNn
	 zbjJDQIXj3Fm5xGSZYePfFg+1+le82lrKxN8TKN1BjOcfCQx7MY3gaGfxOToEDG/da
	 FzbKwtwcbx3YHOntrHyy0/sh5RJxYAv+iFnR2u2Y6ddE3LarsjGx4JNGVG0N5F6wiT
	 FDqvDjNs5u6Lg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:23 +0200
Subject: [PATCH v2 12/22] arm64/sysreg: Add ICH_HFGRTR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-12-545edcaf012b@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112651_827215_8122232F 
X-CRM114-Status: UNSURE (   7.90  )
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

Add ICH_HFGRTR_EL2 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1ec8113df713dfea6d38e39c42eba1e3dca5eea5..0c0e805481c84a14ae62d199466171d97d54ef90 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3583,6 +3583,24 @@ Field	31:16	PhyPARTID29
 Field	15:0	PhyPARTID28
 EndSysreg
 
+Sysreg	ICH_HFGRTR_EL2	3	4	12	9	4
+Res0	63:21
+Field	20	ICC_PPI_ACTIVERn_EL1
+Field	19	ICC_PPI_PRIORITYRn_EL1
+Field	18	ICC_PPI_PENDRn_EL1
+Field	17	ICC_PPI_ENABLERn_EL1
+Field	16	ICC_PPI_HMRn_EL1
+Res0	15:8
+Field	7	ICC_IAFFIDR_EL1
+Field	6	ICC_ICSR_EL1
+Field	5	ICC_PCR_EL1
+Field	4	ICC_HPPIR_EL1
+Field	3	ICC_HAPR_EL1
+Field	2	ICC_CR0_EL1
+Field	1	ICC_IDRn_EL1
+Field	0	ICC_APR_EL1
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0


