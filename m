Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE4DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vbnp6dppOJSaD1roIEtduY8gGhYGLVgiryJd/mNBLcc=; b=MMFbTmgJ9LWZHssQvBEnNFf/6h
	w//WN7yKfy+9WNGECn5rSON4QRV1IAAXy/2RAsfZOWs3bSsjtIofw/yd3mNtCzSQjKGaeZYx7w3UC
	zvLFH+zacmgcxefNYnMM+LKvgeMybGc2EoCQPBKiuUP8g216eBiWULmoxU1pnFFXUlUcw0ssIPeTj
	bfnKu2+kiP94HSFL8rbr652dc+Zmmw6iShkz/RCF+Zj/cx2Vh05Hk8U3GmM4S++QR7wxN4K6ZmSEY
	yNh9kqS59GaUHtr444Kz4rRdkWSo7WOmkI6nR2xjo3rkcP222m1M+rQhjIzaLjDDfHXSqXQ7z3KFe
	sqiIbaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRxV-00000007exW-3jjl;
	Wed, 08 Jan 2025 09:02:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRwJ-00000007eoe-27jh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736326881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vbnp6dppOJSaD1roIEtduY8gGhYGLVgiryJd/mNBLcc=;
	b=BkBjloeZGtY376fNDqK/KYxXhqn4DaZ0nI7OthR822lQD0i9lFpCusKzoWxCiN7NNrjNsL
	aBZ/PUgAKHz/m8s7yvCZqarsONZ6UQF0CS6FanCBVA/hbhHO+/gDURzrn7dXBhiFH4nVOs
	DU3s6ieBK001XxqkFIzUaKjhbp1uGuU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-IvcbMykrOmqbXcS7Zx6Ylg-1; Wed, 08 Jan 2025 03:59:53 -0500
X-MC-Unique: IvcbMykrOmqbXcS7Zx6Ylg-1
X-Mimecast-MFC-AGG-ID: IvcbMykrOmqbXcS7Zx6Ylg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436483218faso16426045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 00:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326792; x=1736931592;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbnp6dppOJSaD1roIEtduY8gGhYGLVgiryJd/mNBLcc=;
        b=iEpG6WSmVPsnBSxx9iYYGnwyrNL8otcDTzpoLeKvKhFQtfGMMplY5pUo6/JE/2aAjk
         9aT+/DRaSV7elldqSCGwHjWpX2cvXpXmVCrTpU9EY+1raKd61KTaIrwtrYOLNWee15CY
         tfJIVJhvSNxWn0l+gB8QTfe12qHRNX6/KmaYJr5KlkjAM1oQ8pwBml4Q7xCad9247xyc
         b8sJqVal6EA1KR5IE/2sWgbeG647oPS5M3MWDveOWroMHJ40OaXc+ne+5B0QnYl8aMS+
         cr5nBQo94+yU7OjwnEysj0h/blSKudVj2ON1zQfs1gGNCxulDbSeOJtBY8ENQKKb0ZCv
         ut8A==
X-Gm-Message-State: AOJu0YzTIwaCR/Q96/exNRJhqSHQsSQx6qxlk339jSZohnQYfGmz6QdG
	RAI22O3T0nvrxYs4bOGHj/VfnaAf0tONOml1imUMJCjf5GfCyri2f8ipt3ZH01Rr+a+7F98oDdy
	QpWShACjdyNG/ZrrENgcYCLdwEvihknncJLyYuW6jO565PhQRJ3Ka1FoonMthqmuvCEo6EW8l
X-Gm-Gg: ASbGncvFGvH8Xv8ShDT64lOHUPiPXjTGp4nWRjsFaNDDokqwfo53KfMGykv4kUp/F3l
	1FDbcb3XEhxbIr5RrhdnQW2ppYoaAXbplEwEsPlYIeH8HApLLao7Ixa63Dxvwn4Uz5OuTljamN7
	iwFAduPLXRhxBTtCWjJHa0PkmEnZmxSZP1qm8+o2IP17Qx6ngtVXVmVD6TwbZ50D36rAiKacx+J
	5BKRmFkRqTpOdq9oy8BxicR3YI6+3RzIJvvWiFlABuqnuMo+SsualMMU4o5x43+4s5quqw2h92f
	ihxnceEfks52GUmrerW65OIYWQ==
