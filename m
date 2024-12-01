Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727FED49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLhcLywhuJhFOiraoxYfL0OnvzBa/3HuAHL0GSCsrJE=; b=4EKbpvxg2Y/K/cvCz9bviCMwdN
	o+7hde9SEkFSCmJAlqPzn0TLM1sdQmG556pPTv49AOUBZwC/Tq32s088JmXurHzTlEDW4FlNLP0vo
	tB5+w7oApdY3f+NsCsXPicCoXdr6g5NbSfzvcIm6HsvSQqXem2doUtxen2tkw3Sgor6cC+UjBFWeB
	7Sp46NzmeMShb8ECc57MocObuY9zz+f+LvxhLuT3Kj5nOxs0DhP3zS+LqGf60m6I58QFN43AniFWE
	jv8p+xZiI9aTN5VGBak7djGFc/JjfZSHMNifzVtNc9Yc2Xv4FAbuEC6D6PFBeRnYz6kHyLTs0zrXz
	XAi2gVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoC4-00000004AHQ-2mIm;
	Sun, 01 Dec 2024 17:57:16 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2g-000000048VH-3dOf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so631625966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075253; x=1733680053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLhcLywhuJhFOiraoxYfL0OnvzBa/3HuAHL0GSCsrJE=;
        b=Csxzg2XKkp/gWzRute4VhXzkQjlXya5SQImuO5ptgIuYbEbHhF6iZV6cNaU4q5eTZh
         /J+scBsGE/0rNNpwXyFtdXaH35EMCcY+z0UOL5+XKev7ibeUH0Weh0LzaUd1RFmSaEe0
         jR6ZNzBfe87PGegFxqR9dEAQSOuksO5uZ0K6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075253; x=1733680053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLhcLywhuJhFOiraoxYfL0OnvzBa/3HuAHL0GSCsrJE=;
        b=ASzSLAfp+PIdhQNlfVPeM/QpQEU7zIIwg74SIPIEUK1u4FbcYx56sI5g7hZyO9c6J4
         LCHB7sbUYKm83+GuSx0wTaRgdT9pJeqkCLPov/aRhM6QiRkiKzhKYHAPmaVSEuRI5iRz
         DOQLVrqd1ISMZvjOLg6n7mvTI2k9J7VYAayJJG9W/Jb1mEPLjDmvuZ9vAXlcImr9SZ96
         wbYNeRbncg0Wqx2BxxloB8F67g0SBHMXcF19RDknM/bk401qBqwMFWyv/wJNy1KT/V1X
         QMIbwImbd1szcmBDJlrJCtksIL+5pf4vLSZnP1i5Bxq1034LxSGCPNvPxYnbwfPpGMEZ
         iIaA==
X-Forwarded-Encrypted: i=1; AJvYcCXmKeinBO4EhApFI8jTvltg2AcWg+foS0YAXzigcqD4/E5iZLsEuJQ1bdQDo6OT3zuBliNH4zumjJtBiuw+bdOv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6h68BwaUap+C7UWd8TWxeHw7RWvxt87HSpQjjoH/LRnbFTRdd
	NQbSsH09rWTiiC4V1fj6o/d5Vs1W9iOv5COZvDYJ64UYHiW3sN97/X7I0Szh1fM=
X-Gm-Gg: ASbGncuc6laEQQOe+UkkA1QCDVhhvImmIW6p+aG3oZiPajGlV/JFV+Y7tw6ytO43uPr
	a9buBmRZz1q5FfpZCx44oJpP78zKXz0n/DD257gCckTqzmu4VXFOZYSZfE93PJ9nkQZXIdsAd2R
	nS5dtnwOrXxVb7052fzlcGq0tEhmkfBx8qHgBUJ4ixPVyObq9EaiihwSpqWqyadTzEzQZ6g0d/J
	wEwHwf/WsSAUvZX0VVNRPVSThj1yq9EQ0OQnX1y/A/r8BHT1C9ZUKuJfsFCrsHzAwgcmUIV5Y1w
	101xJ7JPLzvjsINeuDP8bvy8dQxD3vxkEeybDlt1j75q49vcHxI5SEe0dx6eaDQiKg5ePhTBrZN
	I14AKtbhZatn2a28J
X-Google-Smtp-Source: AGHT+IGn4/RWVLL59jddxhSFtsf5Or4ZQ8VOnVsID7RwbBkW6zIOVCAero1gEw2gjSwr4s7DcORz6w==
X-Received: by 2002:a17:906:3090:b0:aa5:1ce8:e4e0 with SMTP id a640c23a62f3a-aa580edfc21mr2238279966b.10.1733075253130;
        Sun, 01 Dec 2024 09:47:33 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:32 -0800 (PST)
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
Subject: [PATCH v4 09/18] dt-bindings: clock: imx8mn: add binding definitions for anatop
Date: Sun,  1 Dec 2024 18:46:09 +0100
Message-ID: <20241201174639.742000-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094734_900194_34AA2DBF 
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

 include/dt-bindings/clock/imx8mn-clock.h | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index 04809edab33c..732ff87a16c2 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -267,4 +267,71 @@
 
 #define IMX8MN_CLK_END				235
 
