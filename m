Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9738C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7BrT2+nT+N4tgNO1pioJM6cfeiIHX1JI8prXFl5Eq4=; b=TMiW5Agu+0vRxsa2VuS1jH0Wpo
	FepHUnkEHS77b05rxvIe2IKo1PMtx7/qMEZkIR8nXDktByJSsC35dsyNNZ+jJpuoVjQ7Ju/wnRba6
	vZunQdv6jiXjfNB4v5b8N/TCvVSRE9skr09oKU6GDfGa/gvCoRzMO9swNmY3t1udIsjRXnonO/J5O
	KQgYJRGIFqX9FS62+xoHEI7rtyPoeK/PyuVJr4B6rjcjoH6uwgyWdhc+YoROoj6tsKFPznA+Oaqw0
	1LQs/7QC3m3DsImC5GNdyw5voCebSP3S8AGXSxOzXbYrbE/ZD2NZzpEjJnMpA6YVuP64k6G/AggYK
	M7NAdQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kpy-00000008Y4S-0SNA;
	Tue, 22 Apr 2025 21:07:26 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kma-00000008XkE-1cAZ;
	Tue, 22 Apr 2025 21:03:57 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-476805acddaso65729991cf.1;
        Tue, 22 Apr 2025 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745355835; x=1745960635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7BrT2+nT+N4tgNO1pioJM6cfeiIHX1JI8prXFl5Eq4=;
        b=HnsdvLbgcWhPeIs8QLgyuWmonKVO5btVKRbkiub6KPpYVm2A4BCt6UEjlcVKVyT7xi
         U7Uj0JmsLVj1B1mMynCVVRNlP2zZrKh0qIxqQ8AVNMGbjWoUXisD2cPPk+HQF6vuLtW5
         NewdIfWE/wrebbfWt7DHWnGb25h6RhJDCZErlVIckECi0Jd04GZtj0VjsVKgWjgMrQia
         AZbZ9ag1TtMuCpcmQQa5OO+pBL6sOWA6UcikcFczVG2gx17HE3301CfXcfgCn9H01Jhr
         zBDhce4ecwkkCt7zMi7flG6VL5oY9L0cwly2JDEsBiNEOXSFuykUQoKsgYe++3Cqplxs
         jixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745355835; x=1745960635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7BrT2+nT+N4tgNO1pioJM6cfeiIHX1JI8prXFl5Eq4=;
        b=wLJyphGAegDJ6C031Z78u5PWEplXrTpZnbYBCwOkjxEZmGbjVA90fMiUOXNFxta/aS
         TjyAW1MscPTexWEz7hKfpA575caxhybJTI2zvYKZLGGIjnDdjpY0DCtSsY+8jMEgjmhK
         9nZeZLnefDRoo/f4pVQddN8s2q1rumger+n6paqO4kaxypXB7uPvxMKrZbQK95UZ4mnH
         9+rVLJpTvlgGjS+tlJe1z0Ytm9e8R+kAMIt0A09HfEfjC2fCe2h6UW13jSS+Wa7l4DC1
         DN5h3vrRKn6mwt1aTYRv1sLdXti9RXwKzSJo0YgxkWkCfZthg2c+TRDAv3b+IfGJADxA
         Jfvg==
X-Forwarded-Encrypted: i=1; AJvYcCVjf9tuQaSo4xS+UeRApVpAAcpVgUJtDD0HsaW9udgL+tpLcuKwesPaOgwAROIB+bKjhSiOVZYUPNqsm/pDyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+SViywnvU+ucWwWwzSr7zaiyjZCTUHAbYkCi/K4f0nI+gf63m
	MMZtR5fAwskxKFJ8VsJGfvSmkzkI1HOKS6jbBfr0cJgt+9iK5cmVkEsPVje6a7A=
X-Gm-Gg: ASbGnct0briq8YZk+1v5CnSkO0RjwVnG5LeUCZWTvmPURTTT6iShbgDDzBeDr1MaMGo
	d7+qxwEhbfA5syo8KsShU/FgPHIQnRLg73V06UaXOF7xRGbN60f8t8kIA+DILInqPG4c1Vqe1MA
	znV19t+6P9XLRvNKzxGIh/5nENH5Sp3l2KenygPAtEtwYixpAGVGOfOZIb6WPrb6CR0Y3ontd8B
	iBPI7LNFoUjN8YNO3ILg3y1KsuoHi1MltqupL/tHg7zqXE5sWeXhYxVcPnTmuCBF9COnWxvyy/6
	daWbEqMAyY+bPBeiF6aCSgYpabtoAF2fhTWF/VoGp1rVl052O6gz
