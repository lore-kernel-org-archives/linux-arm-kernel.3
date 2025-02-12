Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CB3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PEaEtl2laaTtSXlR7EepykbACdsERKpfJRZ5RMDW/s=; b=vK5vD5KX2wtnSUkrqPB+sqAmu2
	7z3lbtRhxRbX/gakLH4vIv8jZvRfhe2za5XumWFYQfVi2QjxxqW4jlMvGyCm4ooYhJo/bOOdmfvLw
	uLZTErRUeDGChkSeMQkUtMuzlaonP+BKL8SRiUbuYvWgZXRWnmmPpNfDQ68wcpRYuPlZNdBULotTn
	J7pDJMW4Jsm8oFnAXJOImlasILDKprm98WB0OKKBcFOAycWUV1gbBz3UkiXcBAFjKxLw7Wo9uW4wk
	mGyrFZYjCIgzKp5sC8IMe0WFOHYii1jLjSYZOPr+IIgwAK1QYbyvfvgdaCOe8YXB0LWTe2YOCuSaQ
	WrUbOrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJbO-00000008oRN-3O0X;
	Wed, 12 Feb 2025 20:44:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJZX-00000008oD5-3jTR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:43:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38dc33a4426so19932f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739392982; x=1739997782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PEaEtl2laaTtSXlR7EepykbACdsERKpfJRZ5RMDW/s=;
        b=J3jhBXYphK2iEEI52gXfNfYL6GHEQjr9AJOHl9kiYbVQxjpnmKejjuqYyE2Z+cSsJI
         iNfw+oltfj+EvJgKpRXD7SJkQM7pvjtou+85Gqe+xzNr80NpXg1LPKOMIEfCQhk6zMaz
         +yNpXGR+SIeEugeYRSG8INcSLUJKqGiIuJYZYVnE5BsmhqJibUsQJAoUAwi0OaPk9xuu
         1Swb+1p7I+kwhaWTfKP2jX0XmtNWiRJw+YBGDoS0ACMBLhYCODyQMyCQTtPwfw0aQnNU
         Bq1qRKEdqr2KKhczUBZzN4nSll3jI6udW6ChzwmI/83N4aKur/4bswC/dc9WvEw3oAOi
         qZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739392982; x=1739997782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PEaEtl2laaTtSXlR7EepykbACdsERKpfJRZ5RMDW/s=;
        b=sFLHHX7PHIa9uNMP6pgiLZCSSjYSsyTY47YNV55uG2JDBoJ+vwkT+hsOEmTB8yy/Aa
         SqTjL9lZjYe+T2CCDua0n5A5dCsGPg3y4K4dvzDR7e7/TTHuCXXN5HJ3lp4nnmQHgDya
         asumY3LheUvNUo0si+KtJzH7El5Zz2rIHeZbNAHaZ9x2A/eCIWuwjR84XxAucr6tmkM5
         xUy7IHnZ6SY9ZNv9c4/FiMTcScSc3pMFg8lbqfu/S7ksSYp+UFQm9N8tmbVwvArNjGA/
         JO3PsD6WFXM5BWKSMbWZnd/T5osQhydN0r7mNt2BHLB8jMiZc2j7p5f2HFwITGi+sqNg
         r6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYgS24DA5wIQrv3VHZQqvOUUaEqE/x0LSUeTCCD/ST0E0RuY0NsQ8zL2SEsjEjfOD3/ddHcgY8A1MwjEzbAaf0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcp4srfcmrTFIsraD/wzSnCpIvOFvK6UU+qX6uIPaXfNQGYZ1M
	QRhbr4fWhmMLeRPuXNDSYJ0ILR2Ex0c2tXhHzy20FmyUarGtPPpM8/gj8fvM+/k=
X-Gm-Gg: ASbGncv2u0tKj223qXycDMxonmRDGrbx0HnosrLq7CdiubRvRxEC5olhSC2oDif8G7q
	9wHoA+aWwcfXzT5JbfPJ8nejZf/fVg5+1k7vnmQ+S2FTFjtubbsOVKmikzFt8Y9g6CJ2/0PZEya
	RDuiVH02bbQ9wInhUErr0QzbIysCNUvcA+R6KauqhUG/98U67dHlfTBiwlRObTcCg3q7QTyuP0P
	h21/GrsunMzK10Vy57/CyrSD9zUhG3V2SvOWMfq/ZxCY83folUPjal92o2q+6zc0nFLCAIzZI52
	4SbZTptsRbm3/xxLMGcqDbvtfxkF8w==
X-Google-Smtp-Source: AGHT+IFFs77Lk2FDJk54yPret+BrCBmHkbbfJgHImDbky3pssPs28syG1zh4mSnU8lo0JUZp/V9gVw==
X-Received: by 2002:a5d:648a:0:b0:38f:2113:fb66 with SMTP id ffacd0b85a97d-38f21144679mr1179580f8f.9.1739392982175;
        Wed, 12 Feb 2025 12:43:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcfd7d153sm14237664f8f.84.2025.02.12.12.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:43:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] ARM: dts: marvell: armada: Align GPIO hog name with bindings
Date: Wed, 12 Feb 2025 21:42:58 +0100
Message-ID: <20250212204258.57514-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_124303_939891_F9A87E2F 
X-CRM114-Status: GOOD (  12.77  )
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

  armada-385-clearfog-gtr-s4.dtb: wifi-disable: $nodename:0: 'wifi-disable' does not match '^.+-hog(-[0-9]+)?$'

Reviewed-by: Andrew Lunn <andrew@lunn.ch
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add forgotten Rb tag.
---
 arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 8 ++++----
 arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 8208c6a9627a..7aa71a9aa1bb 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -453,7 +453,7 @@ &gpio0 {
 	pinctrl-0 = <&cf_gtr_fan_pwm &cf_gtr_wifi_disable_pins>;
 	pinctrl-names = "default";
 
-	wifi-disable {
+	wifi-disable-hog {
 		gpio-hog;
 		gpios = <30 GPIO_ACTIVE_LOW>, <31 GPIO_ACTIVE_LOW>;
 		output-low;
@@ -465,7 +465,7 @@ &gpio1 {
 	pinctrl-0 = <&cf_gtr_isolation_pins &cf_gtr_poe_reset_pins &cf_gtr_lte_disable_pins>;
 	pinctrl-names = "default";
 
-	lte-disable {
+	lte-disable-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_LOW>;
 		output-low;
@@ -476,14 +476,14 @@ lte-disable {
 	 * This signal, when asserted, isolates Armada 38x sample at reset pins
 	 * from control of external devices. Should be de-asserted after reset.
 	 */
-	sar-isolation {
+	sar-isolation-hog {
 		gpio-hog;
 		gpios = <15 GPIO_ACTIVE_LOW>;
 		output-low;
 		line-name = "sar-isolation";
 	};
 
-	poe-reset {
+	poe-reset-hog {
 		gpio-hog;
 		gpios = <16 GPIO_ACTIVE_LOW>;
 		output-low;
diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts b/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
index f7daa3bc707e..cf32ba9b4e8e 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
@@ -34,7 +34,7 @@ &eth1 {
 };
 
 &gpio0 {
-	phy1_reset {
+	phy1-reset-hog {
 		gpio-hog;
 		gpios = <19 GPIO_ACTIVE_LOW>;
 		output-low;
-- 
2.43.0


