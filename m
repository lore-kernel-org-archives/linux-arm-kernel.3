Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28A0C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=; b=aV/OojIXNlQjiQqJpf8GeSUkMx
	bg1+zshHIrHdp78lQxoRKs8NEXnpgC/RS4qKWtQGFHdDFJ2l5OZGRkEfoAECjaYiK65VxyNEBvWx1
	uDuFzNBsfntda1bC0uBgNV7t3x9ynOegu5VERXPmawtvVqTm4PAAec7Z4/ny0VjEkGO67jxuIMDZw
	XGp1g2k0ow+hu79xoIm0Vn8g8ZzYAq8iG4GCCEuNulGRWizx3Z7OBm0w/y0338tsNkJx57SO7zY6y
	do7fB/MbKk3QDVRgGRV1X4rZJ0iXEOudYdvqP0VuJcHD3imnQ0/7f6EihNC8YV5idEAeBwTnewg6o
	YvFYBo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsB-00000009s70-3O9N;
	Tue, 08 Sep 2026 17:44:43 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009rvw-27N5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:37 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso47126295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889474; x=1789494274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=;
        b=Cic/pxOmkZ3ajLCRihrNFGJSr0Mvq374hHJjOO3i6IdyzWSL4+CEUb298Jd/uAcCSE
         N17FgllqKbIgRKmUlHcQinDJN17L+GYpzFdnuu/FYzIqkePy2pky8cd60PotZXZX0n3X
         k4ZRkCNpmK7kDeH8+Jq9uSVfQ5aiF6LSEvBGJaWMYITcYm513Eito8eLrfsM5rSgMnhD
         7u7bfLniwpGrSTqCHGr+BHa8Isd6okfRKd2U7rpkBCU3fa3DeJtaf7HhPnUHNVtclP8P
         +1iltF4NZbkw14l1WGGGs9UbqqzYnz6ACuEf/+MvFXWOtpgDRIIvWs0gP9GBwOW9ZRG5
         4WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889474; x=1789494274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=;
        b=hg+Ea3OV6ex74YTBxpvJBblQtIlETOtWT7YcY4s6ponkARxi6ThuguNZltDvZ4USS7
         G1GiCJYvwTtxZbXZKvBTFMcIt7eo1r5qWwFoRr7amElGcI6RpRAWw95Wz+M9/ZoRlGAG
         yCx/8wdFXfzq9ge5dPaoLBZXzVEEelPZktb6YJQHVwg6+I1dXord0wLPERexdfBTTa6W
         DJIlMNdXh8Y11qn7JIH85J6tIgZ/rgbVYjulR4xjTb39xUe2/jyz9aLYEJ9ANKnjK6oP
         LBhIE+xKA47S6B+w7IcpacOyLx49R7HCZJNXFlaupRd3B8OU2Yh7Y4nIY7GV0X7yhbbM
         DEog==
X-Forwarded-Encrypted: i=1; AKwUvBzAzUISQvPZow1VOtL5VANDodceYfMZG2Y52Aiw0HvWl88JnnRjyL4Lni38EXmUuHfC6dwMmuoap5iMIcCREAWC@lists.infradead.org
X-Gm-Message-State: AFuF++l2EV23nyF/vrqTH4HQ2YieJY9iYEf7RFZbSLxK81Y+30mwm3g+
	RnTVa2txZzrTRPM0v0+YDZiUAMvidF70ObPUi15KdslGd6hYpHtjUZaB
X-Gm-Gg: AYBFou35YcObg1aPV/MU6yzeHoj72p0m8AVBGPciC72fVR4wCR+iWPHJNrpoP38p7qR
	+99ROygAP3lbWbJP1owGKSX1JfdEyJmv04Jk0QzOLvPy25kauZvB4y+EO7br0vg79IQ7iRr482y
	Itwufs7lNkG+nrgtGmTdXRaoQ5z9UBwkIw4ujQvZgYIYQLnkHMHAg7M06RGN2Pvsm8g3Ci6LcZo
	TIhO5P/Fwe/kkAzNiaeo4PjR/jDB0UT6szs+kTf9NodYOPKfshDeNrypcYfxbNtL9a0qoVwg1TV
	C+WHUIm6FcL+sMqmP1uRnHKnHty/9bpVHH/HGS74ACnXA16aptZ8BGg/Hjt4VdL9rtIUoJ33BDZ
	a+PQqBjjlOVsGtaAxeYq7UVx8ZzYMN1ufvGtJGqdRYJ/7PTcrEVJdCX/ag5So9dfFA3P9yNr+pQ
	2XQxx3XRhNCoKI26pVwYCCvDX0QjzeXmPgbSj0h5jNaaMsPwo1TRmegmdQ
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr238844095e9.9.1788889474128;
        Tue, 08 Sep 2026 10:44:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/8] arm64: dts: mt8167: Properly describe the SoC watchdog resets
Date: Tue,  8 Sep 2026 19:38:32 +0200
Message-ID: <20260908174259.9009-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104436_587141_47C42F2C 
X-CRM114-Status: GOOD (  12.91  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not really compatible with mt6589 (it has 14 sw
resets instead of 12, and the reset IDs are different from mt6589).

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..be215390730b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +96,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


