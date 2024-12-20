Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9767E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XMbMkrizWP2c5Wm6SBC1kkAQD+eBe6zUwJCK1RJ0qg=; b=jzJv1LSpOYMxG9sTXWyj/GOjKd
	nmw0wWLydcVk37Q8p3Mnc0p/zip4h+MrnI7gm+JUxAvdoXLLZ3BQXl/HiTUjHFyyvtw/HBCy6BSXQ
	Iz03UDnyrZT7OSlHm4bZJejgwakqR31FZ3PsuvkdXUnNVZfg5QqNVxtUPhc3d7fLYLhNNNrjPyAhv
	PbHt2ipOeYru0chgCWLr/i8cZ86D6+uONcMy8oWrKYGMObI8YjRpQKVVKXL0qkPk1mLPIFRljHQYW
	unsQThVBD4H20x6fzhBE9ovllBAD7CZ4lcBLDWOCWOvlBxydQLu3Q0kjNrol1GrgxqAADbPRhYOGM
	KWlLxQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdYW-0000000554p-0VdV;
	Fri, 20 Dec 2024 14:00:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdO2-0000000533B-3FRR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734702591; x=1766238591;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FRo8Ufl7iucYReatrCym9BzetwbYuzm+buoOeBMYDqQ=;
  b=ww5R3XYXWjA1+rh+X7j3XgL1B8TfIFgq/pIAxEsw7GzcbQIYRayoyqfv
   KxkLhMXw+4oVHxCvJzOSP9MttsW9Gyt5t4BFBzIGhCkO17s8RkEHNoMNe
   YnBBRDx+jdsBj4AfxGsLIqSIDFeDOhsqoxY5jTDhzWh1znbion+hi0Kk1
   igL+X7aboqyNh9fVMuPEMOKba/nmOyf1rA4J2MuSWaiL8/fGIyKZGZ7PP
   yWYC0ruehYBcmol2yxEMg6bb0M6JHtqnNC8DFDVcBjb8u2v4lns3p2reR
   Xb4IHYN+PHjYNNI4wu74ITIeZP5r/jD6YnOuwHRbWjZbYC3CFrEP+UIus
   Q==;
X-CSE-ConnectionGUID: Lq5BqadMRMm7eOW5EpI9IQ==
X-CSE-MsgGUID: RxHNOPDOTBWY8CZmwd/bZg==
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35794900"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 06:49:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 06:49:21 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 06:49:18 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Dec 2024 14:48:48 +0100
Subject: [PATCH net-next v5 9/9] dt-bindings: net: sparx5: document RGMII
 delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241220-sparx5-lan969x-switch-driver-4-v5-9-fa8ba5dff732@microchip.com>
References: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
In-Reply-To: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054950_825987_7826F104 
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
configured for MAC level rx and tx delays. Document two new properties
{rx,tx}-internal-delay-ps in the bindings, used to select these delays.

Tested-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../bindings/net/microchip,sparx5-switch.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index dedfad526666..a73fc5036905 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -129,6 +129,24 @@ properties:
             minimum: 0
             maximum: 383
 
+          rx-internal-delay-ps:
+            description:
+              RGMII Receive Clock Delay defined in pico seconds, used to select
+              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
+              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
+              any delay. The Default is no delay.
+            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
+            default: 0
+
+          tx-internal-delay-ps:
+            description:
+              RGMII Transmit Clock Delay defined in pico seconds, used to select
+              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
+              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
+              any delay. The Default is no delay.
+            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
+            default: 0
+
         required:
           - reg
           - phys

-- 
2.34.1


