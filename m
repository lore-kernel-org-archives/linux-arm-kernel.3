Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E8FE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=; b=h+AujSwx8kafHH44kkjOiu8W9h
	GK66A7fikLB+Swu5Bz0G6jsdv98nQoYQTOPPxsIq8+gbS6RFlnhnUNZ1xWgLfZqzDv6E7lrx5wJEd
	tGx/tmMBRQQmC8P9vi49CRHTVbHj3NsmmVWrB5VOFmdu06P43n7QevAQqi3MfRXix+oDwIkE5/fAr
	cVRCwZalNiMjN5AXcGn37VtNbxkJSZsore2WnDLF8ONua04ysodypbjkI2v1ahVYERn1/1F0Z+RhO
	huIezCc/bmnKm7iCw9JeAgZiuI9UEUwhxHCf3Zlzu15S6z2Td5bl6oURxQ8DfZuLKc+pV6857ld5j
	dcuZ1SqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDgj-00000000f1u-19A2;
	Fri, 27 Dec 2024 16:59:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDeR-00000000eSD-11aB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa69077b93fso1069401266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318645; x=1735923445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=MyblfW0wsCkqffJ7cHahDvFKkKENtcQC0RSVMoZ0IXfCmH8pj7EQRCFoAqLD1YoFcP
         v4XCSnhKbL42FMqzExdFjS087kTH0NTW9svk+w97RNW3cbHhLz5rHI+rKsw+FuQZtHuD
         9+d1DqwWOvi9L/Td1Yz+G90k/aTnT+JCiUwnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318645; x=1735923445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=Ha0UP+d27Q0tQ2tIdLdLp6Zdy96r7kPc/u/jkDj3TJBNVu2tkznHpnYATq5kvwOSoR
         g17gDWIurVGq1Fs9wU03y6yR3w2c8ETsJiRON1DGtlACbrKqODDjWnahCgCmyDVc2f/Y
         3dT/GdtFqXiJ6vw8RwD5XuW47LdIaIrwcc9Ib9OTIoHm0EfdVJC19Xwd7AKTfIdaUuwf
         nrDCjx5HmNVym3Z5Mic9ZqSR7rbKiJxxvNIVjh6obGLYqfgRw/6aE/I6XK/0yEtkkEj1
         gZO73lBDJFBLDXDQYifyMg0dqJ7LMccmseQiM6OMVPCmkn6eTSFgQYekmQmM4yG+N24z
         mQEg==
X-Forwarded-Encrypted: i=1; AJvYcCVkgQX5UGnrevuvsxq1dW3qAUm8X+r0vUwrzdGJksnn+CG6gwkK7N3ZZjLc/4JHK62WsvMXXzHpbmlUUsPdcn9L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw70yZw5qS4Gf5b2rWY1gNaVryLGFcB1EGh2lDj8eCDFreu86FU
	zaKUlZJ8bsVWE4+KG+USr4YLftXVpzGD58HDCWoNQwwpe+gyaCXkK9GaXDwxkQA=
X-Gm-Gg: ASbGncuFu6n5IVu30cb1elNmQoVNEqM01qvn/y/5q00+OM5ZiaLd4MXoiYIAbssdCgq
	7B7cwKdUH/WKpDNL6vjw9KNMbl+J2pzWHM71MFCqx5iQEAFM6SUCevEE8CT6TQQQvLW/9eLFwrW
	qlYrNvovFqXDslfqKqbP/ZO1qEGdAGiE8b4C+M/LxOrRLqBEnn3qDcRF5VT65iWzJUc9RZhatyW
	a58ozG8tXRMFM7aoUQN2zFptaqfoloncKa/rnfOz6bxIFww6Nyi3PV7w6YRM+cDo/bh+Gt3yF+z
	RvTS9IYu3GPyLHWbQF9XKw==
X-Google-Smtp-Source: AGHT+IF2wAZiZXOhSk5ioYTNrzhfdCszg+K/Yp9x5T8NwwqXN7bzl3LV9Ed9BE9UWV7Fx+sow9CFjQ==
X-Received: by 2002:a17:906:c106:b0:aa6:7cae:db98 with SMTP id a640c23a62f3a-aac2d447333mr2312573666b.10.1735318645446;
        Fri, 27 Dec 2024 08:57:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:24 -0800 (PST)
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
Subject: [PATCH v7 01/23] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Fri, 27 Dec 2024 17:56:04 +0100
Message-ID: <20241227165719.3902388-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085727_285211_1B2807D8 
X-CRM114-Status: GOOD (  11.25  )
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


