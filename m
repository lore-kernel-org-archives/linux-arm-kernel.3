Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E233EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSqZmzfg82O+4dHUY/JUhUjoJ4s2N8toybCaelOQrvU=; b=3X4ZePmWCO0qIyMz7mEh7OkvM3
	uygp5dZcMPTMANfgY3U2PqDnJgspIHM1sBo18OAngqaMMiGw8F6YkEwoQIKJEVZDLnfjS9x2n0BH4
	BLW2CGHHQJS9efUOIbZ+KGFNBlAJATHZZb2UJNxIPbL13M79ev33JCF2zh8HZZFt3tmNl7W/3PmdJ
	uX/tANrm281Oa4ZBJm3aqwKUQMXHOFgVSW0Z8yNq7oErHwDBvgMerws+IujmyQQ6mocXmE2WVgSiA
	otLr4foP4rNbu0xNfiQG/fZSa9EwFOMpueoePM+RzR3jHfV3yMDqRO+Mbe+0ei99fEzeacaWVMB7S
	Vw7pdBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPQz-00000008YIu-3IFZ;
	Sun, 22 Dec 2024 17:08:05 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOf-00000008Xno-2fPc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa68b513abcso688770166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887140; x=1735491940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSqZmzfg82O+4dHUY/JUhUjoJ4s2N8toybCaelOQrvU=;
        b=gX5ZAWM3FODJt0mC5Upqkczw5aoXoc7b2gwO/RMa+UuCcrB9exiZeAkta2UFrV+w8I
         Rcxp0gWgEeXm9FsZRuusLREhEk0+uNtB83EC5lSbeB4N6o94E4Xmz/Ex/6IUQxx4dbWF
         5+rBu0C/FHwYV6jMHgeqOTYqB3GNZllXzHAgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887140; x=1735491940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSqZmzfg82O+4dHUY/JUhUjoJ4s2N8toybCaelOQrvU=;
        b=XDxgKMRXrmBqPFyxLtRg28pS5hbE47/qId0wSWcv6yANINNmllOAURJ7WOfeTbidOK
         8ZdGEBOocph1IP276/oZ+EVg00kw28339aDAoWCVtaVVsQ8BedLrPS83iC41oZQe5vEU
         /sbja7xrsra7rANyMSvnDU4lc2jV1nyQVZwTioE8K3FwTibSoqCT67QMeXl0CylGDNB4
         8hU64NfdSLYNpUATqC1EXPaojQRdwgzshzWtHMhV9BRjjxjPN8giiFXx+HUJB4dkMHBH
         104F0h3QulMbbLtl5AoUxwS1BhTP9j4zlU8ERi7eIXcjtZ5/3XYYD+VH/TZs+qwIK1sr
         3Vvg==
X-Forwarded-Encrypted: i=1; AJvYcCXBngC1EjdqEFpsigSA3mmhM9qtMxaHPkOrTGUxL9/d6pz5HRMi0L7Vi1Me/2f4wqC5Z0hXSkaRIODbXXeG2eJ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp6BRqJImZqBq813lxION77vui+uPXyBwt92DgDUZKmp0gGAJN
	696LlH2fwmpf+0td7gCXffHg/723Td8qUrF3ToHo6aruI7ze+ztdikeGW18xNk0=
X-Gm-Gg: ASbGncu6AOF1KjjZc4O0BIlCSQtBKqmYCsuRMSp0nLsPAVdBdjn4X93c5MrQq0D8Bm2
	K77iCpVSDm/+bkaZIjySaOiGIR2cXXMqg2q+wr+f3GDHyTp+6QmaLBSGpi60HTJn7J524Y0/j0Z
	8VnKzjbF9GF2/ozYh71HDqh/mG7SjZ7gjzpbJlP0mhJecPPIM7pIhD5wRdROlcgeCqK3O2W6wAE
	sG33B8cTSa4AHUHrCxMwASp/TwzkXqwAxisbdK2IwOqI1GBjqNNR9Jy2iyNv/wfgYbbVYmRE3oK
	f/a0bKrZBK5kVGeZC4UHyK9kD8563UDI3kF/69BnxI2uog==
X-Google-Smtp-Source: AGHT+IGoSNLLXoUG9w9h5MwSnQKDCveLmkkQwCAObiEaQRbH9lAFBzDeGX6ULegdYk7dQYszNotN8w==
X-Received: by 2002:a17:906:730a:b0:aa6:a572:49fd with SMTP id a640c23a62f3a-aac3368c074mr1008129766b.54.1734887139810;
        Sun, 22 Dec 2024 09:05:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v6 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Sun, 22 Dec 2024 18:04:16 +0100
Message-ID: <20241222170534.3621453-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090541_677167_E1D6D783 
X-CRM114-Status: GOOD (  11.17  )
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
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0


