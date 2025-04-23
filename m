Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C9C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=; b=lU6H0dKs9mT4WzaQzqYaeqf8tf
	rCoQc1m68UBy8+5nb76X7qlPF9U7DcWq1DM3TOk4SFUExy17lSSRwKqxzWX7cS93ncSQruSytuk/x
	Axq7nh49m3dsyQ0eggP492DO/YbpbWZAfDRbnh5iDapxWSt+kDT1z+0Sw0bY+7Pb+AveO20LRqejB
	7oB3TPASI7AyJuTJjiIvNMxwZltBBYrGd9m0sKT5LmwK6SDTaHFLv6vH4VA/v2LCkxVp34Qn/rdwS
	mQ7xDZ/tjjRkJi7yVte60Jb4eA1EWKB0PgVhKcxU+KwVez4d8s66TSeBDqLNEtz/mlLjCShHrkaZu
	wV+SKeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TGQ-00000009IfX-3Anq;
	Wed, 23 Apr 2025 06:07:18 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCF-00000009HYm-0C7N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso8192735a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388177; x=1745992977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=hvekvZOx5Az+oId+TteLntY7ucTY8v/wwzFlVDrwfVWJECUrr7q5IeQvVvHT09hUFD
         o4fx6CG2//wR1HIBpUxcSiaoTiQeq1DPqFKdWFDeZoaARbYuxBCUzvsZUC4k8YJQJs0J
         S212Bbq50cEbImvz8EF9iJBUmqujOSK4C1jsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388177; x=1745992977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=erJgww7gWo5xSkRhdKcjdlbd9IyUtDyY5IGohbY0lb0s6e1bU4RaAdiZ37lWTMaThr
         FAfgAiR2ZP7zdDm3hBuZFaIHea+r88vLYtGlxXAVF/En+x5W7w4eku7ceDhMIuKO/akL
         +p6Le9x5k3fZJpQRGu+z3dqdsMOSVzhKnhTgwJj9XsTkpZiT9Yye+2wTWDboyqUc9z5H
         FbDCobY3CwRenXXqZ7lr8b7PV5PMCMVTW3dJiomkzHPQXbtRELUROlmTwOJhY4YAW2SN
         zzbQzJY8fkg9rdAPbEoYgipNrkmMPdv2mKGr+RUdyvfVeT5sIsjltWywfr37MBsLZ+RO
         Sgjw==
X-Forwarded-Encrypted: i=1; AJvYcCWRNbMPyaFTAwHu+6kLw+qyAvPHPbOUNhfgMvF/Cne9Bfql3GoaQRZqBRes83SQfKzpEhAIh7o3CtSLMTMCnnZJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzSVh97m06adA1XkMbwGaLMuo/ZBFOJMafVvWGGBdDscJH3HSvU
	qDm/CKFiNUf3BpXo7PEj3FCjt0NE+qx8+XU4vllPxZGJq0sQzQOmGM0VtYwaaXM=
X-Gm-Gg: ASbGncvVTpj0rRZ093Wu7CXJOA4Y1/Q058g3otyV5akhACUtcXnT8fHhFORcuZ7RckB
	eN1ZZvz0oIAdZmevL852vPKyR2Y8fOiYzfsnJnMr+IZuyXiV69fQCLfjLxOpHVm6c7xiqOFBWK9
	I859ILkB0Tmm3terPXyHO+X1ROJeEe/4LSmXm++L97iMZ/DvWiwSv2hGLXbgYaxrSiHg3nzUGUI
	U8MIdnxvQFnWzbKtchSsVxGqQySrRkAMcOcAcQ1DW0VWbar1nERQj+TGiw3v/+pLYL8bz7T2U3R
	MIqSTwOFKKiGtE0D6uO/ZuCK7FhKIJet0FG9CulohD31lJG8ikpb/4OGPhkZFVNz9FTb5aEfvRV
	sB9baZcjD8VjllMs=
X-Google-Smtp-Source: AGHT+IHHI/Ae0cN5rkqgDoL4MALbmLyqGqjR8G5Zysx6M9ySgMiQIXVA9Mcxb72+usZBPZS4gYqX6g==
X-Received: by 2002:a17:906:ef05:b0:aca:db46:8170 with SMTP id a640c23a62f3a-acb74e79d11mr1536173466b.60.1745388177443;
        Tue, 22 Apr 2025 23:02:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:02:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Wed, 23 Apr 2025 08:02:18 +0200
Message-ID: <20250423060241.95521-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230259_084541_DB2495B0 
X-CRM114-Status: GOOD (  11.57  )
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

(no changes since v6)

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


