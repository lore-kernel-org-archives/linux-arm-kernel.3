Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F4AD29FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4so0a8WT2CR2TaRPtxXWnlX+M8XXOTE+f9HZTDZHm2s=; b=iMfeWBgOl3PpNDRM8zAgTCQOnl
	M5H7tDO2n8WIV5cBb1Wov56hru9xAHs8u61djD33kRv1BOHtIEOZPaoDYpe+2VJbzTKwspK0/VXvw
	A6po02VAzc1nHFw51Nt+JkCLTApj0BlRxUZaGaj3N8VFS489NqwRnVxUGhgwLnI/dS+Fk73pYyWfx
	ryr1HthClGqZnzIhG/kTsXg2X2+L4ifJvLth8jbvm9hFebiTZeNbBLqd5NcSgoHRiNVp/4jTZN+8t
	/7iCQFHW731uw7co1aiaawWCDVH8oN4ahU+FMo7ZPGfe4s4Joi6L8ts3/fgPpmLoZHkLGwwsojZUi
	IvRP8S8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLs-00000008qUU-0qsq;
	Wed, 14 Jan 2026 10:43:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLo-00000008qQY-3UYd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:43:46 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so5016627f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387423; x=1768992223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4so0a8WT2CR2TaRPtxXWnlX+M8XXOTE+f9HZTDZHm2s=;
        b=woZW7STTcBUvr3h/E2Izdhgl5j6fSKgJZV7sb+hVLgNOEWQNU19hjUwVANsOkBKgwa
         CpATAmJSQNRRuY4zfBdKEfBJpKtJH4isAE2pX7NSo6aCCur3H34r+GG4WPeN5IYyCGno
         MLor9yAqYlQ1U1fUEJZmbykKTbpxfLwfm7H/A3L9WwSMN9PqZzqvAAf0xf0ay2J79fko
         KTJf/LXAnVUDpPhZSieQGbiZr2OU5+odyEdB2w9/N2rGxRH76baX6fV5mTf8h6YNWZso
         7QfCEyMz/6GWegUwHjWZ/mXOIyMmJCyGvQyo524cirP/Vgqgiy8ekw2iSti9Nv08xMr9
         VD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387423; x=1768992223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4so0a8WT2CR2TaRPtxXWnlX+M8XXOTE+f9HZTDZHm2s=;
        b=o/u8CQc3Q9W7HNziP22RAPA9vDLt1hXhF8PXgHExcpLHrb3TMknbTzQAitE7s7F4p4
         AsfaowhnZ9vy5uk9eyq3aMnh6YWARm1X8fW0PUtekH3ZJpUNqHFu+GmxATL7lXlGFgug
         Q/7xeXTmD3KO75Vmv1yMpqoMcZVk3NFh011l7S25qUOk2cH7POcUif4JRPnuqoD12x0e
         UPjJfHnEb3HFG3NU9IhsbZ0pGoCFEzIQTH4yF0EHKhcyDELiHKlmFhvTfXGve55AQg9G
         WBtXyBjc55Tu3OFx9WIJGf88Irj9QED0NRO6XZ5ryZkN+RPEC2o3PrFkw9yTycM3/FW0
         M2xw==
X-Forwarded-Encrypted: i=1; AJvYcCVTr2F4FbB8XgPcH2EP+QXm+45DuVe3BK0KHBorDAynYJKkgO+IvUBeCU62nNTzNvd/Ay4wlUrCrVF2gHMhs1Tl@lists.infradead.org
X-Gm-Message-State: AOJu0YzOWz8RL++wH4BXociogIQDlF8bKJ03AbxC1Ws2iXsVnlQ8GTFv
	kv9RvDqFueHdpxIk+6SsIWAb4dSvFHn/JGueZaQC3YDh2OGy1mtXRKUsS6cqzNRQPW8=
