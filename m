Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C60BD637CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 21:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26FwqJAKqYuEZ0EEwiiyqnsTRYQ+z2zeH3yiEwZ504k=; b=ru0ZRAq+D5jg8UfHvgVNqsDEAG
	1D5V2L4aEIKJiIC2B0EODWMy8eudT1SBzqdwfP/LJTFvKfYL686158ySCU/++BYuCrexk6tg62fVN
	VL56C7LlqXhgxTinUzlOpK0meIhUliNxgB6/r7GZxQpZT8SUBCk+L26Npy7lf3p95J22vpkz38D1l
	7bm+LvrCkLXnnDE6JdqyuryVYdLGiH06Xzd2vUPVc95ByolF+j7E0lTIKtUCaA83Ox2SFhni3T9wJ
	JsYfVyo2MRRuR+8SBPrTIxLG3lPfdQeSNZmWOm90tL2I1VONQSzB6VOXYxmlfbRr75BLxlW1P2cmr
	a3Rxf+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKuc-000000084gE-07IU;
	Wed, 13 Nov 2024 21:28:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKf8-000000082O4-40FP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 21:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731532350; x=1763068350;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Tpwk/cH/By/7DRbyPN6y3UDPzobNPdtOHRJ5VREhWow=;
  b=D7N6qeg/8Fm7GSA1oxN5WlUSwj3MsrW4FPDVJWETDz9bCjW0cTJdBQUE
   9KYy8rV80YAwhzeXutG3n5s8HFZoHj8uB4bVh4VVqw89eQ7putVOpKKrx
   hqv5zSzEAX9kfWObrLI1FhTqlkAZ0VTWox+FDKwtFWZVjs5mExSgMOZtt
   A2FToJ0DPPmwlkfBPj40amyGDUqHXDZ24GcnfgOxc5Ibc6JiPVGG9RwQ2
   465v2EsDJniilQ+glMgetdhy2bB5nD2xHLtP5wBTUYkectFpXsBNOhuRn
   Snv/ynqsvOKIwS3VPqgCI+Hosde6djp/dreRupoE0xj0obVbcKf3lYmL4
   A==;
X-CSE-ConnectionGUID: vQdPcQJhS0S1px+vMo5fhw==
X-CSE-MsgGUID: +0GrCcvYR3aR7jveVUPVog==
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="37813511"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2024 14:12:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Nov 2024 14:12:00 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 13 Nov 2024 14:11:57 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 13 Nov 2024 22:11:16 +0100
Subject: [PATCH net-next v2 8/8] dt-bindings: net: sparx5: document RGMII
 MAC delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
In-Reply-To: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_131231_165278_608C6E39 
X-CRM114-Status: UNSURE (   8.63  )
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

The lan969x switch device supports two RGMII port interfaces that can be
configured for MAC level rx and tx delays.

Document two new properties {rx,tx}-internal-delay-ps. Make them
required properties, if the phy-mode is one of: rgmii, rgmii_id,
rgmii-rxid or rgmii-txid. Also specify accepted values.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../bindings/net/microchip,sparx5-switch.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index dedfad526666..a3f2b70c5c77 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -129,6 +129,26 @@ properties:
             minimum: 0
             maximum: 383
 
+        allOf:
+          - if:
+              properties:
+                phy-mode:
+                  contains:
+                    enum:
+                      - rgmii
+                      - rgmii-rxid
+                      - rgmii-txid
+                      - rgmii-id
+            then:
+              properties:
+                rx-internal-delay-ps:
+                  enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
+                tx-internal-delay-ps:
+                  enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
+              required:
+                - rx-internal-delay-ps
+                - tx-internal-delay-ps
+
         required:
           - reg
           - phys

-- 
2.34.1


