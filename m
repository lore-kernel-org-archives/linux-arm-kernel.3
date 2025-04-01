Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwwiCnyD+L+Y8DaVS/T/KKB3WalAnWpjByy1Ac4xtJw=; b=vDXe0XbHXDS5Dtmr8/NXxjpjg2
	S6RbIm/xC+cHF34qOUlATCcfzEY5uG/KTk6xa2EpZd5zxH3I6n1t8FOsIJeZ35xmJ//In0ngHSeTg
	wlIpjrxhNLj+PPSUP+ALUmvEvX8BAHfvFcpkuGxYbVCSnIpO3ZHSDGjHYQ88Mjoeg91K1y6yyfhuT
	hkULHUNgwcXmMwRjLXhmRMngC+KfysWxqGY4zMkjG8G3C7FHswNIBmeUddX7fReDJYsg6pI2I8l/Y
	Ic5C27iUCyQoiLfXDJKC1/xXXg+367Isz7rLhOTZkrGgXdhps9mYNdmw4lDDPHvOMI1Do2ZEC66Rj
	FeGTfrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeGj-00000003pon-0lOJ;
	Tue, 01 Apr 2025 16:15:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeEu-00000003pSa-2qUD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743524004; x=1775060004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gQHIFtd7jO6LKnDGPFxQ3YPgospqXdvc41+Z7wLtHwo=;
  b=ORmvuvZ/UXHuYrvIOJ8OY7hBTqpc3WwSAjbeWa9A5JU9AW1Il89gyd1r
   rc7VVflc4gQDAtLXqqYXiiOZm5t0+3KqV6vdpPqaIb/IPUyOUgSGdiziE
   qPR1bzqcpFxTkJ8TRtVcMo9SX/NGr5ZQryf06TK9NStHg8p2KtY+hqrYk
   y+tb3cRGAMR0GT/RkDO6EHewlX+eyDHJWelViP0OUDqJcMiJ+tkNcS8R3
   EVgWfeTVKhh7g6UKPtuB8L7xGWpH0W6QvvULJr4XgqtJ5wIWnW+XrnzpH
   pNlfrn3pnsg1lygscq+YO/cvtZPndt9wz1vp3TwBcF9L+N3l4jKpOzBWZ
   Q==;
X-CSE-ConnectionGUID: ggLzNIpETriZ0zPViMY9HA==
X-CSE-MsgGUID: 2KMWCwVCQiOgIjwH19Ge9Q==
X-IronPort-AV: E=Sophos;i="6.14,293,1736838000"; 
   d="scan'208";a="39512776"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Apr 2025 09:13:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:13:01 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:13:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <onor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <nicolas.ferre@microchip.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 1/6] dt-bindings: net: cdns,macb: add sama7d65 ethernet interface
Date: Tue, 1 Apr 2025 09:13:17 -0700
Message-ID: <392b078b38d15f6adf88771113043044f31e8cd6.1743523114.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091324_967317_09D10098 
X-CRM114-Status: UNSURE (   8.22  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add documentation for sama7d65 ethernet interface.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 3c30dd23cd4e..eeb9b6592720 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -62,6 +62,7 @@ properties:
       - items:
           - enum:
               - microchip,sam9x7-gem     # Microchip SAM9X7 gigabit ethernet interface
+              - microchip,sama7d65-gem   # Microchip SAMA7D65 gigabit ethernet interface
           - const: microchip,sama7g5-gem # Microchip SAMA7G5 gigabit ethernet interface
 
   reg:
-- 
2.43.0


