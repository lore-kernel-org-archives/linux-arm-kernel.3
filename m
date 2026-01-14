Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68384D29FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlByN8C1Eu2c9UjKXvt2bF4y//Mr04/U71i3Y158psI=; b=QjsX9BhPjDaroHumWhOxMB0kDY
	fsSi/0BOiag2/TWTaIQHzr9ICA5kOy5ShrhHVsXDDmXg/RoOc4CpkQGMiczmu7HZVfElYFik0P1nW
	JEgf7UBP7cw2MpGTwZ+E0T7VHoImlUV0oW1f7EX6w4J3dCtg6g3RoVO5lNM+GVs9TQxwP5PTOPBbf
	SukO6xwjYG7nLY4bShf96SOUqGxFs///RFEUUxttABrqMQvjB61ffHaAHF9H39p9xymNJ3rOy++qe
	uIu4up/jKYUV+jW3z9ATY5qxGnJdA0tv2wwlkFruFpJeCGSMwe7W/qRAO/bYLhUX4XcTZkSVPuhnt
	ExzxYscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLr-00000008qTk-2Zr2;
	Wed, 14 Jan 2026 10:43:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLm-00000008qPl-41Kp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:43:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4775895d69cso42716835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387421; x=1768992221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlByN8C1Eu2c9UjKXvt2bF4y//Mr04/U71i3Y158psI=;
        b=bxWKK46VmCLVYRluUF/Q/IZphSuImwc3NpSxGiLLYtF2xCQuvQ1C3pBYr1pFuKbdxJ
         U3XhiG2yMZf+Y75N+VitawvI4Qz3xjfkW2ftDU05jI0IqQIjZiLyYd34FXw0lgXVfaZm
         1OZ8uBFCKORAmK9dLfRLEZpSeUlTXw3blLoztsBxkBrdMPkMXbk4juCZ/0P37y5gmiPF
         JV4frYKOyUdMCBMiOF84e3mOmqQsv4unvu+GdZoyaY7GEzbIaroBS/ieiszWG9mP24yS
         2jCwmkpSbZuFmVSzCzbcBtNc6Vgpiit8i8++XhaCyBcLG2bScGVzWpL47nZf98/52ZmU
         hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387421; x=1768992221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SlByN8C1Eu2c9UjKXvt2bF4y//Mr04/U71i3Y158psI=;
        b=iuEKoHYwtGUvVZePXAUodwg9f5UpJJ0Ha1rW0puiQc09si0YSeokawwwMjdDVmAHF0
         yzlQRXg6iOCJ6vId2LYGSfQVWLTN9eHUWKI5NAvEFgNN+wel84huKdXjaXLD7QIvuLHk
         ocyczrUwbTJM7l+DB0YxKRB1yxViTeEcvTEiMl0/Zc2XP+Mh9Ud8zrpXgyesMd7+5UW/
         ymqvL/XdcJPx+pbiwaHTD+qUTE0d2fU3rTjnvWh4rVxeVmQmd16UuNT2Of4PJQ8ikxoT
         fOhHbCTgWZBI3QuXWptUUcwkhemXRgx5nS2wcJ9Uy6Hl2MtI+yXX51KmW696wYZ7d60q
         12hw==
X-Forwarded-Encrypted: i=1; AJvYcCXMamloOFKVSwovbiUYTVKgafxqdWWK2b1vwJ5UV75cCM0HaDc6p+NmEtibERdbMygLOqANkJ/kLP5JcJ8pm9wk@lists.infradead.org
X-Gm-Message-State: AOJu0YxkB3IniaeNmAjWNX3X5R4oZFrqOS84hkf0JeFqYV7iL1qZVqI9
	8YXivmVzwQIG+Mn2k7dOV8Vep1Bfs5/3M9Q1PjdBA0zpV3SLc6INatuk81bcKg1v//PXj190Coi
	J6R1Acuc=
