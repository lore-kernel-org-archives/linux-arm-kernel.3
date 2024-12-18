Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D89E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tGUqKTNGimYSXlYBFy7wn1j68ogjpR2zlg1s0Wn30QQ=; b=l8AeNv360d6C2SToayPfFOD0Ii
	yxn6OVUgOQXTL5uM98BAzlHe3+IksnspaHTjx79jbnllgniQ0sq1F3t0FjHk0Sg4ImwicYF7zbNEF
	DRIHZD+SgZCwRGyvJWqZEnxMUM38IxcShtzkQEn/KsgtCtcdOXhRVsz7RWNXpailt/+9DURl9IssS
	s7gH4d7a7ncyi7LFFp9lAqjcXr4jpYGmO92E4NnBbRAz7ViiDadzv+TtMm46kY0vIT5NtScDKHaZ9
	c18VvjNrwzxMjjM3DWOWObkwpthCGrxRJbxVOf3VDRwO6BCK7maMsQ77pZ210/oxfF9FsgGQBffif
	eqY3gYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp5P-0000000FtCM-11kZ;
	Wed, 18 Dec 2024 08:07:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp3E-0000000Fsqu-3RSg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 08:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734509101; x=1766045101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qZBieEGoPvE0k3haQfSwJRuoNpJhZOeLhQPi82vbd60=;
  b=czeNueFVU9RZKNRZzUURCT6t6A/4CLzXrktRKHs8ls+WtBaCUjLhdiw/
   oFeEwk8dM3Kpfjk+JLgua89Vz4hiCOeAUPKY4zmHTT0dI8jSsQV613D7o
   4mtqy5SPJWq0v8WuV60e8Q2In52FlUeGvNEuu2iJpX1Zs4QWmM3hoZi+I
   Z3CCTCuI2duSS9OsqzV5jetHO7keda4kPs1ELNCtgMcXkHDjk4N56AhE7
   /9LaX+FNXUR6FA8zGvb0Hh3S/4X/IHPaoyerTMKtn6nb2Amc9Q/jd4qrv
   qML94Du64zrJeTbAeAKPnQZNhPT5z32bvk//EhV73FrozWfcZnVOsiqtj
   A==;
X-CSE-ConnectionGUID: xTeLUC79Q52BURM6x9sMBQ==
X-CSE-MsgGUID: xpQhf9t/R9+vDKVXZvKcSg==
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="266906839"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2024 01:04:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Dec 2024 01:04:40 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 18 Dec 2024 01:04:38 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/2] Add address/size properties to spi-controller nodes
Date: Wed, 18 Dec 2024 10:03:31 +0200
Message-ID: <20241218080333.2225-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_000500_863542_AB8EF117 
X-CRM114-Status: UNSURE (   7.04  )
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

This patch series adds common properties like address/size to spi-controller nodes.

Mihai Sain (2):
  ARM: dts: microchip: sam9x60: Add address/size to spi-controller nodes
  ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/microchip/sam9x7.dtsi  | 12 ++++++++++++
 2 files changed, 24 insertions(+)


base-commit: aef25be35d23ec768eed08bfcf7ca3cf9685bc28
-- 
2.47.1


