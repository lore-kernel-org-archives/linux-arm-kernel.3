Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA6AC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=SokjqXOeES0z7bFHEh78bUJ/x4
	o6R4ZLHTkQekUoXQx5j/A559iRmWnzSG6FfydEnEAQVpJr3P2NwP+tt3P8VRsBrxxOkVMI7pxf1js
	7fk2lR5CTMjumRnOC7L7fX+XguZrVINOSXns9bceUpnqW7jMiVPLTZEsAeSFK/hSje2gEd7N8SKZr
	QS/EqxLG864KdNJLZcQQsYweVYbkGLOcArPuvbBaBuozhAbXa2W+jDr4sdx6NaFT0eSMOaPrrsJBg
	5VGuDopBsWbDilROBXJnrjMGDARCZ8J3xwmn0KfKdyMEiKCEsk6WS9JwVeJQIN0rhzJUmmJqLBGwA
	a9J7CTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKQ-0000000GXpW-1ghK;
	Mon, 03 Aug 2026 07:43:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKL-0000000GXhA-2eHx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49553515a8bso28268305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742992; x=1786347792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=FrInMeOjSPkqjcA0Nwr9n4x/1xCytriAw2L2UUfz7OT3LhvZs9165YNjwAUB6ubgPS
         V6NxKvm9zYxnCYql8hYO0aaj0w/k2Jmv1qjvgSoeIizTy/CI+2ORiH3YxGnX/9d6FeNY
         aP0blWfPx41mIQsHeLp3Ov6iJtWB82YIYYTXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742992; x=1786347792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=AIYeA1kVK6ESghQ2G5xccbYrtRpFG7bY1VmduOK3S5XPH9AUUu4zUJFXbknSJMSeEd
         nuT+fvNdWiUV1ha+CYa2YSviO5N4GOVdMrqec+9hX9wL2D0vJN6h2t+t0BDKyQVRNRq5
         XrDJNt2caVVx9hl8G7DdniaOO1At+myiAK3JNcilxSUPdENLGeRydRdCuU13HMGHdxXC
         vac3fnyRIG9zwkIBl/Dq+fNXbWCXaB4/zVtC7tZ0tHQ2py+HhOp+X7gvyPoQq0xPM5N6
         wnsdb/2f6zPEwH49O2H38p/vYJHnDEDJzjnTJjanD3zrMA16NNO678mRzhEzaObjx3YG
         1ZJA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2/SZkgwWVhL1lJr1mw4k2QfTEeBYT8Y/uDXkubbpPSsk6fZdnj7egft31STRfNDo+Fi/JZK8Q4BPP5CwYinSL@lists.infradead.org
X-Gm-Message-State: AOJu0YwPs0MYz/XbDfkNA2sfnMPMUyxhsHbiMJSBg7iFccA0XjlpKI38
	ZQ/IpwpoaDszOBUFrdialzW1C1al7Rp49jAdEaaXMb6yz8U0UcdL3Dk2/h6GI4nX8hA=
X-Gm-Gg: AR+sD13Eegghz4JETKTlLu3pslF3sCFzjCg94ZWmDdCmKaZrKpUD1JkBLRMGg1R/bgk
	B00DVaCebMT3EYUTWOKAS9NcdsPe1JTfqTuC2TT0hwk3t73AUSecTDLSDiv6Mb2yPp4N+mOCHqs
	c7uKv994wgFTEJuaYQJKaAiSUWDbiOD1rKG26I8+VqouD62Golz1boKx1dt7sHuxRZLXSYwZfLQ
	5IAy500L0LAZ2jjAZvAYhF5h5ZE+Oy8pCgodwLKOmxOXOvTkHGUeTiS7ig4LIZZUYlIehct/fSd
	VAbhvjfZicgl6LYo7CixyKuwmtE2BlIrVdiQmTzsYPjXL11mmawc8SWG1gicCNWrWMMW6MGGJsP
	91E1fE8yMjCGGtMr8Pcjmn2v+gQ5HIeGiO9GNhAuA9L0KsrajX2NTdTxcMtGFylX7C1maynRw2W
	Ds6svdSbdHw5bB9E38s7oCaSfFSzt6lIm29uwcDgEkfu2NNkStQokXqeowbxz8lRr/4IZ0nWDLN
	3KltGavAeCJujMLkzR1UEcw7xqrzIMpDIPNBerZWBT3IKXxyuGfVAjsnx68lB9MQ3wmfK/iPsLl
	oXMOSu/h04wFFgdxTopsf/dCOG6Ot7ndT7h0JpgJ9NVNIxBsvyZuDHJqrimtvSYfrXGmk4e8S2g
	=
X-Received: by 2002:a05:600c:46c6:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-4980c674700mr177583805e9.10.1785742991694;
        Mon, 03 Aug 2026 00:43:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH v7 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Mon,  3 Aug 2026 09:26:09 +0200
Message-ID: <20260803074224.3821911-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004313_695159_59A7AA1B 
X-CRM114-Status: GOOD (  15.30  )
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


