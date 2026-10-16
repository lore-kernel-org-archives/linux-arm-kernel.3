Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ABCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eA1Bhd/Xb+LpW3/jwkYBUSYVO6nQGoBeNGE5Gx0OvK4=; b=F9p9oZCprh7Zsg8KUiHcRZp8i3
	Gu/idCb9/ZeRK++FHZii+XS8wRGI6j4GDO9cevAaTtT1l2qZ/LqWuc7rHZovoP85/ZxqPN2U+lpID
	TLj5c1HgMEOI276GlXz0e3jLk8mNpK97ZmHS46U9HYFhK7zyTCo8WxyL+zMYsAgsPyz6PIseYz1ea
	YIHDlgt813kqbJCtvG2q0z23teO+YPVV2vsMO1B2qrcybAh7pNrqLAX5fbtXH9ehGFy5EODhsrOD0
	QKMqjqPWL7no+5hf3kDVX/rmQ3Bm0Nnfq7+56aoW7ZEJMUgz0XDKjgnJVmCW1UGH2drmpVQq+AN7A
	WYnFxXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHngr-00000003uJz-2w40;
	Fri, 16 Oct 2026 19:34:05 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHngo-00000003uJE-1sut
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:34:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 531F1105B53;
	Fri, 16 Oct 2026 21:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792179231; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=eA1Bhd/Xb+LpW3/jwkYBUSYVO6nQGoBeNGE5Gx0OvK4=;
	b=KmKcW7WITYcPBPo+5Ad0ac9Hr1oGhvkv+4Prnn2AViB/jsyv5tQoBYAMilSusmNF8EGh1x
	XpWhMKEo4DVJahSJOf8RAFwUs7gLxwQ+m9Qzis3k+Lpay5fsM6Zx5kJ8Mfy8O8SR1bId68
	hcpxTOc7BirR0r/ss7gC/BCxWEFeFpXDSylpY++tJqnNKtuNXjm6Ic11f/Xy/P42iLbgCU
	uE3SWYtbagPWfUwlYaZXVkWyJhRzpcKn7WE/xrnskoiTlFccsYyphGujXgqPDbXVH6APY1
	e1NLMUHMpXEvmKy1ZzRAZY+8FRHCs/lPMyg5jf3K202WClN6RB2Z1aonL6oVAw==
From: Marek Vasut <marex@nabladev.com>
To: netdev@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [net-next,PATCH 1/2] dt-bindings: net: enetc-mdio: Document optional MDC clock
Date: Fri, 16 Oct 2026 21:32:00 +0200
Message-ID: <20261016193344.115518-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_123402_661169_538E652D 
X-CRM114-Status: UNSURE (   8.47  )
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

Document clock from which the MDIO MDC clock are derived from.
While those clock are always present in every SoC, they are not
described in legacy DTs, make them optional. The clock-frequency
DT property is not described here, it is already part of mdio.yaml .

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Clark Wang <xiaoning.wang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh@kernel.org>
Cc: UNGLinuxDriver@microchip.com
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: netdev@vger.kernel.org
---
 Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml b/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml
index 71c43ece82954..708d410187baa 100644
--- a/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,enetc-mdio.yaml
@@ -31,6 +31,11 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: A reference to the input clock of the controller
+          from which the MDC frequency is derived.
+
 required:
   - compatible
   - reg
-- 
2.53.0


