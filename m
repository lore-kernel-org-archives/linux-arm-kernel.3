Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E55DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=aFGAtiwR38oSCMGbdK2p62eLD/
	j+RJbJGTMwvDmKUlcyFrRs1xGq0i3SLkZkp/p/VzrB/5KXHZ1BQZTxPfMFaLwJoAMZdCpVWNYL5tL
	l4OzwQ55Nkl0h2W9gX2PwfED3IgKQ83Eclg36yC352l3aOEB5qCSMs2BYErS868w8Uq+vlM0x+Dxa
	SxI1YBg1j25NXrX2o1aa8gXTUM8Y8isCKUaOvIqXsldYZBZgRFBkwQSytYRy/b/W89Y2LN+aaQ+cG
	qOLgWzEf69uKGAa4evzjbHJyg42yfcggu6w9ie53eFpdisZWxlaUKmc55X2pb6ty7alZHiKCD2bz2
	CO+hn/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkv-0000000GQWd-2oTN;
	Tue, 30 Jun 2026 09:27:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkH-0000000GPtd-09SP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=iY4cYXNNTnEgxFdDngrKVsb/Ow
	3DHlbAEWrsd2vYmQubiMAin/kPylmh2XJiP4O87ezqCbQTPu1uUVOwzqLjBz0sKqkf7DCjjuQMz+k
	iL+Jwm+rOwt0CUAoE+NzNCKUQ19YQFBykQLHdRWYDiCcbgN9CBYCYVI7g5ODj/4aChoOMHsZrJju0
	kpesLdrxos/Q/6bda3OI/fZsYWG3Vn90ef7v+cXwRC9IYysk0VCdZ4G2m2XBHKmEN8z6jwUBKZOBW
	ZW1qMaygpcDLzNmGFwG8bGzIK0Wlwy1+kXRU686LA7yFxVdsAsbRWNbmwG0dnBQ2br+YKoo1s0FDp
	41T1vFxA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUkA-00000001hyz-0a5r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:27:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2408643f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811621; x=1783416421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=fxvHJ08CniwYtEKAzG3iAd6nsxHv2paXDSnEG0ugfZSHyWJNxPoGL78kS7qg12qmNf
         VYbTGvDSNfxxPfBcw9F3Hy7VINh0QWx7Nuzvmj0pX5XLgbcig3FCkNABMGEiQqBWdZsN
         67L3/1w1gc13pM+Aaelzidf8t/fbEq1e22phU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811621; x=1783416421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=A/lsG0aKrm8TohqRQu3VBHNp61mtGPdvWzrQeFufC1mFXCw029Edi/qZfJY3LpCsGr
         gx65e/EzQeNyiDeJpCckWIjkejUYbX551Xtj8FdKrJDxTTkbICcGuW/2ZOvFULW+ApnW
         cLgs8LxRtLlvWWgqgaXgoMrfgeMomO4jrGxtOPc6j8mpfQcOg1JeXO9bPgkjW76bPEdF
         FFHXsF5Xu4UeskVCdP/0LSIsW7VIAuDMZ+CEVo74PUhtIW/lwYdnCSpMzx9SeZhTpHgf
         ar1E6HgKOqsEsdFgeC4KxgPnkc5gF5XXYwwc6k6tlcsoznhFUtv9ZiGgkecUuuRxZmA2
         Kwhg==
X-Forwarded-Encrypted: i=1; AHgh+Rroivm0dLPx0Dt2rPHajXtm/7Jc8wv2RToCzGQFSYwq7Wf33GcGvYnxls3Yx//jlZtakqDWfOnjvpwxzpeU6vtG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1KCcKfIVEHQIV6xPmhP80Rv+BSHI+CR2lvnSpoTwtV8mrQWHp
	3l3NuHSNVsVQHalS3JsQI8hZWBGHFFjI+qJaVHTFtaw5ZNxKOGExG9SiCZk9htUT7L8=
X-Gm-Gg: AfdE7ckDBYHFsTGIvD5gm02QKr3UrhFD06Xx1I/RdyS1WbzKyYWH2viTMjcbDkOotsO
	rEh9Q+/IKs6tVq38R44XfUaqUwM2dEYxjcq3jOo9f/Pt59g9d6BhIhvGQ87wzSBkCQLOta79IHB
	IHydFPiEZhonx8STz/4LrvRtL3OPdZktnNYk/jr9ORYSG99cA0hxADyFh3N7VwR9BJaoXTIUrGG
	wRu/vUPp1NLOs0mHGFBvLYvwTywlxpmWq+sgj/h8d1pmcd0uZtFz1Dqz/YUw9VVwUUGWfmk7Yu5
	CI33PIAT7GH8w70W3mIboJIME8LRQN91s5o+H79V9BQm2l420LMhuQHInxaWeL+rKxGsk3BHp/7
	DeB/FhPTk2hXS4V3DvODm4wZdSHZiUYl+4Fu1mwX1tdOL4RrTJ8VOpTMQMKaomdPDhzG3a13WjK
	cIF0DXS1kGevYXgLp84MYkt79XDUmGKGzR/siee9CrTrwQe2YvjrDlYiYq+G0pant1l3wOEOW57
	5WNOxb71HFMNvO8fwTckLVzkn5HCNzD1w7md7+T/jGW5PPgKdVp6VxxeG3qiM5ScypFt1hYoPU4
	tzeZmUwhyWwxjg==
X-Received: by 2002:a5d:5f89:0:b0:46d:d90b:bbe1 with SMTP id ffacd0b85a97d-47550ac1b77mr3711275f8f.14.1782811620996;
        Tue, 30 Jun 2026 02:27:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:27:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v6 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Tue, 30 Jun 2026 11:24:43 +0200
Message-ID: <20260630092628.1695560-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102702_807176_9868692B 
X-CRM114-Status: GOOD (  14.97  )
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


