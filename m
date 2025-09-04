Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F24CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4pvg5TsC472/OZBFsc5tes3U+vxNcbNyNKxPDxsap0=; b=wSKna+/Tov077QDMHmQBisoIIW
	Wc8PqmoBCzMDn2lo3cDMPPnVtOawRkelN2Xd0CAZt3Thr6G3nOujtzMzw8c26buNgw8KDXEsux8kh
	vIhqNtNBj4eKpDCDq1CA8YBL2s3hVfybtF2taGu3ZS7udFdBcWpKx/XQBlyGYGQregGK5BdGEzAre
	xY6nAK26KgsVF5xxKr+1z3IlqF0rDbg1opsUk/k2mf9fNbCEArY0UANgmokdRf0x6bEelLZSu8aMZ
	BRUq1XV6SFmlcPQ19YAIMRhAz1pXSVEQ+apjJaJjUv0u1tiqr2OOb5GXAluSQUc2OlM7Kd0Wf1q9P
	EPXptVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzSJ-00000008HrA-2c2J;
	Thu, 04 Sep 2025 02:12:07 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty8O-000000080oB-0nYh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:47:29 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5840lO6n2954658;
	Wed, 3 Sep 2025 19:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756946844;
	bh=n4pvg5TsC472/OZBFsc5tes3U+vxNcbNyNKxPDxsap0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J85QDcyuOwzbzXSFAN12EOrJBP7LEn8R8SrgOtIbWRB/v7OjlKuhOrIiuZuHJaz7k
	 vPKplQkCFH/oLfwze6OXPQ9aIY4L/BopemY9ySuwOFhBQrQy75CK2iKt7tphzNLJ0v
	 +ErGTmHepiGiE691wK1MeqwCNGAXLEvq/88rvPxw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5840lOC1476633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 19:47:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 19:47:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 19:47:23 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5840lNZL2425599;
	Wed, 3 Sep 2025 19:47:24 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62p: Update sdhci0 tap setting & STRB
Date: Wed, 3 Sep 2025 19:47:23 -0500
Message-ID: <20250904004723.2856005-3-jm@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904004723.2856005-1-jm@ti.com>
References: <20250904004723.2856005-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174728_271484_5F3B0822 
X-CRM114-Status: GOOD (  10.80  )
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

Tap setting for eMMC have been updated in device datasheet [0],
so update for am62p in k3-am62p-main.

[0] https://www.ti.com/lit/gpn/am62p
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index fb8473ce403a..9441317e39aa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -44,10 +44,10 @@ sdhci0: mmc@fa10000 {
 		mmc-hs200-1_8v;
 		mmc-hs400-1_8v;
 		ti,clkbuf-sel = <0x7>;
-		ti,strobe-sel = <0x77>;
+		ti,strobe-sel = <0x66>;
 		ti,trm-icp = <0x8>;
-		ti,otap-del-sel-legacy = <0x1>;
-		ti,otap-del-sel-mmc-hs = <0x1>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
 		ti,otap-del-sel-ddr52 = <0x6>;
 		ti,otap-del-sel-hs200 = <0x8>;
 		ti,otap-del-sel-hs400 = <0x5>;
-- 
2.51.0


