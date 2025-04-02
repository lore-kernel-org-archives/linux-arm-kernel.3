Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F5EC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMs2O+a+TiQUYN0V8AKxd4jss6ijSi+/4hLvnBJOlks=; b=AQkGTmPTAtdQiDE2nyjIC0FeGH
	MADIkYwtT+Cx06bGaJuMY1TRYuzD2k7nkLXRi4i8yfPGaUlxjTwWYptqr03RVLd6moSunHSxs236X
	Fj9C11MYCb++WmQMV5qUgzklf9ZL1eCbncX9W0PH2I+uNItOK8492YxtNI0dUf0EshNyJ+GdBspIA
	NzJWghkP0TGQhTvCaanX50UEXg6DveX8kRO+OFz+ooNH1cpFqjEdGczNElPxQ006iWlDjI8FAjVFM
	dADEGujC9//QT5pL7Br5ECZS3t8zLph9+drLduu+Sf9VlP8Rtb530o5v7jj/w/Lg9lmSySron/nPt
	pAuLF71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwNk-00000005v8s-1sA3;
	Wed, 02 Apr 2025 11:35:44 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwKG-00000005uGh-2hzR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:32:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW5iW3915800
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593525;
	bh=aMs2O+a+TiQUYN0V8AKxd4jss6ijSi+/4hLvnBJOlks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BoLlrrsrE+X0b/LBEXf6dH1ajnK91L8NDlsMoCIpOCJNl5pMhxvch6CFrFqr6RTBw
	 a1nmVR/m4HsvpKArf+xofLuca2xz8l27/emVEIHw7rY6+SOXkXvr6ncuBGIk5dQ2pR
	 TKLd2YNnkBzgouuuOoqjGuF7bcsIrIXzX2oQUfIc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW5ku123244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:05 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:04 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW3Vx017352;
	Wed, 2 Apr 2025 06:32:04 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 1/5] dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl property
Date: Wed, 2 Apr 2025 17:01:57 +0530
Message-ID: <20250402113201.151195-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043208_775118_1AAE374A 
X-CRM114-Status: GOOD (  11.17  )
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

From: Andrew Davis <afd@ti.com>

Add a pattern property for pcie-ctrl which can be part of this controller.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Change description and add example]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2..13b6b6fa5dee 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,11 @@ patternProperties:
     description:
       The node corresponding to SoC chip identification.
 
+  "^pcie-ctrl@[0-9a-f]+$":
+    type: object
+    description:
+      The node corresponding to PCIe control register.
+
 required:
   - compatible
   - reg
@@ -110,5 +115,10 @@ examples:
             compatible = "ti,am654-chipid";
             reg = <0x14 0x4>;
         };
+
+        pcie0_ctrl: pcie-ctrl@4070 {
+            compatible = "ti,j784s4-pcie-ctrl", "syscon";
+            reg = <0x4070 0x4>;
+        };
     };
 ...
-- 
2.34.1


