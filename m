Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E0ACA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXh3vZ4NhMNbRY+711QF0IKLvXtkSkoVzN0h2hJXRbg=; b=k8SVjFqIyHCBphaIPKsbEsdhV5
	lggkUqZvRutfllkq3c59qUc+nUvaxw2wrzPIGmmd5sI2tzbpIreIqNTcu8Y5C3f3PbfZaMIcv4gSt
	EmRcUafFrJB0SrNJFAiRWxFeUhkEsqAXXIqFlOSxihImP7HEzCC0SluO5t94hbNMaRIbAX4H9QV6n
	z7uThOM54qukc4UQRaWLFAjhqpphGVWVQcj3E6cLem1J1dQLsTHO/Mi7U/X4g9WvAYWlPlOTXES7c
	5Iqqec9JXUOM9lYIB1aaU1zIEU3fRdibOxKJBpPYp0+yoS2YcCL+p9Yvcy3r/IIIFqjBGGoZsaajs
	sFASSqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vn-0000000DHax-46x5;
	Mon, 01 Sep 2025 16:36:07 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zX-0000000Caki-0RfI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:36 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso2720020e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731034; x=1757335834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXh3vZ4NhMNbRY+711QF0IKLvXtkSkoVzN0h2hJXRbg=;
        b=SIX+No9jyc6DeP92ARBpnbIUVetG8jQdhqLUWkLP5s6ao4g3gPiB05hl6fCsYCP2mV
         w3vI1q9OGgQnmHqepUIckhhncgjeh9AaZnBT/s98HThtB9h53CkN4PSjaDPhW2WSwmW3
         Ym2dSswep52D9w33ryIY8ftbPFAIl/OnKCUzaiRs48ncqJB3kBmAuX0g8Ige6WEN7Xzd
         6JpNhVihPH+q9P73fPNFl4blqMBrL1uI9dxcXe903vA/RkYf/6kKnQj3XAxD+HFN1RiI
         mOSgCK90FVuyzSX/wS7XalwfbIDXy+bgfAgfoXcp4MOWJekDd5QjLev7iYYvkKkQTsY8
         AizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731034; x=1757335834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXh3vZ4NhMNbRY+711QF0IKLvXtkSkoVzN0h2hJXRbg=;
        b=IkDtbGQ0mqPExwMwlShShKQ8Z1LKVn8PT4StRSIX2qmbnlPaz/bnY5FzrZv6ZbNRXo
         p6uUCMWSp0fUPQCYbJ630GhZ+DOiVu3yop8rikDQRm3SkFYz37fJh3+iT6gPL5sJ1mbu
         wI1zZWnP1MN87INytva/Ozt4vZi61k+wjfF7ADh1qFDpMGxyMR8kaPUNlXRpCza7QOIP
         aVIGX08OCdMNoYBKNsy8bwGOE5q8GeMp/n+aQEz1h0R2u2PYcCGESxgRhmJReVADsJcF
         BusPSK5GVAA42rkiu8qa4rPZ1y92TXpP3LqfLHIIY+Nv//EpJrYzqJZYZ3I/cx1HQByQ
         5TDQ==
X-Gm-Message-State: AOJu0YxDy1MDfEDux4qFINGbN4eLPBA3WQ4uqnbIAb+Fh88ZBoAf9mPB
	D3X2cNx6PChHYC0CToZo1uuNTVC5t4gvtwBsfgKqlAjeGWHDlY1f8LiXXne0DoIBzXs=
X-Gm-Gg: ASbGncvfeJQB+elYTzdP2TMJyqyYJ+1mlVRYLz+2x24De+BbQvyOCDf/qEX05ipo6yq
	1J95HdXgcVF0fLOIKwKph8HoG0Ep3L0NppDkPFMw92xFAQMDyGrSlPuop3ETmKkSPkysDmql5JA
	c90dvADywLSpmccLtkj6Lgzwck936zCAko6LMb6+9dK6SLIFUM9JkvLrsok7yzISW4PlbqEKnR+
	0GLMDrfMJbjoa20mAO1FevmnvPudwXBtrMmgeNqKn7SX5ya7zP4F1Vg/lPrYEFXQZQPL9oh6GmD
	6MfD7tD4i4cEzpvbLMTxCz8NnSFwZSFa/pXDvK+pJ9KvCOC56v+3+Io/ApQKLuM7+kDpVuVqkeD
	PjaJAo83w3ek/vCdC0jVOxocQmNw5BIoq
X-Google-Smtp-Source: AGHT+IGOC9S1NM18d1gVyqO6nhT9Tt2mIjPkMGx7R8oHtSLr0JTQxTWv5ssBqKh7F0v91XCGOFSxwA==
X-Received: by 2002:a05:6512:3b8b:b0:55f:554c:b1fb with SMTP id 2adb3069b0e04-55f70912819mr2082669e87.29.1756731033536;
        Mon, 01 Sep 2025 05:50:33 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:30 +0200
Subject: [PATCH 5/8] ARM: dts: bcm6855: Add I2C bus blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-5-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055035_149598_E9F8FE92 
X-CRM114-Status: GOOD (  12.14  )
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

The BCM6855 has two STB I2C blocks, the second one in
the PERF1 area at 0xff85a800, this is covered by the
current bus range.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6855.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6855.dtsi b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
index a88c3f0fbcb037ee5c6b31933415f90cb51ded2a..d74788c6ebf5f4f69887c496d508c35d276d0b0b 100644
--- a/arch/arm/boot/dts/broadcom/bcm6855.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
@@ -240,6 +240,15 @@ nandcs: nand@0 {
 			};
 		};
 
+		i2c0: i2c@2100 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x2100 0x60>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		leds: led-controller@3000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -278,5 +287,14 @@ uart1: serial@13000 {
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		i2c1: i2c@5a800 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x5a800 0x60>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.50.1


