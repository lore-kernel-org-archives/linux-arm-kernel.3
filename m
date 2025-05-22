Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E51C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6zhe//+mK/YJYFppCQ8AQ0H2uErJNI3PakLy/YR+LI=; b=oLXrx0w7qD0sP/0foPPugloKwD
	LWSjFJvUVFBLvbO1fDfqR9UAkKDlL5w2ljslE+dObDuQodFioEyckHFZMImYaaudrYIymy4bNlzBb
	VVNYV9WxzDZozIum3BL/1KJVpehBVF9b2m+q+JmgYbyn1tFaLvjTzVoHFWIaJ2pppEOPA1q8OxKai
	BdMgY7hD7gqjIsPCOQykxMcN7+TM4jqkb9rgxYcAEcIwdmFifv85Vx0jOTkk2krj3avxh7He95lOg
	iFe3AmUfiqVGOTccD+x/5+PlHiqhv4l1vgMz9G7eEz+0D7l0L6mNta9H2RzRknpx8++CPJMDPyzBb
	J5yBoguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9k3-00000001jyx-1RN8;
	Thu, 22 May 2025 17:30:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9g8-00000001jXw-3WGR;
	Thu, 22 May 2025 17:26:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-742c27df0daso4705842b3a.1;
        Thu, 22 May 2025 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747934760; x=1748539560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6zhe//+mK/YJYFppCQ8AQ0H2uErJNI3PakLy/YR+LI=;
        b=kfAiriYAuEzC2penxnPEg7aQncnZ+6tLrOvkG7HtEzI6cu/y5UPAGmu+A2+U/DZKMM
         8Lg+fKkAhTCs+HSqfFoZ6SroIKp9xd2xmR777KMhLJiJ90kE2ZRFO3WlDXuDIlouIXUB
         Au6/Uq3P4lTWOqNpqubEN19N3W3yHhSQhW3E/iFqOQgxAauKkpGUny9LGVdpnhLuVVJ8
         kmY67fdSXfHvEJGdJEvH6ewvdqBogl0MdUEczVPhMS332XLBQgB19CkVag8DvKXLzHqm
         PhdItZTs6/pC3anKN108Xt4h5OPG8CBtjAtf5qQjgAi2Ks6wWZbGI/I9/tnHW+hOiUM6
         8YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934760; x=1748539560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6zhe//+mK/YJYFppCQ8AQ0H2uErJNI3PakLy/YR+LI=;
        b=Pbtmx4IZJYSm3JmTibN2DGlaPmzbDkT7I8/SFvY6KRfy9nbyQGISig9wY7zuuta8zz
         3IvxIgd+mQkIF2uAtMgxXyM8eAWxPSdbpThe9epvYkKNrmxzeaWFNXjbYAdOE/tEjdjw
         jOPuMi1sFuaPsPOjSxApbrynZjcVMTj4sT3jc5IirXl8yzlO+eJRGXiiXBxrS0a2hwlS
         dfOmg+KG3HRgUXzK2qVrMSkK6oblJ+w2WLGFqb9wsqWNnUcpOfPtkbCspR0y9rTmFtbb
         H1//kDx62t25x2zheg5kJaYa3TfTc9YbGfqkx0qYC4RgicMASr+EiFa9ovwpyftz3+I7
         TrVA==
X-Forwarded-Encrypted: i=1; AJvYcCU+9gJllFjBjS5TBReI8+k7iBMW9ZO/2/KWsiXo40ojroGQ+d1lQUT+8HlQMLWPgNspD2Xb+1GBMs7iWfz5b0arwg==@lists.infradead.org, AJvYcCXKZIfnbq0sHZJbQIeZMiMh99Oy0nYH+ji9yP/HzX+rjsFlIcBLTN4ZLO8Rb+UeMrCpozoOc3qmsXOPPCNN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp4OpVOSNxm0ga9PEkz1AJAleQbC8+UCs6CwBUnaYynHx8yYel
	zfGjwuscOS7VHqqtnCiaHN/yKwppMOMuR36B7NtW77iNxdwP8+Z84is3
X-Gm-Gg: ASbGncsxYH1caqnlxVJYZNg2gxNQOkhUCO1IN98q0HNLgSczb8Vqb6KZV6ICXp8A5O/
	jqtB71MC0vL4voDXko/uo6AJCQLH7TVU4BOtVDWIrH5kiyGYy3fd9D269gDMGFp9L/Ys9HXNH7W
	WglYAsgzgeGKL7sVvbQc5nM8wglvNGsT5WpA16jAlmFIDwWAfp1himfoM20OxVssWaVJwZb2C4G
	dag/B8P2MeKRFXlwklBwBxCUo0RhiCfplUj4X3Dk0U+3Db7lKRdJfrspSy/xq0AMrVz6CClSFNP
	7ZgKnQL1J943t25tMp/okl5GSGFutvF2mqOsoIswNjhhg3WjxskCvSd5mZG3CmPy
X-Google-Smtp-Source: AGHT+IGXvr9532fhWigFZ8cMVaxNwepNz/118pYhgTKFbN3mZan6kqoTUhTAU3oKtR/8/PWsVK+lfA==
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr36947909b3a.16.1747934759815;
        Thu, 22 May 2025 10:25:59 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm11471586b3a.112.2025.05.22.10.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:25:59 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Wayne Schroeder <raz@chewies.net>
Subject: [PATCH v3 2/2] arm64: dts: amlogic: Adjust USB PHY power supply references
Date: Thu, 22 May 2025 22:55:32 +0530
Message-ID: <20250522172535.302064-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522172535.302064-1-linux.amoon@gmail.com>
References: <20250522172535.302064-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_102600_873817_4B2653B3 
X-CRM114-Status: GOOD (  14.20  )
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

According to the Odroid-N2 schematics, the micro-USB phy is powered
via a gpio-controlled regulator PWREN, updates the phy-supply to
correctly assign the power supply for usb2_phy.

Additionally, the USB3 combo port, which connects to the onboard
4-port USB hub, is powered by the main VCC_5V rail. Updated the
phy-supply to correctly assign vcc_5v for the USB controller node.

These changes ensure accurate power supply configuration for
USB components, improving hardware compatibility and power management.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
new patch
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index ad959f8bc1acd..9d63ab82302eb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -310,7 +310,7 @@ &toacodec {
 };
 
 &usb {
-	vbus-supply = <&usb_pwr_en>;
+	phy-supply = <&vcc_5v>;
 };
 
 &usb2_phy1 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 7e8964bacfce7..b105a8ae2fec6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -437,5 +437,5 @@ &usb {
 };
 
 &usb2_phy0 {
-	phy-supply = <&vcc_5v>;
+	phy-supply = <&usb_pwr_en>;
 };
-- 
2.49.0


