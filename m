Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07793C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=; b=YJWaSLTHCiqbv/alVMeAG33ydt
	3luAl0DXEBVnQGnG8cyuSBhyweBk9wkB+vDOn/cok5Oof4cMbJvfyF0VBhD1bNX2l9Xk7g4bet0Co
	seTPSptwVWZ2BlqWWGO+NOisQPsD2+7sZm/tpG0jQfl2O4sn6kgz8YD8mQsIl0+Ei4cbKK22fbyg4
	apIMpvDJn1ctdGD5M/pgB1LP7586/LmiiCWL3VBtXvUVBcaQkFnwToaw1cdHlyM1oWDsKS+AkcWvn
	bUoXTXuoDh/+V4X84r8wjBdxNm8K3er5Kgr018EL8lHMKlJGi33XAJxPxLWfH2cFrC94soQ9yhehF
	u//sP4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7q69-0000000D0Ha-0WuT;
	Thu, 24 Apr 2025 06:30:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyI-0000000CyTu-0Wim
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so3647475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475725; x=1746080525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=J/uQCLNrQ5FZk3yDt3b1QnMTL4T601fDPViVRAeZzy6bNjqu8WvMBpXI2dk3ZHa6Z5
         QDo3FH9xw6HFnLYFbDavu+bqhF+bQ6chaJQbvIMxgKQWSYuY33q/E5oilg6xFyJ6VczJ
         aoicFi8FewGkvuWqshMj3POs7HJdEDo9W9M98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475725; x=1746080525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=sf/JLayfcl2I6ojyUQSZpzf8FEKncoxanZTEfzm7VKfRrPJKyWXVBNkbjCu/RxmaBa
         7DKcCQoEGnaJUmICI1ndu7JXvoUrN/rAnRD894FagBBG8+Zamxd1+WkZuf3bKc/9U8vZ
         elkHlUUpgBmtpsMT+SSSN0iM6bX4lCSoUEokayeseijPKPq+LkpaQ4RmHFuHw7kJBnaK
         V9bi+Dx06sNMV7lkHE0hlt6/tlvbnOpGYADDv5b8NjmwrGJJZmcISySmwz+wge5wULjn
         o8bUq+uBfYnXuYBPYnXO+V3O9Q0IpEl7cc1bhPXXBTMNO+QEgcMpn3VOfCHk9GMcOTcO
         vW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvuLW7Weh9UGIPGcWeo5xaUwYtTEaxzsgNQTVnQz7APz70MFrTVT9Q2jnmBXvE/VPZA5Bjlk65frDUj6I9OONT@lists.infradead.org
X-Gm-Message-State: AOJu0Yww8QZJ3iXckBY+mBJEsGPts/ty6Lv6G72oJt0MP+xaAxtRZLi8
	+sGziKw8q/a+FyN3YlJr9gwW7XgRtS0xXeoHLkb2XWuLCE/iWyURsyxRHp5tHNM=
X-Gm-Gg: ASbGncuJ5ZYxmj0V3nh35YQBsRCy7GVINm91nIWS6lVyirO+/N6wjNiUIOAiikKpPQQ
	oAa9bIxjNvckali/tBNF2mocPy1UVGZICqThrahp45lvUZ+zrqdYqRWwu5P7busMVAMj3GJoVFH
	BBtayflWIjhTLrAyUgyXzpOZgB3cPa1QmZvROEAxPM7W9W22GbWcYudc2U5XM+XJF+cGQG2LyF3
	h+1nMJVCL8KErQuzQV4lF6KdBd8Swg80ly4bEaOI7LHdEM3Bs0w+PV+eYaUpdq1AUwh8ba1cCcs
	ZXYaWCWs/fUlEI/42SjsiUrdMlmb4cBCJx4t5GS6ZwJs87Wd5eh/I0OXmnCyuqdfxMXSeEIxQUa
	GUns+wUEAbuPnXSM=
X-Google-Smtp-Source: AGHT+IHA1z+SJ8l5kTHAH1BnVEYBj1dwbuY6iHebOIqghszliSfqMBNBdsQ07ikrO61th2+IoqH7TQ==
X-Received: by 2002:a05:600c:a417:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-4409bd05250mr9684695e9.6.1745475724855;
        Wed, 23 Apr 2025 23:22:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
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
Subject: [PATCH v12 03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu, 24 Apr 2025 08:21:33 +0200
Message-ID: <20250424062154.2999219-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232206_162555_F0577F31 
X-CRM114-Status: GOOD (  11.21  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

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


