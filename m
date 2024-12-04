Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C59E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pYs9v+5xS9o1woYf9AwDTUqR002kQs92H7EyPMP95fA=; b=VrtLGJvvsi7HP0EMK7QS+EntbI
	3OiPfiE9Uye3hInnkvvpYeWkUzpNdEmPGKU/iOsxFxJUhp0zGJ4ymzJ18umhc4y77F4qtniNEKjK2
	UJesZ5OEqNkNJWmjOyASoGmx1EeYKFIRGMVrfXShR1q8Tpoo544Kj3w3azgdF0FQmYnAfml+m/Hpi
	Vi27ArkzHGiH9kJNLUu32MA2+ZomI7S3tqyMF/MZhqYpYubxhR3WTVedOeU3N1BICs+a/+xqrOQJ5
	SHq0o1nv+EueJjOaRzTE19UFrqj2qgQRfhygxH1/cBVdK4ghVVh1lNNdvBOHFlmiqe+slhoi1/lra
	hk1RDJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInDQ-0000000CJOA-0jNB;
	Wed, 04 Dec 2024 11:06:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInCP-0000000CJ8G-07V1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733310340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pYs9v+5xS9o1woYf9AwDTUqR002kQs92H7EyPMP95fA=;
	b=Ip50DpsW39UO1Bn+qujqFMCyLi/LNgmAOm/omcfM7o76mhHz9SfgdQd++F90UzsQjfWAhU
	Fib2szdp1DR42cuOt2d9ppVsWBOXLMVNksq2eSWFee4yH99EwOjWLo+XbfH2EKC1CrWKSk
	6OCguU3nf8Nt31V0U0TK0J/EeWUh/KQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-lifWS4JJMuqqqin2cPOf6A-1; Wed, 04 Dec 2024 06:05:39 -0500
X-MC-Unique: lifWS4JJMuqqqin2cPOf6A-1
X-Mimecast-MFC-AGG-ID: lifWS4JJMuqqqin2cPOf6A
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-466d3ec228bso8612561cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 03:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310338; x=1733915138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYs9v+5xS9o1woYf9AwDTUqR002kQs92H7EyPMP95fA=;
        b=CL7NprQcphCZPgAWe2v6Rfh5AwjDebfY7vQKOLlCWRWWXVi8L6bZoezmQ2prE1EkTv
         +J2OesUhKmocHCXXKhXa9aDgjnTqXew5S70ilvusNtMUO7eHOK/EzzKXWJyA1QHy9Un8
         OydHWXgtqtHNVZh2xuXMPLQLYwVAOYWrEBAg+zejueJN8QDSvY5kCUIWFBGcACxQGiyn
         35MJKZQwRYTZh33RV7rMJ41P3PQpKCzsegPdaIEflDgNLTXHRiQ6sIDOSYOeyjkkBUz7
         0KqGE6Xo9lNOlIa+buIvlCHE5Wc400Tnv6Lz15g7c1U2RAFgvbGyaaKeFaeJj1UtR0kf
         Jnaw==
X-Gm-Message-State: AOJu0YxGvZ91GIIJTvNlLrSnP9YwmoU9nRrAgeRpvjPbYTDaOnC1sT78
	SnYcDr08hc/M9InP/qnF/w+pJGwnOfJOuwAr5qMaaSBTLHCx8Fgr6gJEHVazSJwfNc0YIlIeMd2
	4RA57qRVUmD3rgCNPyCzsw29AS5vq6ODHN4/Ur03jqphISygz29MuRTE/AH2n0ko1NMxkIVO1ns
	knc6RiAJaf9A==
X-Gm-Gg: ASbGncsRz5tk/xRJsZYEQ0HiYv4jCrF4ELCT6s86nujpHoJKc3AGl5vaKDnbQnZUgQc
	aqLzpOBEFImwJzWxRZ4kD49zR75gr+waepCIJqx4J5Av1W5FMOPk/t62MxJ86F1I+gKjAKwfyyB
	iCbNGfguUWacOu54599z0IEah4mvZrAzvL2hAWX296Vff6OXIqvRnepoV0Wm9LaSTByxynZV80G
	JTpxKyLG+1lrSJQJuQjR2IR5T+5MhKr3rTNuz+hIjt2Z3fKCag=
X-Received: by 2002:ac8:7f88:0:b0:461:653a:eab with SMTP id d75a77b69052e-4670c36962cmr38331951cf.6.1733310338014;
        Wed, 04 Dec 2024 03:05:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOpNUOSt5wAKrvynr/39CNBeGiecoP/HZQKzUprTjksMnD7nDIzipnydiPdmgrbnAKZRyvKw==
