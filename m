Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0128FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojIxQ7ZXn4BuWD/72s/OuzCO15xAe0zqbzQsADO8BmY=; b=uU9UefzzdfSByz8j0NTkdyqRmz
	mkITADeHS/le7aAvXCukBjrMDsBrPS+8dyhoyUvRkMLrqcLJLI6x+OdhCDXuWKs+9dQ9/rNI5QgVf
	PGMGvt9YYBCtMMXclK24IbE4ym19ZsYc7NRlHwwA/WcYHpQAlDkaqhkQgxhT8VzOi6ygvFqiG8YHm
	ymrzoCBevN/UOXv13yndZzJ18LMNGB2iRZ2CPpC+REOmxRdKLU8XFkNFWZndOhZldxBMRSPmS85k8
	jzWgBYIDouTDlhjhpFeV8mplK5gNVBvpvh0jr97Ce+jn6/U9SDT4/tdnnXTzp+XGzaPU1tyo1UgKR
	3dnl8Q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU649-00000006D3H-0Eko;
	Tue, 24 Jun 2025 16:00:09 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45r-00000005nH5-2ePo;
	Tue, 24 Jun 2025 13:53:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553b544e7b4so5592874e87.3;
        Tue, 24 Jun 2025 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773226; x=1751378026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojIxQ7ZXn4BuWD/72s/OuzCO15xAe0zqbzQsADO8BmY=;
        b=RwpMjYKra7xctKlds20HLT75lozaM4W0bLGAelKfDKjeeZ2OAqhR3O4k5OioqnEmDr
         4dcxRN7uMm4kz1RuNCIIeOI1T83EQl67i9Ciurc345RWQi8T5tshY3SDHqUjLTtHmOuH
         AlpmIHZJofWXpX2pxjDIIcHE3HqPUTtPGDWAeQ6UH67W6+6EtICUaw3IX+7R5yIVm/Yi
         DFTjpf74LCmRNCuxrkfQHpLs5IfI/i0lMuURu0wUpC0oXD4U3uqIUHmy13jBVNtuUtqN
         6uPPHHKugotsJuG7kGungkKIiQbi72rIIThLFm+T8RPW2X1a+RdrSkckeO6qheaKD2Bh
         iZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773226; x=1751378026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojIxQ7ZXn4BuWD/72s/OuzCO15xAe0zqbzQsADO8BmY=;
        b=Dtc9AKEOwNJgRCrole091vvUi6FxZjhdRAvRq+gaMZUjPl/x4rkJLOZ5CPjqlvlI7v
         rrWd5dnRjgdGIRv5D+AoL4Q5if3ywgwFfco/APAXQNZ5AZ2BrNx/nRCgUFqmXof1JbCH
         JQd6477g3bAWnYCBPtHL7o485ni/N27Tj5hzFEGlNVXJjGfawIk0qhLN0KvjTRPgZS6/
         u5BSHJtQYBSg+Da+T343OqwJE4yUcM1At4oEBWMuwqfIPgwgudMQnmKwVV0gW1bGmzSL
         NMJH6MtG3raTouCASjIyHibjnMd1oluvi98E+advdB3UPdIcyAkX2qEM2o2HepF9x7Ze
         nrFw==
X-Forwarded-Encrypted: i=1; AJvYcCVraPMaQoNm/uzY6NqOwhqArTxWCm7h3KKaqWBS9/YcgKt9p+FQcIX62bCKCAl21Y1i0w4Isczu31+DMAHB@lists.infradead.org, AJvYcCWJ3xQN6E8GBwHRixQ3mHe6nTbPN3dLWI2cul2u1S/ozJ20xDbipfjLCtOKaibJRF2kYJzre+F+0b/6OS1KPIpc9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNtFqFTOQx7b5jCpulHiBWtxNqiDy74b5TVIR2WPs4X98T06Jt
	x0ZVaqzELgpboagBT0FsCVl59K0BgvM3GecdTi6ACIg6zIdxCePJQChq
X-Gm-Gg: ASbGnct3aX+bs7a7rk/PepiUsAhHtIuXY63SnKM7s96ARrpnsiusQUGkcxsEUGm4QWi
	NSHOsG/Cmvzd/lklxYk6i0MyESyXx+eSOEnGDxacXPDejZ0c3AgOpzWpCZt9m6SDtTNAP68Cqkz
	RgRrhZX3XsV9U0HicxZ8Br6Sr0x7Ef5HMSplwvOr5+pfp6PxBL8cr5MKxH8Mz8wP2foHRWiXMjo
	tZ7isbbskSBRmLYi8t8kd9LgOPsl4I+GptH7GdB5orjdt93BK+4oZPj49MrpgaAPcc/+NbuFAuF
	zVzswsPEj62hr8xIPU6jwcEuD5zfVpYgQn7z7+5fbJpIoTkz8FtlakIUqDf59fIp0GWrCSv9RcG
	iAccXXG0tRKvEX5a6Butl+/lRvG5TBGdANyBpIUgAhuxoJMq30nmGgWrTlPvCjA==
X-Google-Smtp-Source: AGHT+IEttd797kBbdZQwU83qr+T1pUIvczg11xawPSLQGuHM+rw95Tm4IhToVETAc1tjXhgqp5guBQ==
X-Received: by 2002:a05:6512:3684:b0:554:e7f2:d76b with SMTP id 2adb3069b0e04-554e7f2d9c8mr2322834e87.56.1750773225873;
        Tue, 24 Jun 2025 06:53:45 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:45 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 20/22] arm64: dts: amlogic: s4: add crypto node
Date: Tue, 24 Jun 2025 16:52:12 +0300
Message-Id: <20250624135214.1355051-21-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065347_673417_D3E647A7 
X-CRM114-Status: UNSURE (   9.58  )
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

This patch adds a crypto node declaration for Amlogic S4-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..4c897073a33f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -66,6 +66,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166000000>;
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -586,6 +592,13 @@ mux {
 
 			};
 
+			crypto: crypto@440400 {
+				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
+				reg = <0x0 0x440400 0x0 0x48>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+			};
+
 			gpio_intc: interrupt-controller@4080 {
 				compatible = "amlogic,meson-s4-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.34.1


