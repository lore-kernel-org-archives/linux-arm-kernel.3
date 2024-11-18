Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C18D4921B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AShVNZV8n0zO/nO5U5HvhqPsIprtLuZpRN//UA/YxU8=; b=RATaan4CmVnNTNeymy1SIVBhH3
	JMZkqmq6UuugY3qHwymnL9v8vC8JWxBYE2ViDNN6SNLzplrwBvhnxdXIk9wqna5XPJQn1P8VGr39i
	wm/e6b5BlnEpApOdQQ7fiPmT4cnlj2lsTsPrcpPicmdVK1JixU7rMAGwVgH1dljLbgQMJ/NdXdrdA
	p56ESZWFjk/7Uj68471g6cVZGxpGCS5CJswYqCGpM1ctu8irWi7a4h6X9tIu03HCTAmTPUv9QFixz
	WgR4hlucVflF/Xd5LyFbW4oA8P+cciGI/DSJy/lhNJlR5zQaUL7MR7PPe9/smdSERtcFft4tP4viw
	VZ+ByQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1SD-00000009UmO-1rEM;
	Mon, 18 Nov 2024 13:06:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1Nd-00000009TKh-11l7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731934885; x=1763470885;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=o0gsQLUEQBwVaB8DL86kcJ9iRFqkRAgI0i6UZvCJDyI=;
  b=TmHIZutISu5tTFRuV+GlLKmvNNLdecHTdrYsLTklY8RTihLvWJ6vTlPu
   ZRYaINqTEJf1lU06bMx2g9eUjOLqyJuNH/pixSh8/9w6IgqTjZYuQ8SWG
   zRMrHhnHvaqfmYNnkACup+6vRQhlwFfujqzGs8I1EhoDL/mSulc9DFmEy
   vpWRKpopuvWbc4AgLRSPR7Q9LRwRXokk4APm/shiVcXqQGyVpURw1fkHW
   P6TZKzEYx2uuB021/Do0EEVlQhBcNKg/h9Me1lcqthuruUgkCQFrpfOcZ
   wr2Drp1z/NEsrHbEk94dD5ozoRUPjnJiny9jtfAeSPxtB5aE3AmEhDyzW
   g==;
X-CSE-ConnectionGUID: grjwx8pqQyysg5Oh3PusIg==
X-CSE-MsgGUID: HYC7+POhSx6IjTmEcIZbtA==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="201886260"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 06:01:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 06:01:22 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 06:01:19 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 18 Nov 2024 14:00:54 +0100
Subject: [PATCH net-next v3 8/8] dt-bindings: net: sparx5: document RGMII
 delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sparx5-lan969x-switch-driver-4-v3-8-3cefee5e7e3a@microchip.com>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
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
X-CRM114-CacheID: sfid-20241118_050125_348021_8D801065 
X-CRM114-Status: UNSURE (   9.02  )
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
 .../bindings/net/microchip,sparx5-switch.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index dedfad526666..2e9ef0f7bb4b 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -129,6 +129,24 @@ properties:
             minimum: 0
             maximum: 383
 
+          rx-internal-delay-ps:
+            description: |
+              RGMII Receive Clock Delay defined in pico seconds, used to select
+              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
+              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
+              any delay. The Default is no delay.
+            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
+            default: 0
+
+          tx-internal-delay-ps:
+            description: |
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


