Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C087DC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vavH7lvXqySuJa+hx0NcjRm6IStTczVgtkHsC8BjBGw=; b=TLUtqwE6Y1WOZl8yUEArPFlYyz
	Qsq4TMNwtW7NmusaNVxDEXDihmAG86H3I+Hq4ptDl1v4BZxdDuCdtg/0hgGw/m9aoUg7RF8FpbRBU
	cDComUhEJsb6er728szTkQID23Srbrnyx/2wdS2geVdZEHadqUQfZS4yplrKvjuFnqo+CI6Nr9p4H
	RKIJ8nBMPBrknXP3K5RoistZHfRc5LXHTtwk5Y4c7dxv0lW0rH5x6NyNcYMy3JGpVIpK0IZhUy6Le
	JmIL8b+7RMHdUZ+lEcDt7qxkYmaQcQdjxXvDNA3L9zP3ECeCOpFc1pnT8YxjWQW6yJOAb9SUQ0vIG
	gsuh4ZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERmp-00000009Jp4-2a79;
	Mon, 12 May 2025 11:57:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERjU-00000009J4c-2V4w;
	Mon, 12 May 2025 11:54:09 +0000
X-UUID: cdd90ff62f2711f08d385d50fb11b32d-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vavH7lvXqySuJa+hx0NcjRm6IStTczVgtkHsC8BjBGw=;
	b=RZyazV4/RyTPi/+5WH+QsjjRG0t6Fq77Pp683SyPVctZr6OfP978f0/nL2oVIDk6E9ZHtTNoix+UAbmkFeH+v9xzRxZ9p4UGMra/roJAx76iIBtj1seQzTgBe+v+efoGB7gkzT9GgUGSZoqIPe4n62B6ABDxP5kNPKFXMxGr/HI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e333c5cf-c9d6-49df-96c7-6a509b1ff9aa,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:289b6e51-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cdd90ff62f2711f08d385d50fb11b32d-20250512
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1825892669; Mon, 12 May 2025 04:54:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 12 May 2025 19:54:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 12 May 2025 19:54:00 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wenst@chromium.org>,
	<xavier.chang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>
Subject: [PATCH v3 0/3] Add mt8189 dts evalution board and Makefile
Date: Mon, 12 May 2025 19:53:47 +0800
Message-ID: <20250512115355.923342-1-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_045408_641152_2242E854 
X-CRM114-Status: GOOD (  11.43  )
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

We add basic chip support for Mediatek MT8189 on evalution board.

In this series, we also add dt-bindings document definition for MT8189.

This series is based on tag: next-20250509

Changs in v3:
 - Move ulposc and ulposc3 before cpu nodes.
 - Refactor cpu-map to a single cluster0.
 - Change cpu nodes name from medium core to big core.
 - Move psci before timer nodes.

Changs in v2:
 - Fix warning issues for make CHECK_DTBS=y
 - Add mediatek,uart.yaml document


Sirius Wang (3):
  dt-bindings: arm: Add compatible for MediaTek MT8189
  dt-bindings: serial: mediatek,uart: Add compatible for MT8189
  arm64: dts: mt8189: Add mt8189 dts evaluation board and Mafefile

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   |  20 +
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 427 ++++++++++++++++++
 5 files changed, 453 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi

-- 
2.45.2


