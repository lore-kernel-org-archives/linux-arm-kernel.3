Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECAFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fAYBfOUg54M5t/+kaqNBofxYRILpFjbjDYCFpBhx0oA=; b=Oomwq30mufUmS5XQ40ZScs2+R6
	o4t4QnTt3iKrE32QUuhhkiEx5idcUz/bOXUCjm5LpOpU3475dhERepFYwVbv2Z97tjoE6U4xAgD2W
	Iy7+X9ZmA8Y9WJg92Zra1PxXojMPrlvDYg27/6jknYU2WhkfWqzJfa4JYBVCKNpm/toelZXqco8Aa
	6E4CN8hql1/W9L2o1Yy7XrOYWO8QTP70jOMmxOIxSqP+rnaGYjpr+0NXp2ivwxzMIzjf98bwgjPGg
	puJjhFiUNKZf6JVvqV0eysHn+diK7u5lKofU6otKVYT2paK699HLutVvf8P3HGMYz+4r5cLb5+FfE
	ROV1C/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLmz-0000000EJ1K-02Hc;
	Thu, 16 Jan 2025 09:03:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLjw-0000000EII0-004x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:00:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso404195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737018034; x=1737622834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAYBfOUg54M5t/+kaqNBofxYRILpFjbjDYCFpBhx0oA=;
        b=jAQwSvvZm9+BJHW4uOX29LsVQIYNm8kukpIvrKUsKd++pyFOtcpywlOl0u6ZmtSRXe
         JXXMYE3MHHzl/OVur8qIEG6sCtGTxxriiDtShA3vYhJD2dqlTnLIG7GAV53EEeygmGy3
         B5sv4B/yptgBElJ1zwrGMBpcwVlJ89MF5G3vn0ItasqXtjYGw3v+ofaVTlGsQlPgcl5s
         W4A9AuzUMcn3fhF90i6dEv8R09+Nox4stNpJrIAqrH2vk/XgmfeV4b91pMMppUAOTyyf
         5VgsC4EVHFqsmH3MnzF3qbwEUkhbniZjMovrM/f1XlxRhTxh8wu3pwBAmvlKkUlfCzH9
         t4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018034; x=1737622834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAYBfOUg54M5t/+kaqNBofxYRILpFjbjDYCFpBhx0oA=;
        b=GhR5nf6w2mX7ZxTYPLfv93bA6be0fyMnM2N81t5TcCuqie4c3iKXJ5ysPHk1rcjBeY
         hpbBHibSRlChmEXNNvL7iTrLchyT1oGmY2E1jmpEr0DI4lUduzAU2ggMy51tc1LGarf4
         oH63+QfGKxqFjPnyXB3IbuXkulCHC/bOJSRaBWr05mRj2/1lxxmUjX0S7m2Lx4zuY66p
         V7T/PQ0ligTdNn7T8tVnClkPHhRe7XUexDFsU5eCDt+mF2QXVDL8v/l3cxsrreVqPfWJ
         XEQboOtxlc1lVUJIuPj/d8ebE9MVHmjgF2SObQXQZQufpkWXFtDhia+Grujyzi2OOjO4
         Z00Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTPjeCCYHzbt3NmD5FlBbbuFX+SBUE48nz0myBfQrlPPTRNOiYyyHDhSiiJsCc8QCEPdL/ozsdEs0foBzXqS2c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5WHfVZQjysks+T7vtM3MfXYLtp9s0DXBn5Ez+zqxJuhNATD7
	7Qw5eBdhb+9vbqcof4Xuo1yPwHFGdc8AksvUuxbbDoz+WkfpRXtgWc8HjQmRAp8=
X-Gm-Gg: ASbGncu/lNJbaT9b14gGEMv5FOLvu+ze31E6G7/kFE14Qkqw34cv+OrAw2cUSY4JV7z
	xk/pWZmMS0BYMMUlmUjs+VXyjJlC+PT0I4puu0E+LPlJeNz5E/soVMkqvPfwelHID9M+TfIUfU3
	jS1flMitdxfQFooQpeWEpyBGSDBBdwX/FSZvGOKhJugefrRz/HGCXkEs3fBA+PKDsUwwC1HXGD8
	Vz4uJ4ksd1n/D7k+VPKiFlk30Mdr3J4HLm0pLzY7dlLWVzOGIrE1JHc08aQsUQ/r8P79t4=
X-Google-Smtp-Source: AGHT+IHoE3dr5+IW22/U86RkgkX8O1rrKesuiTRisleXCYyZZhvGeHAZRVoyTntXQXFe+8mX6d1bUw==
X-Received: by 2002:a05:600c:1d07:b0:434:f335:aa0d with SMTP id 5b1f17b1804b1-436e26924e8mr129454305e9.2.1737018034322;
        Thu, 16 Jan 2025 01:00:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7525ee9sm51180405e9.32.2025.01.16.01.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:00:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Lechner <david@lechnology.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: ti: davinci: Align GPIO hog name with bindings
Date: Thu, 16 Jan 2025 10:00:30 +0100
Message-ID: <20250116090030.87452-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_010036_036621_6E148A04 
X-CRM114-Status: GOOD (  11.48  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warnings like:

  da850-lego-ev3.dtb: batt_volt_en: $nodename:0: 'batt_volt_en' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts b/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts
index 4df10379ff22..173401c58d53 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts
@@ -412,14 +412,14 @@ &gpio {
 	status = "okay";
 
 	/* Don't pull down battery voltage adc io channel */
-	batt_volt_en {
+	batt-volt-en-hog {
 		gpio-hog;
 		gpios = <6 GPIO_ACTIVE_HIGH>;
 		output-high;
 	};
 
 	/* Don't impede Bluetooth clock signal */
-	bt_clock_en {
+	bt-clock-en-hog {
 		gpio-hog;
 		gpios = <5 GPIO_ACTIVE_HIGH>;
 		input;
@@ -433,19 +433,19 @@ bt_clock_en {
 	 * anything, but they are present in the source code from LEGO.
 	 */
 
-	bt_pic_en {
+	bt-pic-en-hog {
 		gpio-hog;
 		gpios = <51 GPIO_ACTIVE_HIGH>;
 		output-low;
 	};
 
-	bt_pic_rst {
+	bt-pic-rst-hog {
 		gpio-hog;
 		gpios = <78 GPIO_ACTIVE_HIGH>;
 		output-high;
 	};
 
-	bt_pic_cts {
+	bt-pic-cts-hog {
 		gpio-hog;
 		gpios = <87 GPIO_ACTIVE_HIGH>;
 		input;
-- 
2.43.0


