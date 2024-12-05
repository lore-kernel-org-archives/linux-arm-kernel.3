Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC25BE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=; b=RbYUoqH31Si76paGUlwcCKdhlu
	646Y+sf/KyxaFKyaMUnYOgWkJXkyBx3BrTyaMwCK+OAii3ZxTSNP9/OFKCPC3ehj9emfEOLvFgQdH
	BR3VBuPPG4c55lJR1Wo8pkGJm6pIyDZy981SRvLO4ED6HtMhB8bbsF1+azBcM4IweI1cXYeGN5WwP
	XuDZ+Hu01cLVKCn9Z8rJ+rlTezoFkxvAyYgC10reIwyHCyOtn8UnPOrENbnHdDyJ9bzX6WtjKJ22P
	UO2qpckNyA2zOQPxauIQvHt7NVKnOmMc1gl8k1TPcDJ/d/39e5xCCOD5gkg/RM6/s237CCdEsDtZS
	z7KdxYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA6S-0000000FjkS-1Lfq;
	Thu, 05 Dec 2024 11:33:04 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tp-0000000FggY-3aMU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9ec267b879so146999266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397600; x=1734002400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=;
        b=TLiS9i76oIC+GzDMC8nW1BClOn3gOq5Wcg1DphzvEzqUzur/BvanXd5QeBxsh3J+QP
         AUMayGZQyPql7xAmHiuRMPTX6JmAloSvOSbYJwUicqIG4nB5p8EgYenRAUElylnl2PZs
         ZzYLPW8r2LxmAZJPpTwpoFAGIxEZGRV+hICFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397600; x=1734002400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=;
        b=W0dA2V5RxgBn35O8c7B34JnC7h8K1BBAnbNvhqoC/lwacrJmXFj1xuQZ9pbSeychBH
         pq4bJwZPAg6OXyjYBB9qyo/4SemWTB+F1Aq5KQCO5r7usncI/wWyIMiQwjtpcTVf7otS
         kY/FpaSXp1CTGwEYCdSgwexuI8CnbN2Kq804v5hDOi23vz7jgDf+DQWzzccJYAHinLOM
         Gwg6lW7b7BC0XykLEhymw4N280fSYZqHQZSZnF3zdguzwzpD0tccgYaVJriU0JC8OerY
         eulliTwbe+2QVuHiE4aOBXbeavyNk9P/F7rCYhX8aLgsIILHSG3ovtmt+VYWDt+lz7w2
         KHLg==
X-Forwarded-Encrypted: i=1; AJvYcCWxZxWbfUs5zwtvrYBj9CZL8OaOPaweqfkQIJ3u6Y3bJhAz+F91cyC9giu0YkPFL8yL+aWB55YHmE+1WkBIdgYc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1HujetSYDxhum1ycKoakkQ6nmrrzlh3XvX3D2WMMFHrZgN8W6
	H1ZXY2mTN0HMz0giKDoj1O3mufPVOaMmpr4MmopLGD7Z9v9UqSWDoM8Bu9jXAQo=
X-Gm-Gg: ASbGnctzZiBnDPgkuKPj+0iEm1Lxga67/GnlTPI8imI6yKd63Y4FwaN7YGSiMPJLbpu
	CFfe+bTG1PzLndGT4U9TDeq4bp8FidY0JQxnMZ6jM1CzWhdOv2t2E37OMFgiO0M/R2eGgKRiTJn
	umIjnaOTGJjq3jpx0zEnJugdfcmHQbKpWYUMbbjMRP1Gk/Ljumn9TvXVeMA5pI9zAe+/3cSwne3
	oAadKCxOtm9hOi2c7oQ5L3Eui2vezf6NF+Z3JVpZ6cV0AkpYUA/hdgwmfqe9iJ3Xk5BshVzdF+I
	PQoK7LXqB83yX7yBXadIPtee/PONPzgSzLtk6d7nJ0ZHaQ==
X-Google-Smtp-Source: AGHT+IHYmzsfUE5nnaORiIrX4Eb1tu8QF4QuJLvLBDRHYiwoP2v5WElgFEFGC9Kt0r3kBSas5vWKow==
X-Received: by 2002:a17:906:308c:b0:aa6:2cad:2d61 with SMTP id a640c23a62f3a-aa62cad2dc3mr99811966b.19.1733397600072;
        Thu, 05 Dec 2024 03:20:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:59 -0800 (PST)
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
Subject: [PATCH v5 12/20] dt-bindings: clock: imx8mp: add binding definitions for anatop
Date: Thu,  5 Dec 2024 12:17:47 +0100
Message-ID: <20241205111939.1796244-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032001_892659_43D1E767 
X-CRM114-Status: UNSURE (   9.07  )
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

 include/dt-bindings/clock/imx8mp-clock.h | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 3235d7de3b62..c2acba5d4555 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -402,4 +402,74 @@
 
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


