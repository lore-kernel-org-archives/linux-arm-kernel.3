Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06406C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEqwKBbDa46aFmi+HxnS6vbLB2ycBFNNPLceTbIvEWI=; b=V4mvndYDa0S0GCSOMYnVFaK1Vh
	sG1l7tcDkejgP1F/qWcJFIj/qAW5+IR872rctlX1RaGOu5vC2nNDQ7Rn+7hLh7AtbNQp+tGvY+s9N
	kbJ+ck2dsvcBUeeTvybWzcSy2vNLdFLWoT8HslCpDXMy0Yc3K+7WRxgP/mX9eTx6v8ocdrLzTgrND
	1RLmwzM2VWiRgm+itVC3bZt8c08F5kbSPbHnQLANC/ZX7vWNwjM5lnvX+QdgmXWIS9ACCnV65sIaT
	ze7pTuAgNMNg8Co09I3OY8aC1UQ0Scs3l9e5wbtTXK2ydPOekyXhOXpPY4JhvtLu4LHx0w33jEl1z
	He33oRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcaF-00000002gRQ-35Gi;
	Mon, 10 Mar 2025 12:50:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC1-00000002bRA-1s7T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59A13A4593B;
	Mon, 10 Mar 2025 12:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ABAC4CEED;
	Mon, 10 Mar 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609512;
	bh=6fz678DdpbEyKk5wSM0u+w60K02rACokbNxzC9/iEPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E41RTzrz3asCGcZFQFBhl7+Dmemy7+kJSWK/26KRSTzeFa8WyNJjCXen15B2WTCCZ
	 sns00cP3HfN9keE5hQl8Tzs9agZukmsGsIuVtxDPQpMpRIEHiYymKnq82uTjGVQxpo
	 Ij8R2N0wdZ+VDOwr2hTdpgT67pieHaROwPtxKEMuqsG7SoubU045vYfR1UTf3OPjtZ
	 cESxVeCP4SVf0ys9mKc/SLHg6/SYWGEUFMZxPfOldJEUvfy9fVol4aw+3seJ2LS+Nu
	 Mjtvk7YUVEDnV0b32RmQfOOIxRH+JFua1ZIa5+pwt3P80id93WprcCvSl8VK22lUL4
	 8+SAwJfCTbW5g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcBy-00CAea-8t;
	Mon, 10 Mar 2025 12:25:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 02/23] arm64: sysreg: Update ID_AA64MMFR4_EL1 description
Date: Mon, 10 Mar 2025 12:24:44 +0000
Message-Id: <20250310122505.2857610-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052513_550368_DBC77ECD 
X-CRM114-Status: GOOD (  10.98  )
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

Resync the ID_AA64MMFR4_EL1 with the architectue description.

This results in:

- the new PoPS field
- the new NV2P1 value for the NV_frac field
- the new RMEGDI field
- the new SRMASK field

These fields have been generated from the reference JSON file.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8c4229b34840f..3598ddd84942d 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1944,12 +1944,21 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
-Res0	63:40
+Res0	63:48
+UnsignedEnum	47:44	SRMASK
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	43:40
 UnsignedEnum	39:36	E3DSE
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	35:28
+Res0	35:32
+UnsignedEnum	31:28	RMEGDI
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 SignedEnum	27:24	E2H0
 	0b0000	IMP
 	0b1110	NI_NV1
@@ -1958,6 +1967,7 @@ EndEnum
 UnsignedEnum	23:20	NV_frac
 	0b0000	NV_NV2
 	0b0001	NV2_ONLY
+	0b0010	NV2P1
 EndEnum
 UnsignedEnum	19:16	FGWTE3
 	0b0000	NI
@@ -1977,7 +1987,10 @@ SignedEnum	7:4	EIESB
 	0b0010	ToELx
 	0b1111	ANY
 EndEnum
-Res0	3:0
+UnsignedEnum	3:0	PoPS
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 EndSysreg
 
 Sysreg	SCTLR_EL1	3	0	1	0	0
-- 
2.39.2


