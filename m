Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87746C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 05:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TUNz5zcIp5GjV5yCc7o6GEea66/h6Vd3pAnBkCfynBA=; b=JmoqOAoTFpXmNlEf/eaK0VFbRQ
	dbJoUlXAWFcc8w/pR6+8YvskHAQ927p48gNFCBxqVeLeNoxzpYertrQaDoDN7nAYvKAw5qMgGWKxz
	5Tow8DGzFWKCHbwldQRZRq6BTpYOW2CThzPurWk+qwOxYCsuFkUwLdDwjO83qPZ6yBPtLpy3l8h29
	uoxg1fw90gM3pGRgUzc4theJklHdoXDI0pNYvzunPeLRTSyO0LbvLPpJ1YH7lxC+JvM6Mh3rUljVR
	hpRZ7afuD59rB6YS1Fd/D5u2QEJITSrxahspxbbRQMAy+oQOGWa2DgTW8BZ/RDfd8xAGMAXn1XQbi
	wWWpAw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcH7-0000000EsWx-0ZD7;
	Wed, 21 May 2025 05:45:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcF3-0000000Ervm-1i7c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 05:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806229; x=1779342229;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EC21TXP6G5n52bTvnTrND4/c9M0afwyTeFu0AcKsBrw=;
  b=nWTQeqR2GeXIDM8BQIhRo+AG4TVBiUnRAFHihCSAEWVYiuM6R5ujo6UY
   nZYEnOqL1AsvDAn3Ysmen1ZajKbMCNuCA4oFWG4U9AS98meXczFwwd8g2
   13rlXDrEu/IJmB52ZaDs4eaqn5TwqjFnfDgXX3/ijVbfs2VtiZbCX+kVK
   1zXfS6kWqzXDUhW3aAwGbNzkVm/BnzK0z5aARwrMaQyaZ8lAf0hyc7QuJ
   j0hkpyjE4W8JLIegn9lKCJ9p73CgnErJ7+4gZbvSDNV8Yz34cuSE2M46g
   8R0c35KXT2CRG8IOru4FF/8yASC95BtZwWNJoPN2sPs7eLSoxgtsGXrKy
   g==;
X-CSE-ConnectionGUID: k0o2CMOdRGO0OGeppoCe8w==
X-CSE-MsgGUID: lw/LZ2bVSAGWY62L5J/plA==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41428745"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:43:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:21 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:17 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 1/4] ARM: dts: microchip: sam9x60ek: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:06 +0530
Message-ID: <20250521054309.361894-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_224349_639376_2B9F8BAE 
X-CRM114-Status: GOOD (  10.66  )
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

Fixes: 2c0a1faa4da5 ("ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
index cdc56b53299d..c1ff3248bd8f 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
@@ -609,7 +609,7 @@ flash@0 {
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


