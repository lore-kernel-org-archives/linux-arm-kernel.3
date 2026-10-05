Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8330CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2pIgFiEsXU056asN4AfqubB2EFM4zS7a5OgX9F1Kac=; b=kntJZXN+SA0tOIn+Ze4y9ExBjK
	kFJME/DDg0gmfFJrijq9qsx++6+Znoo3Xe2MFQwRXmytvnS93Imfx1ApmTKb6dIrGpx7J2KoPoHJe
	uCCsOY6/03JxSo/mLYmcmlAMj2Df6/jqxLniw7YByx0u/phLxr5VkhsRKeE7b9bLVd2cHli15NfuQ
	h6PLo155ai9LavbB/veJqhBsr0rHrb9xq/C04X/VUBD8c6I570bSBxPCKiv6nE2NFc85yzDH/R58s
	mKPW2LMcSV3gzzsO5YPXOj+lbQaZBInUMlvCn4CYVmLCsZVID4eivbejs7Xd8JfIidt3lZI6ZOQlI
	EHq8vftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpsS-0000000HApy-4AbY;
	Mon, 05 Oct 2026 21:05:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpsR-0000000HApo-21ne
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 21:05:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79CD7402AE;
	Mon,  5 Oct 2026 21:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323311F000FF;
	Mon,  5 Oct 2026 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791234336;
	bh=w2pIgFiEsXU056asN4AfqubB2EFM4zS7a5OgX9F1Kac=;
	h=From:To:Cc:Subject:Date;
	b=bFBMVAKTvhIR2n3To4WWdXuc9KtDdFGha11HRSsirugMVFeHsODpkBYxxUkcbZ6Ap
	 jR7k7gKTGezDUKdDDHiCuHDSffJBWPHDigfRJ/k1udQjSvEydA/jCj/AWJLh3xc0d4
	 hxbH1QG42KGyST/xRlpqkDKMuOVUae85+32BnT878E+TlcUBONBoUyTvaVX2mQphgR
	 +zCJlGztuhKsHiuLQ8mcJM1yv/zo/OZz/spgKt+dSFytpcaE7y8lwoPlZrytm1NtAO
	 uVBA+rmaikFSd0ZWPJfEVOh8dyP89JqJyugbrf80eD61+WWyoQr5rKAob3PS7ncO6s
	 tHo6MGMsi3K/w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
Date: Mon,  5 Oct 2026 16:05:06 -0500
Message-ID: <20261005210506.2118052-2-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Arm Corstone1000-A320 has a GICv4 which means the redistributor
region should be 4x256KB rather than 512KB. This issue didn't become
apparent as SMP was disabled as a work-around in early versions of the
FVP.

Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Hi, this still hasn't been applied.

v2:
 - No changes, rebase on v7.3-rc1
---
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
index f0937914350c..f895a024fc92 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
@@ -73,7 +73,7 @@ gic: interrupt-controller@1c000000 {
 		#size-cells = <1>;
 		interrupt-controller;
 		reg = <0x1c000000 0x10000>,
-		      <0x1c040000 0x80000>;
+		      <0x1c040000 0x100000>;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-- 
2.53.0


