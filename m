Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC63D0BB43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFMp539+IUc6MD0TfmISW90zldpfjVhevqU/3KYfi4s=; b=G/d+Lx/zVaYmJ37wvNCSpN8WNx
	AEShgd5UlBf2ld+dxI2dJbCh6/LGHm3Q4DVvIpKVvgohW5P/oBiU+6aXsQH2AdS/ICFrWrzuFI6Zc
	DOgaFHd0WrOb1hrOtxGeExnREANP9oejLDJnHXZBfchzVpF4uvBSQa96XdD/cwuGxSVBAaBrqJCjk
	IQRWFRGX1WfDP16gZ3lsjL8KSBFACYzlQGzArnyfxYzNc0B1LPsikk5wEEJIbL1WRjp1bt+NXZgpY
	J9wr0DNwAPwSetDJ5DMR/AKCkJ7o0iagh7ApxjoIyg67If3fTO+MENtnYHo9wQNCovnYKWhnYeVYZ
	KOKDvL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jlT-0000000G5NM-0AvK;
	Wed, 23 Oct 2024 22:23:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jRS-0000000G2NR-1mf4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720978; x=1761256978;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=/G4iL7GD2FU5sXjacp+RgfYPneZqqpBcs/+YCXekj9Y=;
  b=t9VWY4tqNwwDyQlPZOmW5sXdXa6HFg4xyoe5o9kA0UHyuuH0H+Vaxqge
   4j004HF2N5F884gJFA9uinCNLKqVZ3n8CfR474TtS1nrrsgcN56YjnIrk
   BpIS4MNeaNXcL1GdO+z4Y5+Kfsd6q31sekwTkWak9rMTBLD167iORIpVG
   DKG27F4z9G5/iuuufKJDvC5aB5TBGByLPJQS187mQQgFHHwDPc4nYyKsM
   c1LeqipRh0s2qLUXmsK3oSaXlNCpIajaTuP0u/0GvsnwK6R0g3tGN+8py
   J3nZTMBBX6Jooi0bC8u9gpfsPxCBApbknFt+uTN9DtQYOyF9BC+n/EFQJ
   w==;
X-CSE-ConnectionGUID: oMPErp9qRFmiMc0P9W4Bgw==
X-CSE-MsgGUID: nRk5MY7RTc+EYXbl9Nc51w==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="264507059"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:02:33 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:02:29 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:32 +0200
Subject: [PATCH net-next v2 13/15] dt-bindings: net: add compatible strings
 for lan969x targets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-13-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150258_518724_FDB3CDE9 
X-CRM114-Status: UNSURE (   9.35  )
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

Add compatible strings for the twelve different lan969x targets that we
support. Either a sparx5-switch or lan9691-switch compatible string
provided on their own, or any lan969x-switch compatible string with a
fallback to lan9691-switch.

Also, add myself as a maintainer.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../bindings/net/microchip,sparx5-switch.yaml        | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index fcafef8d5a33..dedfad526666 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -9,6 +9,7 @@ title: Microchip Sparx5 Ethernet switch controller
 maintainers:
   - Steen Hegelund <steen.hegelund@microchip.com>
   - Lars Povlsen <lars.povlsen@microchip.com>
+  - Daniel Machon <daniel.machon@microchip.com>
 
 description: |
   The SparX-5 Enterprise Ethernet switch family provides a rich set of
@@ -34,7 +35,24 @@ properties:
     pattern: "^switch@[0-9a-f]+$"
 
   compatible:
-    const: microchip,sparx5-switch
+    oneOf:
+      - enum:
+          - microchip,lan9691-switch
+          - microchip,sparx5-switch
+      - items:
+          - enum:
+              - microchip,lan969c-switch
+              - microchip,lan969b-switch
+              - microchip,lan969a-switch
+              - microchip,lan9699-switch
+              - microchip,lan9698-switch
+              - microchip,lan9697-switch
+              - microchip,lan9696-switch
+              - microchip,lan9695-switch
+              - microchip,lan9694-switch
+              - microchip,lan9693-switch
+              - microchip,lan9692-switch
+          - const: microchip,lan9691-switch
 
   reg:
     items:

-- 
2.34.1


