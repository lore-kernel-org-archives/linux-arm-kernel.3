Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967EDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XgRhQWiUnVqir0rWcp6/AsP1vv/Xbsr5kkKMHaXTsQk=; b=QwQt+YUijiNFQcaqyKmj/YXwIt
	E1douKLfq4N6Ak4ixmEynfEOTnGrbGrbFK5gUCRgpZCW+66riaEEBWCuk2GYWw+/cfefIEhjS9sN9
	dYIIr1aUinnwkFWbJGyhwyE4TXMCvWOb5ROZA90dqpg/pz75KeiUSa+TgCvAklOQDxLiWtMfhwRBo
	4I/j0yMkjLUGege9Q1MSdBR3JGwtap4EYn6DG6ui9ShU6PPntDvWOpOeVpMhsMCqqQl52K8RY0hrV
	DwhA+OAzMmWLserdJm3I5/HnhJw1zLzDhMVwNppC308ZgUFDpZm/SG7qs/P28YFeDDChubBUaoVUs
	g0bGqvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTyU-00000006yoH-2r7b;
	Tue, 17 Jun 2025 10:55:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTql-00000006xd7-3vFi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 10:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750157252; x=1781693252;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MWqDIdWNCF7eOdgs4SOkDxYmhHds6r/EiSOKhZbHd9E=;
  b=gHqAWjx1+LXmZ8/wXJwO6imdvJamz7D2A604RxYzYQwgrksBTkurNeZe
   wLt5Vi5uPoBBj32owo11rzLzp+YUXGCoLzn3PTOCD79fRciapvKY+vwoy
   ityOxDDMS0s2Jxokv2YYwxgy+J9XBg2rx46FytwukYlBrvvXuTASfTOa9
   OU8ZRtPc6knhfkYgoluiF0l3wZv+bVvft7F8Par+azD3QGEL772hUxTlj
   J0CTKvFEcA3jq+hhxMjZ2FBtR2GQHzlQUfmV/2/3z8Yol1sO1Lz4gvu9b
   JHsNhoYerCEhOlnGIaMAoX50YXM46BYumie+vFjqVEL8DpAcN1HBV8Jsx
   g==;
X-CSE-ConnectionGUID: NlLJIgKaS1e8ItqRhu+KEg==
X-CSE-MsgGUID: ohbEyHi6T96aDb7svZRyfA==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="274279560"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 03:47:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 03:47:09 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 03:47:07 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/2] Add cache configuration for Microchip SAMA7D and SAMA7G MPUs
Date: Tue, 17 Jun 2025 13:47:01 +0300
Message-ID: <20250617104703.45395-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_034732_193484_0B64C9CD 
X-CRM114-Status: UNSURE (   6.24  )
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

This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
The cache configuration is described in datasheet chapter 15.2.

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)


base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
-- 
2.49.0


