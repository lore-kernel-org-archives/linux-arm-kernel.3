Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C795C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=; b=bnIg8HBVm+B+B8F7gcyeW31PWQ
	f3yGjIne70rws/SNDkimSh5ob8OpihniZt+Fs1rLiT+ViTnpPP8wz12wxclqSrjtsrZpSVmrUZuLe
	yiET0S9CcOvFgv7RrfUQA9sClRCNr2DSvce8GUIvcRDsCb8rqIBctxdpFi/6iTre2nn/loECX9lyZ
	GZwZYM5R8xzzChXjhnLu2UzrGhaEFuhaqW35QeeVyk50LB6n17K/JhpU0k/LhiUQ3PcfPGliKgLOE
	hr4B4oVMb+La7TiYzZ8VrKCLgWPHsdyJz7XfI3nDFIZzRPkGMHL8LoMrb3htIM7bchgvCloxt54Jw
	uA8m9YRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8j-000000063RI-3pJf;
	Mon, 07 Sep 2026 06:47:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8d-000000063Oi-1Lwi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:47:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so24542905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763649; x=1789368449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=Z99Fxo7Wpnd6W1s8EjqjL0Pr7I5jb4QD/zBnBTEzG7f02fOKOwK73gHNu1mU3vX6q3
         nD7sH5lFSO9/bCBYk+D4GWuRdlNZUzSOpPS33sNtKB0baC32UkGUz66nzEmlu7Hgt/VT
         bGrwQW8cu72LD99SGjUYPDUcsZ8uwIPq1E1ltuLcwhbhgtgy+FeAFVIUdt/xppT9e2B8
         HAOBpyZof05FG38/MmFNpZ1auidVgCbWWT+6DXTbZ1IQyPuk2FePbn8uT3E12v0wRTIM
         moTmtXgCCNnR5l7+Q6OMNZxJbzq2Na9fD7DI2i3DW3DydjMiFzDz5DY2PSzfyLI4DLgC
         AJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=Cbg76ZL1UWK7dGMak3dil+j5ptY1VYRIfFMDIQ6s9n7QpnA2RWP65DNH01F6eT5kS5
         nrHY1ys9A3tYKb2UZMplBPqS5VVCcUuznEN2SpZfG+qrwhEUvJVAsxyEhzK4k0XbASgA
         PR/NbssTgrPLGDEBpYIrs3XVkae1ISZgAjNv9F0HRfXJw3YzScwSDfh3OpMPATCR1JA1
         aHuXZ0iL/cVtXphc/0mDP68tu6ZNG0evg04TjTVoZdFZ7obbsG9NOa/RIgLnnaYr3b5K
         R/Wm6CI80SRRsRyXqO0v2Be47+IFZG27Mm3ZDWKF7AJslGzf/S46LNNcai6BzpZsaPz5
         5l5w==
X-Forwarded-Encrypted: i=1; AKwUvBxXx6hG/7TrlfveScxooWX3QC4P5GXKrlKncyl6CkrgOSerDRPs0iAmd3w8icPJPkkHnKxaF/InIxJJVnwA5Oxz@lists.infradead.org
X-Gm-Message-State: AFuF++lC9nydA3dl62q59E35xblcJgpKjFqlSzuUlIAtkfl+j0VbjQvU
	sN3fVg5W4K0YqRFJlvIb2iH7Ncc7pH5/XNCXdgP5aamMQhtpIx74n5ml
X-Gm-Gg: AYBFou1XgVeNhHl3THoHOUKnlMaNJ0priAi+z3jDJ47EjEf6oN5EXC+V/sxNSQZBLAV
	4SYZESXY+VId5RYHtpUeozON6f20D0F38Si9gOJ2YSqC4J8hMUUbsFO4xlNhALGm1o3mZiEqyJx
	nvA2Djs/0wWWxZ9aVDG8yIFghZ9ll62O7+FhfniytmzC67HRdiKvkaXRXl8Bkae8ZWVtyBMs0vK
	GV+AeevgkmB5nj2rrCGw23dOBPwia6SKFe5ZhnUywTTfYRW9JyUbEnm1Tw8naIk1WBbYMVmEtTS
	kLV3um1GgHvYvVuyKybhEmoXoKsGuUndh5sf6mZ8cwmfQEmKZPEBYT6aTq7LcTNXfKehpH+rFHv
	SxXc4F8fQHs2IraKX9haOySDrz6ESuj/j5mDwxR+dnFQWKaBp+1a3Q7XyuhY2u1tmCtAsWfjMRu
	QbOFDh2kzIkxV7x1P0zNTbtV3n3bzESlwfFBoJkUbvaMINXj8m5XF0scM7vKyZisuZPxdMFxxvt
	PWaV43ytdjVhL4EJKwCc0coHSAYoOEoRwaPIo61BJEF8kADkMXzddzHvrGg/JU0UpLozj+iDJaD
	cW/AYJKDaYZbczysnd0ygk9JF83PaxbubMLZuw==
X-Received: by 2002:a05:600c:34d5:b0:49c:fc6c:bdfe with SMTP id 5b1f17b1804b1-49cfc6cc085mr168152725e9.21.1788763649151;
        Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:21 +0200
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port
 2 in SGMII mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-2-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_234731_390853_FC8BE7FF 
X-CRM114-Status: GOOD (  10.00  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: fix node order
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..7698ef44095cf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -104,6 +104,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -326,6 +335,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0