X-Received: by 2002:ac8:7f88:0:b0:461:653a:eab with SMTP id d75a77b69052e-4670c36962cmr38331741cf.6.1733310337586;
        Wed, 04 Dec 2024 03:05:37 -0800 (PST)
Received: from [192.168.1.51] ([83.45.91.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466c407e11esm72245921cf.42.2024.12.04.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:05:37 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 04 Dec 2024 12:05:26 +0100
Subject: [PATCH v2] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
MIME-Version: 1.0
Message-Id: <20241204-am69sk-dt-usb-v2-1-d59b2ac45c6e@redhat.com>
X-B4-Tracking: v=1; b=H4sIAHU3UGcC/3XMQQ7CIBCF4as0s3ZMIVLBlfcwXdAyCDEtBpBoG
 u4udu/yf8n7NkgUPSW4dBtEKj75sLbghw5mp9c7oTetgff8xBgfUC+DSg80GV9pQqmY7MkKaaW
 B9nlGsv69e7extfMph/jZ+cJ+6z+pMGSotRCazHmSiq6RjNP5OIcFxlrrF8JCOICrAAAA
X-Change-ID: 20241126-am69sk-dt-usb-89180ef58f8d
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733310335; l=2663;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=FMm9H6sLzpHevS+BDD1ZhChgz+IY/7iaPRnVhXYcLc8=;
 b=4mJOPQHNLdI0jquYC0yWN66Urs5UsMcZCIcQ7ufmqldmUjbtjc5nmPxy0Lo9kBftq27tGXGyv
 6Wq10Ov1mjzBotzxZIFBNGQOFnYtMXLNGUm2mAm7c483cKISscpv0Mw
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ivqB1LRc-av-_pCF37DLEbz6JTf8iePcukwlYUKLL5w_1733310338
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_030541_141011_9D8F57E1 
X-CRM114-Status: GOOD (  16.66  )
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

From: Dasnavis Sabiya <sabiya.d@ti.com>

AM69 SK board has two stacked USB3 connectors:
   1. USB3 (Stacked TypeA + TypeC)
   2. USB3 TypeA Hub interfaced through TUSB8041.

The board uses SERDES0 Lane 3 for USB3 IP. So update the
SerDes lane info for PCIe and USB. Add the pin mux data
and enable USB 3.0 support with its respective SERDES settings.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
I've been carrying this patch for quite long time in my builds to have
support for USB on my AM69-SK board without problems. For some reason this
patch was never send to upstream or I couldn't find it. So I took the
opportunity, now that I rebased my build, to send upstream.

I have maintained the original author of the downstream patch as is
basically his work.
---
Changes in v2:
- Set dr_mode to otg to fully describe the hardware proprieties
- Link to v1: https://lore.kernel.org/r/20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index 1e36965a14032ca07143230855e04b9549f1d0d1..353579dedb19a4f9809913570143666f4c4ec53e 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -484,6 +484,12 @@ J784S4_IOPAD(0x09C, PIN_OUTPUT, 0) /* (AF35) MCAN7_TX */
 		>;
 	};
 
+	main_usbss0_pins_default: main-usbss0-default-pins {
+		pinctrl-single,pins = <
+			J784S4_IOPAD(0x0EC, PIN_OUTPUT, 6) /* (AN37) TIMER_IO1.USB0_DRVVBUS */
+		>;
+	};
+
 };
 
 &wkup_pmx0 {
@@ -1299,6 +1305,14 @@ serdes0_pcie_link: phy@0 {
 		cdns,phy-type = <PHY_TYPE_PCIE>;
 		resets = <&serdes_wiz0 1>, <&serdes_wiz0 2>, <&serdes_wiz0 3>;
 	};
+
+	serdes0_usb_link: phy@3 {
+		reg = <3>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_USB3>;
+		resets = <&serdes_wiz0 4>;
+	};
 };
 
 &serdes_wiz1 {
@@ -1339,3 +1353,22 @@ &pcie3_rc {
 	phy-names = "pcie-phy";
 	num-lanes = <1>;
 };
+
+&usb_serdes_mux {
+	idle-states = <0>; /* USB0 to SERDES0 */
+};
+
+&usbss0 {
+	status = "okay";
+	pinctrl-0 = <&main_usbss0_pins_default>;
+	pinctrl-names = "default";
+	ti,vbus-divider;
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "otg";
+	maximum-speed = "super-speed";
+	phys = <&serdes0_usb_link>;
+	phy-names = "cdns3,usb3-phy";
+};

---
base-commit: 7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
change-id: 20241126-am69sk-dt-usb-89180ef58f8d

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


