Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3958AE74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoSIkmjhrUW5VXd30Zk6NMiGMJuD5DYNGl/XI2VX+WU=; b=TsCLBxrDQUbDrApxe8e/0lguMP
	wTSDBSv8L7A7K2KzdLAT63f/NvQu5i7FCcUWQzyVBseh7LexMT0AqRH1xc+AxdrbJqMoxghJTH9+E
	Lf66OXGbSvzHHezY/7LhH8BtCh0eaL0XXVJtDLsiOwCeShHxil7sUFA85hzSylgTt5UVGQQTFsFBV
	SBd0mJoxjm1TZxH4llLgWQjqdxxiD4puV6dcSNFtLgNRfR3FRRrNTk09IoGxJJwnd49ks2Pz1E58X
	fo/V/p1OSDSf1yQDZmWLpwLOoLamGwipB+A4ICVUAGpMKsVd3VB87DwwEJcEI01Ssz78iOBfb1iZ+
	JOR190zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWn1-0000000AGJh-1YBL;
	Tue, 03 Dec 2024 17:34:23 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWkA-0000000AFvQ-0po2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:31:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3HVGdI1647618
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 3 Dec 2024 11:31:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733247076;
	bh=WoSIkmjhrUW5VXd30Zk6NMiGMJuD5DYNGl/XI2VX+WU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Awy81HGmKbsNRb3m02NIiV8LsZIwBGEc5QkPmGAcNTzP9BUeTnTZah0dNvfD4wLPU
	 ma+0Fk6Z2T3V0oh54FPUger0PnpBfRAU3/oG2TGJJv15C4Hu/OorZj9ssnW6hHEqn0
	 uuVkdJDFRlDfI3dsEgch+86aSAEfb23PoUAUX3j0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3HVGlK069942;
	Tue, 3 Dec 2024 11:31:16 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 11:31:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 11:31:16 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3HVEpR094200;
	Tue, 3 Dec 2024 11:31:15 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 4/4] dt-bindings: soc: ti: ti,j721e-system-controller: Add MAC efuse property
Date: Tue, 3 Dec 2024 11:31:13 -0600
Message-ID: <20241203173113.90009-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203173113.90009-1-afd@ti.com>
References: <20241203173113.90009-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_093126_279460_346BBDC7 
X-CRM114-Status: UNSURE (   9.74  )
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

Add a pattern property for MAC efuse which can be part of this controller.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index ead0679b30e3f..fbaae3d1bef60 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -80,6 +80,12 @@ patternProperties:
     description:
       This is the PCIe control region.
 
+  "^ethernet-mac-syscon@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the Ethernet MAC efuse region.
+
 required:
   - compatible
   - reg
-- 
2.39.2


