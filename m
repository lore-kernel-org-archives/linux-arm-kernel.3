Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5wjWGiRsr9y+5q9RC8rut0NeC3L4TN1gmmQSHSn4ZA=; b=g8gQE75/dgy4VYskwv2QM6X4TM
	UtLCxwHBn9kLDvGx3qSvhD8UZVA6Rrz/RNRNwdDQwr61vlCMSko2R/1/QD+fzyHk0MOqQUfOhbdWD
	56CxriA5dwXCi4iVBZQfvrSJqKjIiz4z5swTA0Pjk34vgFv02AKYUv7ApXFtv5dvMhmLfFJ53Ns2X
	xYMXxsG+KR21t2zSqX4vfUgssr+7ROLl+P4chhCRSJna0Iy5LidkciIdVhUbqnZojmSwefto7+Zdm
	FvMjKyPFgkXdBHjwJrdYLvIc9kat+dHVJl1oyCLQo4/l/slF7DNBBpmNZhrAxcXALlA2k6aVdnhjq
	C0bHUEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcNA-0000000EstL-0lBV;
	Wed, 21 May 2025 05:52:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcFu-0000000EsBz-35vT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 05:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806282; x=1779342282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K7bMnq0n3jG5IfmeVwyzBiEB38kEhphyrlTYWLlNtKw=;
  b=1/3ow9bbFTYuLiAdCNPx4CzZibAFXKgDWBEN5dbIsOVDKezScHVYfDWf
   vWll7FHiWxanJC7l+eQsFeUaV0+lEebdGaZ5do1ANwZKsH32vplGpQcDb
   IRDhkvF0JcXFTXsV0z3TKwt5+fWvdlgqkvHVBMEOe4t3fa/bfD6fE11jF
   IXjHexFaJV5SA15CzcuyILOMZ5NCtCjt9uSConhI3UV6BR/4p0Jr7T826
   qZTvBjkyVfLHthaoYj3kC+Ny+r3TN54XALn7L/iLgHySbQJPoOYmgRO1h
   6GEGE3qpmAbgfN5DEDkZZT0xmiJ561FxB0GxpB1vEZ+GnMWM145Y6TyGO
   g==;
X-CSE-ConnectionGUID: OHsW4HofReOO8QjhtcrDLg==
X-CSE-MsgGUID: 9ssiEkXmRVWT+8rHJ/me/g==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41428790"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:44:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:45 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:09 +0530
Message-ID: <20250521054309.361894-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
References: <20250521054309.361894-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_224442_832834_4646DA56 
X-CRM114-Status: GOOD (  11.22  )
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

The naming scheme for delay properties includes "delay" in the name,
so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.

Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
index 9fa6f1395aa6..fbae6a9af6c3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
@@ -714,7 +714,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1


