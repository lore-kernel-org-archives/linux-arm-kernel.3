Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D89C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWjdOX2b6nCEvV6otLRk9XBMfiJdwuZ3izATbMjcg00=; b=IT+U0fITrT+pIQNoZK1OYQ7QXo
	eq7jxt/h9ibVp4fgpqX+V85VcOOM9FO9/ghIy7/T7zQDrGaZVUxG5O3LjFcEythILmKlu//CVWTTs
	R2LBGrl6hMgaq0oBoKQAf80oS9ULFvIUcDjG9PZ8jrAleDc1tVvrkxWMyew+OxQtuWTeFZHltHrFH
	pmV5zevmclxUxeis/XRB+xaxbpOBUqFaS0AHlF1F4hvNrvaVZ6g4X5pufZ8dcs4pcpMPUQ9gS5ugd
	wB4dS/uUXFJUwFRgXHuW1He7t64i9Gp6uXbWp5cIyjNDwLdOkvP8QOwFBiNtpw7t7W2A2tfjb6ctB
	MK9+Kz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27H1-00000003s0y-29UF;
	Tue, 08 Apr 2025 11:37:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26YI-00000003kGc-2VAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22396A4914A;
	Tue,  8 Apr 2025 10:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71841C4CEE5;
	Tue,  8 Apr 2025 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109493;
	bh=jtBNyXLItJhfIxTK4Pp6vzdTvnQztzIAhQqNSaBxo3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gcHqfVKgcYLuBTU7Og2f0WEJNqp2cezz1sPjSWcx3UmMF78B2KB9vzySIEjnh7VDr
	 4csyHcatdloWToED15Ve0fmNnzc/GNVle91dhOyXR5p2E8KD2gIRCq5SyfUWw+fop/
	 QpRBWbicqARu5AyUE18/EnD5etROcE91/mwr2pmzEwXK+L9CbzE7wLRfBT243NIAiT
	 Mz3BxcPM6/FlooovDmqVvoHGnOnJUWutivaVHYl4nCF5sGPOzou7FxddLIBQbljKb6
	 e8+sF71ud1+JFjSVMBoxQDEsKuyGt0B8UG8oTs/nBj/peNURNYGPMxEIU/kC9tUiUJ
	 CJ4YjTIsz7RkA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:11 +0200
Subject: [PATCH 12/24] arm64/sysreg: Add ICH_HFGRTR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-12-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035134_709566_13E7D0E9 
X-CRM114-Status: UNSURE (   7.87  )
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


