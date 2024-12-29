Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5199BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=; b=buJFj8tpseR+CKpeLCCAd0puCo
	4z73h23/Z8AF/0zwYcYCja7UNmifqqJGNtzTNNbSnGWY2/4IzDVfCMjbjx15qTrrNyF94TdeYp+jp
	0kEV4BxdHkX/q/MSARnAz9vqgU1FMatZ9qSvNh9eBNKTlFFoUKJ2f+SXSA6zarGhB53FFy2UhxyRS
	q77ckp48SiHc0s+E02//S3l33aaJXOjzladMp+PHKsokECBIcrKKUvX4a4yb6tbFbiw+ITHPNhurh
	DWnbQcZGLBEvZcTqt3rrJeSqKb6B0TdwKyeQR/6Bk7gpjNGthFzdE6vFMqGNST7wVjmbAb8s5HzP2
	dEoVYffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuva-00000003YbS-2xy0;
	Sun, 29 Dec 2024 15:10:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRud7-00000003W2b-2L5x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1416051866b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483856; x=1736088656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=mxS5kztY+e+1Kj2GNzr45Wh9Y78MS7cZzfYZj1Nr/Q/y3U87TRasc/pPSHuTWNWHbL
         kMNz7mx85mKdeyz9ozIZvHtsEVdFb2PDFAWhzjXSMlXQvu1HoC6K4fwboRrcpSUfhZTA
         UWpRSkv+sPeGBu2p2sA+NhGOjscFiaHLjsVFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483856; x=1736088656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=UD+QW0u56AzpY12/nqwmTT7g/TQSvLDDFZz9Z5j06/roJENZgfCL2V9Ky6dKvtZpBz
         /a7DxFQRgNSYHKX979JFL7YiHayvRiE3k/E8MXZPC976rp7ntXDNvpqX2SJWWTCRB6TQ
         Y/EdKg+kbhFcU0P134KjIRDfhwZfA25m2tFrSitQqqna0LBKNisCdJyDIHaFKMYbP5dI
         DngHptkp11WAE97Q7uOql9d/GaKW6Gj+aVSgU4Qh0vaZ26hXShI3L5hkEWPpGwiiYDZp
         BS+3MRc7dxQ5kiWQiREtvI1Sb28qTnbbrLEdKlDFShJXZGSe7SYP4+r0R/Q7MCBhRu89
         yJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqTcwczhNkxrGbCj+uQd9NTd39Dug3Wg8neEIOgSer8axhewK0UyQDvEesGqjkYeTYGooeeO08oZKt2CXbBHFO@lists.infradead.org
X-Gm-Message-State: AOJu0YxgNda8H9OOsZABUC84kNtteqjgwLh9Y4jSuzoIREldxhsMjPCr
	d9yXTPmh6S89njrqqWIPI4B4gWAjop09PN4PGSqLvurOiICP39ybBDTzQmW71pE=
X-Gm-Gg: ASbGncsmGR5xLKoZsgkY5FlHU9yHCyvgiTds6zYqjtZSiI96OEXY1Y8p3ocGxRZT78S
	NCnaQx1Tsu1lnHmx89BBkRF/ZfY3e6m3sVb/AuFVEYOGEXdkUCp2rqd+BUfYB+e9rIhN/DIX39Y
	dnp5bJHleGlDyqAaapeagPcvO7t4OtMwQJz4HbtgxPY+whgPLdTQYsw5ymtS+VKGxOJlalEZlvs
	LOJzh/Xu4nQVqPRJVUbvUg5q7FIqm59Xd/8PMcxZHpnV6F7HwNPFDKftrlLQC1BGzTQDc+uY+VV
	ewp57TrewUgchBVY7p71HA==
X-Google-Smtp-Source: AGHT+IHvQXTsCcZJ8CU1KhAq/G5BDJIBlqOMAEAV9YW5qQI6LW38CUK2eUxP4LJJg+eZZRtCwN8OPg==
X-Received: by 2002:a17:907:c1d:b0:aae:ccbe:993d with SMTP id a640c23a62f3a-aaeccbe9ac9mr2338346966b.35.1735483856193;
        Sun, 29 Dec 2024 06:50:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:55 -0800 (PST)
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
Subject: [PATCH v8 15/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Sun, 29 Dec 2024 15:49:39 +0100
Message-ID: <20241229145027.3984542-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065057_600330_FC36B2F5 
X-CRM114-Status: GOOD (  10.06  )
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


