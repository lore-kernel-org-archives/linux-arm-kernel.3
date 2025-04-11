Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSI8g2E+3aZMUl1QytJTkS1NIcn9yp4GO6VxdLpZRyE=; b=Jex2u0+f6HHYDHfUQmRsMR2JmL
	p4pysOWKbjZ1duVcyiM26Bf6VBW8ghscSBw5uhq2aNqMa38zncN4OufJCvfzqTAyMaufD8wFUnESp
	bu7rJ+MDOcUqEAvRKhwnkFIISre9higRH32lSXIW13RGa3u5uR7UNCC9vzeZfRl63Fpa511VDY+vZ
	kgk4o3IIWX+FICLHZ3lx1pajwEwy8DnBaYRK9xZIuDt1Q5xrfgpDt6SmJ6uBy7G7/9+9slwkng4Xc
	V181M5nTeE4DEu8zlWKPls+Yf4MPiPX9DCIwAOqiXYLb1h6aUosE2LGmBM8FG+2bQfyTtTQzeX8il
	UYDLrbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u386W-0000000ClQm-1V3P;
	Fri, 11 Apr 2025 06:43:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37aD-0000000Cg5S-0m2p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:09:46 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B69bAd1355131
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 01:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744351777;
	bh=MSI8g2E+3aZMUl1QytJTkS1NIcn9yp4GO6VxdLpZRyE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NSli7jp8osTp2WkdIItNAR/y5jAXdS6xS0dzFANf0CdIPcRnbz3X1aV7k0PyeQpJQ
	 N3k0+lMLil8Twcwc1yJFOI65pvUL6bWKU1yaQDxEFLbDAyI3deqA97quVyENSkr2is
	 PVniLKp3ls9G8L0saa50BXA1ChV5LV/1to4Wp0oI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B69bUd015096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 01:09:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 01:09:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 01:09:26 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B69IA0065579;
	Fri, 11 Apr 2025 01:09:23 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add 5000M speed to fixed-link
Date: Fri, 11 Apr 2025 11:39:16 +0530
Message-ID: <20250411060917.633769-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060917.633769-1-s-vadapalli@ti.com>
References: <20250411060917.633769-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230945_266882_6DAB8ACB 
X-CRM114-Status: GOOD (  10.73  )
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

A link speed of 5000 Mbps is a valid speed for a fixed-link mode of
operation. Hence, update the bindings to include the same.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 45819b235800..61e51ea58a98 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -197,7 +197,7 @@ properties:
             description:
               Link speed.
             $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [10, 100, 1000, 2500, 10000]
+            enum: [10, 100, 1000, 2500, 5000, 10000]
 
           full-duplex:
             $ref: /schemas/types.yaml#/definitions/flag
-- 
2.34.1


