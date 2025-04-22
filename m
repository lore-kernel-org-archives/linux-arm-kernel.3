Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BFFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yWdt4q2nBEN+fekwxjBT5bMLNlT9eKdoTAr3aBX/enA=; b=HJKDz79PuPYL9EnhM5ZHfTq2V1
	4qH0EI2skhA2sDSbma4FLbIzF1Dc9GEHWCUIC/Kcna02JzCwNNybqE04uhPurSKX3NXvqx4qSHWKt
	P92L5nw+nQ1YaeJpn4j/HvsfbC14+Gjv7oqpO6dsVak94rwf7VY0zxiS43p/L0VOd+kntmFjqvasQ
	WSv6eN0qCKVZGA1frR6GNGxOEj/dl35vv4hGtdYkbBKTGwhR7iw7xcTM43TjnEq/qTRvcBOuI5IRw
	5TyDet7hh7LRP3g4e3OmIbdOJbqnYGMzH6Ev2+QGVjtFUcPWDNuocm2VlU8V5wbRNJ83VfQixpS1d
	GEGJ+n2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Eom-00000007Y86-1g4h;
	Tue, 22 Apr 2025 14:41:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DcP-00000007Hog-0r0h;
	Tue, 22 Apr 2025 13:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yWdt4q2nBEN+fekwxjBT5bMLNlT9eKdoTAr3aBX/enA=; b=VOMBqN4umKWNw/IPvOyw37RUUY
	joR211AfXTAYgAljTozWBv4K8Iba4TTN9Mqtm+KX95RzhtdzWjIfAxn0pbtppAIF28IAFu4s1YTGS
	rkSQQsoiq9pbSM2IK/9A+FMTSvBRwZI8EsVFCoEhQ8gQMM9Slnh80gLLlUhTNyK8lBVvT054djVwV
	Q9/DZLNNYL8zDaN9wV583Br1syHjSeSHv7XqEIYXkgSOXxeL6hKPgtgL27z2LHH8UharEGCmK/QVL
	tE5dTvPlXiIawwuQIFlCSPz9XtzRsgBu9Du3XuUXaXTztXwHBK3Yo4PDsZRs6sbCHtGrKc6g7ibce
	h83l52kQ==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7DcM-0000000BEOw-1Ni3;
	Tue, 22 Apr 2025 13:24:56 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 625AD40478;
	Tue, 22 Apr 2025 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yWdt4q2nBEN+fekwxjBT5bMLNlT9eKdoTAr3aBX/enA=;
	b=gMdVuls7LC4/Y3tfC0NwW0pDq+cSRNk9Y1walrBnMekNtF3+NqhfC0ojU+YTyPtcEL/F/p
	BI9QoHNMIKpoKSK1cVIyeq3fgjoFc8NYhIaI7QKG6FF7zw3sE0Xm/vkCnz4vp4/7Ti6WM0
	Vx7Nea8jAwyeNoFdvi+IhhfNnF06Lro=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 2C687801F5;
	Tue, 22 Apr 2025 13:24:49 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Date: Tue, 22 Apr 2025 15:24:23 +0200
Message-ID: <20250422132438.15735-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1ea57a51-b49c-45da-a7e8-a99325a7d903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_142454_551349_FD9CDF83 
X-CRM114-Status: UNSURE (   7.84  )
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

With this series i continue the mt7988/bananapi-r4 dts upstream work

changes in v4:
- changes based on review comments in v3 (mostly bindings)
- changed topmisc unit address to match reg

Daniel Golle (1):
  phy: mediatek: xsphy: support type switch by pericfg

Frank Wunderlich (7):
  dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
  arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
  dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
  dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
  dt-bindings: mfd: syscon: Add mt7988-topmisc
  arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
  arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/phy/mediatek,xsphy.yaml          |  16 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 400 +----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  36 ++
 drivers/phy/mediatek/phy-mtk-xsphy.c          |  85 +++-
 9 files changed, 563 insertions(+), 396 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

-- 
2.43.0


