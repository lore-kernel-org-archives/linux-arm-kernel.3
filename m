Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E5ECD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=; b=ss1Yx1x1wm07GY941P8UAV837K
	d21a3IK+diyrNegYM78DZZrcPGJOWqhJXlantqWyHKCixmlCpCe3+wvZ37A9rnMmNGweJ7g80bhoo
	gzzynm24MwBE20UFd/KJ5NhV0chFShf84NAx9LCOdW7ORAgJWCKAzj837TNwtXLMbPtHE5QVK/tlw
	E8uTM5NbMpnBgfLTDCBHroJDbnF2ITEXB+X0e59qqOCJmz8BmqFmfyW5TPzc9eGMkQdjWNvO7fBxe
	a6kbPAbSDB8CfXF8VHhbUgSlMeuoxTsMcEASHJ9sxpWTpbVxUYVt1vtivQ+k6+Dm/LHwlq7kJCw45
	u4enosVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVj-0000000Gnhe-0VpD;
	Wed, 17 Jun 2026 07:16:31 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVg-0000000Gnff-3Fvp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:29 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c857fba35cfso2538382a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680588; x=1782285388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=qbUzahuSR06nFkupwezjiP1CobKQbHtQZzkDA1KOqW5ZJXkCXbfOoUpt3jiqKDa/Rj
         4onueRck2Ssj7LJ6Cgn/s5MKfM97lvQ4n1FNOk+3m40r6n32vbEW88/FzhkJyD+mTaip
         LzGBuE1cRa76GfREUjf48QVJtnxLQU3cnlnGHzCs1v/Ni8K/PKUe3XEQb8swOe/QL49G
         bwhO221QX0KCKDYDXQFAEhNbdHSbtMFetICiOuFmrT3OGOgAtqBvRWtgx3NTUKk7nYgZ
         AJ3jw43nUJiDXVrX9ozroyMrzEmfjad6ORP4OzJp5n9mZkOhK0FcFPMcbzxS5brMATxk
         WYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680588; x=1782285388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=HLlNU69TytPjZ1VnDCtuBz9QnZonmHWKxW8veewQ4IuBj3PD4WgV5vK+7a7bCGyfXM
         3o3aoJ6lFk3z4EhK/JmoYOZ0NpOaJflcAQoEBtEY139/66EXpUELu/G2XL6HhdXjUFlP
         fD22IimIWrBm3EsZume/AO2T1x5LHGT7aag3VttSCgAzV24h1Se8WPMZyodPa107qjtA
         Vx/+5O8TlVzEhaXalFtF7plb8vHJKkFy3IkGFiPjZaj1mzB+DEq1IpPxuWdunVTn+Khl
         Upf6BSx9qpBDG/sO/pHcdf9GdAPM6bIXUGZJU1PDtWJJer2s+2KSLQdG66ayQo7gCfJL
         y2TA==
X-Forwarded-Encrypted: i=1; AFNElJ+8YhBLLCAFs0Xfm0NVVaTrVnVaouFzaCD9j1xsS2NE+rCb/xe+eGfpUxWPAnMRXJTuOSjrM1JGi/hZ8drYYH3C@lists.infradead.org
X-Gm-Message-State: AOJu0YxLzIsOf6860SOanvsxjc+K/K9/cku3Jwu3/QGDh2cbt0igirOD
	Fyw4CeDkuCl0YIPEAbM9jFUfJeo8GD97ueJcP0ZQ6OthPec4wT3z9rFX
X-Gm-Gg: Acq92OHtbOFU8+mb6Oi15XLu5no/kvGXTwXwdGsPcp07h6uE1oRi5ymbNuyCOnTdi9q
	bykNOnZ2twpV00YisY6Fn54V15WQTfBIQRIo17VEOJxp9ua9gpovA1xLGAGbsqfjBw5GKi34HJQ
	ELbH4xEI9u1Trc0uRu9GvtbGkps+AopBQcTNcQp7gvaNqGgcT/z0xAh7M+RtHzqVF8bwOq5RA2s
	ScY10BCf5yOCoS8iPeapUAT2x5LzrIHRocaeS0k8yDbL+0mDhIG2vU2WkcLpMufpp59Hz6wwyKI
	5Py+Hlyfq7TeyfK5mzqwmTIUHAcWNGHYH1ZPQMfAafzIvrGAw/pZAwOtv/KyTzcFblPzGcVFuG/
	ZeFIMWK4bd+6WkabQGubaIdujYqaF+vFRJHKmli3VpSUUunpWCfj5G0DTChT1WPvM24R1EnBvKf
	8EOkSbBpZXeg==
X-Received: by 2002:a05:6a20:d494:b0:39c:1f:3211 with SMTP id adf61e73a8af0-3b8b64836f4mr2769367637.20.1781680587671;
        Wed, 17 Jun 2026 00:16:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:27 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 17 Jun 2026 15:15:56 +0800
Message-ID: <20260617071604.635627-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001628_813891_5C52387B 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
disable nfc nodes by default to resolve pinctrl resource contention.

No mainline AXG boards enable nfc currently thus no extra DTS adjustments
are needed.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..6457667d974e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1999,6 +1999,7 @@ nfc: nand-controller@7800 {
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					 <&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "device";
+				status = "disabled";
 			};
 
 			usb2_phy1: phy@9020 {
-- 
2.54.0


