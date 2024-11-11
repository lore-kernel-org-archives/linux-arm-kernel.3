Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF26D3ABE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9QaR0BG6R1g4qnhXgnvmqa/ekoM0k94F2vyZtmSUk0=; b=lNcR19MHneIphaDfx+6FxrHZ19
	M7OhNUns6OZ2arDhf8RAaVJk1ueShYH5ZQoLpVouz5qb3wm5ARpNNwIn24m++Pfc0Q7ZQvv0XJ4X3
	8sfJ5zPFg62JzS4vgcQckFbnL4yVLNBCP1OgBbovi0EeH4dk4fxZ0DSTBmBK5GEsPUioyGGsDGnON
	m6djQzuHWLAjE1vP7bZJmlcBp/7O1L74d3m6dN95zxe+2zSIlSUuB0jHw50LTgIXEVSdJXCyOdGJg
	9ZVkWddVxexlph3p3/F9meeYM/jTbWpsSsDQqkULrAasLSjPImZ3xYS0dl4engPimpu4oP5mGh2Gx
	92DQh8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ3T-00000000tbA-3zcf;
	Mon, 11 Nov 2024 18:22:27 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYzO-00000000spp-34vJ;
	Mon, 11 Nov 2024 18:18:16 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9acafdb745so958443266b.0;
        Mon, 11 Nov 2024 10:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349093; x=1731953893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9QaR0BG6R1g4qnhXgnvmqa/ekoM0k94F2vyZtmSUk0=;
        b=nT067+edBm4GzQRWM5iow0npNGUZvWkxiVFAOjjFtLzUvMiPspXrOywx0pavIt8IBd
         xPjJ4DZNvTsQ5xUCUiedUpIbKvCP2YUfm1pg+I98BQqQudQP63p8ynxevswaTSInQKLG
         f/R+S+w5G3v232se3nI2is/AJO0KmLOTqIu+SnRz3aUczZBf52DcxV+PUlhwOrWBoC/l
         0DN5odDxhQxTMW+FqPhSMGhDSCJlyRsem2w+DSpjNu02itEfNn2xeTGaAUfHsejlNFfE
         iEeb6Vu+hbDo+IiVe+MPj6xNlIeWg14Gp9PTR1CwhcLDcwv7qAvojfKW0BqSOw1SX3zg
         ZYRw==
X-Forwarded-Encrypted: i=1; AJvYcCVv7lo2YIkkWcOvmtZIHUZdRktyQ5FpL2xRplheF27kBJoKh3NpyAC3+5pQ6/DTnjsYXZYTHEeWp7EItr+fBK/V@lists.infradead.org, AJvYcCWphFeJH6+KmT2bnYPINXirYKbqHlycbCRbvvXaq7QyMlnbH5LgUGCxEQiQXyvyDPrl2ryxg2Nq5ypiQ1QhYwM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgY4VxxbF2991IvINpz1HAM9skRCHsTjIXqMNrayk6Y3b2NBOf
	PXxvmxK+fL+pOS2gEloPksHLzdvh1yykW/aBAi7oAOGm42dPaepK
X-Google-Smtp-Source: AGHT+IFRTD3QXRpX84g/OrfQbY0Ox6bUTyQy1uaHky5CSXyrm+co0z+49Rf4f0/uWBqCzAr0o5zw8g==
X-Received: by 2002:a17:907:7f1b:b0:a9a:17be:fac7 with SMTP id a640c23a62f3a-a9eefeb5cb4mr1224603366b.14.1731349092826;
        Mon, 11 Nov 2024 10:18:12 -0800 (PST)
Received: from localhost.localdomain ([193.142.191.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17b64sm617868466b.39.2024.11.11.10.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:18:12 -0800 (PST)
From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and set it up for SDIO devices
Date: Mon, 11 Nov 2024 19:17:26 +0100
Message-ID: <20241111181807.13211-3-tszucs@linux.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111181807.13211-1-tszucs@linux.com>
References: <20241111181807.13211-1-tszucs@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101814_794702_CBF40137 
X-CRM114-Status: GOOD (  11.42  )
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

Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UHS-I rates and
enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.

Signed-off-by: Tamás Szűcs <tszucs@linux.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 242af5337cdf..b7527ba418f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -688,14 +688,20 @@ &sdmmc2 {
 	cap-sd-highspeed;
 	cap-sdio-irq;
 	keep-power-in-suspend;
+	max-frequency = <200000000>;
 	mmc-pwrseq = <&sdio_pwrseq>;
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
 	sd-uhs-sdr104;
+	sd-uhs-ddr50;
 	vmmc-supply = <&vcc3v3_sys2>;
 	vqmmc-supply = <&vcc_1v8>;
-	status = "disabled";
+	wakeup-source;
+	status = "okay";
 };
 
 &sfc {
-- 
2.45.2


