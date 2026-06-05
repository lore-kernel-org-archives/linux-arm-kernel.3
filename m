Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CD0CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GanFEAB/EXFN18ke4KMogfaho+mkfI6VO/zTEp1k31k=; b=pGn8jeByOg0ie7Ksg/XsmmatRw
	XGIltbmrzSYfycdbtEAb+RKSTeJ3PdSBY05EYjgeg8AarWuJukodoZF3o9ivbAH4SNHQDg9khlgKH
	Ki/vqWyslzucO5YKR1TyCLyKloW9yGstrA1yQLs0aWfzbJagL2f7Nx4Ory/5Ie1giuccPAHPO632i
	ztAKCIiN02HUf98lX8HXAgI35mf5Ve2l9me00PJbcxNPbuNuUv/hEVsJ1L15jjO8zOcDouN+vK1j6
	i+vextT7CxLyklH216ruTIECHEy+QA4TNuVpzT0NQ8Knd8+aaLQH392z8j8ErGv/YlE18gHU3UJBd
	0vwbGirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXQ-00000000bv0-2OTI;
	Fri, 05 Jun 2026 12:20:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXF-00000000bis-2Nuu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49068493267so13931915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662024; x=1781266824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GanFEAB/EXFN18ke4KMogfaho+mkfI6VO/zTEp1k31k=;
        b=OpCpjBoKoe9Mm7LTBcc5zuiBpLf36NMOIY8+OMVqOQ+KcgihkrDxE6DeHHZjSTN5ud
         aTASxtyhAlODSK2CVJfDnguNnY3ltaM2c+G6+QsoKjPqNzA07NUXaqnfvPIzrDEOEKAm
         Wdlo+WEIxUgh0ttGte8Fl7P2FT8+D84TXqR84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662024; x=1781266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GanFEAB/EXFN18ke4KMogfaho+mkfI6VO/zTEp1k31k=;
        b=O8u3kFF/N/Lfe0uIyUipZ3Un4nQzeOGR95p+VIB0ZCvbIcxKCABUZjLW8I9AEb3HXl
         AwOzbRdZEp+XRVer/T3R0zOUNV4v1nAMrY5dUBruXGCpgMmL5vlcCJj+6y9jIYQg9I3r
         5VldyxTK5/AUGuVKOXOJoWGqB3HxspCvi8Ny3crzOcXitwrIISmSjIkXs0wlB7oJkneh
         Cdgd4+ULzKLluPQG5GxKCmRTAp0kiwSDWZjjfwv6iIUURuu8hyyWSRwg4jgA/Su/6fSZ
         WFtTh7S1WdVJM9N2JbifqPpL2Q0FMFux02pAhVveVt7/SPCoqFRsIVOE8b7z19VHcvjI
         nSnw==
X-Forwarded-Encrypted: i=1; AFNElJ/ttHalfjMdEKSB/dgzkC6S4UV7gUiEeLHzd6NLnFfrXT6d2+MzdQHNxuqDFD2l/6ennWBJ5L1lmo5kjfj58FUY@lists.infradead.org
X-Gm-Message-State: AOJu0YzIuXlI+HpG1TXWNM/Ex85Wiop//Y268r0u4iL/EtbyhFn8V8s0
	TrEfXwlMgiZ+2vlKws+itfXqm51UbsopTk5grhIiCXv9Kh3YSKNNkoWQKH8XRcLz1kk=
X-Gm-Gg: Acq92OHyRI0SEice/kUcPbt+nzJLVeN1p6QiKvQkgJMT1cc3xOFTX5cFBtm2v+JjfRA
	rMsJUdlX+vTsj7ds78WwaCC84UFugMPW9YW/1rnUqvAkJ47FC+0kyxjqKpiSpToFBh8PlIFin5a
	OJUtpT2sdhuvsgIA+hHjQmgdiSvsnIcA46qsDSa9TjpzWXSMYxJjnejzX183Av++jDkh+a5uzp/
	KksiZHZkjXeuUcOpSp8DY4I2pdUYslBmEF0AoZEofg28vYRenWNb4UeLsQE/PKNIH0H8G9upsUd
	z+21YfLmkMlLla80PWnCoK9CdZ7Si+1/yJ6R3wdjQVsx0hiEj2wiusE0ylMJgwk2ypZ4V8I606Y
	MkVGATINeEC6RtV72ndMyIJG8G7HyngEqFekWMNSiNx8bWTvoHjIhBNvL3rl4I2pp1Gc9OYkre0
	4HOnT7Mj8RtZ9k5GurCQYYMQeC+Vq+TGCG16UF6y62IB2JfTzV4DFIrA6ZXOIwRKknIfPo4Hh6p
	Q/ccgMyHjNCMDPuyVzR5NliNqd6iIh0DzRy/s7DZMcfPKprFoPFYkJxCIQCuJOynJVDKxmPfDUg
	zMsvO0a6DkoihrsLmj0egzqfye0qsP5xhH4=
X-Received: by 2002:a05:600c:a012:b0:490:b9c3:6c49 with SMTP id 5b1f17b1804b1-490c2610c3bmr55729705e9.29.1780662023766;
        Fri, 05 Jun 2026 05:20:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v4 12/14] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri,  5 Jun 2026 14:18:23 +0200
Message-ID: <20260605121957.78409-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052025_634928_18005258 
X-CRM114-Status: GOOD (  15.02  )
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