+#define IMX8MN_ANATOP_CLK_DUMMY			0
+#define IMX8MN_ANATOP_CLK_32K			1
+#define IMX8MN_ANATOP_CLK_24M			2
+#define IMX8MN_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MN_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MN_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MN_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MN_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MN_ANATOP_M7_ALT_PLL_REF_SEL	8
+#define IMX8MN_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MN_ANATOP_SYS_PLL3_REF_SEL		10
+#define IMX8MN_ANATOP_AUDIO_PLL1		11
+#define IMX8MN_ANATOP_AUDIO_PLL2		12
+#define IMX8MN_ANATOP_VIDEO_PLL			13
+#define IMX8MN_ANATOP_DRAM_PLL			14
+#define IMX8MN_ANATOP_GPU_PLL			15
+#define IMX8MN_ANATOP_M7_ALT_PLL		16
+#define IMX8MN_ANATOP_ARM_PLL			17
+#define IMX8MN_ANATOP_SYS_PLL1			18
+#define IMX8MN_ANATOP_SYS_PLL2			19
+#define IMX8MN_ANATOP_SYS_PLL3			20
+#define IMX8MN_ANATOP_AUDIO_PLL1_BYPASS		21
+#define IMX8MN_ANATOP_AUDIO_PLL2_BYPASS		22
+#define IMX8MN_ANATOP_VIDEO_PLL_BYPASS		23
+#define IMX8MN_ANATOP_DRAM_PLL_BYPASS		24
+#define IMX8MN_ANATOP_GPU_PLL_BYPASS		25
+#define IMX8MN_ANATOP_M7_ALT_PLL_BYPASS		26
+#define IMX8MN_ANATOP_ARM_PLL_BYPASS		27
+#define IMX8MN_ANATOP_SYS_PLL3_BYPASS		28
+#define IMX8MN_ANATOP_AUDIO_PLL1_OUT		29
+#define IMX8MN_ANATOP_AUDIO_PLL2_OUT		30
+#define IMX8MN_ANATOP_VIDEO_PLL_OUT		31
+#define IMX8MN_ANATOP_DRAM_PLL_OUT		32
+#define IMX8MN_ANATOP_GPU_PLL_OUT		33
+#define IMX8MN_ANATOP_M7_ALT_PLL_OUT		34
+#define IMX8MN_ANATOP_ARM_PLL_OUT		35
+#define IMX8MN_ANATOP_SYS_PLL3_OUT		36
+#define IMX8MN_ANATOP_SYS_PLL1_OUT		37
+#define IMX8MN_ANATOP_SYS_PLL1_40M		38
+#define IMX8MN_ANATOP_SYS_PLL1_80M		39
+#define IMX8MN_ANATOP_SYS_PLL1_100M		40
+#define IMX8MN_ANATOP_SYS_PLL1_133M		41
+#define IMX8MN_ANATOP_SYS_PLL1_160M		42
+#define IMX8MN_ANATOP_SYS_PLL1_200M		43
+#define IMX8MN_ANATOP_SYS_PLL1_266M		44
+#define IMX8MN_ANATOP_SYS_PLL1_400M		45
+#define IMX8MN_ANATOP_SYS_PLL1_800M		46
+#define IMX8MN_ANATOP_SYS_PLL2_OUT		47
+#define IMX8MN_ANATOP_SYS_PLL2_50M		48
+#define IMX8MN_ANATOP_SYS_PLL2_100M		49
+#define IMX8MN_ANATOP_SYS_PLL2_125M		50
+#define IMX8MN_ANATOP_SYS_PLL2_166M		51
+#define IMX8MN_ANATOP_SYS_PLL2_200M		52
+#define IMX8MN_ANATOP_SYS_PLL2_250M		53
+#define IMX8MN_ANATOP_SYS_PLL2_333M		54
+#define IMX8MN_ANATOP_SYS_PLL2_500M		55
+#define IMX8MN_ANATOP_SYS_PLL2_1000M		56
+
+#define IMX8MN_ANATOP_CLK_CLKOUT1_SEL		57
+#define IMX8MN_ANATOP_CLK_CLKOUT1_DIV		58
+#define IMX8MN_ANATOP_CLK_CLKOUT1		59
+#define IMX8MN_ANATOP_CLK_CLKOUT2_SEL		60
+#define IMX8MN_ANATOP_CLK_CLKOUT2_DIV		61
+#define IMX8MN_ANATOP_CLK_CLKOUT2		62
+
+#define IMX8MN_ANATOP_CLK_END			63
+
 #endif
-- 
2.43.0


