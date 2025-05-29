Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491CFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOC+4F+xI+7Hfd/sfb4gzyY83VeimMV87ws6zdQWNRQ=; b=UOkEk0FQQF8TOuh70NTKjo8a1p
	Yb5rQ1sBYH/RR9fyb/x+GgCy9Ez+NvF5OB9X5zLHnDKEO295V48vFuxfi8lVcVHsCYNOptdM51wUy
	FgvvnMG0NvBD4vJT8c0pS0Nfnr4gniNXCcZAtQDsF2lMMgAKoOSfKtgiBtfSw60F/190uS8AUK7zB
	4b+OXJ0AxqVWj68Ugjo7VDGzxoklQL0bS5N78RDci9eaF/SjsnSe3JX+d1hn+QF3v9XuPruDhqJEw
	prniQMm5dRw6oDOSSYKTJWqdexek4r94j5CG5EutGwjLDn7lZfs6jgIQrWcc2F/nvhhrV95GFf5jO
	K/GrpLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdjs-0000000FvBn-1HkZ;
	Thu, 29 May 2025 13:56:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPk-0000000Frz4-2p6k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:35:21 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDZCd13591393;
	Thu, 29 May 2025 08:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525712;
	bh=uOC+4F+xI+7Hfd/sfb4gzyY83VeimMV87ws6zdQWNRQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hpkAQuZ8HaRC4VAzlaf4blmdL1lboNzH5kfJEsVvBqt8/o6eBJp0mrLrxayYPM4Dx
	 SZUgzQQrh21sl8nxOBoP2/OGEDP04mK69enGpiKGCyg7b1Cmxk3CJlnVCbggvCL+CB
	 ljCMkjbic9EMIr6wZZirNj/QN0OECDH4DJPuGXbk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDZCEj2202068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:35:12 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:35:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:35:11 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8n1650971;
	Thu, 29 May 2025 08:35:09 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 07/13] arm64: dts: ti: iot2050-common: Remove redundant "mcu_cpsw" node status
Date: Thu, 29 May 2025 19:04:37 +0530
Message-ID: <20250529133443.1252293-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529133443.1252293-1-s-vadapalli@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_063520_771836_8D363170 
X-CRM114-Status: GOOD (  10.11  )
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

Now that the SoC file "k3-am65-mcu.dtsi" disables the "mcu_cpsw" node by
default, following the existing convention of disabling nodes in the SoC
file, remove the redundant section for disabling the "mcu_cpsw" node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index e5136ed94765..48e740eb0088 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -475,10 +475,6 @@ &main_i2c3 {
 	#size-cells = <0>;
 };
 
-&mcu_cpsw {
-	status = "disabled";
-};
-
 &sdhci1 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1


