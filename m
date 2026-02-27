Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E5FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=; b=l85lPQOq71GgywC3hngy2iRNS4
	sZKlg33ng1aBC7q2t4riiPKeSqemAnOhYoCTsHAY/+nSzJF3/vD+qWA9rYRZdcZT72Y+r6jB4SP94
	bwPauv/6CLfB4LbemywyyYL6/1FzSo/uk6EgapchZNuc6AGIc8Pnl6UJYKlAoOuxNtMp2G8OBEEZi
	FO6Hw64MR89duNtuGXF9USNNuqzjn5R93pRy2JZWQzDNQQE4t74Y9vpU2QP3eJVUkhFd3eyQQmdlq
	1BMziR9jN14KNB7BBLgtOh7nYWDOEqagnDcqR/cdd4BWWXfsnRf62Hjv3vIH5625a9sJUoOXavIEZ
	97RSEh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WX-00000008nVR-24y5;
	Fri, 27 Feb 2026 17:21:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WF-00000008nKa-1Fpd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:20:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso18348025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212849; x=1772817649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=;
        b=rnnqw+eaGjytFp1os5BkZl2AhvhbOqUn0MiE9hVJF/nrUsdG730iS/BYAtWINtkZXL
         HMN81muRih6oYEAehmGxBXoQsVn9mfdpwsQYHKGCXu4ZUJECfmPSNV3CIMehG921ijgG
         K5knqkvJAARtF6NCKmgySTTb3ZfrWv2YCs64Vt15l0zkLy5XJ8ytX9jt3+HZcfouI1dW
         fOrBPhVc/uj78CB85VIUzzmJ0XBFYvAkgmuBr8IQNkiJhHIR+4YZv+Asf6/oEhQ2uCjb
         jVcCxcKypo/TXjNPKtwk03cVC2UiGIftpI1BTv39UshejX4bAQooTVZo+GX2icIv/lhY
         9c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212849; x=1772817649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=;
        b=Xl0esrZIDgY1OokRpkKN6W9n+cvaIVY5WPJbHxA1jJBPXm1ai0WFahiJjZ1qARWKI9
         K5cvU5ICzaqz58pJkBTLlbzRLGD65QxLG1/kLSxi9kAAJJyrMv5lUql8GLTZ5OONnbvX
         wFVjUzbSSD53KLzuXjh5dowZ52GgN0oMmHLe/hfhFZM87rK581ajMdTCDqdv952PB4ix
         9EyN/Fvas5NMMJ5Pi2CK6tYhf7Lhs2GcOtdHEBD/VXenIsg41s+D97XbU9delnWWVjr9
         phQG/753oLaoE2CgW0kVsYfI3lBwddLNpmgGKFQ8kMpCXSXmStsTEUNs7X7h6QhnqSy+
         N1LA==
X-Forwarded-Encrypted: i=1; AJvYcCX6k4Izs1goAajLfGvvxoL5Rspxlv/FKtMPe8Prtc13OzOhLdz+c/HFhzK5dNfGxN11mAdP1RuPVMsxVRD94GwK@lists.infradead.org
X-Gm-Message-State: AOJu0YyhoGa41/M3mW+LUMazc2LOM04iBfSKGv9ysD6NqToFtaIIqw4W
	D1mt1PufE1jgaL5tmNRcM8y+ocO6nslexUWTYjoqjMpt0nCiJ61iTTVWo+E83vwWPUM=
X-Gm-Gg: ATEYQzzsObBcRo8o7VlKQ2sdE3LIIF5xI9TT44METcJU4jGMUhRN4XJ+67sHGgfGU2x
	WnLgWCVYlJJJAMiA3D09wVMfIGtaoiSZhela6CF3fyf/NwGE9t9IcFMs7TmfAVcOnYAPiCvoWLb
	ta9s+mewyMdGGkTgd47ZkGA1XTnYVNppy1ele4THIQhrynVf6kCotvpx3NDdAKTgJX9C3FswP+o
	orjHJ+fZC11qvDAR59UTOLvNWqFBslQ9cXVagxQ+ZphthUBbZtvJgcMavog4WmXVvCJI/oheSpV
	CjV263krpDAiKXLhiUZXyQMSufdq/0ITOmrBxiUIhNL3YFMksx+znLof3FKzEezJtzWTRTcvvSN
	f7bgziP/k5VGiY5y8/7mXXtEbhDpjHZU2B+2arTrcGb28D9CivN1BEwd4Ewh8gEAOWoIU1bIOGB
	2QMjtrBfJ522WpbA==
X-Received: by 2002:a05:600c:a16:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-483c9bfb2f2mr54324715e9.19.1772212849364;
        Fri, 27 Feb 2026 09:20:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 27 Feb 2026 17:19:11 +0000
Subject: [PATCH v5 6/6] arm: dts: bcm2711-rpi: Add HEVC decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-media-rpi-hevc-dec-v5-6-9bb3fc1816de@raspberrypi.com>
References: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
In-Reply-To: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20260227_092051_368988_B35BBF5A 
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


