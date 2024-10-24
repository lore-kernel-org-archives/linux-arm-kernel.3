Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83AED0BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MVJNmqv90FijvAIp/3GkvDIQz+9MpbG95NCFvDT1TVU=; b=ZMcp/w5UkC41xCCvh/SWD+vRsg
	rIpzNXmbUo0fvX12750YMeF9PoG/BJ3t5wph2AVRAzgXO/A2vYViXmCzhvvvAft2Ll1tThR+s2JE3
	UxUkAQGb+MapdxevTtVRU4k3MvW8kYlxvi0/IHD4uYhtmG7kfydDC3VgclAEbBYLKv5yemlmmA41p
	OOKfZ0RhXNnIVtK632dep5ujaRADzs3HJkqYU8HQBkXvUQ+2jtoKU1YvqglvwkNIyhMBI3v/HCVvG
	FNVDKhq1vBDG+2wEGVqmMU0HT5q5QkA8B3YIdliIB21ezpNuff9/06XSHw3vkyBEd+/D4M9qCZK+L
	AWY2VVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v6m-000000004KN-39ET;
	Thu, 24 Oct 2024 10:30:24 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v4b-000000003z3-0eE0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:28:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so887799a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729765687; x=1730370487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVJNmqv90FijvAIp/3GkvDIQz+9MpbG95NCFvDT1TVU=;
        b=CbW3i86s5fmHfrlpwQPGWYH6725tRbEdlWknA0KL1WNqED+t9thx5zd8nkuCxxiznI
         Cq5tItC7tggRm3+K8f/5dOvZx7rg3BB5Hq2JIDmRMlYVcdK0HhAEJROOEumqEn94kFW7
         rFA8T79KLOk4tO9lmmEulUeVedBvwm6kvogjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729765687; x=1730370487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVJNmqv90FijvAIp/3GkvDIQz+9MpbG95NCFvDT1TVU=;
        b=SJwkmibodgBM2F951HAK2EjW975v8Bq9ofn9er2+uJ5nh8M8Zi7f6XFMKe7YR0jw0e
         7RSqixvLNEG+4pqqjjKtwf7Hej6KvX76ICUOFKc9RQK05Usr8uvhfYrLDoiELoy2kqkd
         CuV8JBkEtMTc4//ZsgVRh0pPtVzMaPG3jwv+IASKi/wHiss9quFMJOWYrj3JoT64VxON
         NWT8wHkVOZLIkwxTDTgg5X1A3tgyN2MHM2Ka5DRgcCfki/pj4TLL3kZRkw5cUYZmP3py
         25dmmujIPMIDmwrUm/zHDmx7mmEG3nomgWQqM/XXbDp5Q4uEwHDbpzfLzJs2kMmzDliF
         OBSw==
X-Forwarded-Encrypted: i=1; AJvYcCVhkh8Qy7vzbg7gRzRdykMdBsGtTch1uYW6WYJHkc7/po//HgSJSU41iFFz0KEw/6XdycDa+nJ2nuwZh4cF/aor@lists.infradead.org
X-Gm-Message-State: AOJu0YxkpY88U1gTaASlOBi2Y8KFmXge27nKqMoV4tsKuhO8agFsfyec
	pUAWoaHvZrqgA7kHUwGTuHBodDaVbn2+844lRLQJ5lJCr8F7JiphFVnmYoSrukw=
X-Google-Smtp-Source: AGHT+IFIqyj+bFhDT0bT0Yue3u7gj7a0OTnPThmVI8x1ivIOOR0hXbcRig1qWOZuLaJ3Cyrf5Wbirg==
X-Received: by 2002:a05:6402:3591:b0:5cb:6ca4:f552 with SMTP id 4fb4d7f45d1cf-5cb8b1a982emr4924713a12.35.1729765687354;
        Thu, 24 Oct 2024 03:28:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c726besm5538534a12.93.2024.10.24.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:28:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Date: Thu, 24 Oct 2024 12:27:56 +0200
Message-ID: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_032809_238542_FA41862F 
X-CRM114-Status: GOOD (  10.69  )
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

Add a simple-framebuffer node for U-Boot to further fill and activate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
index 7675583a6b67..3d670534a714 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
@@ -4,6 +4,34 @@
  */
 
 / {
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer-panel0 {
+			compatible = "simple-framebuffer";
+			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
+				 <&clk IMX8MN_VIDEO_PLL1>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI>,
+				 <&clk IMX8MN_CLK_DISP_APB>,
+				 <&clk IMX8MN_SYS_PLL2_1000M>,
+				 <&clk IMX8MN_SYS_PLL1_800M>,
+				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
+				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
+
+			power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>,
+					<&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
+			dvdd-supply = <&reg_3v3_dvdd>;
+			avdd-supply = <&reg_v3v3_avdd>;
+			status = "disabled";
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
-- 
2.43.0


