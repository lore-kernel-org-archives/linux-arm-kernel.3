Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188E7109318F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFMxMapU3hwQJCSTDwEi8To2/kdfkAjdlH0XIXA5iyA=; b=3kGZq4bcjD0yv+2TN+DSnfA6np
	jNHJYIz/e2zYNqO3JEhiKTMWDSI78lB2ZH4UQ5j968mH8vUqBg7w4DGy7uhDHn0jQG29XBqc+Yxb7
	tHdMivHc3wsNvZTNaeJt8zJbwyBWY2kHNTtz3SQBhINgzt7DXSfX5RldqfJqraL1JQuvWiMT4Wt+K
	FAfuEjh0jr9ZcFwOzrsQV33BZVuJC8zByrlRS9WknWohFqyKOJO4i8KTb/F6437wxATRX5Qh7aXW1
	Ufwe+k38xjnrnzKL0oVRC01LD4cWqjWdztN0nBsGEKFrdRxe/0MHlzD1O0Q2ANTu/ppwGKeNIO/dF
	k4Z663gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSh-0000000CNe3-0xuy;
	Fri, 20 Mar 2026 08:44:07 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSc-0000000CNa3-2onG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c742bc88d87so684672a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996242; x=1774601042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFMxMapU3hwQJCSTDwEi8To2/kdfkAjdlH0XIXA5iyA=;
        b=FHNYKa2aLQnXTVt9Ho1N8Ppe2TNET2Rim9mVoojYlI1hE1aFjJm4wDh4dziuXyeyHl
         zr+/SMLQyHFh/aOBLhHbAjfNipRCl+NE5FKxDI+qOmBvGAsBxk7qDsD5uWe8o4i/fsxF
         67lDvoMdnfFE1BVGna99Us8Us1b1F+8n1Q5ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996242; x=1774601042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFMxMapU3hwQJCSTDwEi8To2/kdfkAjdlH0XIXA5iyA=;
        b=OO68RtyQAptwKyTDOOZ5N7lbO2I32ejLc+yH+NjWYWJsLjB1clC7zdqbBqp4JQqaaw
         Xn+dcv6Ui0Ls5JSMY1L8U/RHUFp3zRnfwryGgHKG0t2dJxCvEGl5tCCmvgBAuqtz3Gsv
         WqYcYCz1uaYmooTinWG76gi3Iyv4vKzBM7pvln4I7FiOgk0ZtQLh+WKqeTILHAWSaeFC
         +Y384M0IE4yFyC46VJNKPFVUy+1/DUtwXl/phbijucPt05AZHPwdxyBpX4yMJ9mECP+S
         6nsX1+gYM3lFM8vy2hvCdO0wToBwC6UHThiKF2TeFRXE145TbwK0ohptBWmAkjIgnL3p
         tkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1DpkFtyKjtkSP6bamvNVw1LpdkmRxCsawxaBYBtZeqRGpSc5DMRbO+tGCFkZxWEB/rnSLdplyBH/W524udFL@lists.infradead.org
X-Gm-Message-State: AOJu0YwKURg9uGcGwiiVwNXPRzYw4RInLvxpka1yXAVWVzBDWEhOET6k
	GA64574T9JyHgLRpXoe7Rb2giaUd0DO65WI5ipxKMIeVPJYNfH1Tg4q+JqH/fGHfYw==
X-Gm-Gg: ATEYQzyByFNQ2dTsZnWN6LSBDrYzJksTPFFZJS7VV8qUcnPm+6x6GOHeGDWHKa/HQKc
	5Mc+1tDauwh9IHVMYRtvwjHtH9nwMhoR0k6WcYWtYXRMRHJaqz+DSgVldZ2qbO7gzyew9yDEWMv
	3q1j9/JRYMeQquOnkJE+itl3S54aKLDIXuPh8ybz195SmutudauNUcHZtGKSm74GthV/uAW5MMB
	H0ZcYdVArne3JIP03Ad2MGAbQPBrpA9QlYvq0k44PXx4X09JUMMkPHN1f5Gmpj7k48sOWQzE63e
	QgBplj6xWJOXIt08wtUpkqpH3X2HTpO+XRl8jTJbHwusk+SneHj13w6ixXbNlD/COOx9Xs0i1jO
	q2X4v81k7/uqMqxVJUhEuzW/kFqJgHv7m+od8uC+ls9m9gHKOWj+JOdDukbDcRMZ1AaDgv+8J2p
	/XIaMJ7/tsWEQ2foXTPXWmWFE5mhPxi0INGoLjVvX6BUMlujhUa/YqZb29F6RQPdwbl/bcsPlZa
	RXbOTmV
X-Received: by 2002:a17:903:1aa4:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b08277cbedmr23130015ad.30.1773996241843;
        Fri, 20 Mar 2026 01:44:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] arm64: dts: mediatek: mt6359: Drop ldo_vcn33_[12]_wifi regulators
Date: Fri, 20 Mar 2026 16:43:33 +0800
Message-ID: <20260320084351.2461060-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014402_714591_6E3F8A11 
X-CRM114-Status: GOOD (  11.74  )
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

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them.

Drop the ldo_vcn33_[12]_wifi regulators. ldo_vcn33_[12]_bt are kept with
the "_bt" suffix due to DT binding backward compatibility.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 45ad69ee49ed..1c41c4701319 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -169,11 +169,6 @@ mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <3500000>;
 			};
-			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-				regulator-name = "vcn33_1_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
 			mt6359_vaux18_ldo_reg: ldo_vaux18 {
 				regulator-name = "vaux18";
 				regulator-min-microvolt = <1800000>;
@@ -236,11 +231,6 @@ mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <3500000>;
 			};
-			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-				regulator-name = "vcn33_2_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
 			mt6359_va12_ldo_reg: ldo_va12 {
 				regulator-name = "va12";
 				regulator-min-microvolt = <1200000>;
-- 
2.53.0.959.g497ff81fa9-goog


