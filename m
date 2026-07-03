Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=dxACcC+KMogYgrlVypQKoH1pwD
	+yZcMtO4j1nLvebXouqWY9o1YArcAU7w39N9FC0UizzyL86gDMnu2xRmOvFJ8PhGMkzxguGbocY4n
	neXcWxplsL7lWPcvhqeN71FdEBaBCi3jYIiHFoh5Uy3Twkyr88E2JzOEuTaTbBpPZJO76T0s+ga+6
	5O0a7gsWRCj+ZnVItidhwcfaXjemoYFUvJsuHRqNIN2PBNMibAl2hGs8Nxx2YkDmPs3mYfc+078sm
	Hs9Q5QB55Ji0Jyv7bF12sNDd/B7lBGPByMOqp9WeKCjuFZz1qF1cE3Ss5gMOPX/iODwf6R9TuvfNt
	zIT9gL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXlB-00000006DZw-3vfI;
	Fri, 03 Jul 2026 06:52:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl7-00000006DTh-3FdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:52:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1268f71572so196563766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061540; x=1783666340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=T6ZabHyB3XfeLdDcHBpbNFNC7XTMZTQLYIa3pxyonBue3dJhN+fWOvGgwB6I1eRpxm
         +MvL4iltFBxMaY3a7CBLSeaaWasNCNWIA3eQZld9XF85ljTwYyPllm7O81MjXID5kheE
         zWcYn7TIRpk3Z3b8EtvfPldVQqT5QesDjxjhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061540; x=1783666340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=Wtb4E6iZMJ+MYH60mqrgU/AEdTFKOK3HORo1Via7I/wMJ9iMuicKFOqtEWeJu3pM80
         EwhtSKwIqrPTO64pMR3olkqt9LJYNUWoTjaP+P+T7vwajzl8N2hTu3jBmFOay54mXhb1
         n9rbLOIZxb+QLH0qkrgrGEj8/S0MHHCVyMF/wNLml5hr71hw7yt3aKtQfcB0k/LJAme4
         2BdlJLK3AY6RIcXlzBLE4r1Ud1tlP2996rjrDbRH9Xt7/T23Vc3Wk0ppM87M7sKwhVq7
         j3/hvNbViLEaU2zfYC95M5ipcY210de7Pp+ZcJSAqP/m9JQVIZU5lZWRvBx1MPsEGEdA
         +xUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+AgDhlxeuYV2fuHhx0OVZbXGBnKowOMa36+ic5RXaDjIxXbr70HeqG55HcYZjxNkehpTp11ErGetuSF+cOG+o@lists.infradead.org
X-Gm-Message-State: AOJu0YzRiZZlDMceoWVFRa2vnCA0sjXiBuwJhsizKVEhWy+M1H6nvjat
	T0LHiGyv46FJzfceguc1NJfDWarNv3DoyibQra5iO8qIBwraKmrzPIuUauODJy6Y1is=
X-Gm-Gg: AfdE7cn+RJl24ImfxD4ZeQaanbY+QIifTbriInAFAY72B+73OTYQqE4/qltryKEHRMX
	OMO57RmWsyZBjYWXmWbooZ8+09PURxdX0dntzRJwGI8RbtR/R4eECoSVw5muLQXAxtyYHTypwbR
	S/TwwY7liTYWpldhbE0XzLakAK1eP0uBfedLKxF2vRgCAoM8T5TGygIGfnjqgpAWk5synbsySZa
	umsdSfp4RCvu+AC9IyLJ6/61NWapqMezpQfmpZGT3DHe8iB1YcJij7Z2CEAJc8SIOYFVZWSdWLw
	P5U12DRGoG2Ihzwu819MR1+o2Ws+9cDq0/IqprB/RNq5GFf1lOjBSOmhjgeEbJR0bDEcV2oyQMp
	ke78VFBzbTPu2Z2S5ZOIAGqe1lPjZd3H8BrJLsKELjOVUJzH6MFMLcgm/BTAx++q6KMS5aajq6E
	rmltxLdW7dNvydrBBMbQPj3qYfY3qF+xAqZe9h+k3kMOuazDoVD0Neoh+YywT05Zg+t6F3CMdQL
	CSQJEZ1ln4=
X-Received: by 2002:a17:907:a394:b0:c12:5ac7:b346 with SMTP id a640c23a62f3a-c12c9fb521fmr113023766b.21.1783061539868;
        Thu, 02 Jul 2026 23:52:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:52:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri,  3 Jul 2026 08:49:04 +0200
Message-ID: <20260703065110.1433283-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235221_890437_F8532916 
X-CRM114-Status: GOOD (  14.75  )
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

Support Engicam MicroGEA-STM32MP257 SoM with:

 - 8 GB eMMC Flash
 - 2 GB LPDDR4 DRAM

The SoM also provides an Ethernet MAC, but Ethernet support is not
enabled at this stage due to a known silicon limitation documented in
[1].

This corresponds to section 2.21.2 ("ETH1 RMII mode could have CRC
errors"), where CRC errors may occur in ETH1 RMII direct mode when
directly connected to I/Os.

The workaround requires use of the Ethernet switch (ETHSW), which
introduces additional DT bindings and topology complexity. This is
intended to be addressed in a separate patch series.

[1] https://www.st.com/resource/en/errata_sheet/es0598-stm32mp23xx25xx-device-errata-stmicroelectronics.pdf
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi, we are using stm32mp257d.

Changes in v3:
- Fix a typo in the URL

 .../dts/st/stm32mp257-engicam-microgea.dtsi   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
new file mode 100644
index 000000000000..5b4287e86def
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/st,stm32mp25-regulator.h>
+#include "stm32mp257.dtsi"
+#include "stm32mp25-pinctrl.dtsi"
+#include "stm32mp25xxai-pinctrl.dtsi"
+
+/ {
+	model = "Engicam MicroGEA STM32MP257 SoM";
+	compatible = "engicam,microgea-stm32mp257", "st,stm32mp257";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&scmi_regu {
+	scmi_vddio1: regulator@0 {
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+	scmi_vddcore: regulator@b {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
+		regulator-name = "vddcore";
+	};
+	scmi_v1v8: regulator@e {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
+		regulator-name = "v1v8";
+	};
+	scmi_v3v3: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
+		regulator-name = "v3v3";
+	};
+	scmi_vdd3v3_usb: regulator@14 {
+		reg = <VOLTD_SCMI_STPMIC2_LDO4>;
+		regulator-name = "vdd3v3_usb";
+	};
+};
+
+/* eMMC */
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_vddio2>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
-- 
2.43.0


