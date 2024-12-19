Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE76FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY7HDBcNOfBjORHI8dvRz2fgQhJiuYstx4kjQg5480o=; b=xJieMEvqi2sFna/ro5YONgbaVW
	xc0ovxQW4H8C7RYhTe37gPtOoFKzWHTpgz0k1lAkcYzxiKqVYLV97HSgdx1NseMGEHvPyY2EKjR93
	Ls1DBnbvCbcVlp7qNx5fAK/FBdO5P6POhGoNBSFT3AV1XE/2B2Gn67cGaKH3MgyIf/2N41s6UA9Gx
	rmugrHr0B/MDir7IhJQtELy7LfDmElAoU81CiV8UlZfipa/lZTuw+bl4Qv5qfWvXlRCCNYS5Hmjut
	3nLb+g1tdGGVqypeC33qipJHEKTar23SZwfTRS7Vs2FWtiGK0kRvc8SQMX+c/SAezADckwp+rO1TY
	XuqxFDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKa5-00000002bql-0g5Q;
	Thu, 19 Dec 2024 17:45:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKPR-00000002ZoJ-2ojE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 670BAA42836;
	Thu, 19 Dec 2024 17:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9638CC4CEDF;
	Thu, 19 Dec 2024 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734629640;
	bh=nPaZbXOBBHrFlixt9/15NDrzHBuF0m3Er3DJCCqqVmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tIFT39YZxqt5Ce2b0r3ULR4f5l36wn+8kMX1Pm8Mw0C0g6cF/lfZg1h+lE/nekHUr
	 YgG7exTvmnshUf8BZZl2kRpJQM7Jznbjfv+73tqaWsTt0Gou5src+SxrAf1MNooZsD
	 s/PeyzNDLPCw3HlrESeagQdG2D1GscCUkOSSxiD5Xle1AiSYscjbdYoQvHfPhsOc1M
	 kDWRXJp6K9qp40XFtxQqSgpNeyLFyODgORVLwVk3KYiEXBoZDLIlHbBb2s/HAuEaMP
	 FbuuJVI3Dmi2iHu8zywfnKnbsY9txGagxwS9mAfE0V2itplv5AHA3I5+WSWa6aPWU5
	 sZSGfHdb5YxOg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOKPO-005Lao-PJ;
	Thu, 19 Dec 2024 17:33:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/4] arm64/sysreg: Convert *_EL12 accessors to Mapping
Date: Thu, 19 Dec 2024 17:33:49 +0000
Message-Id: <20241219173351.1123087-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219173351.1123087-1-maz@kernel.org>
References: <20241219173351.1123087-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093401_774346_963D510F 
X-CRM114-Status: UNSURE (   9.21  )
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

Perform a bulk convert of the remaining EL12 accessors to use the
Mapping qualifier, which makes things a bit clearer.

Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 64712e00787f9..899526e16a4cd 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2955,23 +2955,23 @@ Field	63:0	PhysicalOffset
 EndSysreg
 
 Sysreg	CPACR_EL12	3	5	1	0	2
-Fields	CPACR_ELx
+Mapping	CPACR_EL1
 EndSysreg
 
 Sysreg	ZCR_EL12	3	5	1	2	0
-Fields	ZCR_ELx
+Mapping	ZCR_EL1
 EndSysreg
 
 Sysreg	SMCR_EL12	3	5	1	2	6
-Fields	SMCR_ELx
+Mapping	SMCR_EL1
 EndSysreg
 
 Sysreg	GCSCR_EL12	3	5	2	5	0
-Fields	GCSCR_ELx
+Mapping	GCSCR_EL1
 EndSysreg
 
 Sysreg	GCSPR_EL12	3	5	2	5	1
-Fields	GCSPR_ELx
+Mapping	GCSPR_EL1
 EndSysreg
 
 Sysreg	FAR_EL12	3	5	6	0	0
@@ -2983,7 +2983,7 @@ Fields	MPAM1_ELx
 EndSysreg
 
 Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
-Fields	CONTEXTIDR_ELx
+Mapping	CONTEXTIDR_EL1
 EndSysreg
 
 SysregFields TTBRx_EL1
@@ -3088,7 +3088,7 @@ Fields	PIRx_ELx
 EndSysreg
 
 Sysreg	PIRE0_EL12	3	5	10	2	2
-Fields	PIRx_ELx
+Mapping	PIRE0_EL1
 EndSysreg
 
 Sysreg	PIRE0_EL2	3	4	10	2	2
@@ -3100,7 +3100,7 @@ Fields	PIRx_ELx
 EndSysreg
 
 Sysreg	PIR_EL12	3	5	10	2	3
-Fields	PIRx_ELx
+Mapping	PIR_EL1
 EndSysreg
 
 Sysreg	PIR_EL2		3	4	10	2	3
@@ -3120,7 +3120,7 @@ Fields	PIRx_ELx
 EndSysreg
 
 Sysreg	POR_EL12	3	5	10	2	4
-Fields	PIRx_ELx
+Mapping	POR_EL1
 EndSysreg
 
 Sysreg	S2POR_EL1	3	0	10	2	5
-- 
2.39.2


