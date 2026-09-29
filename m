Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF2C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukhdfHyooHk8uiIysY2W1PAtOO+m4p47/3kwBKFwiMQ=; b=r4Jl48uXUMWr73G2qE4/wV5wCo
	BGEi/oLVuDInkShQnE8YV+K//+hJFutTS8CXeoN6LpknkuuqYIDS8qMZ9mWGd3rZVB0v8M4fOZRIa
	W4BVNJL0FkCwh8I74JyCCZ9fbyTwQwiQiGT8aOB/UoOQNXQafWyROAWQoA8pxvLjhZH6PVnAnSMoz
	ghQ1/B0Z2nsJwCN+U9yIGXla0vAxW4O/mRTDUs6RMs2/qmGvRFWF4/T0m/fDBytWp0DkPGOmH+z/m
	QkjmCyEAF0vq0in30s5WATmxEzVasPQkkR5BLXbMzhySINkS4CaRH8flQdCZH/iWXad0EUmM25Hjw
	zuQoBR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSG-00000002U0h-0ITU;
	Tue, 29 Sep 2026 06:36:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRS3-00000002Tuv-3w55;
	Tue, 29 Sep 2026 06:36:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F5574482A;
	Tue, 29 Sep 2026 06:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385C31F00893;
	Tue, 29 Sep 2026 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663791;
	bh=ukhdfHyooHk8uiIysY2W1PAtOO+m4p47/3kwBKFwiMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dMZXwo5/TTzmnHjpbsbm3l7KD6qM7KYF9QF4g620SRTncw5OKGs1mZUUmsYgB+naL
	 t9j84UdGUdJuHVk8u9lU+mxjvDkO83L5GK4ltsox3xI6XaAEVbcsW6DR9ACerrd/g4
	 gWT3S7F1D2jSkAlQvJSfeTZIXzDIu/SVaU/kjadPzg+KPpDtDtNOPklxhwJg2V44+P
	 EtpEZzM7dllu2b6Oj0PIJUx5eUj8vZH1RKJzzPzEren3e1p0pev3IxYfBquntC/9/s
	 FbU1dD1QMIkBsqJ6fdUdtkrD1mAlSWwM8hyVg1xwAXU+YRgsK9womFbwc1P9EhO7jq
	 9qesGOGjsEwEw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 19/20] dt-bindings: arm: berlin: Add Synaptics SL261X SoC and RDK board
Date: Tue, 29 Sep 2026 14:14:16 +0800
Message-ID: <20260929061417.20733-20-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add devicetree binding for the Synaptics SL261X SoCs and corresponding
RDK boards.

The SL261X include five pin-to-pin compatible SoCs: SL2611, SL2613,
SL2615, SL2617, and SL2619.

The corresponding RDK boards are based on the these SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/arm/marvell,berlin.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell,berlin.yaml b/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
index 4e8442980dcb..30d94059e2f2 100644
--- a/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
@@ -41,5 +41,25 @@ properties:
               - marvell,berlin4ct-stb
           - const: marvell,berlin4ct
           - const: marvell,berlin
+      - items:
+          - enum:
+              - syna,sl2611-rdk
+          - const: syna,sl2611
+      - items:
+          - enum:
+              - syna,sl2613-rdk
+          - const: syna,sl2613
+      - items:
+          - enum:
+              - syna,sl2615-rdk
+          - const: syna,sl2615
+      - items:
+          - enum:
+              - syna,sl2617-rdk
+          - const: syna,sl2617
+      - items:
+          - enum:
+              - syna,sl2619-rdk
+          - const: syna,sl2619
 
 additionalProperties: true
-- 
2.53.0


