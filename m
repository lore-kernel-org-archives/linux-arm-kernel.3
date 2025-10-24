Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IYs9ww2ceiurKm+FIqAzpXDFAmKEwAVl0WdAVV02wA=; b=Ovx8b8R3OEm3b8qlSDyTsWXkun
	nd2nGrQDSFhuAAd/CNhIBJneb7G0/4A4Pqgi2fMjaPn6dv2EYlcLvO8qBT38GrWTZ9HYTkVuxC5u9
	X84diGbeXinR93z8biBFtHYudsFrMbrWsP1uyPDe7j+r6R9oeaTwFnXSPGBUM9RH0JPSOxk5alwTc
	GmCZyLEYNOY2IumrehF1mOhCGOUqYl+RM2Jn/ChWYVpAGVzMZUiIIubhRq4s1uS6priE4oltoW8t3
	QRu8flaFcSi9TlvI8Bx9sAYJT/7L61mcHbaEZMYHGTF+fZjBeM1yh4N0Vy7B2w10oQi5QztwcVDq7
	4uVGIHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJY-00000009GKH-0UBy;
	Fri, 24 Oct 2025 11:50:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJT-00000009GI1-1irC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 11:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+IYs9ww2ceiurKm+FIqAzpXDFAmKEwAVl0WdAVV02wA=; b=K74+57ejDxTz/s8xWGPKRhFTbi
	VDbCHYH7cvHv98XbWxODQ6moiJhu26LgnRcTimaJLz8Pu0AFLsxDm9fBbteUdzjCZEyhVxDuEgo64
	EYHcZzxXGi/d3GHQq5Cq+dN0dzHHV6zXBnfme3oFVAureMQK6if2FtiECy1tKalbcmDfLagL5BUEY
	jLaD1h/TUIUpETLofxotaeHeeEVvyUnhp4uk32q+c5mW2vADKtaRh02P51msY8i2dgYVshnc8J1hq
	8Eb9BIYuS9RB/J3XHotylhyVFIoAfun+oDi2EWBrIsHRyQoFG7rr4GWq8TPMVrMaeCKxzQaZSrMOm
	dxb0N6QQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRk-00000002FSE-45nr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:55:04 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGJ8-0002FG-Nj; Fri, 24 Oct 2025 13:50:10 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:49:59 +0200
Subject: [PATCH v5 07/10] dt-bindings: net: altr,socfpga-stmmac: allow
 dma-coherent property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-7-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_115501_029036_753547D1 
X-CRM114-Status: UNSURE (   8.05  )
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

The DMA operations on the SoCFPGA stmmac can be dma-coherent. Add as
optional property.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index b53847a2d9536..c34f2ef0cf001 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -109,6 +109,9 @@ properties:
   txen-skew-ps:
     description: Skew control of TXC pad
 
+  dma-coherent:
+    description: Present if dma operations are coherent
+
   altr,emac-splitter:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.51.0


