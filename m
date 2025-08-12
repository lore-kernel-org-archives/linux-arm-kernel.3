Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BCEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJsccVD+aJSM/xz8OFfe3UWNNHj44ZVnM7wk5giEoiU=; b=CTT/SQEFkJsbvJjs/66pmpa71F
	/yNRamko6mBNSU6kjPhdw0XTr7xSDsPJMsMJI3Q91E/nBrMr/FtuIYipHhlgB7YMjnFuKEiIII58P
	+pqkqSsZq8PunabjJSnXBhmID0OlkxE8yAVxRoNl859q2XDtGy9HDbV5GQVDcoXVjuZXLIzkJBJKU
	Ak0gNhVJrXIkK3jNxteVjCYLYOPxL2og+V6ZvXokQkF9S9DbgezmrC8mBr7O2SuQkq41UqXwmg+Ff
	htUBnoVJ/eA1hcxwkx7djfTucyG8lg+M4niYoiZ7LSUwH9RkhtTUIn/ASQXQiUmJvMPwbwBhqgXmW
	BLOkaYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIZ-0000000Amtb-0j56;
	Tue, 12 Aug 2025 12:40:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7T-0000000ALkh-0O5W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:36 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so8206527a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990193; x=1755594993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJsccVD+aJSM/xz8OFfe3UWNNHj44ZVnM7wk5giEoiU=;
        b=KksAXdZIXPdQXqE+kjVStBsMbr399fuWJbbWOCos15Y2O6dsk3lWBnRCmoBMH5jXuF
         oQRfHHBVPvS/WJyimsdNekhYX6/OUVjpKFJLhKStIJYBa/E7jkYU/Il9BKQxfxQvYwL/
         Y1a/VZmENOaO/BmEFGg5YW0jED+vz8zolJHdPATC8CSLCmqqh67y94N6KR2OGEOF4BGQ
         AqWVMOKAr17T/GQ2zmBlN2Vo6XwQsvkJHYBW5k58g5Mr5X/ix465GPbl5bts72HzpA0C
         6ifHz6DY0fMUJYw1jo32ZyD2i6g7IHweNCCQ+0hjGRJedNsmUt+JzJ1NFMs4EN+02my9
         eTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990193; x=1755594993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJsccVD+aJSM/xz8OFfe3UWNNHj44ZVnM7wk5giEoiU=;
        b=C3bEYUYnEg6KJS5ZXdUkLLes3v9Uvdna2fyNC3xYp7YfmwWTLmit/+CmL/o0XQQ9qh
         pflCbOhudYvJc5Nbr5TrIeJopbQNanbHgAoI/NSln0DhpNOARuxUNK5eMYnym2+09DN/
         g4rwckSoiZdS4VsOilULWYYxhwq3rJvR3Vv6LNStJZIqDZdvv2i4fld9uvm92iuYzvEi
         7/hZDZFxrP5Ddcjr73Buh6gXNSBuNZQBxLwBohOBiZBkv+bzZJx4uvcK0KmXLBa+spwE
         tA9GAvSMecBaLnJJq0aD92nPQWH2Xq7ZX6tFsoqslffK9B8yOGtq+bROcDHUzYqFe3kV
         ZmkQ==
X-Gm-Message-State: AOJu0YzgTd6zmyJGJkfHYfJ0NHcpDm/rtLSjiGgNn3c278u36Xzaxn+S
	7toguxVGfq+nSxHFm6Takr+z+ioSI5p9DjhrHU8OYiS04IREnBUhi2XuhMrR8sN7ZhA=
X-Gm-Gg: ASbGncsSDcMzEdsUh27jxFvzop5O/rC+qzM7+WfaCJqzbI7hp1jWIbYgu+xAQ6KRmWl
	jiPfSz28N1Py6GqWuaYcnpaWh2JVNK3lr5DE2ltW8MtvOBHLGZVDjJ4i+PZH8zMDyfea9BvI6gG
	vY5tYSUTuz0arCMmxcdxcQ8Gx5JMWAyPGnqLjs8sNgcp7RLooiIa8T8WlAPi1ku3PmFkMURnoaX
	E3z5RRI09niZ7O3+B+OkeJlkWoY6+uZVHxxl9EET+FaUeeRNBtB1svEOqXqBHGRFQD9xTHjbmHp
	nc9Vh4v+QRufJLxUvcYiv8G/K9eYJDS8zpz8q9XhUX8ZcTl18oR3eYmKL6IJU/kvtCHsNZq6n6S
	p8JIxI+xwktVQk9k1NQ==
X-Google-Smtp-Source: AGHT+IHvlAWtPFCu8ruDDoIMl9S+xsCpa1UFgIk76RM0V6av4fhNT+x/UHIr6WOtfg2QDY55SVGZlw==
X-Received: by 2002:a17:907:6d19:b0:af9:6c74:9612 with SMTP id a640c23a62f3a-afa1dff9230mr212706066b.8.1754990192821;
        Tue, 12 Aug 2025 02:16:32 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a219ecfsm2165122366b.94.2025.08.12.02.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:32 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:21 +0200
Subject: [PATCH v2 2/7] arm64: dts: ti: k3-am62: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-2-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=msp@baylibre.com;
 h=from:subject:message-id; bh=d441FgCmtsa7ZpzbwijgZYrCnzk6B/a5li42/hOla44=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbE4tHFf2+ExsFbAu8fe2EwiKseXpnSx3dKbSTOXou
 +d2/VjUUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPx7mL4w8OmypD9yHaP7Z6a
 6tdGDjJL6jKy5ujMUrnEp6C04sU8f0aG5uivfkuP1e3fPCXAdu3RJYIKfavj9L3VbofN2W1y4rM
 WKwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021635_208674_69F2E0D8 
X-CRM114-Status: GOOD (  10.16  )
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

Add the system states that are available on am62 SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index 59f6dff552ed40e4ac0f9c7077aa25d68d3b5283..b08b7062060ca12ecae83917a831ee779f1a288f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -46,6 +46,28 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		bootph-all;
 		compatible = "simple-bus";

-- 
2.50.1


