Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FC9EF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=; b=BsIoNBieQK9HX91cLRCPxSeAIw
	DFX5XYTNvcXQqgEFQkcFkwenO8JzR4DOgJEf4RNW1WUto3O07yM4ehccHNKEUHbtrVfWIN0JdLhUz
	QxAAU+Os23CLKoV8rkC2YTaKZDcGMeJcOitwObml8Gas9uZRVpOTHkhVFycU3JtG7mKoKfuHkbHft
	vkGnaVUen4FkEg1JkcJFO2xsF36c5SO+4IrWgvXgWY4cJ9iyzJK2B1IlsGOdsrYh7RYB8VkJhlIm1
	owRTs8fAfBp89G4BOtdhZxY1xvEThnf+ADS6WVyzZxF/QFAn9eJBsk6DlLOUhcHTtabE7h9yy6hjk
	L9wyHKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmr0-0000000HJFd-44hv;
	Wed, 04 Mar 2026 14:05:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqt-0000000HJ4g-11Ag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso46863355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633125; x=1773237925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=;
        b=qSfPee0k2X/DtxaiUzRzwVU3oik3iIYNhYHGWRNyhxO9d5Mw3balknyuVSmQUV3FJk
         IUrpjBq/2yOVW7T8Cqvcta7FvqW4JPcohAz/IFh8y8jVpphLjN1eLfeMtHffpbVgrNCi
         GAFHn/qNUW3ziHejBKUhij395+eOK2OkJUvibxRX1tmv94QpZIzEotztaULRRuWhHGYZ
         kzcr5lob/8bK8juEvLpHCgmVCt23Ke7T1XKKZvZYaKpoYCy1rHxr3Wq3fPwBbDUbYJVz
         U016Pczg4hRSi1zpQNA8XqtMDbV/y3rdikIgrSp7wUblug8j2ou7GQYoPZ4x2ST9orhz
         8dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633125; x=1773237925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=;
        b=qIkU7/ZjZJ+rYjks9it4OLaBWKKe390dS8ZLFiSGAbEFH8ICOCwu/S+lxSSq92kYRG
         +Rc4vunQpz4EDlqtgWnVihM/jW0K3CUdWkKVXP3WRM+FsnWC2NdDE0CVXWLFN7RlIa2H
         r4Uao6yJdjipnBb+WvPLxggYvYzJmyNC393trv8L4sQLsRd4e9jkZiVmUTqAFo3u9+e8
         tfRfbHX7VshdrlzMHnyrZ8MrM6BMcmeHANgGKrN/2MpOPivxHcLLQCbLjzscX/1VEJZp
         fTrruOZ+QvEEEl3Nbpm8zXRS3QG+krjg9mKZ9N+/57RugjcbldWOCDWhSzpHM0eXNU++
         e+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCU3lazirLZ0BV4Xr7Rc4VrAMD1iMLj+3FOSaW/N5kbW3gGzq/Rw1COnTFFENcE8d5+Cfs6AjzXUMiBDAjQiydbn@lists.infradead.org
X-Gm-Message-State: AOJu0YyFzCHhhG6/1g5lmitsBMZQH1qBPENRMAxj3bh+nMjEA+dj3cJZ
	R/aO6NKIsYCPkRgAkjMpD3rWdeNZ6BX0UgxweOa9Ey8++gJOhygV8InDb/Ap16avQB0=
X-Gm-Gg: ATEYQzw03pkO/lNZJ6eJlu1zNALZG5EMZjz6RM3rxffeRTU4o9tnetW4dfcCo9a9acA
	nP1C5Gx40TqaZXKeElbsi/GT4Yg17bHBvFQ3DHYJi/Ly/q/kGA5QZMQ5Aeodv6g9HlJJWhoDrFz
	itDq2jPaNznRoHBXVBkTltNuAFft47QPOz+ORcQIYCfZJSZXcY0JZtLOR7BhiuQUW4IeM2YJV7j
	4sLeXPzlhbmKlfO6eIcFSRJ8vrSRFA/RCs4pR83jtbTISEmpvcJxVCq9hr46+HlGz/LLG0SNHYw
	9+zwgWiqOM7EHfoIpSklqJ1i7U3/cgFHMPIGAu7P3ozGZp0uk55C9FvMz/aOItc/CZMlRqPK9g9
	fNJjnZu0kcT7a3hhpYm+IaeplmcU9U5vq+m57d2MZksoz/EZxq8F4Fuip01XKmX722UfaebeDF5
	Z8p1L7PwSvmBFr0nkXaUMXTYdC
X-Received: by 2002:a05:600c:529b:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-485198843e3mr31062255e9.8.1772633125462;
        Wed, 04 Mar 2026 06:05:25 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:24 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:19 +0000
Subject: [PATCH v6 6/6] arm: dts: bcm2711-rpi: Add HEVC decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-6-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060527_338090_881E4EE3 
X-CRM114-Status: GOOD (  10.52  )
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

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 1eb6406449d1..aef5ff7b2a53 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -68,6 +68,10 @@ &hdmi1 {
 	wifi-2.4ghz-coexistence;
 };
 
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..7b2081ef0413 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -617,6 +617,15 @@ xhci: usb@7e9c0000 {
 			status = "disabled";
 		};
 
+		hevc_dec: codec@7eb00000 {
+			compatible = "brcm,bcm2711-hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>,
+			      <0x0 0x7eb10000  0x1000>;
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible = "brcm,2711-v3d";
 			reg = <0x0 0x7ec00000 0x4000>,

-- 
2.34.1


