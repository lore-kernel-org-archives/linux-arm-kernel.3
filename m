Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF2D232C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oATgDoCwLXOHXgXZE3iEsYFQpUgOK5EH/SSem16BDzo=; b=knX02o4qJu8bpbWQObYYpvV3OI
	5DNa9OfyWtuH33xz37ffYL4kLFNJWgSm6Vi1LhQdacoyW5AQS8VVFzMWyX+JXN7ZZzALowreWewDs
	VJZtKfCMrOKvMnRWYlGbhVbqmok/2cYq4aMYAaErYaFEa5cZlIuVFAXxGaOdFXjqM9zBivbAfFWYd
	ePQWdgE5vvfL2fAobwT8jVi7IjvmlVocNs1LEVKElgjoxDV4Bc6UJV0TnqO2x+iiWD1ZQMqZtTTpZ
	QtzE6hlZDAicoFrldZghlNzya/RHE9zF9TouQQeYjNtCziVclmTpwjy60O53ktFRMGEjGls2KTbMX
	K1I3a7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdygw-00000000xGQ-2GgP;
	Thu, 08 Jan 2026 22:41:22 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdygt-00000000xG4-3D8g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 22:41:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so4202962a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 14:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767912073; x=1768516873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oATgDoCwLXOHXgXZE3iEsYFQpUgOK5EH/SSem16BDzo=;
        b=IA5sW0DvXyVz1wvH7V8QR0uDrnrrt4W8ofXm74Iow054WTXapCu/ECyZm1ZvvBL2mZ
         d5lJsnQzSGHKeTwUHjyXko0Ek5C+0WnI884fzlNwxAWGRSZJz/VK94piht4untoQhwHT
         MB5T85M74xBz6v47DPRyaAZjoz5y8Hixi1g9WuvI1so3lB5OaM0RWQs8R3Vjj7s9wjOx
         adnftQY7gcYNq+6vdEWvpI8JGo+EBuTJ14ukYRmQLGUV2ofrHQU594iEhs8jRLEsZNq8
         9wwAkhnw/juEz6SuUdwCA4oIUBypssci7t517LbLMcdDQz+LnXPNQe4CvendFpa+aAlN
         VhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767912073; x=1768516873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oATgDoCwLXOHXgXZE3iEsYFQpUgOK5EH/SSem16BDzo=;
        b=Ewe14W8z4IeHlW5+eQ5UmJpi/CW4ozQeROgxWImdvBJyd4firtu0mQ6cnxIrEBfg/S
         /E6mip/8WT4ogWqBCZXFNZbPRk+ZKzEpe8RC/D+ByvMiCCGnJz1zHnf2ECYzfqbnloWx
         BVU/a+KFEypb6dkrMc7roVE6fGZihSnp+EvMH0BwIvmUb9L5c2gTqetZwjEa0AXtC0CU
         gnA9gXQWv0qpwBZFQmNt+b0tIFmUW9qwXo9KXTG9G7nhjYEIpXXquuOqzxdBw5onu985
         bbVll9P+YgZ3rRTgyW3jH3IGdaNkCoiMieS60X/j8Ihflb6JTugwHYplhaP3g+J2NE+v
         9+GA==
X-Forwarded-Encrypted: i=1; AJvYcCV/72gA266lkWbZHXcVW+zplTms5zf3E4IvSVHHU4Ks4IKqIP1ZS6n5qQxxAxguBCrxoQ3e5SvY8FAPN4kx48Yc@lists.infradead.org
X-Gm-Message-State: AOJu0YwhdilX3TzFlATwSrmDnMG4hHf760XLuhcyxyU9E/rAC/302+7h
	jCX3UCYA9HZiD6Wc1kudsDB6Sqwm9hBOEciCCiEvkAVmDXgKhPa37TRo
