Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F27C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7NJj+BwESLxSCv+8Zk1pcu1RxKx1XCQo225tb0+Ojg=; b=w98oeKEQGaolHK4CX7ycmPHtMj
	VpBo5gyUt97ogKr5TNAltuRhlh4+exSJBicU2Sf368ced+l6TGQ5VHECIFxbR9dyFzSpTuaujbm0Q
	55cBewrdiPSyCLMd16/ExBkXLP0urkkTPWYXlI/qZmj0NeJPDrVp2VSy/dIv1Mo5fFq3nwHCeV4mq
	DWvfO8c0Xz7cBnTKW3JJshR6bPQEc7Co/zJ663wK7Ga9QFcr6zVheXkLzuekPF532zNiEffah9CXt
	5gRkRuW6vyTuIYEi3NeNvC7HBAao0zKQaAIuC0vLSBz5K7CkhW/zJJCCQZ2Y120aqw+EutXPB7HpN
	5gRR3kcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0lQ-0000000FwFK-32HJ;
	Fri, 14 Feb 2025 18:50:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07S-0000000Fp4U-1hxZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T7NJj+BwESLxSCv+8Zk1pcu1RxKx1XCQo225tb0+Ojg=; b=Low69T0FuZ5qJzuu4466VBfGM3
	LjOyX7+SrNAlge0qD/yLHHQ+vD9yUk5BWp5FHQ9EjcrjXJSuhGSluEGnEF704iB1Lw7zB1ajtr+R7
	w6u7BZBxtARp/L9jziRmhJmJkfV5G5NflHaJ5IpCg6wrN5hL+1PBkEbzpySQcYe98/XaCVhcVg9Uq
	xogJ/HveLayO79NlVzE8lwvhPgeaCIiuSp88XSDKme20XOzM/jjQ9/GA0OuKuEC+mkdOoxPl4Mm2V
	PJYdUF6CAwak+rS4WQ8azB699YDN1MQ+/WnwtfEve5xp65ac7SzBm1tcOdRu/vicXh3LhzwJkBYeD
	Q2g/og4w==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07P-00000001J2u-0r91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556532; x=1771092532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yO1T4LqfZi3vJny22a1HZxYVACCF1g0E5YEV0A24JH4=;
  b=a8Ik3tsL1/jSP0czwRXuwV6uTPzujl4aHwWaVLMcv4wdnWWZP2nu+R0Q
   sMYeDyRbuxZBgK8UdbSEuKAcYe+AGVb38WztK8HMBzdh0fqtPMMhBfFnC
   GS2/Tclsrb3nefnpRfG45YRe/uz95dkihPRXkNlzGzpVNPNveHmnfRfCP
   KtCddsoUuluMMz9CfI4bsOc5C4OxEeAsvswnMGRh3qEhIU/e+XTrz9ZGP
   GUCovOO/JOjzl3cXcOR0i/IVZ9rx8/gXGqE+yLNTNDx0ysQJ5OHmn+8/n
   B5/1iMFtN45LpGMA8OiOmgp74R29yxSxpVtA/9RBtltb8XiY22Lux/0ac
   Q==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: AB1UyuEZQfyQS6dgQjsgaA==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700930"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:26 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:26 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 5/8] ARM: dts: microchip: sama7d65: Add chipID for sama7d65
Date: Fri, 14 Feb 2025 11:08:18 -0700
Message-ID: <14e6cafb64df345e6bd79ac96961248cc266770c.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180851_747176_A08892F5 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add chipID for the sama7d65 SoC to the device tree.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 854b30d15dcd4..b1b236e1f6e38 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -83,6 +83,11 @@ clk32k: clock-controller@e001d500 {
 			#clock-cells = <1>;
 		};
 
+		chipid@e0020000 {
+			compatible = "microchip,sama7d65-chipid";
+			reg = <0xe0020000 0x8>;
+		};
+
 		sdmmc1: mmc@e1208000 {
 			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
 			reg = <0xe1208000 0x400>;
-- 
2.43.0


