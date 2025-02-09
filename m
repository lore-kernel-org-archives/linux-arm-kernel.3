Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0067BC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n14WLjNeVm3jyFICfo3nmxlNSDZ1JTTnxOPrJZHnJuI=; b=o/TzMsQoMwTAD13nJlemj1yusQ
	q3JsVAJiBU13WGpIjHa2vBvgvVFPCTjLpWIEi/NW4i2juapHt1C6v8lYVayhmTUO/WArbo98OQfIW
	NduazXdYCJnsXddhcaLq5LjutesX6tCuOfqBzYx9ypgmpKyN+5Dr3HP7Zs1CWfHADetvneDvINaOF
	LEM8Zri88cRVsEYgKVTBTqjVXgbjmvtnxi8VBYAhJrIphWp22fd7F34LFM6JJfgzSsxX3Co3LWemS
	6Psm9W0JhF/DvdUhBClvhjmdtcDQP751QuDKYV0R3FurG0A0zCnhVfDGE/7nMnerJWVUkKgDxCCYA
	K9tMr3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFZ7-0000000FfnC-0M6E;
	Sun, 09 Feb 2025 22:14:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSI-0000000Feg1-0eo7;
	Sun, 09 Feb 2025 22:07:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dc962f1b9so1372041f8f.3;
        Sun, 09 Feb 2025 14:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138828; x=1739743628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n14WLjNeVm3jyFICfo3nmxlNSDZ1JTTnxOPrJZHnJuI=;
        b=cGXQ4zekFiehHGX2GKUpCEi/iBXKj0AeKMKFTCXTXQOXZlGESF9LtolaqQo86m6zgr
         Vj4UUHnVNiJnpnlKc//m71VCnAoz1bHrwwMv4PgRm+1Rr8WPvLcxwjMFqhT6aVdOK2om
         fgcOJs5fK2tj8tGG1SKkQuIHaDvG3+U6+Z20euGj9NrWFndJFnD1BHmFGPNCEPkGTzSV
         RaNxgPh5ovT2WKEe1S+c2BdEVgzfauJCOWYJSyqwMq+IZWEvt1KhQzDHH4IbmP6VYw0T
         oudp/4NA6Iw81+K3h0QxBrUJ37iduoAMyVkNCutsIl6RkDtx8JVM5E0af0UONdVxV4XN
         X0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138828; x=1739743628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n14WLjNeVm3jyFICfo3nmxlNSDZ1JTTnxOPrJZHnJuI=;
        b=X2boXDmUhK/wA9NAqaQ0amOD/IugWnbN1jP17sRIg2hthLD1KmO9NefgZuuTRA+bo6
         Z+06PBH6ZGktfs5/Up0wbvgVU43IxtXlbt7CZzEQcpkJsWDSdoeuLHYEOAJIokeJZW1Z
         6BCIKucOV4LQ0o24JzXMqrfYKJORSKso5gTqwy33kjk1AuMRpLoAoGNpMfSrJrMe9gVg
         Yp/feSoBJWxJAaFXdNK75N+iZuaOTgPKusHDrgITfe1HzBYm0iY1U9k5B9S0W47PB0DW
         pbiV2p84wT+ElqucvuYd9nWE3IPzcbs7KxTLH3sICkT43GFPWKkKxVFYNAqID4PuhOEA
         rHdA==
X-Forwarded-Encrypted: i=1; AJvYcCU3NNgIJbVWxM2vobPVZS5upyqCbiTZhGTUlWDpWtMfYhiDSKBwMr/PXvLnCVbZhemQA7omf+8BDqig5+M=@lists.infradead.org, AJvYcCVi8Z5Nhue+xChVs70BenN2LFihyvoTWNXEhWjK0/2/2A20w3/7s+OapuJWVh7u8PdpEQskR5gPKs/RxXWqyn+8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3M9v516sPxy7AjUbDWOv2b57rnRLCzeQZMzhsxLdZz5ZpoomJ
	iqSOtbrT66kNxoscJ4ezhI72qBgNrb8VgH2A/WREP12vMGrB/55B
X-Gm-Gg: ASbGncv0/WeR4gmK/n8DGVCdmbeXDIh3abLJwjP4llk3RfH0FPbBWH3yx7MqImslk5Y
	vYqOUUWxG6NslQ0Ts6OlSq3mjkCQ41qqFc9M7zeZ73nZorgktpwoBjtULqi5eae7jK8STksqpNa
	8mjWC/B1IsGkBXtnLDt93L8KUX6WtCVQneQpJMGqvr1/8rrareSiUWPeSL3JxKEBDom3cjZkbv6
	pTF/VRGkXherev6NiPbOMg28wtGg4A9FkN06kToWZwjGGyuvFNtuIhbS7QetlnDhPXzXpOvJOlY
	O3SWjaYwlKAoKm6xHctkOrpvP08q
X-Google-Smtp-Source: AGHT+IFnnVaS6q04jBo0CqYl+rd5w1TnOLdiL3DvrdfmPcV54sx21PtnBEVHObPWcPkV67SwoWEUWQ==
X-Received: by 2002:a05:6000:2c2:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38dc8d91f1fmr8017485f8f.2.1739138828332;
        Sun, 09 Feb 2025 14:07:08 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:07 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 04/10] arm64: dts: sophgo: Add Duo Module 01
Date: Sun,  9 Feb 2025 23:06:29 +0100
Message-ID: <20250209220646.1090868-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140710_224035_09AB1FE7 
X-CRM114-Status: GOOD (  11.81  )
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

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000_milkv_duo_module_01.dtsi    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
new file mode 100644
index 000000000000..7edcc4d03cc4
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&emmc {
+	/delete-property/ status;
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
+
+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
-- 
2.48.1


