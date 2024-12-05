Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253A8E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOY72MHaxAftY+kPZT4cz9mX5QyWQyee4eQ/HvJFX/U=; b=2j88aPWNMEmN65QFDTgPptPJjd
	EMqJ8LawPsVdin4tJRuBpjJiuSAOY6UuhsF9oCmVZCwIovcgtacrWPkcC28HofAi/Z4J4TUwfkxuM
	XWPsKSQ5lwt/ugZhvxofrk8DSlAzT024k21IFhVUDFVAWHYeLpq4N3y8RzfFGFSmR5hSK5ymZeRKk
	b0IFB3qialABYdExm+kIq4a6PMnRLbTNNblEUvNkzlr27RN/92TM+JEFzWlS0SLLFf/ked0xShkqD
	xHthOSUw5hVajSQtJNUMoGIbNkLuIixv2iAdIw5h+C0/InLsiG9/t4pWRDsvOId6H5sUftM38fduB
	OKdsHi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA5T-0000000FjZH-2upr;
	Thu, 05 Dec 2024 11:32:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9to-0000000FgfY-22BY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa503cced42so115262166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397599; x=1734002399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOY72MHaxAftY+kPZT4cz9mX5QyWQyee4eQ/HvJFX/U=;
        b=AU4gDqngqzl03K2QuIyARaQtMUYQFbedKZ6cMsE5CjdlChCfXv0H+RcTxbKINW3t4d
         YMQth9xI96NyzvshnkSzT6lVfL9q/6/ajfQCPT137rmpoycryzxgeLLL9zAnBzsqdIDn
         J87NXVWE4DVVxJRpzVF/nqX+TviXFHeHQObLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397599; x=1734002399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOY72MHaxAftY+kPZT4cz9mX5QyWQyee4eQ/HvJFX/U=;
        b=mR7Uoh7ybayWA8z9zVTICghJqios2ahSzhsg4zQniXaNd8Y7DH3OBTDNHFFrNKap3J
         xV/o1OlaSJmp7+HmzazB9Mbf0HonjsemyF+N9uzCs/pNcQhllGZIV/aAjnOPTUQvtOmg
         1FQMguMMrnr90hPNq1CO1LiAQLh5wAGlsI01h4fKVNLw1vxFC+TK1fA1aYxyjDkWJ7+t
         YTsw/q9R12omr3vkyH7X/p/DUYCyYNZs5XQxuKbrFIVQx5hrLCWcKWreOiGWLNAwesJd
         /Tq/K66KkrR0cMaT6Ae3zsHvpaK5BrrjQswIqRQ1hcSEES4OGN0ZpomHtDB59dowSoNB
         EqGg==
X-Forwarded-Encrypted: i=1; AJvYcCVlLx61j4hpG9qnpLxL5ztuPt8sAOlRrIJ8WkxIPnbWUF9AxWEHJVmjeFANl+XlRIKX3IGnmxetVSEe2AMfLGT8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw29Yu+5txkxsOJTCLjqP8KTfxZai3L/LHfPJzaJQsX6ZjmTHbL
	aEZSPBARpsdf6wMflcs9rpcjUXVm38MMPlnJ1i2a81R4Q1We9gMm52dPfKLCNec=
X-Gm-Gg: ASbGncvIw8SI2nQmh2hm9hUFrgjqRBONJi94wN7RnP/717zAFwgAYLdzIsaueJCc4DA
	1Z0kLUO0MNNTcADQTmSzNb6bfsCGxDDqLWWweWtinJ3FRsmkp5MP8jmBvmEXgtRFbg6JpdbDizL
	ifJvWYw2CBrNAJT/8tHHsSFqBQTnXhc8WJ03fXMtUDMmsLpYfgfgFphkB2XZlmGR6XoVABRxN7n
	EZ5AmrzmgTOOSGQPGD9jGGTAvoVg+CVz5ueEGkkgH4MhIfJPdukTbvid0VLrq1WGOogYko8r6o/
	OS5XWONWGrNKGRxP4BH6B6nWPGvlLdMG6/baawrUL3IL5g==
X-Google-Smtp-Source: AGHT+IFXJcxKOle31pOcIopdUkkB4lCAoWI6FX+oQCGDMC4yR2Zx2PMfETB1WKVrtpXVsIUvtR8jAg==
X-Received: by 2002:a17:906:4c1:b0:aa5:f288:e7d8 with SMTP id a640c23a62f3a-aa5f7de5826mr706812166b.26.1733397598755;
        Thu, 05 Dec 2024 03:19:58 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:58 -0800 (PST)
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
Subject: [PATCH v5 11/20] dt-bindings: clock: imx8mn: add binding definitions for anatop
Date: Thu,  5 Dec 2024 12:17:46 +0100
Message-ID: <20241205111939.1796244-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032000_529267_0A7E85A0 
X-CRM114-Status: UNSURE (   9.25  )
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

---

(no changes since v4)

Changes in v4:
- New

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


