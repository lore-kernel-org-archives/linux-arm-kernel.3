Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54502E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rq1VSi4sJPfcoFKtG/h420vGHkyV2FuPufBKEuYsW+8=; b=gFHavZKO5h6ooHw3sHJ9deNVvi
	rOotLzmiao9pwNENc9cDz1fH0YvVC9Nq9YMaKsOWxZSOp9MYiuq17QOvURUd37D0DQw/ZFqsxbz4I
	+7w5QmPV6JUgnjYDDG+UTj9Oq3HEGNiWEI0W7QK41ditoH1LmnuiV6fkfkRs/OBrWUa98DGu3weCK
	HOj5fVjSopwoIPs1E5J8zTl4ARxv6Y+BkLL1yzYiSnBmB3+5e4BhUYfyEAT/MknerNPyaOw/+MlHk
	Nm69fTTlMu9gLJgrMu0H0O4coOgbqojvQo9ckqtZ2UK4njG9e0Ms6x5rn1DQmrnvJSUAoKiq0Yr/v
	c3jkVfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE1B-00000000hv8-0xPl;
	Fri, 27 Dec 2024 17:20:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDet-00000000ebt-3Eys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa67ac42819so1054855966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318674; x=1735923474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rq1VSi4sJPfcoFKtG/h420vGHkyV2FuPufBKEuYsW+8=;
        b=PI2RWhlS7za3Am1eCqp9dqoEPiu0zgb9iQ9rET/bAQdvizKaNGAs+/BRhpWr0eZFN9
         iV1H2LHGFx7R3KJhRnQWmT5Jh+hDGts7q3ZycM2LuCZDrTmtK/qlc7BNWR9+0lXz07uf
         AJ8L0EYWsXJGdJTjF6c112tFk32RjHtqBC3vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318674; x=1735923474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq1VSi4sJPfcoFKtG/h420vGHkyV2FuPufBKEuYsW+8=;
        b=adbQ7wjeH00G8TTDptDhygsBvwt8CWSG0ZYsSuI5GRD4e8pRfK3Lr/Vmdsfa+suO1B
         FzcK0UMINBzBgq1QXa7ydU4epcTPiIaNlf3whl73ePiqRPLtP/e/VWVS9x7k3MJ7OPJX
         oq86ybvPS1i5Hc6W+qbsBugX/9Loj6541bWrP1/uolQEAkrc63gw5+I44Ho4rdgHIyAK
         Gz2S/DLJRCIouHag6ugi7vZBDPRXRQEwVnNwH0TGJG4oEQhNTwOfKe8OQz3YOxKWj0O6
         OG4S/5+PLqfDRtGU9TPh0TGJqTirsuETOScn9IBhMDKhfYLzJmmEbD3pCFS1vvswGo0M
         N1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIVmb4dD9YcS1Rds2Tw4oNY2j/hn0HfRBQT2mu05fpEtCCuQ4aHHMjrc1CHb5d8/Hq5Utl1TZoZ4Z7vnPhiJHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyY4Hg3yCebiWBk58MpWbUA3reG0AXKzDFuueQ//0ZIYg11wzZR
	Q8EUylpNGRE5NiuRu8SsBpGH1NaotvY2vYsG0VWZ1L09IVQsVGUl0uSaQomnDTI=
X-Gm-Gg: ASbGncuwrkEIOemoiqJseqMOdbqKUCT/qpiTrvbaxSyi5o5GBzWHK1wq/QzHzwxmgVn
	uftjE+aDHnjhGZeRi/+di2/AEvU2E+auiObJy8WV0rMcamKSHDRham6Hq2Lir+t6Re+xdOqnO6s
	7RYcyShlOk9+YCbFuCYT67CXWl5WDCrTqMGPfT+Hn4wySb10Wk8x2z3SsRNX+S6a4oVFlHlZQWi
	2BC3EFgw5MnM+53oHkHdRho6nu3pPssmoSaa92v8CERL5GAbIq+peacNEp8owdStbrLJ6/NHelO
	qhyM8Xc3Sb0507w9OhIYfw==
X-Google-Smtp-Source: AGHT+IE7j4dDMSJzj4YF9TTof8Zod66BxHTVWnQ8MmtOChqL0trQDynsgYUTS5unrBlBn2AwqqLf3w==
X-Received: by 2002:a17:907:940c:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aac2ad9e63dmr3011790766b.18.1735318674459;
        Fri, 27 Dec 2024 08:57:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:54 -0800 (PST)
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
Subject: [PATCH v7 19/23] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Fri, 27 Dec 2024 17:56:22 +0100
Message-ID: <20241227165719.3902388-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085755_811613_0EFAE11D 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
index 68efa77535cb..ef25c4a655ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
-- 
2.43.0


