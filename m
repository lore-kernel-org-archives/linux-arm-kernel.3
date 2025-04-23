Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3219CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=; b=OoRu/aCqb0VLp3tzTve7S7+2bH
	kKJoRP5WAdpMQH1dwz5dfbElT1xHeFG77i/dxUoEN+gi7DGQ7/9IBFPUHWMkLaDEwR2aG+mPto2kl
	QacMWIV+PKFXuGj7in17v82HbuPIfqh50vS4pohnzjp60vNMznyiSbbmRF6pbRAHUkLahXFpWytLu
	ZMBJgkNCPfTjKlCrcgPm9lk5759SCu3XEUE/yO4oXh1xDuur9SL6covFlQNz/Qob8jcUDIeId8pRs
	9v+tn+d5lgiv2ELltQk6WC9yc1Y9rbBAGuiWh8K8bZGal8iX+KMCy4qEO+YDc838FgrBkAg+xwsX9
	6kN2buag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TjY-00000009MKW-0AXG;
	Wed, 23 Apr 2025 06:37:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCd-00000009Hib-03qw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:24 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac34257295dso1084704266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388202; x=1745993002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=BRLjKr4LjWmyJrEzTMlILdOLTD2Z7N316GDshWJ/BR3RRryBl64nwMB2RywXSAcbvk
         UeQtmNaV2WEWA8HR22X+Gy1P+M44ujqsotBR5QXxKMw/QdQOQ38Bn9HiQ1tw6srS8nIE
         3sWT+85LNFY3kPECTFMcsCl1AYcPNIhrbcLVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388202; x=1745993002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=J9tg2w9TKDja/nwPf7A+1/kKDIhhvvw8cjHEZVF220R//XdXAIuAERqh1kkl2PXl/R
         tPoyxS4CFZiHy6951Ou8w4vE6XrgyJqrrPKku/GXnhsPl/TOfVdy85/GPb3ciJuBEZLQ
         hM2UBuApqioJa7nO4czhlZRhjTLumxR8QGX58zLLQtXpbX3tvmKEAOJg4smIQFbkLwj1
         P9wlqBZSM52r3iBEyuOhH9mCvX7jwdiv5vxKIRAsQGR9NONCp+TBna3CmV5iKtCGR7QE
         IphYmYM7i++DBAL3kruOvkXv76NYZfnREBb02Smp4pJXJT9J1ZM/GpUPywINazeNJQ7B
         UuWg==
X-Forwarded-Encrypted: i=1; AJvYcCWJs4lzA4dFPsb+pjJIQh1bwMgkDx6E/q58hWPaRB007lGDqihtBCwywY7sEhrVdiLW27BkknDRlGIWYKKP6kpk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzql4BwJJDEohoyx7/RgBJmbmJKD5Y+JoxquxglzdP71IORTQYx
	1mPRzoJYk3wv00vs7C9JMTm4asqepWbfryjoJLtCijYyedHawK/ddoVXQV5PRGY=
X-Gm-Gg: ASbGncsO3owfHUDfQChgVYxeGkH8vU0PAT6ZyfIJGTlPR48ilV0DnnzxHcgR5rJQNZC
	sV78Q1DTKp/c6d8iLfMtcNVEuJPo6Gu1cPE8M5A2Ha2wJR76YC1rbrQ1QiCBwsH+dDMNSkXy9J2
	iUAM71Y7dZPVEFdywtKVBNggV5j4SNnV69vOB2gAvRjToo9e6YxCtXBA4fdyoK0VXU0Fxu5fbE1
	5MDEafunsCPsvcDRoyWq9bYk6HQphj0B723ymNPfq9+4YQeCGa3LFR92k3lF+JyAzkWzWBWZaUr
	uzJrIblbpA/04N8W3yefr9fzaL+C23oy6sm9nYPzWsgZ1XLCpieXaaVH4QDm/AmZdL9YJY5mshD
	xPinC
X-Google-Smtp-Source: AGHT+IEJ56spgVoRyAaSkes0KMlG9QsQfLguHD7mHBCsh2ck1d40hCG4yrSLmlQgHJPAAi1Y7j5Rmg==
X-Received: by 2002:a17:907:3f29:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-acb74b7f3ddmr1978951766b.29.1745388201594;
        Tue, 22 Apr 2025 23:03:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 16/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:33 +0200
Message-ID: <20250423060241.95521-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230323_051620_71066497 
X-CRM114-Status: GOOD (  10.49  )
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


