Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF9D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSyxGudo4TfI2MrYqbdQ7V6s20Yzkj/CTAqlDgFZyfI=; b=dMsMixTs5LAkVWeNCffH+BOmUL
	EtN9qzco50sGVH+ZV5pIQFczk42a2G6kddRZkU82lnhf2s5BO53HZxQurdNliTWePigvSI7AEMLOR
	dsP8MxdHYGcFJqT38A//p5mGpH9QyqC74g0XYG5vAsEHLHRluDxSCF7huAgTUR4wJJ7eRSqnXrBgv
	PHY+a6JJr9S/wJ7ZkpcFSMn8gTqRPvVoUH5LDLB6DBspXvH7ZTcFZ5nvyNoXK3NS85rDHXLhUA933
	Fhn9NupDeDr7woxcqgDCJ57QBZ/KGcw/XmAjKKbClvsLHjeQKBs8ntSNYlOWTTrjtc/lNVweHNLnW
	/oHSO0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNBV-0000000COWU-2fq5;
	Thu, 15 Jan 2026 13:14:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNBT-0000000COVa-2Xq3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:14:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2CB1601B2;
	Thu, 15 Jan 2026 13:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD4DC16AAE;
	Thu, 15 Jan 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768482882;
	bh=FX7UALIJ02YDk/RVkAgS2vLE+EOriIUhy1KqEypqK/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DToHEBzUwASaQ+P+1vGn+Vnl7oCYyzozzctZdLZkBUOKu1IZZ2XbAZzhFKBj2NHAr
	 BGiQhqPuZRXtM37XDBJsXF9HD/GWLQuMA1onx5Q8e+s4fqZYqXVTRQ2dQjQjDX5GiC
	 bBIWZoLoM6WFrot/DGVr6KGpxdkrO4c8lKftDXLQKD1qUlILfWJYNRc1V4klq+CLx4
	 AVdkLZIQOpXYnGS0ClY0PmoaXh0gWqM1OaROW+5D/U2LPQ4a++pWxQ9+sap9BuO4OH
	 6CuJYvwNPzY/DJC7lRsqPNj+wS9AR44Y3K9/YAZ1ft5hlI7vhrvOEyMaZTM+snqR8i
	 eU3QveMFEYmiw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Udit Kumar <u-kumar1@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] arm64: dts: ti: sa67: fix CMA node
Date: Thu, 15 Jan 2026 14:14:18 +0100
Message-ID: <20260115131431.1521102-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115131431.1521102-1-mwalle@kernel.org>
References: <20260115131431.1521102-1-mwalle@kernel.org>
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

Fix the size of the CMA node by making it a 64bit size. This was
probably a copy&paste mistake. Also drop the unneeded alignment.

Fixes: 1c3c4df06f9d ("arm64: dts: ti: Add support for Kontron SMARC-sAM67")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index bfcbecd8ef33..db59ec4e4106 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -85,8 +85,7 @@ reserved_memory: reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
-			size = <0x10000000>;
-			alignment = <0x2000>;
+			size = <0x0 0x10000000>;
 			linux,cma-default;
 		};
 
-- 
2.47.3


