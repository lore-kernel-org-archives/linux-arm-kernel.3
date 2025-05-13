Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0743C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgwDt35m02VSmxSK9SVNfzdUq/5r9Xikwh7jcXc8+R8=; b=ZKNPmIoE6RORfRbuvrXW062XKP
	QaRUOjRAkl2vgA7JAwZ8UqegS5lJ1tvYpR//rvv+JND6zhAKYwTwP7WQS7jdH8bzVIt5PaNXR+tS+
	/H4iKn/il9vVdaJ0mZvyg/4NB4J85p0LqGu3eRNvvgFk/1gGMyhp1jUn25WMUZ3r+XiN7llQdz1U0
	67+BM1Zl4FQmm+cigOth2fJDhGsBfxrZGDTi09oT1TKxErJzxbz1B3QE6PPxfaso1bcYRqQkBZReg
	XEEsOcXyzF0v3SHJMspzwJC2H1hFiqyj85Ak+JaJMzp8VRsgN51K2Wl0NRjRRVpdBIhiIKpOMrM7V
	ANdzj8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuFt-0000000DEC1-0bRS;
	Tue, 13 May 2025 18:21:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtko-0000000D9HB-1tkp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B93640BDF;
	Tue, 13 May 2025 17:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886DFC4CEF0;
	Tue, 13 May 2025 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158562;
	bh=Wo+8ZCVDmb0B4uso6wnZUfaOVqcaGAW+YnwXXYWbbY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ca+9n4MyRwBBYr7qFOSjhwp09DucVZPyYFT080Q3fBZR0DIqUD/FWi3tpWQGU2BWR
	 VHp6+yUgDgDPC6FNJ6d2iXfjumKbJ+7P6YnVWxAtU0A2jXwHlYjE69WwSyWwSqcnjp
	 cJOrXA18iitGRjZiEAd6S6MpdB2RFU8w1f5wfBfPGGcVQGDcsWOEEWwML84eS8487G
	 W2h0pbOuj7g0PMzrrFZZW/LJF+/K+1vkoUccGQYALXmCG2An3l+80aezKQ3v7gDqDo
	 qK0KkWiTLbn6itGNu+CcuttMNrmFBHhe7zM4WA2VFZKxB7ZV2WR7ZZdDNXATsbNPTs
	 16bFfw/NsOE7Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:05 +0200
Subject: [PATCH v4 12/26] arm64/sysreg: Add ICH_HFGRTR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-12-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_104922_553119_DDFECD46 
X-CRM114-Status: UNSURE (   8.13  )
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
index d54c9783acb85f1049dbe51f9a37157d0fe03292..7eb9bca61728d1bd1eedc0bfa6c8a904a25132fd 100644
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