X-Gm-Gg: AY/fxX5oS4IVlQHIJU4Ti9730bBV7VL3oDA7Di0gj9VDViSbji2e63QfXgqZXL84iMk
	muHi9ItaJDXRijzYCeJzNbOlbv9DvUPiIQDcHURGbIECJb6/OW1MgqpAmsMOxYBp6mlZKcMe0dx
	Jqda4YD3GCas8ADJVFhTNS5+iSL89XTmUe8UyJm4xejntfGGXfhuurbddCQRlZ30I2pebnDYk45
	zCiWRvNvoH0N4+NVUBHi/OvAvrstH4zd5oNM37Mg8G8hIpgLNXYTmhP2gKCq22ZAeqGAi41kFdv
	xvW5RgMrSutlU5YOPJKxLLSMMIuor8ajsYf49SAZa8N0Tj/MwuLX/7w2sjtIjBBDbw+xHoO0Ezl
	A8Ty4eaeWkSqfOvBJ/4z1IG5ym68M3rC1+lja/NwVNxV//8Ctkf09hRg/WXAAOf9EoWNOzFxSDO
	GytXPRbsmEwQ==
X-Received: by 2002:a05:600c:45c8:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47ee3071491mr26145085e9.0.1768387420967;
        Wed, 14 Jan 2026 02:43:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee5613cfbsm21953065e9.0.2026.01.14.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:43:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 11:43:11 +0100
Subject: [PATCH v3 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-s4-mmc-fixup-v3-1-a4d3e136b3f2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VYGCJTyLWyZeqxrYJqis+f8MCWkH4xGdHO1FKT2JVf8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3NXDe1yYrYJvm7ef+o0HbQsBE36HBFvgGEFi
 3gDd6HBfxOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdzVwAKCRDm/A8cN/La
 hcFYD/9Q8GfbO+oTJmQEoIph6QdmzFBAunlGYVNjY3ojIk+xGMpx4K8lcWBjqy1KR2o+tv4/0XB
 mOkxCqoU73aajqQG1Gtu/YjfrPOiz7CJX5LMd37ftHULi1G7bXOAqZ0ctJro+v71iLcAEOM5I74
 9Dn5u9+06E5fXfkVjEcyhPsx8wnkQxeeyY9lA1nV+qNH0qd1KSeqq5x/4vWdbmYPX6FQojk4cPP
 /DS7poKOJnn37qdQTGs0FPwzeoWq4R/w+WrgcmVWSFjigeMfdqQy6RiA1IFWZp5zG/M255ngOpo
 m5/JWAK4GOdNrCDZveD6tgTh/3wnGJa3c4esNQHRQwa/XlEO+pJlbSnSRZsJ5+QVdeg1padx9I8
 0FrGIODF2UxvRAeVcIwVgJ5iXE2XKI9VY5i0HELTE5mnenUeXL6u5+tKVHz+8HgYxyKKpYWPJtP
 TLMCwoKFRs3jA2Le/KPc/zHL5qdm/DKJxpetbX/F1lnaN5yHBnk2c4twSz8HgRhjxm0CJQeP/tm
 5k/RpETe/LiozsreIgoOgVyKy/i6EWPEspD7Y3YmtK1hSniiSp3aJVfMKcBDH5NZ4ON/Qb21RhT
 43LnwBcgOL61sSI7h8gOCcno/p18o6a+uqjLV9bBmCdM0wZRrNTko7tYefxSI+4/65EjsVWK9i7
 NhG7oRZ0RIkfLBw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024343_016386_E06C983E 
X-CRM114-Status: GOOD (  12.85  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

This assumption did hold true until but it now, but it is apparently
not the case with s4. The clock has been reported to provide 1GHz
instead. This is most likely due to how the bootloader is using the MMC
clock on this platform.

Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
24MHz, the clock should be properly assigned, so assign it.

Reported-by: Nick Xie <nick@khadas.com>
Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..f314f07062ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -838,6 +838,9 @@ sd: mmc@fe08a000 {
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		emmc: mmc@fe08c000 {

-- 
2.47.3


