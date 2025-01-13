Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC92C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFkWnrlscGMyVXcRQE/gzR0O9GqEn/e/k8M3jQoAxfQ=; b=MA3b0EutzNENd/mdQxuey+/Epf
	47jZUN5Q5JFNCL2EUo+rashhyvShjcfPCNO8cPzmP/M1RPUZ9lwCTUN9zqNAKnSYnnvUQN4fN4EU+
	cgdBOTjvvXq+2BVwrwyUB1wjOLsMN3tK7RSTnqKrlPJGp8khvTbUHIwqPWnvaWmhjm0FxQ2lWyGRu
	GcePfPYOWNnj4tWmljdFQLQLFK1WdYu29foBaGzXed33ks0HXH3+piDRKktLGK+wj65yPaE2vISA6
	ltrGyF3sD/8H4+6OC0oT3dYVlU13DzourdvIkOt7tl+JP4C6LoJp01LsPfRKm3Ff5Dc2RSdEW7AFG
	k20R87tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQG2-00000006Q2w-298D;
	Mon, 13 Jan 2025 19:37:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQEk-00000006PY6-3mUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736796994; x=1768332994;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=RWp3FTdHXsv0g7oH1Wf6zDIDMJuYWwCvt1vaU7Vp7Bo=;
  b=2PXNJPTMslHhfCEeLOhTYsjQbzTj2IuS8a2Yc79ASox4ydMTVrV21iHz
   swBCNMgNnr9etALHTFgRv61/gCdIrXojHpTioyf6mhOpBjeZE4LYJk4Pv
   Mkb4PGsloQOQsUhEeDfU84jp2O9jGXVOuK8Eo8zj+Hs/m1IFngEsvwHgx
   TbGwdmYqNCls0oB0okI1PZvNfqPqRERt8bbhLgfS9TNFP/PB0XQ4VuzUv
   7p72TE8U87NrtTN1vqppbuPW+MolMZaG9JKwSl3zuV8HNaj+NZQFHO5KO
   KLB6jkqKXcUxdTG+8No8UiJ+qpAPX0hYDG+u2RGgTv3uyf2eOKPVPfo+b
   Q==;
X-CSE-ConnectionGUID: Fja7+Z77S3CaoQEzhBU3bA==
X-CSE-MsgGUID: VaI5AklMQXSpnmIMZ0+v6g==
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="203970673"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2025 12:36:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 Jan 2025 12:36:22 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 13 Jan 2025 12:36:19 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 13 Jan 2025 20:36:05 +0100
Subject: [PATCH net-next v2 1/5] net: sparx5: enable FDMA on lan969x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sparx5-lan969x-switch-driver-5-v2-1-c468f02fd623@microchip.com>
References: <20250113-sparx5-lan969x-switch-driver-5-v2-0-c468f02fd623@microchip.com>
In-Reply-To: <20250113-sparx5-lan969x-switch-driver-5-v2-0-c468f02fd623@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113635_115196_13B761E9 
X-CRM114-Status: GOOD (  13.01  )
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

In a previous series, we made sure that FDMA was not initialized and
started on lan969x. Now that we are going to support it, undo that
change. In addition, make sure the chip ID check is only applicable on
Sparx5, as this is a check that is only relevant on this platform.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index e68277c38adc..340fedd1d897 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -784,8 +784,9 @@ static int sparx5_start(struct sparx5 *sparx5)
 
 	/* Start Frame DMA with fallback to register based INJ/XTR */
 	err = -ENXIO;
-	if (sparx5->fdma_irq >= 0 && is_sparx5(sparx5)) {
-		if (GCB_CHIP_ID_REV_ID_GET(sparx5->chip_id) > 0)
+	if (sparx5->fdma_irq >= 0) {
+		if (GCB_CHIP_ID_REV_ID_GET(sparx5->chip_id) > 0 ||
+		    !is_sparx5(sparx5))
 			err = devm_request_irq(sparx5->dev,
 					       sparx5->fdma_irq,
 					       sparx5_fdma_handler,

-- 
2.34.1