X-Google-Smtp-Source: AGHT+IGxwGTSRZInSkpN3XIto/A4QPy1xC+3qrFHbb9hVq1/2bj9Uzz0M1o299cR0cZz+hXdDFtIRg==
X-Received: by 2002:a05:622a:1a01:b0:476:aead:802c with SMTP id d75a77b69052e-47aec49fea9mr313701251cf.36.1745355835019;
        Tue, 22 Apr 2025 14:03:55 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9881sm60031321cf.65.2025.04.22.14.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:03:54 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	sigmaris@gmail.com,
	John Clark <inindev@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
Date: Tue, 22 Apr 2025 17:03:45 -0400
Message-Id: <20250422210345.196050-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250419023715.16811-1-inindev@gmail.com>
References: <20250419023715.16811-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_140356_421627_243B0E2A 
X-CRM114-Status: GOOD (  14.86  )
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

The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
regulator disabled, gpio-58 out lo) due to misconfiguration. The
original setup with regulator-always-on and regulator-boot-on forced
the port on, masking the issue, but removing these properties revealed
that the fusb302 driver was not enabling the regulator dynamically.

Changes:
- Removed regulator-always-on and regulator-boot-on from vbus5v0_typec
  and vbus5v0_usb to allow driver control.
- Changed power-role from "source" to "dual" in the usb-c-connector to
  support OTG functionality.
- Added pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2> to the FUSB302MPX
  node to specify USB Power Delivery (PD) Revision 2.0, Version 1.2,
  ensuring the driver correctly advertises PD capabilities and
  negotiates power roles (source/sink).
- Added op-sink-microwatt and sink-pdos for proper sink mode
  configuration (1W min, 15W max).
- Added typec-power-opmode = "1.5A" to enable 1.5A fallback for non-PD
  USB-C devices, aligning with the 5V/2A hardware limit.
- Set try-power-role to "source" to prioritize VBUS enablement.
- Adjusted usb_host0_xhci dr_mode from "host" to "otg" and added
  usb-role-switch for dual-role support.

Testing:
- Verified VBUS (5V) delivery to a sink device (USB thumb drive).
- Confirmed USB host mode with lsusb detecting connected devices.
- Validated USB device mode with adb devices when connected to a PC.
- Tested dual-role (OTG) functionality with try-power-role set to
  "source" and "sink"; "source" prioritizes faster VBUS activation.
- Validated functionality with a mobile device, including USB Power
  Delivery, file transfer, USB tethering, MIDI, and image transfer.
- Tested USB-C Ethernet adapter compatibility in host mode.
- Tested USB-C hub compatibility in host mode.

Signed-off-by: John Clark <inindev@gmail.com>

---
Changes in v2:
- Changed typec-power-opmode from "3.0A" to "1.5A" to conservatively
  align with the 5V/2A hardware limit, addressing feedback from Hugh
  Cole-Baker.
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cecfb788b..3d8b6f0c5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
 		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&typec5v_pwren>;
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-name = "vbus5v0_typec";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -188,8 +186,6 @@ vbus5v0_usb: regulator-vbus5v0-usb {
 		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb5v_pwren>;
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-name = "vbus5v0_usb";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -465,24 +461,30 @@ regulator-state-mem {
 };
 
 &i2c6 {
-	clock-frequency = <200000>;
 	status = "okay";
 
-	fusb302: typec-portc@22 {
+	usbc0: usb-typec@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&usbc0_int>;
 		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
 		vbus-supply = <&vbus5v0_typec>;
+		status = "okay";
 
 		connector {
 			compatible = "usb-c-connector";
 			data-role = "dual";
 			label = "USB-C";
-			power-role = "source";
+			op-sink-microwatt = <1000000>;
+			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
+			power-role = "dual";
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "source";
+			typec-power-opmode = "1.5A";
 
 			ports {
 				#address-cells = <1>;
@@ -1135,9 +1137,8 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "host";
-	status = "okay";
 	usb-role-switch;
+	status = "okay";
 
 	port {
 		usb_host0_xhci_drd_sw: endpoint {
-- 
2.39.5


