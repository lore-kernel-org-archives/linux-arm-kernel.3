Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E18C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=; b=aVsvRyArmopfxH4SS+Tijstv3l
	HoZ76VioNYLnTZUActpVlwiMIBfuzOoqd/IZlNhPO5BTlN6BZfPiSx3UtjXIou7hghy+5UrY6YF32
	BMFKwLvtTJMr/3dEhjpDmnwfQyhyMWNFfl3BqihSswZw58EEiyEwfRwOrAuOSqA7VToFAeVLwee2C
	JdtTY1uBkm6XicJ41lqSSvGaLc8t/Tkcb0w9K3zFlLOHxg18qBQp37BvsV1xDZXa3GSeOvxdPKNSH
	3EK6k/hY4P4n1pGGRUsivc54CyrRDID7nMIF9fhCm6p4KpnbjPMX3xDXPgYbTNahk957kjmnvTfq1
	JGfi18CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8S9-00000002QTA-0lmt;
	Sat, 18 Jan 2025 13:01:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88c-00000002NFV-1H2w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:19 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaec111762bso580959566b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204077; x=1737808877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=AmZ1kGCjVaT793MEhhYLyoBAlkJ1bJGONmsNGW6onWzrmW12Eo/TXS552ZobrIiuQM
         U53sZBqd6imMz0zEd7rzUR8JUESHr2MfSUFAC/OWBcNNiP96Mwmpe6+6/o9JEdByBrRy
         WMDW0B9txOAaqOzMerV/ad/XxuPKrNkJEnMjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204077; x=1737808877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=pY8w5DzYVNe0FwFspVLapA9i29lApYk73YtfeLXIU1ZR4qNgs6IxFnlmq0KZqZMmHS
         W1B0AsVrJHnEHebRGGwAjQQ3tq2AF2bcVhSdeso3Ie8tANsSMJlxIuZF1FEZj+1pZUtB
         eEj6PUbb6GaALBNHGBwLb5jZym0T6utcxFMz+SVHRtgi+OUl/KxLh4tmu8oO3LRiVgQy
         80/ZL7QQCJM9aj5nLLgDtwbV6AO5y/RzPbO0aVbzNicxP9zfH+m/VbYMvme2hE6VnZTE
         iEWi81+URpMItp1uQCAfj56zGdaTnbTYjJz4GU4Z3VZr9v1xZzejMTQnIK29WbONYj3Y
         9rNg==
X-Forwarded-Encrypted: i=1; AJvYcCWJQ/u7hltbjQVb6JC2Bk1LR+N8Im9yCBocrju5zBIOMJa2VVeSmYQz6l3rnHFLXT8TBQwdf8BeX8MB1rVcfGIg@lists.infradead.org
X-Gm-Message-State: AOJu0YxhHrlqGr3fgmYUMDtL3RcYaoFcsE+z6CAK9mzcSalIrq0zhrID
	T6BmQklJlRiYkHU+0B+CFT+QUwiPGmrdTFXEWXbVq4xSQNQojo+8ZhhXF47V9mQ=
X-Gm-Gg: ASbGnct2wVf4UXXSj52QLZGZvKovZfVswVhDfnlNYxk2WbeiqOR3bNYz4sx8L0ucuWD
	ZSzwG2PdH5kPDd3hoMM59UeDRqMJ06ylITVRMIU63I0adxoLT4uIpw8y34rWEQoNxqXRd9+j78N
	Cr1zkKoHgNvfVGIwMD4uiq/Kle2wdITPx/k3cDzFJbMfYIUdpqEBj/6W6CGBlxMiK16ucorw01y
	6U04L/ojAvPpsT/O/prajoHUgHjIa+jPbEn3FtAKPZNU2Um0ZHcFs7fMQA8bhIwYg1Dbdu6o2hP
	vx38/JGMb/mjuF7YkN2WaH4+9FkUBe6/cXhI0oWec6rfsc+XgCnVti164gV3uus9YVYIJBs9uNV
	gXK76PmhcVLFJo7y+2oV7ma8tQtjmI2cnh7g9
X-Google-Smtp-Source: AGHT+IGvRuBDTrgB3PprQD6w2u9+mzwWfpkPjZcj1dwHV6lzx8agn+y3iE8FE3Y65FW5ji3NNLG1Xw==
X-Received: by 2002:a17:907:3da4:b0:aa6:7933:8b31 with SMTP id a640c23a62f3a-ab38b3707bdmr608638566b.46.1737204077049;
        Sat, 18 Jan 2025 04:41:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:16 -0800 (PST)
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
Subject: [PATCH v9 15/23] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Sat, 18 Jan 2025 13:39:58 +0100
Message-ID: <20250118124044.157308-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044118_343826_F96C9A32 
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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..eab05170442d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


