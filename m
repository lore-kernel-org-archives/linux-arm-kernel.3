Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9188C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aB00SSfP6c+OHo+3LviFK6KTCkRiE6kjMG1sy5ThVvM=; b=4F6/EdlSVMXU6k1RAu3sDnzlAR
	g94tI+H5lt/afBTCjO8D9iiTFtU8TcmF7TJv1lr+VLdzXElTrOLY+fPcBja2wKY9HiL1XpQSLDz3N
	4LEHg03oH8FtjIjg2vr27/dhEzd8gsapcwX6lm4br0TUao5Gl66CuyNGD7FAAXra5Har8GtM+7dUO
	amgcmn48SUnhqkTQbhihg7lDGC32Hh4i0Rrtw9qzbAbY6d4bcLc6YuGNayCrNgg9+eVD9bZs6+u05
	7HUD0L3BMkG8HGDwyO41QUNPcVEGgEyLy34dmzsKmuDfqYbIB+FPfU+OvVBWJiIkY1TpwyV579jAH
	QuLObZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVtx-000000043b5-0koA;
	Thu, 31 Jul 2025 16:13:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTr7-00000003liS-2lUv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-454f428038eso4272865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970520; x=1754575320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB00SSfP6c+OHo+3LviFK6KTCkRiE6kjMG1sy5ThVvM=;
        b=u/Nke9pkOI/PjeX12Xd0rnPqVwf0ByX7S4Oq1BKII/f4AaGuDTmydXwa+5WZJDSvoM
         jVLXskjj9o+YN6UlZjNhd+Q12gorJQSt5GAjKANT2p0hHtwhni3DDggnwEEzKfBoctGY
         CbnSsBcbix8j7ark6SY2N7Wple2x71HlS4vl064xhulrOWHKpY6mQ9Kce7q/azuxhrxa
         3DahfwzAZarKSFI6WEyO5UpHSkg0oP3Ff760aqvX9fPPIWEhHUSuYaqln6LaU/S0e006
         OqB6rBOkPZeFlNLVyi0SpEIL1ikeRlGrS/W1ZCIPLLx1E65JlV/q4owResbjNUjZ3AJ/
         Ig3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970520; x=1754575320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aB00SSfP6c+OHo+3LviFK6KTCkRiE6kjMG1sy5ThVvM=;
        b=oKJnmpCuk/uutCyv2NJjuMqNzBNnPDds3zrW9a18yi80Tushf1tnYG655bEFcRYQ3M
         8A2ASMxBR71HYYRh0NVy7aYMOcUT4wOISvIfgmIvMDcx75n9vZ69g32yENm58aPIjgkV
         ZuJ8qhluAhd7udsNHl9VRsUG8jXN/bPfXaFzuoLt2B8wHpiWqSyiAkOb9H7SSJBGTH9C
         uN4pvKZ4CQ2BIv7/KJe7xU2wI+nbY0aWp4Y1Yf1wNkLVG1j+qMZaZqGShIZX/sO1ULRa
         IXKrKSMwSFfo6rkDm5CSwobz5pPcf5OuRgyakZir8p6NFsc7cmaocxNe4U2EEGjyWbu8
         kZmA==
X-Forwarded-Encrypted: i=1; AJvYcCVrBTYRiwdqZgsn2pcSZh/3GivpsvdfTI48Bs27Oh0W/FPcvN0fRGmbEBEB1OBGrNTj7rkI09X7NTlgRaE52SEj@lists.infradead.org
X-Gm-Message-State: AOJu0YwLcGpfzRbdAQw8A0pAZddUl1S4L4s5dq/f3G0Tx0VcwlRzVhNQ
	0dAFSwV6W+xixUUdeuOdpCs2vdYjldckkeLShNyPtuO/GT/aXuz9obG6K+gJOX7w/Cw=
X-Gm-Gg: ASbGnctxlrwQezA6gnIJy0x+CZ7Y5Q6VdEN2yOnSc7tCdtpmTA7f7GKEx6X+PuP6Ckj
	149Kt52eS9aPVW/gBCW2otCeCoeSSBO57/NH4kCXeWX5voXbVe8FlMVK7TZYkBZ7FIi3PsN67Zn
	A8rb4Y5trU0ZAMMJLmf+3o2hXf218oHjeHhHzzHefE8Abdk9ECp6RY6p0Dp4w/j1v0KFRk4Igdm
	Z7qi/yjiVERuoW5vJ++cJ1gYAwU3M/bHZxkvbJrEycDizDruOjmsIO+BEuPMs8uarseJbUUFZTx
	jxi57ec9t0Q1V/I6JhUTdMCzxdLyvZ5VI83Z5TPimWBmqrYYZ1n0zplAclKSI1GaTj/d7C222Qx
	mPimlt4Wgnm0fFpy+6JvwkEY2g7uRSjz1QkzCPRkkllkLVFSe
X-Google-Smtp-Source: AGHT+IGqwlW5ma8WPKveKqUhTUAr3VgKYFhAtuL+0U//6ALH9ryJa3alHyJCYGFqgrUVq1o4bMWuuQ==
X-Received: by 2002:a05:600c:8711:b0:455:fc16:9eb3 with SMTP id 5b1f17b1804b1-45892bd7be5mr65100585e9.33.1753970519969;
        Thu, 31 Jul 2025 07:01:59 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 3/8] arm64: dts: s32g3: Add the System Timer Module nodes
Date: Thu, 31 Jul 2025 16:01:36 +0200
Message-ID: <20250731140146.62960-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070201_704678_13D3D64B 
X-CRM114-Status: GOOD (  11.48  )
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

The s32g3 has a STM module containing 12 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the STM0->STM11 nodes for the s32g3 SoC. The STM7 node is not
added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..c2c986f03986 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -374,6 +374,42 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
@@ -471,6 +507,33 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		edma1: dma-controller@40244000 {
 			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
 			reg = <0x40244000 0x24000>,
@@ -560,6 +623,42 @@ usdhc0: mmc@402f0000 {
 			status = "disabled";
 		};
 
+		stm8: timer@40520000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40520000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm9: timer@40524000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40524000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm10: timer@40528000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40528000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm11: timer@4052c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4052c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@50800000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.43.0


