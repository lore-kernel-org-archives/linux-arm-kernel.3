Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713FBFA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dNKx9N1uuZ87KLeMwjnruL9uVGluo1yUq50Z8XjtsYs=; b=Br43bAk6BhudsgE1zuY2WJS6Li
	mHNwhH9yImFKW1LmOGJceWo7epAO5SCo0bXSKgC0GxxqJjs/B8SnZnsAVIRbmF24l1DSe2dUI4tBR
	cNnGK8MbjwApfjXFv2p7YVRWTVykVTdmLBEV0Ypx/ldP0NmzfKanxXlSBKftuOGuek3fwmNv6BR4k
	UATEZZNRWWBra1O/N5eUq7rXxXMtibclEkFEzzJnshykZiWF5dRFk0zqLWfvJlwcTm3BboAnVEKG8
	brCsbLo8D+HctNygOGfQnZsWqFkprhlSi3Q8d2EAvs+Q0T1E+Q+WW/LHf87An2b6K3eRN3X1YtVNJ
	07oGWWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXB-00000008Weq-1svV;
	Fri, 02 Jan 2026 17:01:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiX8-00000008Wds-1R41
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767373310; x=1798909310;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t3PcIvP1bEc49Jqd/h18j6QKB31/UewEwIs7h8/S3Ro=;
  b=DWteqf+PPAS7LRG7YtAjA0ezhqDMDKbbuEFLhBrOUQyPYiPKEK9ctVWP
   tfofDTRZ+xosDI4KyJ+lmXBVsQEV7y+Jposb9GrRBKQMUoUxXhfzDTODO
   jiSPlPbx6LCQQjBWWDfcTdhXNe03vUT6W3aeKawYrRcivT8yY/HaMFOMF
   ppc0P8SapUDGcl9rwHk31Nj9ftWspOYi75dPutnN9wxDwKFmKtRHtU8/D
   9mEXi06/FU1cer/F7hPZmOzXEs+Bh/U5Q8q5E4kFCgL5D0+TxOY2Msqjp
   vWnLeXioWlpDwvVt2s9Xi0r+Pq0tPA/61/VbsZhPtYGUr62bhWeX38IrU
   A==;
X-CSE-ConnectionGUID: dCrVUlstT/WCgDlJ76zoeQ==
X-CSE-MsgGUID: si3s1oQ4Q1OYb9j53Tc6EA==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="58167743"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 10:01:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 2 Jan 2026 10:01:35 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 2 Jan 2026 10:01:33 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 0/5] ARM: dts: microchip: sama7d65: flexcom nodes upgrade
Date: Fri, 2 Jan 2026 18:01:29 +0100
Message-ID: <20260102170135.70717-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090150_595612_1E8BD673 
X-CRM114-Status: UNSURE (   8.96  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

This series collects some additions and fixes for flexcom nodes on the sama7d65
platform. It enables access to all usart, spi and i2c controllers of this SoC.

Hari Prasath Gujulan Elango (1):
  ARM: dts: microchip: sama7d65: fix the ranges property for flx9

Nicolas Ferre (4):
  ARM: dts: microchip: sama7d65: fix size-cells property for i2c3
  ARM: dts: microchip: sama7d65: add dma properties to usart6
  ARM: dts: microchip: sama7d65: add fifo-size to usart
  ARM: dts: microchip: sama7d65: add missing flexcom nodes

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 283 +++++++++++++++++++++-
 1 file changed, 281 insertions(+), 2 deletions(-)

-- 
2.43.0


