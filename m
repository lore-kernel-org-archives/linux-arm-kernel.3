Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E27C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 22:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+9WkLvKxCVNjpjJMT0iDzPKr8AA3uiZWqAZX0UYmVw=; b=yJ735Y2cj3nJNULsr06O9ippvc
	C2M53rtAbRY3brd5A3jKU+J+Uld99BjCLoMPVyixwUbOcxcmrcptBnPqmYNbs6qtK0M1CnOV/hIUg
	ugAYTeimTlUziDa+N0tei0hxrb56AKstDzrdfpCcqmNLrku80yLXAs0qVC/70Hp3OlpZ9xdji6Nv2
	6Ow8tCMU0L3MFKWer//fdb1dIeoPWdMdfo8wDV/6YmAvlx03x/ScdOkus3KlraddQYZ2veAKlpaNb
	704KAF248OyMAuFFxwN8z4rx972u7CpaO8IJOreheClK7QGwAV3PolNf0bY3bIgQKwP/FLWIRXDPu
	JhiStUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucB0a-00000008pNO-3D85;
	Wed, 16 Jul 2025 22:53:52 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAtW-00000008ofr-2M1R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 22:46:35 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2f75f1c7206so157994fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705994; x=1753310794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+9WkLvKxCVNjpjJMT0iDzPKr8AA3uiZWqAZX0UYmVw=;
        b=X7qxHJaj4g2Y0uhIsRWVX2Y4aq1wqTyvMyERSXf14Aouse2U19JVWcd/PdQejXhkiz
         VVcVZlcTtnYWAuW+qjjapbs6zrXaR1Hsyg5saEz8zmtxEnERLu/kKQV062PFBOJtp2ZR
         rXtcqzk4cjuICMGqF5AW/M3ou4CUTtgQUFt4nBWqDfEwtjkqdjfcW1Rtgws9F4nzqiTG
         9QFj8hfa1eB+JXhrf9DEG2Vew5XrG0PwyuSAELBDbyn/OKq6ibgSAGdN0+Fj9fzlAnsb
         uo1LtZN6sflHVzc+xXcDTQI4rFXPkPNVK6KZYSEfB6kiJEDTjFdoCEHmMG6efFuWx8R7
         sQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705994; x=1753310794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+9WkLvKxCVNjpjJMT0iDzPKr8AA3uiZWqAZX0UYmVw=;
        b=sF3U9cnQCJ3RYcmsia8+17A5JnnZB83JB6YN0PwX0cfRvYXiry5rKbuy/rb8Gy/cMf
         kzlXhVb2yjf+doNcrWHVukgoeV5eoGR7AiYaOXGBkvo2BJB5TOzsw6/3IP56rrVx/5sC
         oTvF8MFKHDbhaATti2g2K/MKNee2mh8LPH5tAppeGj0JrdGtMAmrOxRqkrvZ01V6D907
         tqH36EKVcLMhZFbp+2i0Ruqn5vpt59W+ZLCaIHwshgoZViq9YT/UNDVRfiDYJ31cNjro
         aR2piWN3Jjoq7tG06p5tbuW8CUqSWNEL9GlmIuR03hY6HSuM66VnPVtUY8bm+UpBd90p
         /u9w==
X-Forwarded-Encrypted: i=1; AJvYcCV96efkxZWk8ruls8udXZ91E2ITeikglZxC3Wf9RkMBSpCSJYe3PXa5Pu1wmQt8YIihAVl33FmUnlJBQ06HlZRK@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxCOAnw2N9sG/4fxqXm7gU1yLsFRAei94UeMFHdKDybz7ESff
	ONuO9EIivAOnWSukEC/IaTh3dXiHc5zGHY2aMcfAkMqk1mzNl0n82cbx69E1+4oTlIs=
X-Gm-Gg: ASbGncu8nRTnPTCMKVYuFrsLTVNm8yugppxUvd/4B4XIs5LA9WBj4uLtmweurRqHtfS
	VrNSjZPatRiuTz7lbE1L8a+tVPRw8lGqMUbe4TSK1o+HdTRlSoOG/2k2e+blJGQI9nEi7FOVFa0
	EEr3usivCuSv5YBtVqu6kWQNiql3JyEcKo7kTly/77eAXUDaA/SYx7EwmQDuIp3yuMdyiBRTt8X
	EcohBnM8m4EUcryQtJqc22LMlloLNMfqr42Vt6fNvPrmvEeFAnjoXtePpwf7UCYCVvicWmh/8Sj
	VKKu9aQfbweg2P7ukFyVW8cqMbnaHFXlz6jktKOgDtef9tpc53f5otcu2cT/wGLbl88D4BVXdJR
	Kxnp0p1RwJN2aKrb1hJWQE4m/B2c4WA==
X-Google-Smtp-Source: AGHT+IF0LmgLP0/FrplToo3zBIOwwv/f/5ChaEptepbpq2yLyxK0fU0sEf+7Lt3bCWvy4wpyOrIgrQ==
X-Received: by 2002:a05:6871:60c9:b0:2ef:e245:c65a with SMTP id 586e51a60fabf-2ffaf6002b4mr4420295fac.38.1752705993846;
        Wed, 16 Jul 2025 15:46:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff9ff853b8sm1651683fac.23.2025.07.16.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:33 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:31 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device tree
Message-ID: <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_154634_607051_2894690E 
X-CRM114-Status: GOOD (  12.64  )
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

Checkpatch points out that this should use spaces instead of tabs.
"ERROR: code indent should use tabs where possible".

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 68c11ebd405f..e80144e33efb 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -489,22 +489,22 @@ usbmisc: usbmisc@44064200 {
 			reg = <0x44064200 0x200>;
 		};
 
-                usbotg: usb@44064000 {
-                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
-                        reg = <0x44064000 0x200>;
-                        interrupt-parent = <&gic>;
-                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
-                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
-                        clocks = <&clks 94>, <&clks 95>;
-                        fsl,usbmisc = <&usbmisc 0>;
-                        ahb-burst-config = <0x3>;
-                        tx-burst-size-dword = <0x10>;
-                        rx-burst-size-dword = <0x10>;
-                        phy_type = "ulpi";
-                        dr_mode = "host";
-                        maximum-speed = "high-speed";
-                        status = "disabled";
-                };
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
 
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g3-i2c",
-- 
2.47.2


