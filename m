Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0295E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFkWnrlscGMyVXcRQE/gzR0O9GqEn/e/k8M3jQoAxfQ=; b=yJysPt1Cx/g1Esjs62S7MWvnls
	pZUkLtFbq+kbuazaxxLC/CXFPD6J9by3K2oCcIGklHcBCp73tSflaJMtgASEOIgNo5CQpbT+MD0OZ
	KiekVjkZzeFOxCsDgn41lOdISGFR1g5w40XB7jdmwlVNCxRMVUTCIKk17cURs5sCS/xY/iQYK4+Hi
	codj2Fkl6SIOdBFN5OAkcfdUKWcisqeMjBTTf7s8PnfaMT7PmcsElHGpihzPMnFbsshGVkcQdjOhb
	i7HRQi89NwssNJm5nKqL8MMId2PJETa6lcY6W6BIa4oacBxLBMp41kuAWde9wjH6CMSKbEeB0Rmq3
	b+39QImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxSe-0000000D0Ey-3qMZ;
	Thu, 09 Jan 2025 18:40:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxQH-0000000CzcX-1Sfz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736447905; x=1767983905;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=RWp3FTdHXsv0g7oH1Wf6zDIDMJuYWwCvt1vaU7Vp7Bo=;
  b=fG5xSU+EAt5BEJZeKGxk5Vrnd+ghKvrFQogbD0333kUoHopaUCB76tGw
   nlHuvuBtwanT9Taa0c5oGjqrT7yVDbVvB8ihbF2oFsb3plF16HTYRcdKK
   x+mbwvOsgQP7FYZnUe3sd3CQFVO9EsW5hDwW23drSp+ckROZFzXCj92D2
   9BZOOMaeYQCLJmRgJACnBnVxrCnG1R/cu2A/pgaHBC4t/DYmHKw/86zG6
   YxGq2+cRE/WTvh/dILNTHNHBi2W+qIjFb5RpLYl119pipHL7A0RwsovOj
   BBotG0Y3a95Xqk13+apU8KlbIJCyUqsxmJ4jAImuKAIOJytCqr5M0wM9b
   g==;
X-CSE-ConnectionGUID: lYxo9VQwQ0yequjZYTYLoQ==
X-CSE-MsgGUID: SjiN47tOSoGue7cLsXILMQ==
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36007557"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2025 11:38:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 Jan 2025 11:38:08 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 9 Jan 2025 11:38:06 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 9 Jan 2025 19:37:53 +0100
Subject: [PATCH net-next 1/6] net: sparx5: enable FDMA on lan969x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-sparx5-lan969x-switch-driver-5-v1-1-13d6d8451e63@microchip.com>
References: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
In-Reply-To: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
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
X-CRM114-CacheID: sfid-20250109_103825_450274_74FD7085 
X-CRM114-Status: GOOD (  12.80  )
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