X-Gm-Gg: AY/fxX7Ga+FsHvWIYS80KW6rl7T+WvSOCqMb9eL7rL1rntU4lDuXqkA00mmMqDCMz7N
	Tz5Ttb9P6w2WN1RulRxOen/mNFZU5RScZcUkE+OEsmO2zu6BATTw0FGmO0/Xfj4iuKDVwfc7sLG
	bHuvpA+QEmFSzlpAZh8xU1ALB+/gy0856mm1oianlW7KZKxYPXKnpBXq0oipzmGk8I9mw7dZoNG
	mKbf138gFZdgPn6bEYn0wRvVecIcvLwRWppl3o+5WT94r7VRUY4RIM7n/XxVyww+yrRLmcAJZEm
	R2TR90gV6r/HJ5c4f46RJOamerEPcF/LqmvNc9TrCPTiDPar0Sqy7K/wjNUAQX40TNkdPvR/rX9
	kYBVRLOUxsIaB8mLOWXuQ/O7158/KhF/peiAxecnJgS1CClrPnMH4UIph2ZBRHETW9JYVSwi0Qm
	rSPRe0jfsoXONfvNjWHwx/
X-Received: by 2002:a5d:588d:0:b0:432:851d:35ef with SMTP id ffacd0b85a97d-4342c547dbamr2693184f8f.42.1768387422890;
        Wed, 14 Jan 2026 02:43:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432d286cdecsm35818726f8f.7.2026.01.14.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:43:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 11:43:12 +0100
Subject: [PATCH v3 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-s4-mmc-fixup-v3-2-a4d3e136b3f2@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4okCO5nn232mOuyf3EnlQ/xwKykNnPdvcOnvM4JNIi0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3NYatEmmShZe3hPb4vYNDwK6REixcdUgkwbM
 7DeSvwXB76JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdzWAAKCRDm/A8cN/La
 heV3D/4kz6OAG4nqNZrPcYi/eDYNZS74ELTkhDDo4ERom0PQCUECsVyo5vn7l8IBKFvvqqsWQk+
 M5NzJb01Nz7F6xPZZYX/kfAEW/Ck8M5dnYntGlDw4Ql/wAYOvvXKH3VN8oyQhM85pyK4VNAYyGN
 /fQ9UjWakylCiuu8MFMpw9HT1NS8ZIiKPDEA/OKskz7BxDAz3B3IDW8Yqy8c0GVU9qJNaEflgSh
 uVjPN0P8Xfw7SYgs0oonjvPqIzI5GLPW22tVYGyPQ9alKBs/W1tJopHGRPGF0oYGKadvYm3IEJm
 1ahCcoqEQprH+jIH5/0nyWLz55KwfZAgz9+0bD0OLmIkmKyFfC1mS9TCdHqokQTTJkzkPt3d7xX
 xgkArQtY626XXF7dw5GFHmNM0Mk+PWWsC0X1r1oHTexWL8xC8Peb0ZEvVXmIIq5evyDJsjdXWsG
 0xyezinOjekluDa8T6AX2g6UvBcKz0YtPTcw9q2je9e2uQ4TinMGdMtwcSzRYxIZcT5R0l6lFSC
 vbXXBzqlh+sLWfWgHU31GERsUI+XGwC4IesAHUa3PuBtP78rjRc911BpPGB1mTB6Q9he0ktwgUA
 vckGo1SoVivU0dqGjprYsv0zOhdjwE5LvKgY0d7q0t1WOIFTVU2QaMz3py22fL4sC3NV2OObaV6
 boYyUgagUYVU18w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024344_912380_5CDDBA6D 
X-CRM114-Status: GOOD (  11.50  )
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

MMC A and C are mis-represented as having their "clkin0" input connected to
xtal while it is actually connected to the MMC clock, probably in an
attempt to provide 24MHz to the device on this input.

Fix this and assign the clock to 24MHz to actually provide the required
rate.

Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index f314f07062ab..dfc0a30a6e61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -819,13 +819,16 @@ sdio: mmc@fe088000 {
 			reg = <0x0 0xfe088000 0x0 0x800>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_A>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_A>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
 			cap-sdio-irq;
 			keep-power-in-suspend;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd: mmc@fe08a000 {
@@ -848,13 +851,16 @@ emmc: mmc@fe08c000 {
 			reg = <0x0 0xfe08c000 0x0 0x800>;
 			interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_NAND>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_C>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_NAND_EMMC>;
 			no-sdio;
 			no-sd;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
+			assigned-clock-rates = <24000000>;
 		};
 	};
 };

-- 
2.47.3


