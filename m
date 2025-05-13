Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FA7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJ0T7oZ2ngmzWuTS6ujKVm/ENCaiVbeZ2i6uRIcL02Y=; b=i11jXmlElE++fbL4i70oQta+uw
	L7JewIEB40oAsH7odayH9HhnhoMKRSYFfdnYECA97EPsnAIa7p8sdSlwSLLrx6xFbrw1zHc5zsiy5
	wSEg9EaOEWhzLwGmUddw3L9fmJ68eko1smBJYojLj3TsTZoZsrKdWz8ShfL2u4kpEFyVdbOYZcaAB
	aGp0j7+KSMxldce0yMwrdsBoTNCrj7VMoOVoSjWk5T8dBbkD4hSb/xvbaJSsoSTWd7D/DrThVSjzp
	AEHJbGGzQHnjNEL8SqvENMLWsYnAflbIF0gVBtS93MqmIm8d+t2dMRLgy5RnyT/+6XSv38QKRF4PR
	y+FA8rIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuHw-0000000DEMa-3sm3;
	Tue, 13 May 2025 18:23:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtky-0000000D9L8-3h56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28E9FA4DAED;
	Tue, 13 May 2025 17:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87268C4CEF1;
	Tue, 13 May 2025 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158571;
	bh=Tr4cD6xh6+1h9U0/qenfvi0xSs1rAOetTxU7+Kq/NsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DGtVMW8rWlmlHsxvE8L/kq0gSXkrCalgLvSXQiExTyXIA0NG9nKHPWWkeF2tB9t1a
	 xfAXFtFAWa+A40957fEYvgcaCYR3zwGDDkhvRoWn0QzqqNUdQkO/N3YOqeK23s7gvL
	 UenXU42zkwZTPPt4aV5YKqjcEfPOR/L5Mx/X9SVSr+o4XocT1G5YuYVhrrwArAZJtK
	 TCEmka/45nW1qrSvl89OyrI99YSdmouW/eQkvclwWe/wkNut4qaTbCZ0sOgm5eMNbz
	 zLGg72e3/8YQfiXYlgRpfVDP34TLDI92PaoUzdaRZkZcT9cjyCnl325Z6jMaP9kEzS
	 NlAlKkQNFnbRA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:06 +0200
Subject: [PATCH v4 13/26] arm64/sysreg: Add ICH_HFGWTR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-13-b36e9b15a6c3@kernel.org>
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
X-CRM114-CacheID: sfid-20250513_104932_996360_BCE7E2FE 
X-CRM114-Status: UNSURE (   8.27  )
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

Add ICH_HFGWTR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7eb9bca61728d1bd1eedc0bfa6c8a904a25132fd..0927754d9fe2c5addbd9693d83b7324f1af66d3e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3601,6 +3601,21 @@ Field	1	ICC_IDRn_EL1
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


