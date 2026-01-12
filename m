Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ECCCF45BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZpLbJKWhVPbx/7ziJgJ+BUcFCiVkYgZiZuAiyt6YZU=; b=RE5b4XL6at0Kp5Xcdm/9Vl+bxa
	6vfP5YQ2NhDuShmaUNzSDt91RfXaYaoFDkMDOnNcXFCFKM8E3ja9Q6Nx9Co5P6QBZMKzJjsYy7WLC
	65yKl0LTNmSQhkDvLJ/MlpzL3yUhVIHuMJzKhVZBaKIsnrB2Zj8wFd2w3HL0ETWgfSQN/+JgNaNaE
	fZ28Jr/pRd868cQIW+KWRlc+QPCpbhmhpg0IUfjuoV18e55aotfYWzhcuaP4tIWQaHWW3otTzlOz+
	gijqQCDEle1iwAW2lYeX0ExgNVPntgxgLm/rqhTCytD8yrTFdCq/whtAkcKa/XYr7IQyLUFOWJD3D
	yBDBZ/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7Y-00000005tCa-0Gwd;
	Mon, 12 Jan 2026 17:54:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7V-00000005tAw-2SIP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:54:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so43159315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768240462; x=1768845262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZpLbJKWhVPbx/7ziJgJ+BUcFCiVkYgZiZuAiyt6YZU=;
        b=TgIgZq96Mg3CySlWfZnrzMfwUlEofjkQ0Ml6jV0qBOTMCwMw8Ww220k1wuJd25N+uJ
         N5qFjHEvKyXxmIgtb2g2/v1ZsAeFKlnPELBXlkG338jcVAfMH5OV82VPr7qgk8WX8n81
         axIe3wR8WTTlDll0wHnhOWKZNlg7odIKySv1YVlx2fYNAAbV3Hs+JoNBYN3t6TUGRWAF
         mK6Qd9FPjlQ4o0Iga/csabFzzd+XOD+/yXV7GYSU6GS3Y3OyNBNCTkDEOkerUmIIy+iG
         hcaOmdqkwV5zjiG9djs9kmhlJQigzyC3jCrnU9hx1Z71/8RMTIrgjk2Alsw55xgZ2e8M
         Qnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240462; x=1768845262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YZpLbJKWhVPbx/7ziJgJ+BUcFCiVkYgZiZuAiyt6YZU=;
        b=OuqDnKUTfRCg57QXe2yCSRI0WYCumzj8xM180j05oh2ydZmHph5XnWRYrRLBAqphz1
         drbauwXIp9U501gQreTMqjO2gvcvxhJ1D1nBnRhCjPxEyrLGtsSZnRX1xCckvK65fJTe
         kvm3SJ8K8azmWEXq32s2WBgjqzijT+peyfXILV7Br7SJPkSPcT95x4kzNrMafw4wlFcw
         Z6bEl2gFLLH99TLcRFaFBGL2bLvKOhzkZpIAusz/y6nxtBRT7x0a+RAyE/fyscDCxkL9
         kZ2qQK7RGLDtMoCfpZAFf1YsCjVm5PdunTzdrhoWc64vqrxzkCM4bx2Jm5gVCm96vQOe
         0N4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe7uUKbn4C3a4GJZijqYqcsJhEQsmmitaGEgLy5TFFcvQb9L/poTLdFk/FQ9YNseQc4O7EbBTKXBebr2s6zpAm@lists.infradead.org
X-Gm-Message-State: AOJu0YzyFFGREasUN1JAEfJwsVrplSjmfkwyYYpk3jfG0RXz4ZdWrJrP
	pluzoudmvbYA7IWa5aiN8a5zBL9e1rYpjLrgz8BcwfPzfWg2Ki6U8oFz
