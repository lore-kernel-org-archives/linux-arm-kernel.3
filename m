Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BC5D185C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cUa8Pey1ViV5Y8IDQxtrszzjliKMhnSUcYYXpMeWshc=; b=iYBPbyjMDgi1VK0WkM5gAx5daW
	h1u68w1KwMjKZIszqsz12FOih2oZiT5VXIZjsIZHrR2RmsZz+eC0+pOy+xzuwk9A+JbYCbQ+wTyfm
	Yl524N3vjNzObNqEZ8bVSz4aM3GLEFcVBGqpGJeBgxXfTuAXWrcJ+QdJ71bwUEu9iQ0s+oOUUisZf
	e+YPm6mZsYFUaL1QVEPBgrHfAHEiwkKUVJa+9uFk0x/U7NMNW1Y7CSdZnyGOvif1qxGlneN6G4Vf/
	rZTl6Py1MnQ4qNt96bvo5muDTG5ELMOEGq4xR6Yac2rJ/xIqq9QJe0vwqz37astKjL5VJsXZ7FzAI
	nOpJWn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmn-0000000GmPN-37l7;
	Thu, 08 Jan 2026 11:02:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmi-0000000GmLJ-0nbZ;
	Thu, 08 Jan 2026 11:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767870148;
	bh=FjTO4MwoD/ainIr75jhsXy0/Wn1Tk9zoVoEa2EpUej8=;
	h=From:To:Cc:Subject:Date:From;
	b=KN/Svax+wbp5OAhy33jOr0ElKtk984BLo1gNmR4cKF54gXx5Eak697Hu74mPys1W9
	 5QudsZ/7M2ybsYjyRSBsNUNbnIInSUQ4x3pBdyEAawiL/InXMYu7aQdTpsQZTLKeyJ
	 KtDYsaPWRh3SY5QSnmoYLEi3+X8tChbg0Rs9R6C0H9D3xaLQRazeBBa+4nePYG1o+3
	 U8lcxtrA91Zws9x00bSx3fyIU/7NI0nvCcSqiP8NlKuAn+VUxTOrwVIGx+153t82bo
	 Xtl65Ay47nPNPGOMM6ZLT9J2zvnpfwP4ozTG8rT/mmLmnEYg0SRS+PNPxcvHu2nRar
	 XzZFzOOboUipQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDDC317E0DC0;
	Thu,  8 Jan 2026 12:02:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/4] Fixes for EIP97/EIP197 binding and devicetrees
Date: Thu,  8 Jan 2026 12:02:19 +0100
Message-ID: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030232_397634_60C8243D 
X-CRM114-Status: UNSURE (   7.06  )
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

This series adds SoC compatibles to the EIP97/EIP197 binding, and also
fixes all of the devicetrees to actually declare those in their nodes.

The only platforms using this binding are Marvell and MediaTek.

AngeloGioacchino Del Regno (4):
  dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
  dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
  arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto
  arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto

 .../bindings/crypto/inside-secure,safexcel.yaml        | 10 ++++++++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi           |  3 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi          |  3 ++-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi              |  2 +-
 4 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.52.0


