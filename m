Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4D1C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV7jCnMrMxqcUpoF7Sb7Bgwuj9krY+1lli75M73Ykr8=; b=hXDz5X1CN+ANvVKJwOhb7d1Jrj
	BsoXy+dLMnOf85e4B7Sfm2Cgr7uKxAnMltcmET4GxuBbUJ5gb41x4Ee+n3KrgfrLGZnOP8rJ8Neuy
	G+EaRKRomkVn4fLK/XD/VEUMjX2a4Xwc6kZXKrKFaiHcNugJM9QUDchKeNvcS80XvEdpNTQVkpi3B
	wuMGmHAZoKuTe/Ha3kgoZZ3ISsna+MpNE9PrpVifDOoLIphFXDoNvXZO+5i8sATzoiSr3cbT5vQZd
	qBZ6nLzK6/AvthnPEagLUGz4gldnuY170WQbYivesyQopLOYdYDrXfD+5MwFvZimqmbrbH/f7m5Xj
	A5uyb+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lm1-0000000FNEH-3khN;
	Thu, 10 Sep 2026 20:53:33 +0000
Received: from mail-pz2-f12.google.com ([74.125.228.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4llx-0000000FNCS-2VTP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 20:53:32 +0000
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8523cc41f3bso16088b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073608; x=1789678408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qV7jCnMrMxqcUpoF7Sb7Bgwuj9krY+1lli75M73Ykr8=;
        b=Dakr90Dw/vrPN/yV/Cnk8hWjJGxczegCrkQy+ZNPBD0t60rlVi8ou+i7kxERsqIL/y
         OuvzAUPA9skZy+Bc0skmPSj0OkBAqwmwKoY4NCeGsMO0AHA/71aVQIa+1KtxIjgjcqz+
         IMZaiuS/6BqHH/GRygoSYVKxd/5ZsFTTEZFkW1DUVRh5m81mPu4wz8NK8XZHrxv3l4Fa
         /DQjeWhGTyhOfzXHv3FwW94kDB4i/NLZAom7sOxWxoWLux66PfuNahRBWSNNkkW0Pk68
         81/PCnv2VrFUDTWu9/HOq8dU8WzWEdog8r9vjfqFgBhsxBnlQUqpcvOfK5u6aRIjPVTB
         8SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073608; x=1789678408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qV7jCnMrMxqcUpoF7Sb7Bgwuj9krY+1lli75M73Ykr8=;
        b=IQ2je5DbtCMixF3/3vSirUoMUEIMTUK2q46kUl4GeJPXtbkc7J+XcGFKCaaNvMsYhO
         ar9G+HAA1AiaCtb29vZ5aOvsVHipu9nI8kMgEVxKiighyWYssvj2kyR78rgqLfYD+NUd
         nQOd/Kf1GIShFH7GaD6OkvisXMOcXKHlBVazd5m2M3nAfKqBvGdL6P7stf627F7bYeFe
         7o8BJMUQFQt1jDXzEQucZ3on7rllqM8Vz/pNcP7+OUrllXqU7Jt8DAAdK68kPEh5Wybi
         Z5qFy8HiRGtU5U9uEOG/150vSNyMgbod96vU3DIuqwfduMG+00zLiKrRIOemgeE4mVLg
         imoA==
X-Gm-Message-State: AFuF++l5VnbHfGIhQV7lFF6IofMy41qimsaw9Ig3YItjCqjmYpXfvmaN
	LoIHkvDG8tobKXaX9jlXz+bQ6xmB+JVxgGqJsXO5qkQ8SuNXI8iDVRjlv9oGCQ==
X-Gm-Gg: AYBFou3XeI7njdfyp8Coih2xPdFOwQk1An9GPd6Qv+pVlx4y0xU1vYJhtSeN3H/aeyr
	Gus6qQE2QuY2wHGZ4ndouReqH/8dVN6CxTbQTEKYHeuegJr8Z58uEjkbe4HsRN99XjL4YSN0dkw
	GK1JOmZtU+EwuJun69+JFwF4tVTaf93/KsRgfcUomZUgco1yLO8q/SFWHVEQo2zcSjFjpBsHWIg
	5BU7YHNgbhjvs9zmHmSiHeRQb7nZnnNgVwF0Kiz3WLCsPTng7NjOsOgtnhGNWdoNOSB9T0/a7IR
	GqXanZx4uLovEMMOZDuz4aJidDHrLqh08PF1qV+oZeCsp3kOPGIchR/kP+UuC6gT/I1emhTvmk+
	GF6VtYxWl/8KfcA6cJH9oVFopysQFG1ZYHAefMIXInoHe0H2cVGP2bSMXEO+tSIPLVCya4DQDMm
	d82WG9EQj4DS2EwgUB70GaFt9L+PPU7oDqv3Rlp1oBoxDXtPovgpCl5xzBjc6NWvJ8xjvzuiJbv
	AfmOo8mJUQH
X-Received: by 2002:a05:6a00:4891:b0:845:cf73:5bd8 with SMTP id d2e1a72fcca58-86b30e0e9e2mr502408b3a.1.1789073608481;
        Thu, 10 Sep 2026 13:53:28 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5431:4168:e542:5202:be02:6ae4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf3e6sm150822b3a.5.2026.09.10.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:53:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 11 Sep 2026 02:22:51 +0530
Subject: [PATCH 2/2] ARM: dts: keystone-k2g: Move usb-phy nodes out of
 simple-bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ti-keystone-usb-phy-fix-v1-2-9f6e9cd649a3@gmail.com>
References: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
In-Reply-To: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789073586; l=1455;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=KPgoBO1nv2ixXnAOeXDLi+rIWIYBz8Puw7NNm00WdZk=;
 b=up0xZHUD3oEBsdfWzUu/NU4e1y2rfEMY2fmQpXizS1C1K3D5SCKhUi7ySXSFdAMIQn9hR3Hrs
 Ru30k6VE7rUB3PtpD64dNdeVJ4nAb5Q3PqemLm0mC13HF2jj7dusCdy
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135329_660789_744B8DA6 
X-CRM114-Status: GOOD (  11.00  )
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

usb0_phy and usb1_phy are usb-nop-xceiv NOP PHYs with no registers. They
sit under a usbphy simple-bus wrapper with unit-address names, which
forces a meaningless reg.

Drop the wrapper, reg and unit-addresses, move the PHYs to root with
plain unique names to fix dtbs_check errors.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 26 +++++++++----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index 5a63874090eb..c18bec46d9bf 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -69,24 +69,16 @@ pmu {
 		interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
 	};
 
-	usbphy {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "simple-bus";
-
-		usb0_phy: usb-phy@0 {
-			compatible = "usb-nop-xceiv";
-			reg = <0>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
+	usb0_phy: usb0-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
 
-		usb1_phy: usb-phy@1 {
-			compatible = "usb-nop-xceiv";
-			reg = <1>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
+	usb1_phy: usb1-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		status = "disabled";
 	};
 
 	soc0: soc@0 {

-- 
2.55.0


