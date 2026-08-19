Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0255C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=; b=h9yD6BbcYntmGIacQe2iREQT2Q
	xXN4xwofFYpZ9+qNo5P9XBfZViUZ9Vlw02loltb8BEqs2/RObabifWaRr/Ptj5jrlrMWRk83xSnQo
	aaL+Rh/GpAfAWImBJcfiAH1PnBZKGExqY6exwyQBcPAdF5nHqvWpd74243gpqDZNfVguSgnv6awEP
	uegUY9YbMNBqj451qc6IMoZ4imr0nry5B908yLc76tKAuyplD8TwlyEl0cuzyGVCp/4Bz11emZppr
	63RBOgvjOmjUDfUzDbY5IuByk5UWvg39alkdkBpaUCzKs2k18O9uvvwAxikpJAElyEpZjLztKN/UY
	vkLUaHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdP4-00000009WXi-3OA2;
	Wed, 19 Aug 2026 10:20:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOK-00000009Vz8-2CdC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4980dc26022so8683235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134767; x=1787739567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=;
        b=TyjrUsL+NZybtEoduTjpvw4L0hzrQ8Mzxa2i2nQsqQsZ3fP7KLduwz3OckNhLQq1qV
         NMRzs79dCNNf3OBP4tJSydBGXpImu04Oi+Oy98Q2U/pm5lRiwDLd75qMxXpwcQWD5PIN
         je7eybSGm7OsEgiEKDRjMbJwOXYatml0t9cFv6OSEP1aLZjwL0XDUy3FygdDqG8hZYoS
         UU3hicNnf3XchVnjjqagXVT3oDk4AzDU6/9KFHzZDPVzWfF4Xqx8l5b6rqujZWPSLWA6
         bEt6wnslpnLzVfVKE81ER7d5fnueGaPyJhxf0m/ms3W4fnAIUVZmkwifcMCf3jJqDke9
         UitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134767; x=1787739567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=;
        b=Z0z8AOw6Hceuj/699b6Hn6ULX0sVRRySZdD+NZbGINOUT7SLabNKKvZiQmNUNpLW0p
         7gucKFi3UpFJAmqGxxDGyzZcVz7AJGLBsmFF0rdyczmvk3g+urudTCP6ngKoI0RvOuHR
         NXzFRwpIEm350Kw4kA6lSuwbUi4WomL2Gne5iqKGwux1+rQpqG7i5ikqbOcQrM9UpZ2L
         UPfNmsJgvbynh93t6RWuvWE3H/ZsJ6v5Oag4sSncCTejO1TM9Z56I+YbuKUXqmpBfnlK
         ynaRz1Udh4nC2c2V5uSfbgNxzIQorLQdwCgr27jzboAv/pxROblHpJYtXxT9g9Ky+Z4A
         E68A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3O2x3oyT2Sv5TOKhwspjQI7eQbKlCqZMn/s8naxF220w8P+IMaCoolK1+ifDzymdvU9UcGZjf8gwW6WXTfQCg@lists.infradead.org
X-Gm-Message-State: AOJu0YzD895xK1XFgkFRg3H/qoq+A3pWOxlRMo/mJfEF6JlGf38Wf+0Y
	4n4tuzczUeYjickMwBG35RhH6K/5Qk9z32sFaTjFTES1uLVi5PURysAL
X-Gm-Gg: AR+sD11N3JUrKHCpnMVeJXCw0WJrIiOGotbMoWoNIOHR6pW5WLs7b5CmaBI40KEDUnS
	iDLMGZjyJkB1JAxJ3fJ2UDKcbY2kPhbRszW9NjTBcc1sx/MNTkpJplVlp3Ddyw+QPX8Z3Kshu5F
	gQ0Idc0dja1n1uuS21SxtNwkmjALYLvOt6prUoKBFj4L9Uoemq6YYcWTnw4uJUfGBTLZHRCC6zu
	2VVsK6CrbecHhJZPkr60C5huDGjeDScC9HnQ4ALqDnhazQHi78Dy5V3IdbG2gD6YU813aJytMtg
	lZCCiCNtxrQ7Y7Bx9ayVQIX7otRaBfbaPjGCpFqZoKCoD652oYxXHKAZcSP2avSpHyjtkSKF4Vo
	dFMn1jngIpt0h4bnN0k8Nbs6IwYOeBXE4YFkBFCcYxW76+gwi626/bgvfP8MQD+6+shXqS/F5C/
	Kh+W3kO8hKn2zZKrCS8ipkSBmX49/TWqZ8KBksq/P3PUm0jmumfxHdrnjsIGLDW2xR
X-Received: by 2002:a05:600c:1d1a:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-499aa1dde53mr59985075e9.10.1787134766581;
        Wed, 19 Aug 2026 03:19:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:26 -0700 (PDT)
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
Subject: [PATCH v4 7/7] arm64: dts: mt8167: Properly describe the SoC watchdog and mmsys resets
Date: Wed, 19 Aug 2026 12:16:28 +0200
Message-ID: <20260819101853.44681-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031932_295872_3548AE19 
X-CRM114-Status: GOOD (  13.63  )
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

Also add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..cccc487086a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-mmsys.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +97,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
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
@@ -124,6 +133,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0


