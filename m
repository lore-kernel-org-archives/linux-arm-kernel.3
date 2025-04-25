Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BECC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow+UI0NPOq4F4k1XRdbs16ucXtgoo6yarOk2Eu1UB88=; b=XMvZgpQMAA0OSlqwCxdTr0sKQ3
	h/7aY7meJbTaamC4CCsaE4dSB7YoGseDsjw3DdAqKqUrwlm5HclMlJKuycFgLnhCxlHUkyTdYn01e
	reQ8aYYI4X99uVnaUm3oxzdxDHGBW5/jTlh+GL709zksJECXbsoYwX0Hzdcx9oJ3fOfJhXshB8+Qa
	62Y0rz3OS885MtnEpt6xGzAlo3W1zn+rmmq+tvyxT5d2thsQxagZiu5ThlJqS3zpNQXbte++VNfGG
	Bhg8XmbtSy3sTh5ShDNZtomw1+RGqiOllL/xiNzELU81tcQUJKBa2FtE4ARw7yr20B+DWhTxRN5AL
	tJbo1g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8g-00000000RXr-0aXN;
	Fri, 25 Apr 2025 17:47:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KpH-0000000016e-2q5A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:18:52 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so1974551a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594329; x=1746199129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow+UI0NPOq4F4k1XRdbs16ucXtgoo6yarOk2Eu1UB88=;
        b=PAFZryrliSmp9h5L5o45kWaWdwjLGCeljw92L9RIVY2+81lfXhUDFLSNw//CtTw9qX
         JdJxxbfx+RnRB9mbwPH3tVPceCNPIic/HfpTnCKqzBRTSQU6panieFD+dQs9RX1+C8Dp
         b35vZcCA+T9ihFA0i7YXFacnS9G/CqwkSrMqy7PIOo/9sip5yFYP07Q4QKuTzW3/ldXc
         Bwf4dj61g9HXlhdzpmGabeJTLq6FskuGwrBYzH1FUT/JxGF3UwhRaOCebSH8+yQp8dRq
         u929exCQquD8SzitzSZeSssB5yNLYNnOpWdA2O3n+s1eq4P3igKSsgHTKAXZNdSjKqR/
         qZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594329; x=1746199129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow+UI0NPOq4F4k1XRdbs16ucXtgoo6yarOk2Eu1UB88=;
        b=hBysmwi45Yhp2KTo9LQhslboxCUNsJQDFCsKbfDtLRDwvY3Izm7b8kFM0HvdldQDwg
         AJYKwUGJfz/8uHSn5boAprxSfdjtdsUTS7PRy/jJ/U/C4RlHetpdwr5XnDXhkdMwzeqg
         oOX2EAf52YAtcijCyhYlrk/sGB6RgU5RzZd2/50iBjzUXIOpsOOhSha1731kYTcoVzx0
         wycpV9aJPpxdZl5bKS/4Qh81gZ2UhBIurvaNdu1vofW7gKE2+AaDAEMVvRCT8Poa4S4S
         hmAvv4ar9iZrX5McM1GXHkRPO/dUKE24g/YYa0d4LzQiS9Klc5G4w3tlFKV200tlQQZR
         NCbw==
X-Forwarded-Encrypted: i=1; AJvYcCWodwzNqvT2j/7Nr9SwzfxMf/KBBg1Qxzy3XXcR1EA+KmQTh/cERqQb/91xHRDiJunzhKCiuObGRjLHrWtfDZXJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1VD9aliICKC3jm31IeKNb0P+dtPSn3xzP7asBzST5vBR+/FI
	nNoHC3eMwxXgQmAGTMug4v/ISYhoGvLz29iI8R6w/kjoGLqF8DsokOe1TDHsJCwgyyHv58HygON
	gY7E=
X-Gm-Gg: ASbGncuzq5PVsFltH9QGMoAcharL0gprA2lCJcMN4f3odUyu2MAwc4UTTHKiNGjI2cE
	0r0cGyWM7WHHRUWIRXzp6jmkw/2NBoaTFWDtQGnOuS3+Zkjpb9Gq3LhapNsKD4XiiajtW3XBmTL
	1OTLQUqzFOX1o3rStvrR58CrDXUa0c9PNfz1KbSihvKMy2yARivGl9K36Of6Zhpl/LErTMIm7+N
	x/HzFQlF2jazFi6EwVY9X2SSHn2VqO0y7ffXMKFFwl2jIBWPOSY/80M+si39PSMcbJC3hIYqVW7
	dbGCDNi96dzonkQuo4D1eN9UFe41a5Db6sKfdRTEUCR7CYJ2L5/csLPgAw==
X-Google-Smtp-Source: AGHT+IHLD6XdK+4P1TnWS4a50TCqQBANW7xBQ8lr6hgbyOsYBCK2P26JRQZuJdTwivbVOS6RTnoM6A==
X-Received: by 2002:a17:907:3f0d:b0:ac8:1bbe:1a5b with SMTP id a640c23a62f3a-ace5a27b983mr482588066b.9.1745594329437;
        Fri, 25 Apr 2025 08:18:49 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:09 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: disable unrouted USB
 controllers and PHY on RK3399 Puma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-4-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_081851_708125_49BFC8AB 
X-CRM114-Status: GOOD (  11.62  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The u2phy1_host port is the part of the USB PHY1 (namely the
HOST1_DP/DM lanes) which routes directly to the USB2.0 HOST
controller[1]. The other lanes of the PHY are routed to the USB3.0 OTG
controller (dwc3), which we do use.

The HOST1_DP/DM lanes aren't routed on RK3399 Puma so let's simply
disable the USB2.0 controllers and associated part in USB2.0 PHY.

No intended functional change.

[1] https://rockchip.fr/Rockchip%20RK3399%20TRM%20V1.3%20Part2.pdf
    Chapter 2 USB2.0 PHY
Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index dd5a9bca26d1d221607e73071685d5774330d760..5c1162e2f34f9c9786da1f774dffa71adda23dbc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -579,10 +579,6 @@ &u2phy1 {
 	u2phy1_otg: otg-port {
 		status = "okay";
 	};
-
-	u2phy1_host: host-port {
-		status = "okay";
-	};
 };
 
 &usbdrd3_1 {
@@ -616,11 +612,3 @@ hub_3_0: hub@2 {
 		vdd2-supply = <&vcc3v3_sys>;
 	};
 };
-
-&usb_host1_ehci {
-	status = "okay";
-};
-
-&usb_host1_ohci {
-	status = "okay";
-};

-- 
2.43.0


