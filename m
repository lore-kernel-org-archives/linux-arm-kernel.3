Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47460C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv4e6Qk7IChbHIEedlX3OXgau2KN9lmRoUtERsYTCww=; b=AV1RjHHeFov15e+n0vZMGGU9yz
	t34S4CWuFVhOXRQJ5GeLSJEVZcy1kGG+iTfDdHssbW9BBfGI5OvoGJG6JZYZm8XI4G5uldKbgN+Kr
	8UYMVeWfYnHTCJ1XYplbceGbsITduqUFaDf0muHVkgdI9NK1hkIPZdNlt4ygPavKzXX0pXzX91y8I
	/whastkLDT1gc9fV3WO8bjftamty6+39FpFp1N6tN+D/Owil1O1VuVtOBFoRPYaOehVNnFQXc2yxh
	lXLicPu5N0uJWUnuk4yYzHDdlI0fyYh/WsB92xulqi1rY4duKObiz7X0+fwTKHGsiX/1AKD7bdZNd
	1Uebkk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcL8-0000000Eslt-1pye;
	Wed, 21 May 2025 05:50:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcFX-0000000Es2t-3P4h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 05:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806259; x=1779342259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3CHm6v7jyTAu8MzIb3P5qTUxnFyDj80RHZQfU4Jp/SE=;
  b=M8TR/HN/EnjfzG9+0Y9QeoQHpgJbHxQIQn59lNxVFvZS/+hGAyzPk7x4
   YKNc/osKwRIK8rDSUjhoZbSQmV/RHr5clYM6drDVSdkYryVui2Y4BqbDP
   ZUjjCyrKZQ6FuV+ERnkfz/DIGpZt4OzhDh0uiwK2zIhmstAh38x5iVMtJ
   ad/7bsKmRXTM2vXoydTLs4ZMsbjRKD23J2AGsi+c74/uyYryBiuTLTgAb
   4QGtyc2K0/3rfRr3H4mX75ZCi5XguDAX0hJtMhmHrtrfcUtsepBg5Sv8v
   cN1lWk9WRM6B3QGSxmDjgm+eDakYzgOPdTM/V6YOtfBaPBgAR30ZLPNku
   w==;
X-CSE-ConnectionGUID: CeUgBc8xRnucLyhtnuJrfw==
X-CSE-MsgGUID: kX4N0k7/R/uqiCpOZt4kdg==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="46696439"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:44:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:37 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:32 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 3/4] ARM: dts: microchip: sama5d27_wlsom1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:08 +0530
Message-ID: <20250521054309.361894-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
References: <20250521054309.361894-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_224419_859072_33547790 
X-CRM114-Status: GOOD (  11.14  )
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

Fixes: 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b3..9543214adc9f 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1


