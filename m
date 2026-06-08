Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439ACD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=cUrnPHJtM22X3jW100b4zM36aj
	VIoVtQqJ/9JU8cL78fOXs40ansZfiLyzpFX7ClYB8uN/LcvwyqsNKeepuf54DVk1S/VhZlJ9u1MC1
	3kFiC/qgLdOAJnySoroAvtvV+frqbPIwAlRB3hLS6F+kSWv2gRFUcl0TxOxiN/iG6V2A9NNvyLaeT
	V0KSRj6X29YY9D3k+xA+oAxPp4BTMMbhk/LhLTgz6Or53HpiFzvIvoE7lUZ3KxU+Iyj2axo6ADe0l
	g9gH4IJI+RttKIrrnvL2D88buWjr/SDNilx+DDBSfoBqZkTCLZ63wj6R3EEAogw7plvl8vgWPfvvm
	xqe0Iy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasX-00000003jyK-1Q9x;
	Mon, 08 Jun 2026 14:23:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasQ-00000003jiz-0GDH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-691956903abso2665675a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928572; x=1781533372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=i7ffKJEB1MR27Er1MlyrKsE2Lb3QRiXhmFJkU/SjFGbiDAZxUXU+mIrv+v4WVRz4mM
         BqtZ7WK7EaD9JgqMeZ52/vcSDy4tPW8N4q94D8M/QDFpgjtbDKKk/T7JILK5KHifGpdb
         y+S4xbAbNfJmBRY0rJhoffX0uyVY9PYKGPwoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928572; x=1781533372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=hiuRo0XdbZ23Kf9KLsV5EXnThG1SM4KWfOfvwyeVS47H978zdkRNSMZnZ5Ufqdk8n9
         YJsBM4/H36a9o8JYl0gTmJ6jku+7J+CbHhbccM14/gRyQnV/Ko6Gc3efexQ6YcqPP9+Z
         RE++cdPuU4RDum2eoAkUj6wd8MAtUyXxr7rwcw2lg3SCmaT4R6zbZYBo6MY1IphcVdMu
         1QB5yd/e5qPmgCE1Dr3a3CPW1jHhKk+l3uGZUUVmD8liVJJVNe+OMz3icaoaJusT+fmg
         nRAHXg+KTNUF3NdFAqQjeWo6206hH9E7EpiHUqhZh5ofh3Dya3o5ORSrJU69ol5quBr2
         ElOw==
X-Forwarded-Encrypted: i=1; AFNElJ8n7bi1T6T2m5jp7Arb2CvSJKWQ/zu6YYQphFhauqjyR+aGrsUnhLellDzMFJeT8y8IGNLgdnxRLqNeG21sYm9J@lists.infradead.org
X-Gm-Message-State: AOJu0YytUmdiwuSAzT24dHIUiKdg7QVc8OnvWvTZltmtuABQg1a0JDWX
	2Z6yCVgbT9hA9oMTzCngBfzGgDOC6B47V+4IIu8UnVQIIjWN6XyStrf16KYt927l4hI=
X-Gm-Gg: Acq92OHe3TDZGGQVVg8RBGOlX+bgdcrlltFS710xL7JVP/7V4y8A3T9fkPRhFNrMFOH
	bySrSAVeGirx89+Ynk7NQjotRqiDfGblrM8/6cb1ZhB1/0XEF06ms002HmUaJHu1f428lBN7Z6o
	FpO4z1qrtHcDNCty+5C7seOGIirWDqcDkjdrhEp0Bfxy6N8O4ka5/7cALYcE+F50Otsc6JFcgdJ
	0DVX07AOFZaXPPeL7EFeyPya7zrGrdAkl/zgmkRTLNdbzAs80D/ryeWyfwOYHld2qjhymF2S4om
	JkC9e9oNIkZ84azh+V7vXLtbmW1bDLpzgvq18MQW2mUvaB+dYafjv6++T2wlNVZ97mfgVtunfur
	F8cbyDS0AQSYANV5f15gW3y3+g0gYy30qIC1KGXM44vuPnFOxmM/ofrlpDvjZgmRc1lrqu7IN96
	Q6AKH+Bl9Y3wrAHYqF8xJhptBmpxsS875ubsjWp0rHfCS5pEsevNWJzn3753M8HxJIUWu0iVoB+
	0shkF/6S2BXNkNLmwUH8z01PWNIOBSUTrNqs1QANGV9EROii9QGCsacxuc=
X-Received: by 2002:a17:907:2d89:b0:bd4:4593:33dd with SMTP id a640c23a62f3a-bf372b2ce9cmr731057466b.34.1780928572008;
        Mon, 08 Jun 2026 07:22:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Mon,  8 Jun 2026 16:20:31 +0200
Message-ID: <20260608142221.952245-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072254_272828_A5C8B5BE 
X-CRM114-Status: GOOD (  14.96  )
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


