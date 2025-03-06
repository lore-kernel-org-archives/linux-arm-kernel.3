Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF4DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=; b=iNIdJYIaThosyGE5lT6pon5nSR
	HnIDYM2343qoHNs1MwukfabZ9SI5F0rgxWa4Y8CbzQ3yQy2mcVGA6OmaVPqwQPN+5t7HMt0VEATT/
	7Apyd7WQvanljpNyntPgLIrhQxRUnDO53g83FMS8nnP1uGJQWTi10Y2eB84WiPgDSwSDExdSN044i
	0jZHSOm8i3OvwzQ645c9qaw3rcI+5nE5FDzC1S1KFcPOBwpHACXO9WbFNOvvSVxG7HqOLfckj4v8G
	kLFBtjgPLxFKgqzuuDXvI43M51PighebAgSFqwW10E+jymqDwcMGVLec6v/6Sp/MS8D5L1bLegeFK
	mwFpDEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqA7r-0000000AtJN-2IHw;
	Thu, 06 Mar 2025 12:14:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RJ-0000000Amps-2NLt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so4085825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260656; x=1741865456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=R/soemuLcWPgB0SOIluudKvTZj8FIAxAeGSsdCdi/YBn/UK5bd+fy7zRlqyeoYS2MK
         aecyRo8kOkls0TMk2ehS8Y5yEJvLTIlEZpxS3Dj9Ond6SbwzeX44e7WE2raOsKXOmoO/
         xdK3zjXhCDBzwhQvtYoG4qahBL/m2jSiIoszA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260656; x=1741865456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=BjHuQa2WhnwuF1fEI8dOAzUTNkF3+zHP1Xjjzr1XFoTWJCxotFKFyY7oR2JenCo3HZ
         IiMtWnsddF5WmE227PUTK2NyQ7n1L8/prPEdhmFJRhdt4AauwJjjucF09uhX/XhmczSb
         C4MhgSgPprxjC2gOgE9vwnbivf4f0dQR7LsDct259YxAvRUasxoovryHe5BvDtKEtQr9
         n7LYYM15ta6v/0/McwQAht/TQU9oR0em4+R9XLVFj8O5nWCwsNG33hQXU+3hEqRq9dQq
         8RyAb/xbwrw98xM2gPXBCMJYvXjJLsnEKfPLlFwc4npI8kKsDCyjUghhLgMT3lwoPYjY
         uIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuNCajI/h7Zq/yBFD+vtcY0KvNze+IQUd2dIdz7tBbp8bYH3AXNGELTC3J5myUEDITSwtPCFiu+l/WXb7B85xR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo5QD3QTmMeqrMnX3vPrVLuiZI/G+AKyJDJsc33Tc3SbWzYToC
	/KPkrTZ18as/WRz9IXWofAIN7fTBNRIlN7sB8RebgqXdy0DU4kbtVSTbunH+GdE=
X-Gm-Gg: ASbGnctjSgEZ9ij5EAyvbLuCx42J3TCN5S2567yan64EurVUi+JFnDJ6ZCWwUSfpgxO
	E/pPV1r8m+0Cm6GLLNVigN5F30+7++aED/3OOmkWkkGfalxahvDRSeqfsEniMy1UesVOHEb0+ac
	lCr5JYKDZkNFcCuMUDsdDrObgkK8Fyv3jh37y04d2Gr6hPHKq/XKj1xu899ec7scLa8iBnPT3nI
	gFWauDSdsc41A+sBqr7sXhPIoZ+gVKeW7t9Qtb4OBqWIdfQ8lVVLu+Tz/7tNWFfkO2KZkug97r9
	r7m7h6IJlLuWqbTWGZAGi6IRp2rKpV707Fqe5HtnwuD3Eun/CQLae1Aiqfm3iBmqu9z2ZXYmnVT
	jl5+1Vg==
X-Google-Smtp-Source: AGHT+IFeKvGyyBqN0xdpou0tHRjJGAp0jFx4x573e2BTr5KjxvJqJCsFOx3f7ZBV0vsm+afHKUXGSA==
X-Received: by 2002:a05:600c:3b87:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43bd296abc2mr49684235e9.8.1741260656050;
        Thu, 06 Mar 2025 03:30:56 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v10 17/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Thu,  6 Mar 2025 12:28:06 +0100
Message-ID: <20250306112959.242131-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033057_628900_40F421C1 
X-CRM114-Status: GOOD (  10.63  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0


