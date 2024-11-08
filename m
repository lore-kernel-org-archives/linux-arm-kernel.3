Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D117D5C0EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gl8mKD3rLXgTWdw6OlZfKmkOf1hXAJ/ECQW4f5tY5vU=; b=EC9O6chuDicuQ8dDBo1rBxk3/F
	p/HNvHShSZEVhb1k6D0R2ThceygtFEZdIQsRAUmWXMjttr4WKKo5hN6EvaXR/CfyNXA8sA1zBfodZ
	sAVs0mT4yQC37+IfjGV27bxzuw7mXI0SdyqM8F+nn79DdeGFy7INJ+ym0OAsYPepGxxwMlIVDi0A7
	n/fFiU4cvnjRsyPMN1PGjGAlgvhdn5Vl3TV+80+tM56KJmfFK2uQYVoqbPct9z6wmW5IXpXCL0ODI
	kw3jIjUHMHFYFVOHFMRA5utw/NHKNA9Y39pSyjrmGSE0BPWaF6cOQrXPhG61G6flGWkZ+VQ9OKMvw
	llYnosZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QqB-0000000B0sY-0gLs;
	Fri, 08 Nov 2024 15:24:03 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pzn-0000000Ar3N-1jVR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:29:57 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8ETp39086500;
	Fri, 8 Nov 2024 08:29:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731076191;
	bh=Gl8mKD3rLXgTWdw6OlZfKmkOf1hXAJ/ECQW4f5tY5vU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zKVJlqnB6PAp7qJYu3p3T++qpnDzU9MMlPKbRWb9JBiBLnqPIM2+l2DPbRk/aV9QH
	 4r6ribctNgzDF82fTBcYVi26UPSWXPtBeQhuY8Gn5bAiAlaZ2+1GI2BeC/bdpjS5rH
	 07jBnrmZoYgnWWI7zvF8KYJAHjenNNZ2T9gpV3Eg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8ETpNi104243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 08:29:51 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 08:29:51 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 08:29:51 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8ETpEE040961;
	Fri, 8 Nov 2024 08:29:51 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A8EToLk032068;
	Fri, 8 Nov 2024 08:29:50 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
Date: Fri, 8 Nov 2024 19:59:45 +0530
Message-ID: <20241108142946.2286098-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108142946.2286098-1-danishanwar@ti.com>
References: <20241108142946.2286098-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062955_589316_59F9FF85 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, vigneshr@ti.com, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add clocks, assigned-clocks and assigned-clock-parents for ICSSG

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 3cb1471cc6b6..12350409d154 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -92,6 +92,11 @@ properties:
     description: |
       This property is as per sci-pm-domain.txt.
 
+  clocks:
+    items:
+      - description: ICSSG_CORE Clock
+      - description: ICSSG_ICLK Clock
+
 patternProperties:
 
   memories@[a-f0-9]+$:
-- 
2.34.1


