Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA03C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 23:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5aj5vUWJXyfqyhprLvdwVUEl/uN3d7BC1IvykTif/4=; b=cLf6ncMWsD0t7bAZ8gJo4keh4q
	Zf9Eyd3yZywje8qAhn04up930PhGQivYf9zq5J7tyw3hDzxYtumDfLi1HymELeuKrCsoTTVknLEmV
	5nn4MPJOJSsA7SOruK/wTVPMIk9fz0d8tOqODiidf0qqlqtQbgyHa6uYRuOYaKhPuPpBg+NqQs25d
	HhcHlnJacms2OSsAbwWz8ngjXwgSeIIK/aEVzT4vdozkDL4Nkd7ZiDEk2uTdwSrORScp3k4mTGsu4
	bq/6mP/uRNGcumjJqcgk1VPlp6ECy8DDLnu/JuVNpFb3eb6UQ1MdtUcSRVJLHU/v5FrTnfcI/WOrb
	jGIMVuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhd0P-00000004gvX-0vkH;
	Thu, 31 Jul 2025 23:48:13 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcxp-00000004gcz-4Bx6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 23:45:35 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6159466e80aso151252eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 16:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754005533; x=1754610333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5aj5vUWJXyfqyhprLvdwVUEl/uN3d7BC1IvykTif/4=;
        b=RGbie3B8hyfaHf5rdoPv4lJ5Xbk2G6gHepiH4KzM74FkQMbp4/101xs+dDJ7A8oki3
         g0Da2wR7+g5LrXTx6b9ovGukmKhSOgxCL2N5cR/s4qktB5c8hq4xwRGi7r7c3lNa4D6R
         Egsf4Pgb5+/OoAA+pfrjL0ZMKsEsblVukCVdIlCxwyxVuhKR7vWNurogUjB2lURpI69o
         YZaEBHMuQrGJrj0SERjrULedznFOdIm6XgPk6fgh1BAVCebXxj40cFa0agXYz4Q+vo+8
         DPfUG7funy8eiQ95OA+S553iFwBcsEAF7fF7IT9d4mCeM3rmzFngLB2689yosMj0W9Yk
         /L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754005533; x=1754610333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5aj5vUWJXyfqyhprLvdwVUEl/uN3d7BC1IvykTif/4=;
        b=XLECNNXZK6guYrKVT8VI/TRYMURkNzkt4tQpHMtXWasoGacRp9ccBo/FO1lKXUBuRi
         dNkIUWYtMk5nYFICvT7Q4NEhQLrJp8866gg0J7dkB4n1IHkUjIrj69raLHCqs3+mcBI7
         ybJbQwwH23XbStVGadguspBCGajeAQ30mbRxa1U/04SOMg/M4sEivlMsEicx7EfBCQIE
         woJZ4QWnlMtU8mRnJHMKC1cboKwZcIcScd5nhopmBUmJ4cvf5GZ9y8b+WS+DEuoDA2iR
         Ky9GhkdgItWUS7zIK3bmJ9qQAz23h4MDeAFt3ePgwgbGyzj108ejigxilkQf2m9iQURo
         2zZA==
X-Forwarded-Encrypted: i=1; AJvYcCW7k/uYvZORLnW9+DH9/e+x0xWrLQAaPddU4QSGbtLC14TGRvgv0ee0i7ZOL4wZRaUAro9YvcmHl9tZl21NXKJP@lists.infradead.org
X-Gm-Message-State: AOJu0YwyrKBFUFjpYWNoDJg0snex17pdXl2HHlXufVTc+u3uLG8qica7
	9S0si6fDut+lH2iLcA4tJlNAoGLWlEb+Glff0JCxvrQoc9AI7cgFEXVdrHVCCugPd8w=
X-Gm-Gg: ASbGncuNya0uSLnlD47Qdw9RPW6cIyPbUyTds7rOv6z4ddyUd3uNg/bb4CAToJjCNBq
	h62ssGOG/AAPfNzHDRq6g+ciKXn8jG5R4AsM6cDkRrPOJ9coatXqeS1ZzKxdYUJWC7LZVctUdWk
	sjkjKVy6wlv4WvuJk6ubWp4/UcJ517dmEP7440Fvbb31Qz+okBCtkUaG9kcOZvub5It98y23bJM
	bBhLm+nJ9ZaS3vDIjqGfmxag2SZtnlYgYaUya5HPbO2yNGjq52naUioGw3FRbAfJYE6FjYeh9b/
	UOFyAB0Nktc7q47Wc6EBGIZtGe8wFBxwcJcLqL2bnZ+fic+MdAGJwWwDDhbTN6RtZ6Cx2yfd/g2
	OgWuOzVkKZzMB3zEBgcw7e9uFMg==
X-Google-Smtp-Source: AGHT+IFuo3EccWt2eqaswL/GXTzhTAtiWo9RPTumIYwjblTx1Ehjy9OmBX7qt65iTSqVmlJ1VnsAJQ==
X-Received: by 2002:a05:6820:6682:b0:619:7ffe:b0af with SMTP id 006d021491bc7-6197ffec3b4mr712572eaf.8.1754005532733;
        Thu, 31 Jul 2025 16:45:32 -0700 (PDT)
Received: from localhost ([136.49.61.16])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-619704e167bsm373502eaf.4.2025.07.31.16.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:45:32 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Add Ethernet node for E850-96 board
Date: Thu, 31 Jul 2025 18:45:32 -0500
Message-Id: <20250731234532.12903-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_164534_060181_9E20F763 
X-CRM114-Status: GOOD (  12.23  )
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

The E850-96 board has a hard-wired LAN9514 chip which acts as a USB hub
and Ethernet bridge. It's being discovered dynamically when the USB bus
gets enumerated, but the corresponding Ethernet device tree node is
still needed for the bootloader to pass the MAC address through. Add
LAN9514 nodes as described in [1]. 'local-mac-address' property (in the
'ethernet' node) is used for MAC address handover from the bootloader to
Linux.

[1] Documentation/devicetree/bindings/net/microchip,lan95xx.yaml

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index 7d70a32e75b2..ab076d326a49 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -21,6 +21,7 @@ / {
 	compatible = "winlink,e850-96", "samsung,exynos850";
 
 	aliases {
+		ethernet0 = &ethernet;
 		mmc0 = &mmc_0;
 		serial0 = &serial_0;
 	};
@@ -241,10 +242,24 @@ &usbdrd {
 };
 
 &usbdrd_dwc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	dr_mode = "otg";
 	usb-role-switch;
 	role-switch-default-mode = "host";
 
+	hub@1 {
+		compatible = "usb424,9514";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: ethernet@1 {
+			compatible = "usb424,ec00";
+			reg = <1>;
+		};
+	};
+
 	port {
 		usb1_drd_sw: endpoint {
 			remote-endpoint = <&usb_dr_connector>;
-- 
2.39.5


