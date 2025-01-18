Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AEDC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=; b=H6UB/8uc3as7W6MZZoFw2St28f
	U7qH2zvV/PWT4DBmq9t2IQT0hC1Zs2ZzYmBLB31U+F43zsEN4Jpq86xH96iHQS8K8h2lsDsAaCzWW
	7kGj7nu3Zi+41p4lun7/J8YPNdIyLn1O1uZOfLO1gwsbcrPO5z5hc2viF6zpbIU1W2cbofmHiPlEr
	6gcG9xibOjABxaiV6GKXBf9tqf6QAtDb+nJOgC6ClGzDumsdLSmHfri18zeEfTggljA8BnjjauTKK
	K5JRN64Hdn8OsYxyWbfQGP+E6htPyUWsuZMowU5ccXy+XPN8J4OXsQldmDwsKCcgI2gQ+CIPHQuIM
	H/2TMscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Qu-00000002QGq-2KuJ;
	Sat, 18 Jan 2025 13:00:12 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88b-00000002NED-1ZPG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:18 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso5880204a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204075; x=1737808875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=P4BgsrI81coN3KTH3jROHa1KergmkelZlNWBXPRNqVG1I9nrE9hXvOHUvYZ0p+ntpz
         nnM6BJoV3+luDfDepotE6KXU3x2WQzWYbV7jjFgQh/e0wd/CJI4a6C6yXIQPv+Wom4Ja
         glQiquXX1tSLdG89AuiW4cU0qRcPWr+M8eOLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204075; x=1737808875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=UPynnja+EqZrVaz+AnFeoRFygJIGtOrVU6o79JHAbK2ixgERbi3fgcIyJYUuMLeoB7
         KsaNlN3swREll8j7u203Li2mkm8EC/Vl5tudr45B91ZVbJDzMWu7CTVzs/CaALXZqTFv
         YUj9++J+hSLor9zQE52PHVOxYwn0uRNzIyCxP7NC74x2HxJSyp/vROmIQo8IL8pmZIKv
         cTfMaUi7NVMQFfFFOk9rgBbKXfELOSQC95sYoE2qOSrMs7JDkCHvgt5TmhOyTIhVg75v
         saTz3WhPNq8fuOa6pCMoFonij6HuqGhtJHz1TE8ig0F6j5uJGmKTcPnxKVjr0RHtaYym
         k1fA==
X-Forwarded-Encrypted: i=1; AJvYcCWl6IqUBmzPRI7xT7aoWkP5MlEoK9Kn0I1DjNX1BuSOYfU3GTAn3OofrTxDZFhtpz9sOHFbsErK1NVgAnVtT2PE@lists.infradead.org
X-Gm-Message-State: AOJu0YyOP8Fn+snYmytDWef/K90RnOA63o203Gr4MSAHwjOAcIlWblCm
	duhMHEQErAcu//NaYHb77ZSelnbgbIHzs0V15tb2H7Joq2qBauY4F+vRvyuPuQc=
X-Gm-Gg: ASbGncvAPHWptvFE1r8SvC19QFQP7cbdhmiUXHgTqR3FcprzynFem8BBrTtJ2DjpPDJ
	arsyBtcCYCvpGu6XBgm5G9qYq9n+XEbg8tzr3OuYxKxvO7w7ZUapu8m9srRVl3ZS7JTpaeY1nhB
	AVfhjLbMmwZP9UmsRazyLMBCOWVOsOrQaKnu3X0zIz8fSJ0Qhi1CiyZmtTG5WvyT62XUmtYTXkg
	k0Io+CggyMe8WSGqjvTjw2wrVEdvBbT4RA/PFGfMLxDmDtDsB70NiRRvaI3ZGNW1WBwGVTCW3aO
	oL+Yj02rcclQjFHfGcyfq1la5QbDWZttoz8dBpn5gTeEsx+05UKZsDGiPnpS2mZHuvNt1XuKnz/
	2Uv7/HQd39SNCswdty67bF02hHmbex56sXNwR
X-Google-Smtp-Source: AGHT+IGrdiviIu6q9fiYP/RGOjIY03KXNIsY/WbK/qC6yiR83TyBa8iDeXj/6LQlS48GivuMZ5bWmA==
X-Received: by 2002:a17:907:86aa:b0:ab2:faed:e305 with SMTP id a640c23a62f3a-ab38b1b2689mr549230766b.10.1737204075606;
        Sat, 18 Jan 2025 04:41:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v9 14/23] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Sat, 18 Jan 2025 13:39:57 +0100
Message-ID: <20250118124044.157308-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044117_428554_D094E803 
X-CRM114-Status: GOOD (  10.12  )
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


