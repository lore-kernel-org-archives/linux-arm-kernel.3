Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A86ED3B7CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fq9q0biky9OpRw0dbtbwOh/TCxHi9sqzOOofCo6yTKw=; b=4DtDu9KNdrsj1FunssbBwQlJ6b
	QiyBUJ3m/Es8upBomA6vXL6P15SbiVu5J2T5gIGMUMUEyaZBAo28yOUcThsUy8tj1UzCiyDGROZ8A
	JAV874H4N53xWaue6QXjeGwIEQSShtuBHAfLOlDwlDAQKkwuRK6Xks5/kGRPQO0Tx6dJ2pG1L1hxn
	ZjzdjuKO5u72u5AvHYSIuP00Z+yWbeD1/HVOh/SjdyJzLVKmJCAmnT2Ab+YVYj1yfCyPaZK66BWIy
	JaaU4UsAV5s1eSfxVx4NUdlFjz7CPM3wKr7KvelDAz2vwAxubHsSaRgwxSR2M/s0ZgEseg4GRr58s
	ntYMNv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsVf-0000000AG1W-3av7;
	Tue, 26 Nov 2024 10:09:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsUh-0000000AFqD-3Gu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732615709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fq9q0biky9OpRw0dbtbwOh/TCxHi9sqzOOofCo6yTKw=;
	b=GM8K8K640zayLb2z69eu2z1FLgtiVqqA8FjIvpNlH/EoPRGQZdIjIoMPvzZQB0tin5u6+Y
	rgdAAeU9eLKAxngViV35OMlnlbDGtDU8NSye71LfksvBDEdsR8wn5nYfxFRgxoVvmEaNST
	dG4Bvd0cE7iZXn4S/ByfE0pzr4vV2Bo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-j2bLia6BPliVUP525g5Rkg-1; Tue, 26 Nov 2024 05:08:27 -0500
X-MC-Unique: j2bLia6BPliVUP525g5Rkg-1
X-Mimecast-MFC-AGG-ID: j2bLia6BPliVUP525g5Rkg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4349d7b7609so3153525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615706; x=1733220506;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq9q0biky9OpRw0dbtbwOh/TCxHi9sqzOOofCo6yTKw=;
        b=ezS7MobBv9TIC+PYb1aOaEun051w8Fu9f6d2gSQ8n9PfzvDB6RhoitwnsC5/AJA7bu
         u4MqdvWs768j2W5whDb0Kx3mwKnknxmXyCM3i5SAKyfOKkp6DeRApUK64L8ftrt17FJg
         XitTCQ18eOwkaxl4CvF/FQBYMVwjJ8jSBZCMLrKD6GwQeUEJvwrtTCTNrczYX8UZtwrw
         chvNQtTwsO2EhlV75mL/YCb3oqRoXCyBUVPpm5C3KEcn99lcHTTSD33+e/o3TZ50i/SJ
         XLjj5JWx0/0ymj8EXul3/Gacn+272fEoYx8LQMLSacrJZ3+Zu5mrISK2GF2MU4IAkgJI
         K82g==
X-Gm-Message-State: AOJu0Yxk35u8QH/6InCgMRtL2grXvwsrf+HveRUwtGXWdyUJ9kbPRwVu
	thxNQyH1I7l461znoLxHRBgIQeR4/leb5Rp7YQYGK2hp+X2CMr3i9Vv3gh0Utm8yROuI8Z2Ibf/
	0NisJZWQAsdBNE3/2MLF5EMevqjdpXg7dAHe2yZ5rmcCaDF5UvR6tJO0s7uDh5LrRhjclcvMk
X-Gm-Gg: ASbGncsibyEy5uPP+B5HkABkbgU9Dmr8FnKh1+WL8kkdPZ9nrJ006GcRvL5ktHr9tSs
	f0oAQNtbeEXdVIkLoCDOzUAeBhFWgsQ7LarOVg4+jXDANnwk/hXy1Sxqj5IuWxwyrO81Tex2cPu
	2+FIoDQgIRXQyt5sWapSkXiWOfDHu074YWRNcYKEo/afIp47kAUKcTKH513X565Su6AaXufSYfF
	c7Sly/pl5zHPTP+H1Ne6qgXrb5s1Qo8OoauImhSBokhQUBAKbaUVvDdo9Dij/+apyuQgJK4Syw/
	s4FWqD05PC4XSby+
X-Received: by 2002:a05:600c:5490:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-434a35089e5mr13353375e9.0.1732615706558;
        Tue, 26 Nov 2024 02:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcdvb3S8cnPM7PxynTPeWCPWcNAxtPzHc8ZlB/++BpaqHt+EG4RUx3doFnbJGVCosm9yICXg==
X-Received: by 2002:a05:600c:5490:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-434a35089e5mr13353195e9.0.1732615706130;
        Tue, 26 Nov 2024 02:08:26 -0800 (PST)
Received: from [192.168.1.51] (50.red-83-45-91.dynamicip.rima-tde.net. [83.45.91.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb4ecd8sm12851203f8f.60.2024.11.26.02.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 02:08:25 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 26 Nov 2024 11:08:19 +0100
Subject: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
MIME-Version: 1.0
Message-Id: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
X-B4-Tracking: v=1; b=H4sIABKeRWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMz3cRcM8vibN2UEt3S4iRdC0tDC4PUNFOLNIsUJaCegqLUtMwKsHn
 RsbW1AD6mwZFfAAAA
X-Change-ID: 20241126-am69sk-dt-usb-89180ef58f8d
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732615705; l=2485;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=bT/35JMF1+qLpDfXB2Q3jx1Ol/t4nxsjkwGX8bY51Jo=;
 b=7jrfrXs1ya8OfzpPtuUbESrW1gPpkkr97NF+q5NtsQDPkoHtxktfWvCWP3xFRyuifAGaqF1sa
 CY6Hs9aSQoPAGPlL1ge9DEYSisj6VWHBHQ2Kv9gb5vkRvlYiHceUzg3
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: urGB03_xnZt1Aeba5wQ6rEMogqrUXNQZ1sIS20DK7dk_1732615707
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_020831_893079_15F86A6F 
X-CRM114-Status: GOOD (  15.51  )
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
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index 1e36965a14032ca07143230855e04b9549f1d0d1..72797f4b689c1d069bf395d6d4fe1846dc4e4297 100644
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
+	dr_mode = "host";
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


