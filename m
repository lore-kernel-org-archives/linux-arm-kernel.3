Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC73FC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=; b=GvybBvsIv6umbJp3HeLALICmtE
	nn2etM1SUMRp1SZo19vgDSUtTpDNaZDp2IKO2L/fZ66cPzd4STgyScEJvACXHH5ZYr8x13uBJKyNp
	bdHVg2tvAjZ38+d4PD5mhcNYIwNvbZituCJ+gI19geXPAMODn/EOMJ+t7rJCJ52eHQj8F/28kI2nA
	fbFslb5/EvOgaZZJNtc7MrEM5uZ86OEb3R/bDm01vSISVdAE8W/8yZjtFdEVOgNWrjvdMJgIUk5w0
	fn/IcYgKVHoLQubjgs0qoJwbpIPB9MhfbEBKeU8J8ztN5A/57+Zme9yEiaGJGJDfrfQ3fSrmncsst
	5BlayJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjct-0000000GVMw-2yfN;
	Wed, 07 May 2025 18:36:16 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjNZ-0000000GSvv-43Gs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 18:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746642008; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ggge+QZGr5xlTVA7vxZ/DhCinzk/tfLC0jY9/0C12uHsm0elGXp7J2DtmfR5JkXSZu
    jVDRgFLUtJNo08tXBGmOB65mwOp2UggVv4H033dx5y2HaFb/8RquCRGu5SAcfDLtvIhO
    6STnMtKFQgCxFEhfkApD8YDsysd3q5MMgX+/zxNu2bpL/ijkN2gHj5g3PZ0dv+BpV2+e
    cFY6sBTRXa+1NzMcEJNVoAr1L4LIwZnPr+Y4mRU+d0s0AinEJnkep3GV9OG3OkGru50d
    Ux3rYV+y81dxzBCIbHN9Tse26DbYp+uaN8FJOM5NU5Z0smGPilJEhqih7QmZBvgphg52
    0KfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1746642008;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=;
    b=AaBAN5F+3xCC1nBDYRrN1DwzYcukxl0dwY5lL4M7/eypM0RwjNRruuRutLr+gev7Of
    OdpGi9m95ojwPJhwG1zd46zqY9RrvFMsdj0Vf2mnoZJsEYofkwxSfInRHHYNnvCbEEBf
    U3c1xl0M3FKqab3YLvI3rirUaW2ux3uuPraOFHosVDcQeKo67rLQdpQzAKLRqu75L4Ru
    cITv9CL4M3hjTt0Mmi0yYdkczbajYVYhBl/FpbUNXgC/Su+nvZv7DIL1+5YdvM4QO2kg
    1XfAJRuOMM4hEkgfqhlfxbGCCN7SxAcs/SDDxU/J8xHJI/LL+5vAAyq7ka3y+plEuvXw
    GGMg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746642008;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=;
    b=D7uPwl8mRfI57QaefQKOtQp9FCFjdKWBPLmCzJTfm/4snA0mo8iOYFbobl8yorExkw
    uCnhwU9lwMLxd6uHQnxTuF8MNoVQi5VYNssKMhCW9vCZpLWZNbBp0bIdY+h+VItWow3d
    W+gjclUHfpRS0i0T/tm7TV+xX20A9o+4n9+pfdXY0u4a7vnmJgA2DcCzsF+0qudlR+Iq
    qlZYza/u1wZPNSDJs8mBcEp8UhouCAia0nIBkqFhfB7GQlHQExzM0qxNR2dv8dTO3I2c
    CM0KqTq1nG4DAnpYhbtwe/MVA2OVXDkAQTED0nrPSgInOL4byOsvluoMJyw8ZXDoclwt
    29uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746642008;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aeRCGfuCcMOkPK+Z73zPArBARVdjs149XSsfgGnEbOA=;
    b=MPK+TQ1b+m+0OUuuVFOGwh69lVpWFh+Ddse2Lzgn7lMhnitJJQLWBdH68HbZ2/Vbm9
    1R/ge4ax/EiJpDTl5XDQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b35147IK8GMU
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 7 May 2025 20:20:08 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1uCjNH-0002s1-0Z;
	Wed, 07 May 2025 20:20:07 +0200
Received: (nullmailer pid 8685 invoked by uid 502);
	Wed, 07 May 2025 18:20:07 -0000
From: Michael Klein <michael@fossekall.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: bananapi: add support for PHY LEDs
Date: Wed,  7 May 2025 20:20:04 +0200
Message-Id: <20250507182005.8660-1-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_112026_305421_CACBEBFB 
X-CRM114-Status: GOOD (  12.56  )
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

The RTL8211E ethernet PHY driver has recently gained support for
controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
the device tree.

v2: Refine commit message

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
index 46ecf9db2324..d8b362c9661a 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
@@ -48,6 +48,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "LeMaker Banana Pi";
@@ -169,6 +170,32 @@ &ir0 {
 &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
 	};
 };
 
-- 
2.39.5


