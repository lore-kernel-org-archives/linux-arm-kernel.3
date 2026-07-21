Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26965C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=; b=c8dLxN6785rzDrhhYeiOCJgxkM
	RM+c0sqxObsbMobzfY/yZxpVUYnvt8CRIJSC2UQt8mKFxBPhOafjeOKEfmAbHcP/36kbBJnFP6nGA
	2NnilacwG31wHm9OP8cxFtS7iykPVb+dE2uEgAmVhtaH/YPLZeARFlK/489cQ5D0sINPYIhNd9NFr
	9TT+NkF3JeHmgVXxuyE1wYm5TWGV8hHftzTZtrE7KDC+NJn7xH5+yJwjrKiBokOm8aBm4T5Ruc3fi
	Msw8tFGCTVeAWBmnuFtI5Eap429aQ5uOZnNj2OsqH1vDNb1s8rnfyzk56+qsO1QyfngwnbPfMQOhD
	Jci7U4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAT0-00000009W0g-2ziS;
	Tue, 21 Jul 2026 13:25:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmASx-00000009VzE-1Po8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:25:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4758bd3731bso4024131f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784640297; x=1785245097; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=;
        b=I4pCr1kFw8x3R+Tj1R/9MCTHIWTeXob7RYrd7Nz/hX1+DvOyL/gmTFEPcGg1xJDoaD
         9zXPpB494gq5iFG7EBOiOXMHlMB8gMH2fJvjv6G6B3tsTHrodUZo5c8IM/0hQZZvzGBX
         IgvI8CXdLzvKuoX3lGLL1CE6UVyZFGJG/rpwuUtGKmKwqVboOJgURcQRMLnRIG7BiEub
         I+uSu9iEcBPt9wMXoXq6xKxNT9Dw4XHeNpRSxJO9Vlvry+ViLkOHDRIxxPvLdYERRnle
         UkeV88YKciMhBNoHYPU2ra1uoelk21MXQ74C6tTZ1p6QB62SvS0all0GzOD3w4164TMl
         I7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640297; x=1785245097;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=;
        b=gsGZRkk8pvUxG6SwRer7u7viaGNMaDy/PDQ43BtLvETrmscgYW9TCzJsVMErj/1yNA
         l8BQkWaR2uit0u3KSbBxWlQnQpkB8uWJqcOUsUUGjr3PApGyEik2q4rk1+XmpAhNjFLa
         8GyWAclOsIQBcJ35FYiBo+YKl9Y8q121cuWrWEUeg7gzEzgOYEB5dU+dOYa9ODh21am8
         2yF7ZrB6Py/A8ZP65vcGAhW8gro+5ndILLDyj3CGsqeEbqWXnLGKpqs91EhswPiGrc6S
         CefntihIQ9DtlFEbLLmJmgpJyLW0J5uIcyPDjnelZTEjf/606k8YwLGb6qNNVhDv4CuG
         Dw7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp9BJUcaMm30aoweFNaKuk9YnvBCViRQpEVVZv6Et1dXdnNpxpjsu4HYs/OmBUOkU4sABKnBm/aRn8RmfHfVqEG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm4W82U7WnMbx1DPutGaS7kXiKewFn5j8gFNtUnee0SrhmMzLT
	J07yb8v3R6maOW0mUucmJK7UHGLO6R3ye5K8VedQEzpJfAgcywcHkEV12NS9t4HO9FM=
X-Gm-Gg: AR+sD130L0RDR5ftPzNc/FTDpOvC2KdgArSt0af/K5A6uHGLPK6iFcwIjtf8Amz1dUF
	/D+AP8vL8lZaSFNBZNJEkhzCdb0A28nSCX7pnaMk0b1aT+lRRJg9oBmNGgTVRy64eXtLUDR4yuq
	bReX1NWTZ5m+7WZbL+AZ0tv92WgY6kfqqQqa6ewHHTbAWWgy8GhqQuAYP7/t+FeiXXZN6gtpUYV
	cR6hBz6/wC5Cdo3zScvXZzJ/F1DpVHJaEaBP5SMDAGXAM8FqwhuerEb9LrYNzkt/rG2eMa9ydAl
	lCfE4RAm2YY5Xb/v+n/i1HJOdofNFOrDyExmIO8/qtuCZo1MueSs3w2Q+LSyKWPXBi2srteaMCB
	ik4rdxvQLfTmev6gUqGV4N2NoBiln5sQvSGqANlifDGNIpTp1ExMdgN1ZlOXlRZrY+X67TPZMWj
	wzoOxyuvyewd4OzBrPfahx5J1tUu/+xdxuMZtdV7hwOruBb/0bKOwQtkQjTDU=
X-Received: by 2002:a05:6000:178d:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47f62378c4bmr20304933f8f.0.1784640297061;
        Tue, 21 Jul 2026 06:24:57 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed244bsm2918310f8f.20.2026.07.21.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:24:56 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 15:24:46 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-700: Add boot phase
 tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTbQxeKcryK76GJ0EbaWphNh7
 N2tevnB4T8bmGQVg0uzQZaXmsaloj00wFNYHoJ6qwZydHIdtcgc6kRwTVayhBnncj72DscYS5p
 QQhfIe089MdRIynLX9+/gOvxt6/gULt8q7PsHCWa3c4IAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_062459_388832_4B0A6381 
X-CRM114-Status: GOOD (  10.26  )
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

U-Boot SPL runs after the platform DDR loader has initialized DRAM. It
needs the debug UART and eMMC controller, together with their clock,
syscon, pinctrl, interrupt and watchdog providers, to load the firmware
FIT.

Mark the nodes consumed by the current SPL configuration with
'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
information and bootloaders do not need local overrides.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 0d5a75efb2ee..83f2d10fd28d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -16,11 +16,20 @@ / {
 		     "mediatek,mt8188";
 
 	memory@40000000 {
+		bootph-pre-ram;
 		device_type = "memory";
 		reg = <0 0x40000000 0x2 0x00000000>;
 	};
 };
 
+&apmixedsys {
+	bootph-pre-ram;
+};
+
+&clk26m {
+	bootph-pre-ram;
+};
+
 &cpu4 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
@@ -28,3 +37,75 @@ &cpu4 {
 &cpu5 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
+
+&gic {
+	bootph-pre-ram;
+};
+
+&infracfg_ao {
+	bootph-pre-ram;
+};
+
+&mmc0 {
+	bootph-pre-ram;
+};
+
+&mmc0_default_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&mmc0_uhs_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-ds {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&pio {
+	bootph-pre-ram;
+};
+
+&topckgen {
+	bootph-pre-ram;
+};
+
+&uart0 {
+	bootph-pre-ram;
+};
+
+&uart0_pins {
+	bootph-pre-ram;
+
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&watchdog {
+	bootph-pre-ram;
+};

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


