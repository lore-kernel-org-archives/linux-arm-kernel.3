Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C71C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlsQlCfHIq8vz2iy0CiSylKrrpSDs+IY+o+lQyf3C0k=; b=K+kY9LebwMcGmL7boe2MMw1bIU
	v22woxbSo5v/QJCJfQ5j3za2UeCfBaPsMNsJXX7dNKvJQ38RV/WMXsbfyn1NOa2aBn+fvWqYFoQuL
	+qok2bMaacI7OEZ25TJXOHOKT7/rp/SWQzcpQa9n2As+/XW77t7Gql5ZccJ69FVpTwQZzul/pZl4J
	lcXXGp4KnzcMjGUUiLExTDBZDalAwmpMuz3rb5RZhZN5ooJGPyPVbBimfpTltROwltjBO/eHbx1SF
	vNCEV66cL0WuTjBs3SbfIsmhlWWyDC47IjPCFvVMFJ2et8Ole09LkYpEunWKXRDfBhBbS52akCAj/
	UVylCGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBZd-00000007b2q-05BB;
	Tue, 21 Jan 2025 10:33:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBWx-00000007aJ6-256R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455447; x=1768991447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tlsQlCfHIq8vz2iy0CiSylKrrpSDs+IY+o+lQyf3C0k=;
  b=UPptdSo7iPuyGyInfRLwPnKMdU+tU2WP6hPOAo9Wl9Z79N1gd/erk3v+
   3REhQnGCh1ihhOOogdUNZ5kKROErA1AzVtxhVb9E7RNiGuYQk54uldHE/
   f14O1Xw1WmtHP8zztX5cQbFIX+Sc9GuMulgaMTLP4puzzZBC/ZvdYKrr7
   SUC24lSS1H8HZGzGyMDS3dfUyW+fLkDSf2vMlcb8wZlo5yOX69IzTJBtd
   A8LaPgABrncVjqqGCP5INQsGS+U0x2zB2L4h5GGQbA+0OGDxmK4kplVge
   fHSV+N8RYyfFI4bXBe9LvBMywinfQwRyj4GDDcj73XKo+CCdSE6iB7meZ
   Q==;
X-CSE-ConnectionGUID: r9WjoSbqRruXpBNY16awEQ==
X-CSE-MsgGUID: 727sMbwzTsy9F+LICVegPg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196369"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:46 +0100
X-CheckPoint: {678F7756-3E-3C670366-E45AD810}
X-MAIL-CPID: FF8A12664048BA2D1665EDA16725E622_4
X-Control-Analysis: str=0001.0A682F22.678F7757.0010,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E97541636B1;
	Tue, 21 Jan 2025 11:30:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlsQlCfHIq8vz2iy0CiSylKrrpSDs+IY+o+lQyf3C0k=;
	b=qAeQKRccwtvxt/kwm26hatik7fnK7x3FQgE4C4/d+bmmi+3LYMH9exhrwH3nCbs4Aav82F
	WFI76tRFq+4DpTvd4li9pWvn43SDkWt/MzejPAPy+UthW4AcZnPNpNdBDrY7b/NWyhYUkG
	L0pE6s0ng5UE6x4ErL97Hiqa1X5OijH9Ey4NqifrPGsdohNuVBsiZAs/AfGSVu8lqgapLo
	CfW9LbSiDSV26uRc97JP7UXAd8l1wXaN7DL4j9TQOxwaaV0XDZ9qmaV+l+prfMgXOXmk4z
	bA7rSUFpHR0SckKlUOa8nY18GUaQe0BMkjNhVFTvPxNhwGJU6CTO+59/B90POA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: freescale: tqma8mq: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:23 +0100
Message-Id: <20250121103026.1404856-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023047_841922_9A5ECE11 
X-CRM114-Status: GOOD (  10.18  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
index 01e5092e4c40a..c92001c80f114 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
@@ -254,6 +254,7 @@ flash0: flash@0 {
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&nvcc_1v8_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1