X-Received: by 2002:a05:6000:1889:b0:385:e877:c03b with SMTP id ffacd0b85a97d-38a872c7e22mr503654f8f.2.1736326792667;
        Wed, 08 Jan 2025 00:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxs4nyMy+4efmQct8BG2ReZXARDKC9cyCw0D7i11y2guRVXjKoX0Z2AbGHoIJ69Iu3suyW5w==
X-Received: by 2002:a05:6000:1889:b0:385:e877:c03b with SMTP id ffacd0b85a97d-38a872c7e22mr503640f8f.2.1736326792266;
        Wed, 08 Jan 2025 00:59:52 -0800 (PST)
Received: from [192.168.1.48] (162.red-83-45-90.dynamicip.rima-tde.net. [83.45.90.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddcda3sm13586785e9.22.2025.01.08.00.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:59:51 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 08 Jan 2025 09:59:46 +0100
Subject: [PATCH v3] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
MIME-Version: 1.0
Message-Id: <20250108-am69sk-dt-usb-v3-1-bb4981534754@redhat.com>
X-B4-Tracking: v=1; b=H4sIAIE+fmcC/3XMQQrCMBCF4atI1o40Y1MTV95DXEyTqQ3SVpIal
 NK7m3YjCi7fg++fROTgOYrjZhKBk49+6PPYbzfCttRfGbzLW2CBpZRYAXWViTdwIzxiDdpIXXC
 jdKOdyOYeuPHPtXe+5N36OA7hteaTXN5/pSRBApFSxO5Qa8OnwK6lcWeHTiyphB+ORfnLMXOnT
 I1kS2Wrbz7P8xsFcIVJ6gAAAA==
X-Change-ID: 20241126-am69sk-dt-usb-89180ef58f8d
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736326791; l=2889;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=rvcFoscZViVxDaJspALFWgoUr6T2RAOAuocr/57icVA=;
 b=Qkksndjyf8mnDQ0j6z34D8nnH2YTOy/nuMBKhsg0AHf6+rTAlJeqPNLm29cRE/pbdAyTPUUHG
 oQuYFDSYw9XDRtHbgNRvRmE6E4ftT9swXLieEjDXlpgJfPYsv0kMLD6
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jEbytmPFL5zNK2HKpb-r_SlsjSWbOItoIYSYEHsOjL4_1736326793
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_010123_616396_FC611F76 
X-CRM114-Status: GOOD (  16.39  )
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
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
I've been carrying this patch for quite long time in my builds to have
support for USB on my AM69-SK board without problems. For some reason this
patch was never send to upstream or I couldn't find it. So I took the
opportunity, now that I rebased my build, to send upstream.

I have maintained the original author of the downstream patch as is
basically his work.
---
Changes in v3:
- Set offset address in lower case for TIMER_IO1.USB0_DRVVBUS pin
- Link to v2: https://lore.kernel.org/r/20241204-am69sk-dt-usb-v2-1-d59b2ac45c6e@redhat.com

Changes in v2:
- Set dr_mode to otg to fully describe the hardware proprieties
- Link to v1: https://lore.kernel.org/r/20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index 1e36965a14032ca07143230855e04b9549f1d0d1..734d81019d286f233ac03fbaad9e80a0f7ad3ae3 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -484,6 +484,12 @@ J784S4_IOPAD(0x09C, PIN_OUTPUT, 0) /* (AF35) MCAN7_TX */
 		>;
 	};
 
+	main_usbss0_pins_default: main-usbss0-default-pins {
+		pinctrl-single,pins = <
+			J784S4_IOPAD(0x0ec, PIN_OUTPUT, 6) /* (AN37) TIMER_IO1.USB0_DRVVBUS */
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


