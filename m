Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FF9E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gizMFS0YArsyHASDoydvIeTsKDRLaHGSpkoEFxovd3Y=; b=haN2jSPS9L55ytw0JxkXugLwSk
	fzl3sn34kldzfOW/ypkjYe92q68yW/puxBqvNKIxalL6ZPHDmPQUg23vrmF1WEU7QFAlCZ3flwwfY
	siOViR4DW7shLTAYOkIPon+HY/EHBAcwTAz/Eprp67Am+Sslf0iHnRZHvg5NI+OpYD+EQvfVp+acy
	6b+jLez0NVCNfw35mlI6RUhb469G67iC79d2iQw1t4/x7OohRvsGie2hZE6HjYppNXPNA1ik5v2tb
	Bu7rERlTj8QxOG2hbCp1WHcOBb8DkZRvopiKpt+gcb0M3MKzfiEqPtcSUuX+Afo3YC8bsWyzMNtIL
	ImLz472Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWl5-0000000AG5L-0kL4;
	Tue, 03 Dec 2024 17:32:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWk4-0000000AFv3-02Ql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:31:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3HVFGf1917216
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 3 Dec 2024 11:31:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733247075;
	bh=gizMFS0YArsyHASDoydvIeTsKDRLaHGSpkoEFxovd3Y=;
	h=From:To:CC:Subject:Date;
	b=HQ4DOlp0WT7Khna4dN0txHeAqI91w81flZ5bFNgCM1GHr0lqOqEE8xfDrBnGGvgTq
	 fsGgWx+B+g0EHuBJxQe3LWb2KTWWO7pZoAc2V1EZhL3XcptJJrCBm664JPPmrvJ/zD
	 E63+lV0U+CVamjKId4cZu7GpGHfE9fxZqw5Fod5s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3HVFAA069926;
	Tue, 3 Dec 2024 11:31:15 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 11:31:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 11:31:14 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3HVEpO094200;
	Tue, 3 Dec 2024 11:31:14 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/4] dt-bindings: mfd: syscon: Add ti,am654-icssg-ctrl compatible
Date: Tue, 3 Dec 2024 11:31:10 -0600
Message-ID: <20241203173113.90009-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_093120_093731_6B9C22C1 
X-CRM114-Status: UNSURE (   9.62  )
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

Add TI ICSSG control registers compatible. This is a region found in the
TI AM65 CTRL_MMR0 register space[0]. Each instance is used to control a
an ICSSG's RGMII delay and GPO mode.

[0] https://www.ti.com/lit/pdf/spruid7

Signed-off-by: Andrew Davis <afd@ti.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779b..34943d9fc0ab5 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,am654-icssg-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
@@ -213,6 +214,7 @@ properties:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,am654-icssg-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
       - const: syscon
-- 
2.39.2


