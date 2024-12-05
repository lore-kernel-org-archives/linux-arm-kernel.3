Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04684E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=; b=l/WpaoVvXBuaY2V95vTL6vPoSl
	AdzPzWGwLES3LnBJ8mc/+V4IpRE+9pbNlawC0cpZvrfvNWfl8ZJo2KoaSRhi9+9bpiOcOQ9STpvnI
	qj0tD2pm/NNJRQKXKn9i17wSsALwWL5t3cflQMQbO0PLXuiXQUivz0R/2d/9eFOI9O88WbXAP1N3m
	6+vrW0rMa+CCkW9WkYUEY3lvd052fQEu47sez2u6eRA7t+jnizanW+I2/S0eCIz+Zz1RReqMmj9C0
	UhSt9mC3EjlTdWBN0McpkDmlY6moQzYKl0gS4Or1KX000NkxL6af5q0NYAqyVVbT9Pf2MHxcChCHo
	g0yClvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9vZ-0000000FhBK-3t5W;
	Thu, 05 Dec 2024 11:21:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9ta-0000000FgaI-15vs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so1138333a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397584; x=1734002384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=;
        b=eZRPAGEhz2f+eV+kjH2ZAilRmIEY7LCx/hC2Draegg5Fe/4zWkVooTNzL2Dh+qboz8
         /eMFLn+vH0h3EQd2D1xlC2W5QDrHOdUjoBHu0wC0AppWRBOp08+zDvF1v+Uy79thMsV0
         fXL28ZKsmAIOolzomQCaATa3acxIBu8SziExA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397584; x=1734002384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=;
        b=TOyQ7V18a08RQwOcPfiwx8eyNnuHnr7LlXsAaDGGPzElGZCtpsMc4lef0Ax7G9CEOI
         YCea0z2Lt/5ci9d2c2BXL2jNtYCg+UCLDYgCtt20J5zSy2EYcLbMNwr8jeWdPyzBjPSD
         RdwHQZVD/8ZA96/d8A6kDamnjacn5DGt/w2p3mY6J8Lp5+m8y9HMGDJZGsw+C5E2SMxT
         We0mHvb5FfqE19MECVf0pC8uILTO025k/xoKA0/9IeIwQumwAsklSOEqDK2doxuMC65s
         1D06LrMF8PiOionNDS+qWxzkq7FWgjns/whKQ/pRYevQK95aPWnh3pEUepPAEFiIC7Vj
         vxBw==
X-Forwarded-Encrypted: i=1; AJvYcCVqar0I3mxKOBuVtKViTwgBX1vL1AlXFenAc7kQRKMOXfex54KZQ4gU3T52F2TIWVg7e099NkrTw64P0Ee98YOR@lists.infradead.org
X-Gm-Message-State: AOJu0YwsHCQLBE+urzbnviYwnEQ+ecKRxDx4123aoyBNhGjbFgv9+pnQ
	6gHFjpfR0Mz+ZsZkwdo0O0jCDlvXNdAGH/Y9LLX7Ly3/iVfIaKJKJ6JP8/9/a1Y=
X-Gm-Gg: ASbGncuEIuAcT7j9CG6s0+r3unOF5UzD3Z/da4ybnG6fXyV+k+XPGJwb+/eoHKVnY2B
	CrZWuVl4tV/f0d3PfbuI+18vSdZxd/jQumtjbkunBVjREd/7F6EW7nEh4RBLwDW2tGJ/nUTiYdL
	OIt8Xg17UaJKK75hPb/g04oClNMFnA+bifyjMNAoFp9h22gqJBa/lBk5RcDF/+8Yj9ezuF3UmWR
	hliSjqvt815MrsEclavFdJriRKs8bswukzvTgson5BS7qW8RD+hrKnglfiki28iWyFdxoiDfr0D
	f1oVNHgT7YDPcycST0NEtfzerJs/FtT5Qp1bnNgslhCevw==
X-Google-Smtp-Source: AGHT+IG4SKCPLnpcJBbWDmV3TfYeNP6K/Uvezlg68+KTlNCXPIUvxOpsGINolLfffKcS2GXC8CUr7Q==
X-Received: by 2002:a17:906:2182:b0:aa6:1c4f:4642 with SMTP id a640c23a62f3a-aa61c4f48a7mr271020466b.53.1733397583627;
        Thu, 05 Dec 2024 03:19:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:43 -0800 (PST)
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
Subject: [PATCH v5 01/20] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu,  5 Dec 2024 12:17:36 +0100
Message-ID: <20241205111939.1796244-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031946_297392_7B8453AA 
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
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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


