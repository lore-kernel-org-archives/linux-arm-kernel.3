Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC28CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=; b=YzN+ZfdcC8AkD7c2IYKZKvo5rt
	ZP4tRpBzn34h71TPIv8dPXhyWOfgCfM4QG3MX0CysYR1MHozXQnCYpNijJFoTvX7BEWeL3gmMGQ3l
	rLcnL9OPZbBUt1LdjRXklt7ScGexVxU9IDiaHs5XJpnFiwCOOHj6qUjaL1OZHSzeLFiFjEroPDlGO
	aSpRLyq3Jy1wF/2lWpmmDqH10LLP0S9kVHLmvc8LrzbKEqkRQDkfX+19KwtqmWuRYgIjP/N/504xl
	jysJNCTYdwtoPo59PMMoAGYLUVO71jYGA04n7FSQ6nA+ZyZNsTTN4neuO0Ae49ipNpMdZNGVDLk83
	BGATm5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiz-0000000FGwn-2EgD;
	Wed, 03 Jun 2026 14:37:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmis-0000000FGoe-3XDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49041e84237so7547165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497453; x=1781102253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=;
        b=j4ScGm87e9c8GcWn11oIflu5rG0cM6uinbN1Qkq+Tw7S2PvaziJBBMwON5KDQWAMzq
         oyJ3VGLaQIPq14POvncS/Zdo3OjPt7IijY65gu8jVb4Pwxk8nQr/jS56gVaC49+LOz7X
         gevHxoNILVwqhz9XXLToF3OUwyCGbi27/oNk5XsDQjVjc+mZtfqOYIUJLN1upn4OqNjj
         Q5Qbx0w9EMmXLrTMkaCwJ7KW5DNwZ9RkGdrB01lGn6fxA6udkyMRJxTp1+NB23ArgFEk
         /0fTTrjQgq2M38F3RMqFkKGbEKmcmLIo4iLUZzIDiwaijcCg0fHdQVMVfPcJX/qLgNKp
         I+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497453; x=1781102253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=;
        b=pkoS7c++p4oAkhnEeCM1VJPd+WIAujJ85yV45eC3lhd4dFGUFmyW94RO+K10YY0E4B
         EL3cdcq7ECv4DfVMTFztVW9PFUVkTF603vOsi8UQuOlIe9BsOk4AdFCgOjlm0xriq7dE
         WqjlvTpzyyHTkJ5LgPMgkEXqye1+EYOMw9EuG8ax3ni1QtCfP7LL9hrFgwzHDPOGb1UV
         ObjGSya4FpLU/WuSIZH78yEz9XoEzcCfmuFE0COIMzC4IrmN+tzX5KaGciigv7jy+8L6
         7D2yYPFLMj6TvyVW8qlBi3yc82CZvEWW/Hj2iS21sJiTWgtF+asm5dQpcm8dp9Ys6L3I
         X4uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YSXsUCoYAwTm5fbFq6GXqQb+iIJtDD616bUtaueMgXhtpVuv5MrrSm9rM1MYdCo9xdgXETXl9zIGUsxVf73JV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxly9B3ou4sH7Te1gFKiWAHw9qVPssW9BYyu4RGSmlY7wtEObgA
	9yvhYj7npQHIkvCuX7nnV/rG+JsR9X/6oPiQ4z7PtB6M7JM5zkGQHe5z
X-Gm-Gg: Acq92OEgfeF3i1ztQtROykwU4Rgc5YkEFHxLkTzyA7buOA3+SS+NgUqdJvRy3D6pxr2
	GLJ3AhIMLF4kxrDJnveT1plKW+wiS0JZGrO7wufkYLH0gb4S4J2P6dEqGjnNm8tG8xfSzLf+xDo
	R1dkdijHaTDZvD/D91pZJWMu4BgQNM//e/ADemWwbeP+2dsUTiu7q+yJdoijoBl6F/nQxjYonuu
	az0ktwnlk+oayLruCsowOwUjl0UGOZG1jwyFH2im9CyCjQEuF5dDh+uHOpbNc4CrkcQs11ovck5
	269J8J+2QTYiXGWa+v33DsFsP8/znVieQXNwXtc9xc2ZPRgNB7i+Rys6ek26cVORLJlGdaO9PMw
	W/cZyEX40GKeK2rllaGb4a/5QRMeJxNAGihAK3l9td4mWF7KVuC0KbKqDPIixoKGA90uEs67+V3
	xVHil7hbrtDXrOTVDvd0EyY/Xlc6iEY1voxXzVdkRcbzOuVe+HpJRK4A9RnY6NAbSY3dbIkbvTL
	SPqKsUiusNvzy4oSnXYC7/Vzl7v0+56r4PcwTrVDbpj7HH7
X-Received: by 2002:a05:600c:4509:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490b613c9cfmr42823005e9.11.1780497452743;
        Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 16:37:13 +0200
Message-ID: <12749af99fa4316a43d5aa9233ad8e99da9f221b.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073734_904110_09D86B6F 
X-CRM114-Status: GOOD (  10.93  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9500c9bf0f42..db0ae706f648 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3


