Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4107E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=; b=z9TFfY0c0hQfFRfqxe6wUTinnU
	fbtDUX9uYwKnEjjpimrZOs4eqxa0++jDAKIQHeX2deaz5iLTCjQrdBdrD+6uh1jmUSdXgIsGO37xh
	EZ8bjDo6Fa0nZAiLuIppr6Le+xviwhAvaNNW0QYRLoml+MVU95q3iRUD9nemdw98l20rkdIGs/fV2
	EsQhmjYak0JvYsBNpNjyna7WhT/HpU88jCXHuhMmY2YXEuvPUcDdHM/av2AstV5EtMlCsxZECpYYp
	kAHcqhmHxbHiJDwXyEEreJVxqF0jUaWFHseXKRLV6eDayjG/NRqCmjMrJfmUssmnruylNzKwj1ObS
	/X/aMjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9xZ-0000000Fhj2-0dbO;
	Thu, 05 Dec 2024 11:23:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tb-0000000Fgar-3WyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa530a94c0eso155569666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397586; x=1734002386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=;
        b=i+LkEPvlNq6rgTeDnhgp9XZcl0sv/0RUqxQnoin9NGODstuF/A5OSVbVKTHPqpGFwf
         GUurVMAtzKvrFxjfumPjl7srI04o74S6a+Ki653w41DWHW4xKIYd3DjJBpscQQDNbI3c
         KSEIsbeId4MwSW7mpMX/DlPGoUwsEdnqsXVfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397586; x=1734002386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=;
        b=QFSUtCUJTvu0CEFxo6CsLsg+UcSfIiIHYGf6Z1uEBNzvJBdlA5k4rhACyxrJfZON+x
         txlIlqTWvjHumMh57tmL0mrXNXXghCDbwiBr7rvNuXqkQlhStVmTr3RPh3qsddLU8+dO
         goB7KRMLsoN7W7BaK8J/11VeS8VE5Za5BbrnezlXyFptFqW+ANZ2RCtmf2ZAfh5JF5vG
         Ew2R4WSgupVAnvw0M6vJ9EReBp7fdv9SfO8yXKDW7wRDfjRNZ93Cckk9u7+S8uL+19Nf
         ZWcpBR5xUqBT0I9uKmFNPK0Dy+Z3nQqdZkw9euFnun1pnYnguJ0SFUsEEE1YO0pXHSne
         7DkA==
X-Forwarded-Encrypted: i=1; AJvYcCW7+CFJ4SUXuqGCB5QJva1lxnGpbIY4/2ssNa0Bv/2llPs95o8UeyloRVoa0ls/PuYqS8vJm5yXiv0QzXzqIepo@lists.infradead.org
X-Gm-Message-State: AOJu0YwBy9eXi3OKzIW9zXRrbxbhnBcdpuDeslSPNGyGZ2iaECUkS+kA
	sqYlF78w6JoLOJRMKpBxF6q3HkSoN6tZjx/GQScFRgZ70OQilzWRag2flCJmV7g=
X-Gm-Gg: ASbGncv57o2NIdCO+LzROWEVJSv9WZ0kszw0Kp41Zl3DCckuQ1IQGHXHgu3CJ199c38
	RtdPZ0r46YeEMRZsDuZTGwy8c8qTJiJP3t0vhrqXPGYNRqSI9TKMVCd7LjQcCY3qcjklqyiKLCK
	MMJUztVEgC2Pn7zLIrdGOI4GmW19iqYRgX1HI0j3pXUbHajb3YQRLKW4eLZNMcbKh+zxLgRhySx
	qxan46Z6ux3/k/Hm0algN7pNkeBrnYPYXR0lFEKwzadIWK/7t0e8/KnOfr2hbAb+BM9NcjosvDF
	Dq/bgBPFYt12xIgtGaD+iRQxGmYt6Mue8MHJ2T7I7jcHwA==
X-Google-Smtp-Source: AGHT+IEvMCFVKhXQs/BEo9XGkjUrPVab4oCHkJg6oXUg3V30XKOK2YMJHs4Q4VAghsMiMHhIuTdfyg==
X-Received: by 2002:a17:906:1da1:b0:a99:3c32:b538 with SMTP id a640c23a62f3a-aa5f7ecdd96mr850956766b.42.1733397586585;
        Thu, 05 Dec 2024 03:19:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:46 -0800 (PST)
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
Subject: [PATCH v5 03/20] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu,  5 Dec 2024 12:17:38 +0100
Message-ID: <20241205111939.1796244-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031947_879407_D3468B0E 
X-CRM114-Status: GOOD (  11.10  )
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0