X-Gm-Gg: AY/fxX5bA4KhlqowfTzS0dxBgUS5uOYjfLHzEgIqtTFTrbkWcsIR87/sjmRRUkCRb0Q
	8qwPra+NMMHDRgUdqmrvezct8I+TF4ds+waARXvhg0nIihgbZpk4KXNY8jeugmGYrqoMe5V0x6L
	A+Cao7wg3UWcBARR62KPGm8shCbmD/+TsjUoUvhJts4ZlYk11C6f5hRkwN+8wX/8AnJaS0ezUnG
	2TSlfV8u620F+cnHsLI0U82CuLqnUJI93fEBHJ0Et+zVwgDkIIUsLzFFqunD0pr2Ir1jktbFOAh
	1M0LHkyK+5Abz4BEb5/KzUAcEwSLA5fqp8q0uPpg9KHHN4D8VQBqOZDpYolBKClJZGfX6FgMteE
	Mn3QZN/8TdJH1j0r8iCmeBar9UsucWMGNjxTkapAQMK82ldEGcHIv8c2QyI7tZG/ljknuKz+qQU
	bZgwEGfgWOwyyuR0G5B2Ts0fGXv8w=
X-Google-Smtp-Source: AGHT+IHmEgAivbyKanCqdWIVbxGzKMBInHrl/Nc7WUrpYqgytlUWLQD/mgSePemLvULXhTwgIMUARg==
X-Received: by 2002:a05:600c:3110:b0:47d:3ffa:980e with SMTP id 5b1f17b1804b1-47d84b4101dmr196515325e9.28.1768240461502;
        Mon, 12 Jan 2026 09:54:21 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm134047305e9.16.2026.01.12.09.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:54:21 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am69-aquila: change main_spi0/2 CS to GPIO mode
Date: Mon, 12 Jan 2026 17:53:46 +0000
Message-ID: <20260112175350.79270-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112175350.79270-1-ivitro@gmail.com>
References: <20260112175350.79270-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_095425_644488_1F1FE523 
X-CRM114-Status: GOOD (  11.81  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Hardware chip select does not work correctly on main_spi0 and
main_spi2 controllers. Testing shows main_spi2 loses CS state
during runtime PM suspend, while main_spi0 cannot drive CS HIGH
when bus is idle.

Use GPIO-based chip select for both controllers.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index 0866eb8a6f34..5119baf62a4c 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -479,7 +479,7 @@ J784S4_IOPAD(0x0dc, PIN_OUTPUT, 0) /* (AM36) SPI0_D1  */ /* AQUILA D17 */
 	/* Aquila SPI_2 CS */
 	pinctrl_main_spi0_cs0: main-spi0-cs0-default-pins {
 		pinctrl-single,pins = <
-			J784S4_IOPAD(0x0cc, PIN_OUTPUT, 0) /* (AM37) SPI0_CS0 */ /* AQUILA D16 */
+			J784S4_IOPAD(0x0cc, PIN_OUTPUT, 7) /* (AM37) SPI0_CS0.GPIO0_51 */ /* AQUILA D16 */
 		>;
 	};
 
@@ -495,7 +495,7 @@ J784S4_IOPAD(0x0ac, PIN_OUTPUT, 10) /* (AE34) MCASP0_AXR15.SPI2_D1  */ /* AQUILA
 	/* Aquila SPI_1 CS */
 	pinctrl_main_spi2_cs0: main-spi2-cs0-default-pins {
 		pinctrl-single,pins = <
-			J784S4_IOPAD(0x09c, PIN_OUTPUT, 10) /* (AF35) MCASP0_AXR11.SPI2_CS1 */ /* AQUILA D9 */
+			J784S4_IOPAD(0x09c, PIN_OUTPUT, 7) /* (AF35) MCASP0_AXR11.GPIO0_39 */ /* AQUILA D9 */
 		>;
 	};
 
@@ -1204,6 +1204,7 @@ &main_sdhci1 {
 &main_spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_main_spi0>, <&pinctrl_main_spi0_cs0>;
+	cs-gpios = <&main_gpio0 51 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
@@ -1211,6 +1212,7 @@ &main_spi0 {
 &main_spi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_main_spi2>, <&pinctrl_main_spi2_cs0>;
+	cs-gpios = <&main_gpio0 39 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
-- 
2.52.0


