Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9CD1267B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnufJVfDk1ptEUUud8fdtVXsibf/Uz5iyVkPIydfnRI=; b=T6NfENCFtv2LwCD/x7/YSliMvL
	2n7wfj8FELwvNbaw2KAvwpKy45tspckWnSPs86sSz/V3fXGbnDCHm2syS6pKAxE4pbkcEqnNY4ZzQ
	MclDEHRf9ytnH0BMQDXMIx9vNGRFPyu0/rXl78QY0Tp590YF8W0yJDCBKywKlW7iECTiOr7C8WoQt
	FM/kequT5oVvl61r4Evx1b5TSNrbv23NDjNtT9bG1oWstDqtawcjXjXwDAp9dBi2nytsispfTZJgj
	aXpMqtgp5OdZRSiYU/JZ5Xv8renYjUKkFjOONptOADaEC1fvY1A3Ad8o7ftjAcU/8oz77hoAikjL2
	X3XYM8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYn-00000005st5-2cNL;
	Tue, 02 Dec 2025 22:09:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYg-00000005slE-2hXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4775ae77516so58426695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713357; x=1765318157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnufJVfDk1ptEUUud8fdtVXsibf/Uz5iyVkPIydfnRI=;
        b=BmzC3uJJlzFBkmflPlProvbhk9hnvflCKxx1L8TjLZ2i5rr4bRLCqvGPLENwT22kI/
         u/VkPHF6RVLC58+X2pOcU+skoL2BLxzA5sMV/vUgYRm3rchKZWB8nVifMTZZ2P8Q18H1
         qqUi40haOUmfGpONhd1ve/I2Q0waP1LWmJ3O/m/DBFEGrYuVuBe547cR26/XfKCnRosl
         zCd6HiqcN3KkJs2Re7sG7d7Sldt33bDvvYLXiEXaWRX21vOi8kt9qBnR9H1W6wicI13l
         3WDkGXcuupRChufGm2wHJThEvGTIlOQuqV6n7RUathpz14j6zTLB6wa+sXZYKg8C4zxP
         ttgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713357; x=1765318157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EnufJVfDk1ptEUUud8fdtVXsibf/Uz5iyVkPIydfnRI=;
        b=xOE5jz6TXml+e8/bYtnFHEG4k8az1Nom31GpJMqKVUe30bU0sWUmWBnSDlHcckHiOJ
         JQ0ztb4KGO8XNmSRQFMAUHcaRPwXdQlUfugNtuuIppxfHgE/J2YG4TnXSkI7LAToaXaP
         EABsRWevSnRPpIxEO7WOAgkl8/mtire5bJCcZnGR/hETEfVuq6vLEUR0DSh1Yx4qAYnQ
         c+vlUc7wHN2uKla1333U0znUru11Gzlki4xFSL6U9TRX8IBmkeC0FlTLkmjwfLMcCgRP
         +5UyNkpZkQQx4WpY76TKxr5OHeisTxv0HTg+2GylI1D3I96GyiBsrkb0N9WW80RI/nlr
         LkwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0+4eWQv77J7cL2UqZceZrProX7rx0VtzL5MxwDkpdN+gMmtc9lx1yp//R30ahRcM7sswJurwXrv/CmJip7yY+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDgzYqB6owC0zs8mK5+DjyVPfwjYjxphJmRaMCBQlJwgAeMr/C
	nmJY3IYZx3JqGMuXZG5jT/EIL6TCNUPBucmSkmUTyIyH96H0xpFNYlmM
X-Gm-Gg: ASbGnctaSQoOWADVdsRWDFFO5nf53jUuYPye3ILPg3rfg6+Xn2G+L1YXduFpKUrfcXL
	ik5InJytfZEMX9NWpUj1/Aw77jhr4lJqzvtcVZk5zcJE1lSFqZ0iVMCXz5u0S0MwDDMmJjiSqcQ
	t40NJSzBXc0L3ijq9yUPPrPE9PIK5uQZ8VcQxMn/SizN2ioN1+fRhyCwMqHfyivSRznQtBW2oeX
	bvnwb3SfJsDxAvAiH3gaxK86l83WZHPX0jABuzQ2SLcSWczyfhMeRZKzH3pLQsnhYlYw1ajK+qn
	bV8Dh6dzIKcA8B/7M45QQ0LMsaR7YNEH85BBHm9CYgfE7ZPvW6uQexjRpScAT74eYgMPKKra4zq
	eLfTXSIv/2jfcGftjEkRQsP5OiQQm2FPZnLMkXIeGw75EX85VqMYioXRSXtbyrT6wh+9UL0RMk0
	Mw6BYh+scq4323a/8JPsvGdRin6A==
X-Google-Smtp-Source: AGHT+IHSDGE02fY0dReRMJgCm6advPHO2AtM2RFxT6ONrmuhjEja/3cTZ0ta85Nk/vE45Cu4bcbUZw==
X-Received: by 2002:a05:600c:1907:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-4792aef70bbmr1969675e9.15.1764713356647;
        Tue, 02 Dec 2025 14:09:16 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:16 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 02 Dec 2025 23:08:49 +0100
Subject: [PATCH v4 4/4] arm64: dts: mediatek: add device tree for Tungsten
 700 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-review-v4-4-93f5cd2a0d4a@gmail.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
In-Reply-To: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=2289;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=H+11TnPwC+Mq+Hq6buMg0dY1uoqQ3+P7dRfzirr9Mwg=;
 b=VK9xT5IUpCpuVlUok73URtudgickTfBUXpxDjkRquEMjWHUxg4j23A2ZA/QfcjVzPPvrT3K3H
 HlxmvWkwAgiC8tcVnO7VYQ/MdWh2T6tB1Hc1eu0DP2YChYJ/o/bUeBI
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140918_746986_BC332DCE 
X-CRM114-Status: GOOD (  14.16  )
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

Add device tree to support Ezurio Tungsten 700 (MT8390) SMARC SOM [1] +
Universal SMARC carrier board [2].
It includes support for the MIPI-DSI BD070LIC3 display which uses the
Tianma TM070JDHG30 panel + TI SN65DSI84 MIPI-DSI to LVDS bridge [3].

[1] https://www.ezurio.com/product/tungsten700-smarc
[2] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
[3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- None
Changed in v3:
- None
Changed in v4:
- None
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 30d169a31b10..85f338344dd3 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-tungsten-smarc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
new file mode 100644
index 000000000000..f1cf2821107f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Ezurio LLC
+ * Author: Gary Bisson <bisson.gary@gmail.com>
+ */
+/dts-v1/;
+#include "mt8188.dtsi"
+#include "mt83x0-tungsten-smarc.dtsi"
+
+/ {
+	model = "Ezurio Tungsten700 SMARC (MT8390)";
+	compatible = "ezurio,mt8390-tungsten-smarc", "mediatek,mt8390",
+		     "mediatek,mt8188";
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};

-- 
2.43.0


