Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63609CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mclTzGDSUSSOxUF84WDRq2fQHJYlVhvXl7S+nUy/YMg=; b=VWAW3G4mCjJWjHs9bdxgw8Ed7L
	9kFpNldIT0lCLtELfl4tDmkPLUmW8sHeCQ+mhvXF0G9TtD8k6TZ5hwhW+Q2Vp8uvU+6BTPMkpJxs0
	CTIaebnLsTpERWQkISFifo27nCaeOtu6hzz9Bly95nhwkIXGLpn1NHYoah6rrEdeLP3TZ5La0pMMK
	0g0HuE1mrsr8MoiFXyGSYcQvZyiRbuKUSOrXs85oNm86jqyCfWKc4TTgQbspFfDRvBs+dSwitjk93
	12SYct3JiEklR2QUFljlbCiBiBAxFkvT9JLayqjCVGGkjqi5MBr3xAaBVaiHgIUxQzXniORmngc7Y
	PsVl8z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3k-000000009uB-34tX;
	Fri, 05 Jun 2026 06:29:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3e-000000009ki-3gbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1646709f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640969; x=1781245769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mclTzGDSUSSOxUF84WDRq2fQHJYlVhvXl7S+nUy/YMg=;
        b=a7uYbDBZWhC72ewzZa1x9Kv+udwHUhTzyJ0MxYg0k1xpgDm5bI5h7kFSfXQ13gqeN1
         wmYmhHWDUGbZkDlKAXXl56IUykQ+TlXYZG5Zyy2kJgOg0ChpR9gkl0F0OAEDVowbF6S4
         zBA3/jxeAmlRzP2EGdi5oe2BS8u2djCRsTzDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640969; x=1781245769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mclTzGDSUSSOxUF84WDRq2fQHJYlVhvXl7S+nUy/YMg=;
        b=h+qQeJTOuZW2dVz8OimD9YIDkh1676qvYA7wpD8qjW4iXiUryTfn2aDIJzB7zFN/un
         +bQozVTcf405w7X0EYH+zfV5GMSXxZ1QiAK4iPVr+R0zwxbg2y5CWOpod8pC1ghxxUNx
         rmCC+UMlkyWOnktNN6juMga2M7v+w+C3UWhUKm8XpFhvmmcZKYzz+39yu4ivVfoib9CC
         8WEUKNrnqOHEzVGx9pHh42PQSgLTlFUC13y9XocYfxAiRwgtbITOHrGQ4Zd7C/5PjFUm
         QnG1tbyzVrD8nn6kpgqBKQvMSWwCnlmPfTjLN7A0Wey3Wp6QH1/1cometoN5fixQEVj7
         OAlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kh7WE4blsFWNJS3CzLFe5L8fm4YDeGF0thUER1jbL5XgfCb7KQDREW15b0RyWPV80gfKjsE4auMdxLbrrFhHj@lists.infradead.org
X-Gm-Message-State: AOJu0YxWBUCbn/xgkvDDpqGvI+vpB3GUexJ/fapxVqLidUFWdL3N5N9e
	7FefaBQhQuQnlXJptdiyPAT5seJIPytoV1sQDDrywF4gRCTPwQnrW/ts8PFon8lqKDo=
X-Gm-Gg: Acq92OE0SHYmUbh7YhfbnPTVOtu0yKsvRW6EebFdzrVijzGpie3QazslErsV7Asu6do
	vW52ksi2yFVtxY1c0XrHpQpqvZhD7rj061Idx9rH0RRYNIUJ8lohbYqAhzYQeQgZ1hJT9/NNuyu
	tYZZAX1mU18QJIdbSpT4v3682dPqWOVhhnQN5AOdg+tMBF6ZvFwAdf/oGTRwuZjjNPVIwV+hd20
	AWT+KUcHVRCesFYSU6eBdV6alXbf6owC3UZr+R4VYkg216/oekmLDh07IdThV6SULE9B/N/ftla
	TuX91l2wqq+IkSbnofKw/LAaMJYcdwAa6UO8crXmpkvgMhaOOKYYXfilSYhaCq9K5AgCwL/gsZS
	B0sPFo3ovqsaZ4vTmX5Ddw59XAmqcU0oyrn2aFrbo+CtV2iiIt76kGnrqnV4Uk0lwBVQWoHFBxt
	jH0YVdhQ4zK+d/W/NYcR7PcPrK7J48R1CLox6SOSLACOJAimctN3G2uq4z2SRUZt3Chmw5aMDK6
	fiZKfnHSBFB3drxYY/Og+H3kB2qRXU7amjl9UO4p2+H/wyxKe9oXeYeD6f44TihbSZokVBn5C7K
	CY/brNmvLgglOteAO/P3LYWq+wwilA1PDmg=
X-Received: by 2002:a05:6000:400e:b0:460:18cf:d49b with SMTP id ffacd0b85a97d-46032dabbc0mr1671442f8f.15.1780640968980;
        Thu, 04 Jun 2026 23:29:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 12/14] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri,  5 Jun 2026 08:27:40 +0200
Message-ID: <20260605062900.368376-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232930_954869_CFA37B34 
X-CRM114-Status: GOOD (  14.67  )
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

Changes in v3:
- Fix a typo in the URL

 .../dts/st/stm32mp257-engicam-microgea.dtsi   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
new file mode 100644
index 000000000000..67be66cd1930
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -0,0 +1,64 @@
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
+#include "stm32mp25xf.dtsi"
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


