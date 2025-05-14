Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D43C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkmrUstDFM3IQIJ4SrYBdgA6FK0mSkuMvNrxI3Ghhsc=; b=PqwqS8UGYSNO3VxxX6T/UIMLZY
	QaKu5VgO+vCkBT5I1PXwi1FnFiCFXQRtZp4ljNAgtjDfmgSLBxUNqBW73kPt6xlNTgnOALUpdsbqx
	Y2b/3E9VFK2y9/N8IFprnR0+M+25DTjjA8oY2sOze8tJzR7ZObu3VSWaNv96+Ubeqr2YCPE9zfybg
	lMzhHr3atsrqsFdabIJkb0ynA/q5wxokNFqi15/yh/1J6V2fFp1BnYECeXjt1EYCcwC5EuWKRu/TX
	sIRxy6leeHh32BRTrYiAoYJeGg3QiylUFiQOGRfxgiw1b+OWQzmdFXnhF3fB462rzHPrD5p5niKzB
	B/wHqYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6bc-0000000ELG0-0sZG;
	Wed, 14 May 2025 07:32:44 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6QS-0000000EHow-2Qb1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:21:13 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54E7L89s3072419;
	Wed, 14 May 2025 02:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747207268;
	bh=EkmrUstDFM3IQIJ4SrYBdgA6FK0mSkuMvNrxI3Ghhsc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X3IxxpRUK4Qel1kAGcAPP5G3xDOdgcsig7Y6uup/jtIMa8lt1YqDV5QMOSPnBhqQu
	 wCXnpZypdd0UyD6UvGy8LnMpou89TGn8u5UEKhiC5FNVTOqQPMDNu/18UnQVUb1ZsU
	 Jo+ltBCCmwsEze013Hi3UJFgDsNh2A/3scyBIdT0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54E7L8Va3101555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 02:21:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 02:21:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 02:21:07 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54E7Kueb082928;
	Wed, 14 May 2025 02:21:04 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node
Date: Wed, 14 May 2025 12:50:56 +0530
Message-ID: <20250514072056.639346-3-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514072056.639346-1-n-francis@ti.com>
References: <20250514072056.639346-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_002112_659329_24CBBBDC 
X-CRM114-Status: GOOD (  10.15  )
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

Add DT node for PBIST_14 that is responsible for triggering the PBIST
self-tests for the MAIN_R5_2_x cores.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
Changes since v2:
- remove ti,bist-under-test property and use ti,sci-dev-id

 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..fd098aac3989 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -113,6 +113,17 @@ serdes2: serdes@5020000 {
 			status = "disabled";
 		};
 	};
+
+	bist_main14: bist@33c0000 {
+		compatible = "ti,j784s4-bist";
+		reg = <0x00 0x033c0000 0x00 0x400>,
+		      <0x00 0x0010c1a0 0x00 0x01c>;
+		reg-names = "cfg", "ctrl_mmr";
+		clocks = <&k3_clks 237 7>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+		bootph-pre-ram;
+		ti,sci-dev-id = <234>;
+	};
 };
 
 &scm_conf {
-- 
2.34.1


