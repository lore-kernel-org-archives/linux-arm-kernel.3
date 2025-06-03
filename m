Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E27EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbgR8ZDW2uPGvn58WVFNhzq7fTz12qO2dGs97R149is=; b=wuYPsugr/0/aGyh0fVA+DAoGIp
	UF3+p9SAm+zQxOkiC01H60oCqp05Bx44PwdiYAwveSl4eaVQ6r+/41JI7XRBbC5F0Qc9vyY4rsVTs
	fFN/q0qMyfT1tvJh/zxxdKGY5HnUaqn1zpjQuJeXP4/jqMSdd+LOHwxYp3PVSytKwbNRvu9pe/xYZ
	ATm03XwybX2R0PIdU0nI5hR9LfoNKbi+MbcwkTh7zofKvyaKi6uZqATMkJ71t70Td31dJ7CAt6A8g
	Hcp9Go8gp+PsQMIPpfsZidiiYsISG9PQdCxHBgHGa6YIUMamgN/DtQbKw4+7o+MuXw9T6mfd1UvZY
	vT08ah6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBG-0000000AhFt-1hcW;
	Tue, 03 Jun 2025 10:47:42 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMONW-0000000AcyY-19k5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:56:19 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uEWb3473620;
	Tue, 3 Jun 2025 04:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944574;
	bh=qbgR8ZDW2uPGvn58WVFNhzq7fTz12qO2dGs97R149is=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J+T6Eg+mNN7IACks/lvxIpCb5Jn1W0feTAala7zwBKBQSy/a/MpzCkx8QwCGswyp2
	 d4bjdzYxWwlTIIEH0ndyg0PcU29EcOyG7yP8zhHcy3CPJAaFknV2Wi4ZYDSiqa0S8l
	 wJxn21ed7mJLMQrqLxTf1U4DfSa+BwPpGglaNFp4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uENL3661744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:14 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:13 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539uCJd166498;
	Tue, 3 Jun 2025 04:56:13 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-j7200-main: Make the "scm_conf" node a "simple-bus"
Date: Tue, 3 Jun 2025 15:26:07 +0530
Message-ID: <20250603095609.33569-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603095609.33569-1-j-choudhary@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025618_362174_49AE10F4 
X-CRM114-Status: GOOD (  10.81  )
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
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
index 5ce5f0a3d6f5..a3f6eea9d325 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
@@ -25,9 +25,8 @@ atf-sram@0 {
 		};
 	};
 
-	scm_conf: scm-conf@100000 {
-		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
-		reg = <0x00 0x00100000 0x00 0x1c000>;
+	scm_conf: bus@100000 {
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x1c000>;
-- 
2.34.1


