Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B452CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLQVl0w3jGx0lkR2eg66egF+mkrquOVri9rNUT7zMUM=; b=DsTVKj5lfwXbb6BjZIVvP+88kj
	n4m52VDLeGrhf8zHT/ZnDvU3/EUGPB+1vKkQ01ZmWWgFos7leBWfcfRJg6+mmf2zA2fr/1yTlrkTB
	4e21Mq++/BCID7BJwyYjyqjq/jGEIZ6dCF4DRIWGzHwgU89kiZW/U0xOpHa/AYJB9fp3IeQhjfbWh
	931YSvKY+BySrYePrqmTqZLD9K+idZgwrF11oD/gHOwHxUlJ7W0jcozJSk5JD5ra1v2p9Xo2C5Ki5
	b17lVacQ2zzs3byAmQLtM6/sYE2yCo+BJwT1EqOoY0/D57wVmKBbe+T5w8wXLhwwFYjL9Lo6CbRP6
	ANqbJukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJX-00000009GJt-3OFZ;
	Fri, 24 Oct 2025 11:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJS-00000009GH9-1mjR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 11:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gLQVl0w3jGx0lkR2eg66egF+mkrquOVri9rNUT7zMUM=; b=aRkLklBh41YhsKkMcGs9uK/Vkc
	3wHzK//pLUowvyiTGiCF8ThYhfE/HsKk0+5BbP1uHb1HBVnNiHj3KTHTF65lPYFS+pCkVedfQCNeg
	2SM4ceCCLTjEOQx9YTqRMxcAf8opva49+/6135J8OaHlqVDqZAvneiXx9LlyfUFcJxwctCJqEadsc
	mWciDjVaIZDEm3+vIfL3ZUebha5a2pQ/WhTeTvlWr1qmzT5l9KNQesLfS8i/hCg8iRNM8HAbeRuSb
	6ONAYslZu3N7F5sJQEn0heCl6pObgiLtiA19y6IdZEpG1SJNGJzrAR4Q36gcH2GpL7/+LIh1AbCP9
	kT8t1Aeg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRk-00000002FSD-3P2z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:55:03 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGJ7-0002FG-20; Fri, 24 Oct 2025 13:50:09 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:49:57 +0200
Subject: [PATCH v5 05/10] dt-bindings: net: altr,socfpga-stmmac: add
 generic dwxgmac compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-5-4c4a51159eeb@pengutronix.de>
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
X-CRM114-CacheID: sfid-20251024_115500_992943_13733476 
X-CRM114-Status: UNSURE (   8.81  )
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

Add the more generic "snps,dwxgmac" compatible to the list of
compatibles for the agilex5.

The snps,dwmac binding explicitly uses the "snps,dwxgmac-2.10",
"snps,dwxgmac" combination as example; the stmmac driver only checks on
dwmac and dwxgmac compatibles to decide what kind of gmac it is working
with.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1a..b53847a2d9536 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - const: altr,socfpga-stmmac-agilex5
           - const: snps,dwxgmac-2.10
+          - const: snps,dwxgmac
 
   clocks:
     minItems: 1

-- 
2.51.0


