Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D91C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYWtWFEmKq2Yx9UsNl2p+/Em17/141cqEXY03gfpnRY=; b=oBoWMj/4Qxy16NapjqV1JjO4eP
	AVw/CmViT3eIagRSnGw8F3bklLXprNIu3TGOVrqYHiN/FPSCxZK1pumPW/VsWIoW+922Yp/YusHr2
	F4LHziRaIiaxvhgljCU1eXp+kZdnV8RtGQOxMm5OccTdwK75+KVZqxobe6OeBxuhl+fVt0nkDhKHE
	DY2DLZP5cODcjr6YPqVdZfPcvJ3e3oPApBsPglUgjJET51zTnKRzEcy92toMxK/VIZS9e6hyeSWem
	cxE+75tRw+3gHx9zNhiBE6/fdVR+xN+6RGoOlUx/HgKioa33NCrVwb44KQXdXHPXdylXGIfdAv4UB
	ra092Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBF-0000000AhF4-3YXx;
	Tue, 03 Jun 2025 10:47:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMONT-0000000Acxv-4ALm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:56:17 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uCv7432800;
	Tue, 3 Jun 2025 04:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944572;
	bh=jYWtWFEmKq2Yx9UsNl2p+/Em17/141cqEXY03gfpnRY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qyVdNFyYpJz2psiS+ZiHYSK4ZsvNpI5wSfT0DGHO80u7yF1fueX0/6/IyGk/3d7IG
	 jxt4D73VZwdNsuALhTtLWzciYNs6DPKabJj7GMcaI+aze75mifQXWotmvVMDNMD4Ge
	 nFni7S62XRCzxo1U7Fb2YVvlblo6mqjOyJnb63oY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uCuU3447461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:12 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:12 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539uB4v254810;
	Tue, 3 Jun 2025 04:56:11 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf" node a "simple-bus"
Date: Tue, 3 Jun 2025 15:26:06 +0530
Message-ID: <20250603095609.33569-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603095609.33569-1-j-choudhary@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025616_076212_53022E6E 
X-CRM114-Status: GOOD (  11.08  )
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

The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
"scm_conf" node to "simple-bus".
Also remove "reg" property as it is not needed by "simple-bus".

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5bd0d36bf33e..4e01c1265ae9 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -37,9 +37,8 @@ atf-sram@0 {
 		};
 	};
 
-	scm_conf: scm-conf@100000 {
-		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
-		reg = <0 0x00100000 0 0x1c000>; /* excludes pinctrl region */
+	scm_conf: bus@100000 {
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x00100000 0x1c000>;
-- 
2.34.1


