Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9159BC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKvgrOdZpLOOR7Do8qY+dt3WmoyXKmuAQydlk63pqCE=; b=elnfgOFK/HoBzqgKUmzQD6SbfX
	vCTxHXjddKs4GlAbTjzyV4o3nhGkNfdShitIJ66XUnomf0ai/F/LXP7DEWfcUr5bX0IL/i8oI6vwE
	N1b/JrEIZzh4hi5uDJZyiYfurKGbfzUVTkmZ/UokZ9U6tiRlJF2EBL8ghApzE6DaQOoaBjFxLStfB
	aSsMQHhbazeE1k1S6MZtEejAdFPvf0S416F+nFz5k3je5drXzB3rPxoOLSmT3w9VxQy9nsxZpAsRx
	5ZX1oWjTH+dQ9s896LQMzy8VWwQ2cbDSKpaDfsxeG+G8mQzYLLkrdNkdSxWm21A3dquX6r3qUCL/A
	OuJdXUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpG-0000000Dfor-1yZz;
	Tue, 06 May 2025 23:35:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOr-0000000CiH4-1x8e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8C42A4D6CF;
	Tue,  6 May 2025 16:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5386AC4CEF1;
	Tue,  6 May 2025 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549848;
	bh=7Vdiog1Yp+sWTxIrEPX+RwlsIaichWF0sK4N3/9NICs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MXdBocBa/gnLHPLZU+fccO0D0YgOs+tB1LOFdxt6PeFwxkObczXksGI7BhsYAMxQf
	 pIIfXbHjDLbcHyQh5tCsU+73iZFT7plYIZXsqyGrqHKAskn+iCs9RWXY1VUqpOjjVj
	 10ObiiB0VNcTAuJdp/spRT/3MI06duMyyltwhYZVNJw6Sko/O4K4nZbH1v8zgKgNgm
	 4bhEpcwOXirHEU8zf5GdALH1g1k2aJ8iVtBqzRQOvIZd3wKG8lKKHfufn9W4k78rHy
	 nXfRjLk5g3xNOCFDHMKiBTMLDoMInGm0kEJPIUp6yA/s2g1pVL+8flp5yuOUK623Xe
	 fyX92x4bawpKg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOo-00CJkN-Bx;
	Tue, 06 May 2025 17:44:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 02/43] arm64: sysreg: Update ID_AA64MMFR4_EL1 description
Date: Tue,  6 May 2025 17:43:07 +0100
Message-Id: <20250506164348.346001-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094409_564329_1FE9E22A 
X-CRM114-Status: GOOD (  11.14  )
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

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e5da8848b66b5..fce8328c7c00b 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1946,12 +1946,21 @@ EndEnum
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
@@ -1960,6 +1969,7 @@ EndEnum
 UnsignedEnum	23:20	NV_frac
 	0b0000	NV_NV2
 	0b0001	NV2_ONLY
+	0b0010	NV2P1
 EndEnum
 UnsignedEnum	19:16	FGWTE3
 	0b0000	NI
@@ -1979,7 +1989,10 @@ SignedEnum	7:4	EIESB
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


