Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F60FE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9mvSUZhe0Gs54mE7MNJ44HT1A+T/9sT90UthccBd5g=; b=rI43xwCw+Lode+TaEoGikCZYTW
	gZzYkTDtGLqRT8pOADN7Idgwm3wPlir9d8ejX4GdZUfP2esT4hW9GgfneUzfVrbwr4PFJtO6fgD1y
	tZeUIMAlQpdEhTOQ6pE6Hx0vOFvnm+JGYKs864WcoKxtCrW2StmNYjyp2ayYbPjSpLAztsmY0Q6RZ
	i4sOlkA7fLDMEH1hTT0XOPL2Xd1yj6vWK2BIqyToCQsEZ8Gz5BRvqw7VM7CmkfWs2102sfWtrzPbm
	s2cdXs9V5Dz3duOuqY+ROuIZeA1C4HLpiI/Czap92f7imaAPa5rGXChLnUyaKa+EiahzrHyOOk90P
	w6afVzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVewM-0000000A5Xz-0VWW;
	Wed, 08 Jan 2025 22:54:18 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVev8-0000000A55j-3Dvk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:53:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508MqDwv081041;
	Wed, 8 Jan 2025 16:52:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736376733;
	bh=B9mvSUZhe0Gs54mE7MNJ44HT1A+T/9sT90UthccBd5g=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=Zcnos1hVIL9p58Nrt4+8ae4JuYezcAdOHGqMqKq2dKtSw1H+DBfKN6C++l0xqaQd4
	 lqjvw7QdNxPtc3SYTVOLHoqkOgIYj568lYwU+XHucGDVgtD0N5pMXfe+Z+7mHNNIbO
	 lZYkUrvnEp80CxNbjuNQVq+CMof4GecEFOBurSTs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508MqDhv080915
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 16:52:13 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 16:52:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 16:52:12 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508MqCNw019025;
	Wed, 8 Jan 2025 16:52:12 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 8 Jan 2025 16:51:53 -0600
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-am62lx-v2-1-581285a37d8f@ti.com>
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
In-Reply-To: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=bb@ti.com;
 h=from:subject:message-id; bh=9zjr0PfSafrvP01TZ+70pbAdUxS74CrMPxKjkg4gfL0=;
 b=owNCWmg5MUFZJlNZI8PS+QAAYf///v5txq1/7/+1nuXF392TnNd/9teT7///3O/+/9Nv8c2wA
 RswIeoGgNDQ0AGgyBoNNDRkBkGhpkAaAAaaGhoANBpk0BoNDRoNPUyBkyaaMTGmUQaZDTRpo2oM
 gNBkAAyMjQYgaMhkAyZpND1GjIAAaBpoAA0NMEA0GhpoyaZNCGRiMIGgyNBkAMjBDENNGmQ0BkN
 GmhgIZGgaMgYQABkGgyA0yNAAADAQLBDVQNPh3PkBPQYlRDxc7bjgiHaNBpCNEwBwa6ALVsmV1r
 rKO9wDQCT3m6/Uw3tKgJEoXoOY4BXgRmujnRrqRhZ39kv2u6YChMSsq+9A9IQTzz2/F028fVXkX
 nsqXiAWG64LLwPn9qFgJdzctFQ7zJcqSjVtclqrzriFUcIWXKhE9xw0APaChMlJpl2QIr4+tsHO
 Px9GxjbEhsUCh2PEloxOdGOGUUjpsUoKSLSiir7FISr1Larnq5ktqBENOgOEQmuc4CP+Biozpoi
 ogGag72BB2Cl+JYaHaPo0LsDMZXU7HD5Ty8WrI/hzueWwO6iKm25dd9qQycCLucdIfljDUQaCzF
 FzjcmAyXymYA4Gm2SFymWDRwRZstAqrPBJNUBhwcQ4Wk2sAxCI8q6CtmYYpOI6OhSoSUCHF5wPm
 JvC2Z10IJ/i7kinChIEeHpfIA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_145302_959943_2D94D5ED 
X-CRM114-Status: UNSURE (   9.30  )
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

Add the binding for TI's AM62L family of devices.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c84..b109e854879cb 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -31,6 +31,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.47.1


