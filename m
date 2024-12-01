Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE269D49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9ECY73UG8ehnqT2joX/xp2njmIlfmPxWimrFTqyoco=; b=ncfUN6Ie/ccA2XQZFMJXlww9JW
	pfJFmYShhHrg9PIG75UZjCD9A/fCVSi4Dkq5AMsRXLDs38ZYe/iEDJresk3PF9bDW6Rud5iJOAMUZ
	Omv0/5/GetiFulpGBIk1bE7bpdTQpnniVzwtrZl8JG8RdxMafxVKHIFYvewj2yqWdeUK36f2P9/7W
	d7HjESotglgmbT1QDizHA1IeJXsRd1RHMUghHp959Gp8eg2F+FttLgTJT9ae2o90qyxGrYcaVjZz+
	hOcWL//wCnO/IFfwon8ti3onNcSC29L0lfGhW5wedLaqMsxK+fKz+omv+CM9mqFTUDqAYLenRCVRj
	Dzy0L2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoD1-00000004AOe-14VL;
	Sun, 01 Dec 2024 17:58:15 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2i-000000048WB-1tCE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so446365866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075255; x=1733680055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9ECY73UG8ehnqT2joX/xp2njmIlfmPxWimrFTqyoco=;
        b=OvSDFGvZQDipZX7JFtOx2zQVrY0cn4vP8tC57Nm+TBqURvP3SUY0C6U2pCMvqM/puP
         6H4lprULrlO6gMdeoaPmSD2gWpmVCgm1gt/X2vVnEug+6GKDQNobvS2c/cy1LaVFqqBY
         7qJ0mTAn+zT1G2ofpQFlpxTSMUc39IoBgc11c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075255; x=1733680055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9ECY73UG8ehnqT2joX/xp2njmIlfmPxWimrFTqyoco=;
        b=OHMxcBZrXH8y+ZBJpHj2bMdIhAwnHi5910p1KCZVVtUhVOkoOeV9mW4cXmZQoH49af
         i3ZVL81udSmsuB5lZLI6b8XO38LADzzGwp6WfgeMEFWm9dsaia5UR4vBIs1Isb7wraM2
         KreVU/12YeEaUKuWuBMm10F7yLpx0jVl2+2Nk3SoRKoH3hy7tDcJ1vZgiuM3L+WBg+xH
         MhgSrfbCFvBr4EijYg4zuUGdbjOGM5s9xNyVt6880nFUr5j2EANtqp822gq53sP9Jemc
         HrmEU0umWX5jSA5ZtrDmORRfr1V7qAbM9yeEJkccb2Xw6PJ0vwR0meqBjgw+2yRgXdHz
         UhPA==
X-Forwarded-Encrypted: i=1; AJvYcCVPm+60QSoG3ePaFJm6t9wpJRPlzcMJlKtxqDX4+ch0QaOEwhoM2SfHpkXtTsFRH5ddU7yiS9yyLUgxl5dJhhfH@lists.infradead.org
X-Gm-Message-State: AOJu0YwgAS0fyVcq5ter3sezZPdlT/SkH0TK27PUQF+cAQ8G1IJ/kPKc
	6E0eFIpSyoTsYbC5UozQDWC7NllMMEQStp0nwW0WyIaU/zPzA957ZX7mkUF+RPM=
X-Gm-Gg: ASbGncvi9Z8pBiaYla3KVaerjTVjdMvuTiaN2ZtFt0x/e3sygPvUI5IEXomXMdsieio
	w6MxYu0bttjohVSrmwfvncJqreciI9kyc00Ofh6HHDsED+5Om3nB0Clv39qK7FxYLFiboVyw6em
	tha3yZtK8vuxa5uExuWCYigJfNg4Tp/qrS2Twhtty2AKjBdabhaaB2VNSJ0stLDdzgUYlpH2vbH
	d+fRtUdcYMb5GeDyNpMYRzobYiZDyWnbm7qggu1w3WggQ7EbCVNmL4+lXWdcJyOSGODSCkSM4eN
	c7ziISNHE3hkRFeLA0jHWZowlDhC+7xXTPuctNHqdKUuLykCqufyLMrv8NsTMb5ls1k10BQnN8+
	9va7tdUSHz/0bzuDG
X-Google-Smtp-Source: AGHT+IGWip9V7SPf/QghX0+OWBObLNjALVbM+OpWM2YdiKPU4MTIDv5I0WeF92pbW/fXTxQeu5Tp/A==
X-Received: by 2002:a17:906:3d22:b0:aa5:11be:5703 with SMTP id a640c23a62f3a-aa580f3a76dmr1448724266b.35.1733075254737;
        Sun, 01 Dec 2024 09:47:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 10/18] dt-bindings: clock: imx8mp: add binding definitions for anatop
