Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF722F99351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=; b=FuYw+KKuUm7Mhc6+wXI3Ti7E8N
	gOhGyNusGQhsUAb4BS/R5R75qGEETQal9QmTuTvFOw4nqS2jdlvHJcuMBZIyJSjdOx9V80vQsejC7
	gyZFoY5j0TiZN4LLyYPCIDkgrYBEN+Gizc9C8D8Y9rijXRtIxfxlphROUCb7z2cXPgM4gYEJyYbJU
	JLlBpdnivn/drGQQ4Y4JLuI5vS1FolQshOidueTSIFJlreNNTtUrI5jh/+VCMhren3OMDX+EzR/6e
	6H5gO31UDZ6yf5b09cAu8bCjSJinI89K9fMsNBOXeiPsPyPLsN8Ft1g+FkxFrv86nleFS1WnAl2ZL
	lM5xQi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPR-0000000BFNO-3kNq;
	Thu, 23 Apr 2026 08:27:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPI-0000000BFIP-46Cx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:27:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso64983565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932851; x=1777537651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=;
        b=B9yeg7nG4nd2Rlv6wWpBLYXRAowXFzmstDdvcx9yqNNZ+evne9igC/gO6OmFiWe3JS
         kpVnjqZHDLy0kYo8J/zD65DGSlyGhvtrzcbCaVYuIPHXREgjNgPIjRZ0VVhN0BEyf2LM
         r4LxDxwpYP2W9BRJNwxyS3dMuvxot573qbE0wmV+Smx/xid8LiQJaYWDwIUy2VPH7O2m
         YO2z2UKtWhVzhiybLkeH4Lol9jjx6iZodpGTRVRxS2gwMeE+Eyv5HI38cTAPzp/6tWGV
         SxI5mal9Gxv/auSeHEcTJNTZF9Mgk413/ZLbVC6/yc/RIlsXnlHk9oqweVm04/iKdAi3
         E2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932851; x=1777537651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=;
        b=HN01EA/7FTHRIdq47sglpw4o8CD3uM+4tH9atCoWgtdufEQCqfE/cHrCEIPxDxtCI4
         LT+2xbnq1HbmH+x+jzcchHvmsusuE1tRB+jAjdf1vSU2eNaZxG1IGJ2tiA+kRL4OuhqN
         JEF2LmsLZOvk/GagOMUMorWJaQjkcbSIFtVzxpq5Mpu23Flbq/OIEE9Bo6yKdIzCrEB5
         9hWMbOYURQ1c7Vw/fgMirX1VaYthJMtU2UV0/lftnTXZLqm98J6vP1k9nMfxukNQKR1i
         OrIHq0VGED7VYQ/24DCp+2QtxS+rrTr0GzqmeqzXznq4lqU/RBh4neDhXgqiMP1GlfQ+
         wCnw==
X-Forwarded-Encrypted: i=1; AFNElJ+q0WeAqwNXJffe8ht8VYpRPF0xjjmkdii0ok6VbrkOohxRcnC4uE6wtaBupr3a3deqZcrcq3/0D1wcDMyb/CTu@lists.infradead.org
X-Gm-Message-State: AOJu0YyR1HPZcbYgsCrTSX2T7LuZ0NBx3I1mSFHwfY4BoZR3yeoBJXk/
	VFCTv+9A4FuP8S3aEGJnw2p9t3ukRGSPPCpmysC9LJ3pJvNgTsthz1nO1NMbf6+fc0s=
X-Gm-Gg: AeBDietK1pecQAJKPGunBdqoqNkvDx+xyd1ki36JsGWF1H+/Cc+mqvCSxZwF+OmvHnF
	Yvc/L0hok7wFjIGQ0H2P/lv4Cz3YOjw/27zda3Nes34VmsruieK11oc8N87QeDKl+k8oVCIjMfM
	t3tYGBwEOQ8grvNC8iBLnXnlj4kPm7GHGJjO9U2TlTm+p7GzHeUSVo/EE7fMYKyqvM35yDcndh7
	xwbO9SSNHKOIP2b0J1Yp2+vAo17YP0m6AtNUHFatXUxpjAddE/HtSHSQtEprrzlu5OKlfeFfnmM
	4nPQY90atsSfzmbXUUmVgtHEa4XWDsCB2XlQgjJfxJE+GxHoFCVVjSINw2jQDirPpg32sRFV2mK
	gwdbn4fPI4ZlUI/ZLYRdEg493u6tcRvWRm8a7xZfoUbArtz1k2oVF2gFEuAfGzQc2uZIkhwNdGO
	4R+oTk92ABvXXkFujYt92afTU7sBcKlOKIzYKsxGqIO6v4kMOAvheboFyY8pPBuvnArCVEeiwLn
	0CPaFQ=
X-Received: by 2002:a05:600c:691:b0:488:9ec1:4976 with SMTP id 5b1f17b1804b1-488fb88b81emr223263245e9.8.1776932851294;
        Thu, 23 Apr 2026 01:27:31 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm55901924f8f.6.2026.04.23.01.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:31 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v3 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Thu, 23 Apr 2026 10:30:21 +0200
Message-ID: <d6af30e0d72b2df2a0b640d413314a9377cfb226.1776932336.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>
References: <cover.1776932336.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_012733_440630_6B3ED16B 
X-CRM114-Status: GOOD (  10.94  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2856082814462..a4e5ba23bf536 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,12 +64,24 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
 	};
 };
 
+&rp1_pwm {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5a815c3797945..d0f4d6be75500 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -26,6 +26,16 @@ rp1_clocks: clocks@40018000 {
 				       <200000000>;  // RP1_CLK_SYS
 	};
 
+	rp1_pwm: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	rp1_gpio: pinctrl@400d0000 {
 		compatible = "raspberrypi,rp1-gpio";
 		reg = <0x00 0x400d0000  0x0 0xc000>,
-- 
2.35.3


