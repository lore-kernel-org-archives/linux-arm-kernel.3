Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51713E73153
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/9JPzPXycdMx83CaeWNfv6UAe9hVcm0NBgWSL+jhuA=; b=EsJ43ARZprtFpRNsPS5oupGVvK
	rZKtTQhI8D/JkztVc4LwWwFzpmNKoomQPEZcjBwt0GMnidW8pia8GwtN2x3wxFLz5NPB3CepDiZdC
	cm9X8ahFodvNYXqKEbaPwlzefMoMX5XN1RM/3a3tYCrGvPZ46hzgtZebMs8LDW5waB8wBE1EXHSJZ
	wgqDS39k/T0svIIKmwFBi7ZhjwtifufLfdx5Pk4NheSzHXujvIyMDWt0eZfiOHT4LxhreElitQiis
	fWKhsTEndL0cbPBkzgDvx9JMk27zXHRJdParjyIPjurOusXQbaLatvUQ48z8iRyYAxrROuMd/aoHw
	FRED0qFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMz-00000004qAf-1w6s;
	Mon, 02 Feb 2026 10:41:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMw-00000004q8i-3vac
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770028882; x=1801564882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2uvh5GR04a5ws4bAhWTfW3RAkctWft0/DaS7gLhvCZI=;
  b=2AR0VA74366CN36hZ3Zv/yNDaokLikaOpkxz0UMG2gIalBO57dPlRQys
   VJHkb4NtHCTwPkj2HASZ4H81ugmk6y7fKb2ETBZER5SdW/uwiSGYPe57Y
   jdq0MvqmoZ+tXrlW74Z8g2COEGPGMgv2VWD3g5ZfBBKFNCL6x2UFrV52l
   CU4Y16OUPwWlpVi5uRswyJxKWPofjftTS3t0BDE+/vk+GH9I1+aH3U87Y
   ft1u/yAWhkOI2EaNLcJYemLrTroNLJmQxMxMOTb3ePJipzFWhYNqnuCOv
   VX7cYElAR45BnV8fgU/D9uMvQep81tuqBQ+MZCGopjE9zeQoG71nLRMpD
   A==;
X-CSE-ConnectionGUID: 7oiJFARpQRyJAEDPNcfsaA==
X-CSE-MsgGUID: 53i4fbhYR6CsWbCdFGpabw==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="59959608"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 03:41:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Feb 2026 03:40:58 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:53 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 5/5] ARM: dts: microchip: sam9x7: Update the tsu_clk to use the generic clock with ID 24
Date: Mon, 2 Feb 2026 12:40:25 +0200
Message-ID: <20260202104025.3781-6-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202104025.3781-1-mihai.sain@microchip.com>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_024122_978149_731C8EC1 
X-CRM114-Status: GOOD (  10.21  )
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

Update the tsu_clk to use the generic clock with ID 24 instead
of ID 67.

[root@SAM9X75 ~]$ cat /sys/kernel/debug/clk/clk_summary | grep gmac

gmac_gclk      1       1        1        266666666   0          0     50000      Y         f802c000.ethernet           tsu_clk
                                                                                           f802c000.ethernet           tsu_clk
gmac_clk       2       2        0        266666666   0          0     50000      Y         f802c000.ethernet           hclk
                                                                                           f802c000.ethernet           pclk

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index da94865c57e9..a42716e18da3 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -990,9 +990,9 @@ gmac: ethernet@f802c000 {
 				     <62 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 3 */
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>;
 			clock-names = "hclk", "pclk", "tsu_clk";
-			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
+			assigned-clocks = <&pmc PMC_TYPE_GCK 24>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
 		};
-- 
2.52.0