Date: Sun,  1 Dec 2024 18:46:10 +0100
Message-ID: <20241201174639.742000-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094736_486563_CDD3FB00 
X-CRM114-Status: UNSURE (   9.14  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 include/dt-bindings/clock/imx8mp-clock.h | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 0601df6c8d38..39e4ad470927 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -401,4 +401,74 @@
 
 #define IMX8MP_CLK_AUDIOMIX_END			59
 
+#define IMX8MP_ANATOP_CLK_DUMMY			0
+#define IMX8MP_ANATOP_CLK_24M			1
+#define IMX8MP_ANATOP_CLK_32K			2
+#define IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MP_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MP_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MP_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MP_ANATOP_VPU_PLL_REF_SEL		8
+#define IMX8MP_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MP_ANATOP_SYS_PLL1_REF_SEL		10
+#define IMX8MP_ANATOP_SYS_PLL2_REF_SEL		11
+#define IMX8MP_ANATOP_SYS_PLL3_REF_SEL		12
+#define IMX8MP_ANATOP_AUDIO_PLL1		13
+#define IMX8MP_ANATOP_AUDIO_PLL2		14
+#define IMX8MP_ANATOP_VIDEO_PLL			15
+#define IMX8MP_ANATOP_DRAM_PLL			16
+#define IMX8MP_ANATOP_GPU_PLL			17
+#define IMX8MP_ANATOP_VPU_PLL			18
+#define IMX8MP_ANATOP_ARM_PLL			19
+#define IMX8MP_ANATOP_SYS_PLL1			20
+#define IMX8MP_ANATOP_SYS_PLL2			21
+#define IMX8MP_ANATOP_SYS_PLL3			22
+#define IMX8MP_ANATOP_AUDIO_PLL1_BYPASS		23
+#define IMX8MP_ANATOP_AUDIO_PLL2_BYPASS		24
+#define IMX8MP_ANATOP_VIDEO_PLL_BYPASS		25
+#define IMX8MP_ANATOP_DRAM_PLL_BYPASS		26
+#define IMX8MP_ANATOP_GPU_PLL_BYPASS		27
+#define IMX8MP_ANATOP_VPU_PLL_BYPASS		28
+#define IMX8MP_ANATOP_ARM_PLL_BYPASS		29
+#define IMX8MP_ANATOP_SYS_PLL1_BYPASS		30
+#define IMX8MP_ANATOP_SYS_PLL2_BYPASS		31
+#define IMX8MP_ANATOP_SYS_PLL3_BYPASS		32
+#define IMX8MP_ANATOP_AUDIO_PLL1_OUT		33
+#define IMX8MP_ANATOP_AUDIO_PLL2_OUT		34
+#define IMX8MP_ANATOP_VIDEO_PLL_OUT		35
+#define IMX8MP_ANATOP_DRAM_PLL_OUT		36
+#define IMX8MP_ANATOP_GPU_PLL_OUT		37
+#define IMX8MP_ANATOP_VPU_PLL_OUT		38
+#define IMX8MP_ANATOP_ARM_PLL_OUT		39
+#define IMX8MP_ANATOP_SYS_PLL3_OUT		40
+#define IMX8MP_ANATOP_SYS_PLL1_OUT		41
+#define IMX8MP_ANATOP_SYS_PLL1_40M		42
+#define IMX8MP_ANATOP_SYS_PLL1_80M		43
+#define IMX8MP_ANATOP_SYS_PLL1_100M		44
+#define IMX8MP_ANATOP_SYS_PLL1_133M		45
+#define IMX8MP_ANATOP_SYS_PLL1_160M		46
+#define IMX8MP_ANATOP_SYS_PLL1_200M		47
+#define IMX8MP_ANATOP_SYS_PLL1_266M		48
+#define IMX8MP_ANATOP_SYS_PLL1_400M		49
+#define IMX8MP_ANATOP_SYS_PLL1_800M		50
+#define IMX8MP_ANATOP_SYS_PLL2_OUT		51
+#define IMX8MP_ANATOP_SYS_PLL2_50M		52
+#define IMX8MP_ANATOP_SYS_PLL2_100M		53
+#define IMX8MP_ANATOP_SYS_PLL2_125M		54
+#define IMX8MP_ANATOP_SYS_PLL2_166M		55
+#define IMX8MP_ANATOP_SYS_PLL2_200M		56
+#define IMX8MP_ANATOP_SYS_PLL2_250M		57
+#define IMX8MP_ANATOP_SYS_PLL2_333M		58
+#define IMX8MP_ANATOP_SYS_PLL2_500M		59
+#define IMX8MP_ANATOP_SYS_PLL2_1000M		60
+#define IMX8MP_ANATOP_CLK_CLKOUT1_SEL		61
+#define IMX8MP_ANATOP_CLK_CLKOUT1_DIV		62
+#define IMX8MP_ANATOP_CLK_CLKOUT1		63
+#define IMX8MP_ANATOP_CLK_CLKOUT2_SEL		64
+#define IMX8MP_ANATOP_CLK_CLKOUT2_DIV		65
+#define IMX8MP_ANATOP_CLK_CLKOUT2		66
+
+#define IMX8MP_ANATOP_CLK_END			67
+
 #endif
-- 
2.43.0


