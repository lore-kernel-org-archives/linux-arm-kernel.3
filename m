Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA15CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 05:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAs9qMG1BpKyVXdmPAt4pcX8A8cB6YSnKjGI64Xvzp0=; b=zObz32Wfyou30Z8cnhmJ8zzOHy
	MgGj4EImyPHUI/oxKRyNmKebCr1S9GSakNUmDXz62klHZsWZN/Xej02oyLxKliJ5a0GqqUgS6DdDx
	tVZQpFDZKM5C7ZkXj8wOB6XqR/I4f9OBuUp1EbnPcL4fvxKhQH3KIxEtEgZFtH0KQ4yiHHU3WM6pe
	tlgIwqBKvae9rpkaCKAsdoNGrkbA+8WsfMgXbd9rnhfVUiaM26jSy0WicVBPUm356e9kuvzNySFTn
	naTrMjVXBrXBV+RLQKQO5QSz21ca3O0ScE15/8v6VfCCsS4DNx89SzHzVTEPRIDVPe+nCXGGip4xu
	pvwZmQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcJ7-0000000EseT-3Bx7;
	Wed, 21 May 2025 05:48:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcF5-0000000Ervm-09BZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 05:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806230; x=1779342230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jtw7JeQj+gKKTo4+jL9MB/YjLoD9N+YDMSLHz007/3E=;
  b=KAqs9OvBor6G5j53J8aZYhffDcpcDljsKAmLPMQBRzI1M554byePjldu
   cPAjzTrHsf8ZrIiJcMyZyb/iCoA1qwMnz+d9/DXVzhASyoMuhsq0TFnXj
   sUksFgAbdSuowHEpem6Be2uakJ0aLw90/buMnD5mCpGY5xKbUv2Rb7PJQ
   RWcXCdoujvgM/HuVDbB1w8sqID8vANtMu2Wexcf5UmUcNeKNK7Eb61XUu
   LkhfF3zwDa1rst6pNEoIBdoAY8SxVdxEHQXI35aFSTI4l5Uxu4lTAd5Q3
   a7spopo05zYfvDMIfBinIJ5ccJwLH3JchCMaGFRVga/GbfiZECioG9DdT
   Q==;
X-CSE-ConnectionGUID: k0o2CMOdRGO0OGeppoCe8w==
X-CSE-MsgGUID: t36/8hdiSFObJkHdZAeIwA==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41428746"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:43:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:28 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:23 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:07 +0530
Message-ID: <20250521054309.361894-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
References: <20250521054309.361894-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_224351_133539_97684D06 
X-CRM114-Status: GOOD (  11.03  )
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

Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
index 8ac85dac5a96..13c28e92b17e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
@@ -44,7 +44,7 @@ flash@0 {
 					compatible = "jedec,spi-nor";
 					reg = <0>;
 					spi-max-frequency = <104000000>;
-					spi-cs-setup-ns = <7>;
+					spi-cs-setup-delay-ns = <7>;
 					spi-tx-bus-width = <4>;
 					spi-rx-bus-width = <4>;
 					m25p,fast-read;
-- 
2.25.1