X-Gm-Gg: AY/fxX5vD44MDl+5DfceWUtFzXjy4HRiMXLFS5S8y876YYoYmZiOAOR5re3qVU86jQV
	6p5hdGTjZmlida2p/yUGKElrh0aY2roZq9LvBIc5NU4IUii6foj7PpLfMrU+cuHtUosc+f+4GvE
	X8pcdyV9EAtP5K8WT9YaC8AT1MwFCXyVn6z/htw+MClqJob/UQTkAaZgCM8kaNExxbDI0rPRx+I
	7JmjugcfnlGyrFWV5+OSkLrXJBhak/Q0i1d7h+7wrM7nhTmyECHfkRwYuuvlSAxIQ1Dx//js+gP
	OzdXepi6Ww8m3z793I7kmtT77TTRKiYnrTh8+a61sCNnkZISO8Mopm6aiW362gPy0/aGkyYsSNG
	UfkbFM5XrR/9chKmyqxYuYypTBF8cV1fKoAqeBUA6bxc0C4OIU5XINW2hSL8tFky5FSezgUWeiR
	HqnT66N0CDTZhR+hp1kzF7afL9ChjKujSqEUL2JWi9C/kTNF1qxn5z2yHuAaUIRyY=
X-Google-Smtp-Source: AGHT+IEIySNhvB3/9Gm/O6TMgyh4jbvwuFra0kpG/d3v8dv7VzlHjXM8k2siKcmcz5dw+lFkdZFAsQ==
X-Received: by 2002:a17:906:d54c:b0:b79:ea1b:f13d with SMTP id a640c23a62f3a-b8444c59a0bmr896144866b.2.1767912072715;
        Thu, 08 Jan 2026 14:41:12 -0800 (PST)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm933547266b.2.2026.01.08.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 14:41:12 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] ARM: dts: BCM5301X: Describe PCIe controllers fully
Date: Thu,  8 Jan 2026 23:40:26 +0100
Message-ID: <20260108224026.3550-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_144115_854969_2D383494 
X-CRM114-Status: GOOD (  12.01  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Tested successfully on BCM47094 SoC using Linux's pcie-iproc-platform
driver.

This fixes:
arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@12000: 'device_type' is a required property
        from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@12000: 'ranges' is a required property
        from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@13000: 'device_type' is a required property
        from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@13000: 'ranges' is a required property
        from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@14000: 'device_type' is a required property
        from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@14000: 'ranges' is a required property
        from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Adjust "ranges" in bus node - thank you Rob!!!

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index d0d5f7e52a91..cee08c8a9d72 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -95,7 +95,10 @@ L2: cache-controller@22000 {
 	axi@18000000 {
 		compatible = "brcm,bus-axi";
 		reg = <0x18000000 0x1000>;
-		ranges = <0x00000000 0x18000000 0x00100000>;
+		ranges = <0x00000000 0x18000000 0x00100000>,
+			 <0x08000000 0x08000000 0x08000000>,
+			 <0x20000000 0x20000000 0x08000000>,
+			 <0x28000000 0x28000000 0x08000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -182,22 +185,43 @@ chipcommon: chipcommon@0 {
 		};
 
 		pcie0: pcie@12000 {
+			compatible = "brcm,iproc-pcie";
 			reg = <0x00012000 0x1000>;
+			ranges = <0x82000000 0 0x08000000  0x08000000  0 0x08000000>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
 
+			#interrupt-cells = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 		};
 
 		pcie1: pcie@13000 {
+			compatible = "brcm,iproc-pcie";
 			reg = <0x00013000 0x1000>;
+			ranges = <0x82000000 0 0x20000000  0x20000000  0 0x08000000>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
 
+			#interrupt-cells = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 		};
 
 		pcie2: pcie@14000 {
+			compatible = "brcm,iproc-pcie";
 			reg = <0x00014000 0x1000>;
+			ranges = <0x82000000 0 0x28000000  0x28000000  0 0x08000000>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
 
+			#interrupt-cells = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 		};
-- 
2.51.0


