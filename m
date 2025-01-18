Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376D5C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=; b=GzAxPSOfoEarHW/0sRB8940vlZ
	yawBGLBqBSPVnGWuy7lOBlQoiNnXR00ZL/ni1xG9gXcBq6SpacUbqLamlirCfPgkQM8bkQkgdOykj
	vKNXTyV/EmvH3q+SzvrWact3WHIeGmTKut0nkrBu0J53j0oWt4620gCJ/3rLEnEl4NN0FCrAP+rv4
	1AKpfsBkrr+8cfhDVhC84dv4YMBq0INNw6RWNMr0Lx3khekU5jL5ms2mzSkA7N7CimyB1PIN1nv3L
	1rnPKpo6ZQPf8NoZqfn+kNfsPktnmiZVq3re17A52UMPZc6aPGGTPzLDeN7/zjgcdzHPpdu9cTvne
	3DjhJlkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Pe-00000002Q4C-3ekq;
	Sat, 18 Jan 2025 12:58:54 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88Z-00000002NDq-3oKu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf60d85238so494641066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204074; x=1737808874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=oWZOlj5/kZFGcDXVlHKgio0+vCAE90JGA/mRJXD6lmXqdSr1aIHJZXFEM1co9T8E0o
         fI2LV9wHYCZ/Ujj9ncz4/dbttSgbaQI87Ci7BIoxTSxjX+VXWa9AIEAiJp9Nole3xicJ
         OaUiu+bSxupkjs4W6xvgsTuWbc6R2fiqpM8bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204074; x=1737808874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=E313q5fND6M10LxrYzPsvwjc6ZPioQBp4mbTRlqz/IKbZs+/jIt+viUimmgjoKpNUP
         pxb5iyoRjnVbq/dKLQx2u0DxOY1OMpnoyu3HA0F/VTslYMp0te2MTv2FErLzBhxIDbUi
         tuDkdlaqKAPQkJBqjP5SrzHfbu6gHt6RywoOJimxXpcINSvNbh1x0MOBUpemdxAPH/rZ
         yJO7z6MMKly3MQrBPpO6qPOo0XojoDSIuNY6D00Mwzvwu76/HDVc5KfXTfxQ/dpd57L4
         ZGYCH1kGaqHME9g5QdHtsjO+xN0tG/VTM3kjl7+3N4d73ghKzQf85FkKeNSiBu80FALZ
         aV6g==
X-Forwarded-Encrypted: i=1; AJvYcCWI8X/q0EuRgw3RcI53heR6Qj0B+i9T3LB+/kJq6Wpi7ahQLGt5aMnUqGhoqTdCCZ7eMdZjoaomzP5gW00ZY4AN@lists.infradead.org
X-Gm-Message-State: AOJu0YxBV2t9fsE+ZbgJvEAOHsA31/p9pF5Ygbswao4EeeBPPEvRw0s3
	sIlL024EOlyBGixeUJ+Hmz5dUur6Pah/8tbPj4fmwXsXj+WXHKOTZG3c1Tfb9rc=
X-Gm-Gg: ASbGncsFuhfYfCo+7NxtCpHUckaWD9HU8uc9ZT9BHOS+udpmIhBgamGTYgGth+EBGym
	OqMEbiy+jStdFQ/WoX1IH2quykd9aN89M5QqricrfNTLWJZTgl1Z8TE18hxxP7/v0Di7EKeQSXU
	aj2igJqIsxpsqsX+i39Trgw/MSWy4yfNDTMBeGiUWStHSgnd5E9Hp2vvSWRiG36V1xN6pGRl47k
	DuSez9g/c1Oo/LL2h9Q02Dt6j8dM/hvz5fe4Suzj6HKGQrc8yQEoBBMLPYDrrN8SRfDhHpixBlL
	z18c2aV/MauIdi9QlIaAM/w7+9y1HM6DIizX0Wwv+4WOwIOA34ESpCCsUk8aS0AcDQ//d68dcNp
	Ez+2Rcv/jGN2w8qPOylDkDyqnITezmnKpHnfN
X-Google-Smtp-Source: AGHT+IGnqr4YT5Wzyd83pkMxDhSEUlvVDC6B0O6kz7Yyd6w6Exw8TgSQIXoiI4laqNBgm+rQzNW4YA==
X-Received: by 2002:a17:907:1c19:b0:aab:dee6:a3a2 with SMTP id a640c23a62f3a-ab38b4c6500mr487244966b.47.1737204074293;
        Sat, 18 Jan 2025 04:41:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:14 -0800 (PST)
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
Subject: [PATCH v9 13/23] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Sat, 18 Jan 2025 13:39:56 +0100
Message-ID: <20250118124044.157308-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044115_943180_9C0948F2 
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

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0


