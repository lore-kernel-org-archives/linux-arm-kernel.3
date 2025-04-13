Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D5C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkS+vSuo1znIoysQeehovZJ1m0kqebSTrJLxr1xkdnM=; b=F45/IduU8caajllJA8q4dg6+qd
	4/s2vZmW2/fCbsLdghHHpzYAVV+KEVuct53TYlDxF846KB8VtTLPns7Ny6mE0N8Fhx/IeCf8BsZaY
	T7nLJ4PKjWrV2/CJ+j5Dg3gxnO7OMLWRskJd66mzzJYGb7hjMknHvSqHi/C8seqNJA34GJoXtjB60
	V4rANPeDBn+vI04dAVuUw9GF8pz58vUeKQMRVQ6u9SCllkGfE62pHT9N+etXDVH5s0MBi6IOjiIzW
	rQWNOt9KuI3Tj83hBI6Efwxmflm3WlzLJBNgmzYQAFsavPaNZAkNS/RmW3nNJfQCCArEAIthZieBd
	vESxHjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tCF-0000000GywX-3aE2;
	Sun, 13 Apr 2025 09:00:11 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tAM-0000000Gyl4-2UaW;
	Sun, 13 Apr 2025 08:58:16 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 108B65FC6A;
	Sun, 13 Apr 2025 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SkS+vSuo1znIoysQeehovZJ1m0kqebSTrJLxr1xkdnM=;
	b=cDGfs988LIIYqcjiBKSyw6TwXfDQDp1uPMMGUitip6CDKhA7ECg11X5UOhErtB/remUPCz
	3UnW6VKdgwOqndaB9+6KGu2jRN0BGd569DiE+0gDk1SwxQ6T6IAhABO/UQxA9+lMm1wDtI
	ZCZpacRkyp9eOA3WwXE7i3BsBOvg/6k=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id CA8EE4006C;
	Sun, 13 Apr 2025 08:58:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/5] Add mt7988 XS-PHY
Date: Sun, 13 Apr 2025 10:58:00 +0200
Message-ID: <20250413085806.8544-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 29a3ad43-8079-44b9-9f98-200054c44558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_015814_800522_EFCD9D05 
X-CRM114-Status: UNSURE (   8.19  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Mediatek XS-Phy is a high speed phy used for pcie and usb on mt7988 platform.

It requires a topmisc power controller to switch between USB and PCI mode.
This topmisc system controller is also used by ethernet-node which is not
upstreamed yet.
---
regading syscon-fallback...i know that it should be avoided ;)

based on these commits:

ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
5728c92ae112 ("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")

I tried to get it working without syscon by changing

instance->type_sw = syscon_node_to_regmap(args.np);
to
device_node_to_regmap()

then xsphy was probed sucessfully, but all pcie (not only the one with xsphy)
stopped working.

for ethernet its driver uses syscon_regmap_lookup_by_phandle which needs to
be patched in syscon driver to also use device_node_to_regmap instead of
syscon_node_to_regmap (with create=true). But have not tried this.

regarding the pcie issue when dropping the syscon compatible i would leave
this compatible, but send this patchset as RFC. Maybe anyone can solve this.

Daniel Golle (1):
  phy: mediatek: xsphy: support type switch by pericfg

Frank Wunderlich (4):
  dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
  dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
  dt-bindings: power: Add binding for MediaTek MT7988 topmisc power
    controller
  arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2

 .../bindings/phy/mediatek,xsphy.yaml          | 17 ++++
 .../power/mediatek,power-controller.yaml      | 35 +++++---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 39 +++++++++
 drivers/phy/mediatek/phy-mtk-xsphy.c          | 85 ++++++++++++++++++-
 4 files changed, 164 insertions(+), 12 deletions(-)

-- 
2.43.0


