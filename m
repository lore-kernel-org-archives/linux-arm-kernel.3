Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22D7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=; b=MKeajWDz+VJ3Po5wlBeSgAHabz
	Jl7DW/MXBU4b1bGkRZP79dizmMUorQ1nzk5Ol0L2+22D13hluMBXTK3TVj36lWWOSRKpUERvyY6H3
	nldEH0rQH5hjxF4iulBWx7YXB6MdE1f90sTJNUe5oPAP1sNIW0ip/vGY2eEBgeTzIsEFQ/JkT+pMH
	cJ0NGRZHULtKU6sBeOrKJssMT7/DnLS6OA3sXKfM/LfO8z3UVNPYsyplEwYbmp5hqDzoQPblR2mFv
	1j2k/h9WVg8rzrBaipIwq2znzW8yCzlq8UGKiH+S5RFL3a15Zn10QUa98iXyD43i31EyOBKmNWP3o
	yilzimJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPTI-00000008Ymv-1D1n;
	Sun, 22 Dec 2024 17:10:28 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOj-00000008Xoi-0gVf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaec61d0f65so121167266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887143; x=1735491943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=;
        b=i//NpB/XnwrRWKWUgtMXZqj1tZVDKYWuac1XSQObn39V84iwGV2/13GlS/US6ZHmc/
         8RGEfAPlp9Ft/KVYhpsX5coEBDX32OKgMR23Qybq7PDBuBhqGJpcahpPVNDzsSkGfFbN
         W99QyJXGkjTuqzgQtrFcWf0QcLBDfviYfIJiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887143; x=1735491943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=;
        b=E9nrE59sbcRKX3RhkqVZ5jq6DTCAKWc4zx/9RjvY5APuXfLsHscW+OWgl7ePeoDLYG
         U+xlad94hdkVum/2FPoRih/cEzhbF+e9ewUcSS15nW7uKWvhSX6Jdors6kPLdU4eZlJs
         y2rhH/LlNTlxy8rJd8byf2KnZ77Rmvow82+k3eKsTXEdP/ZWo5obTB5ABos+Oq/CP387
         l82GW6HY5y5gPabuM/pnTkOfc2RrK/43sdvMP9Xxarl4D7cQ6fvm9FyyIgdo8Glh+y+G
         d2hXzLiQHS3myvwflmYlrvuFVK7UxPxvwEEcz3/qB8aHGIc90u6NxH4R4tq7pXL72pmw
         oDhA==
X-Forwarded-Encrypted: i=1; AJvYcCU5TjGxZeuYoLFuY4MC9XrL7yN63NMdZuMFsDCaKU4eTtg811rCcB4py4r4sQJUZN9NvKC7Jj671AZ8FCgvqi4Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1QC3xzFkIlg3pu71Q65f3VdH+RF88isW/Eciz6g2SwZ2b49Zp
	8gfYFa2YCCZaUhPCPO6gqpFu79QOs949HaiXB0nkW7zJkPUwLxTF2m1VhqEgZz4=
X-Gm-Gg: ASbGnctLG4W0mUf/OxCk5R1sqAYPyZxWmXXDw2odGApdPJD3VjLZFAO/fcn7Gx0Ot6Y
	gk8zgSXD9cvXoQBXJrjXS6Rte3DwV32KxBh5Mv9WPokGSbkThK/gayOrcmMyBDOHFVSz+VrXqgw
	0tmbD+/M1itLrRY+cO9eH7ixpEeEYqphGw/gscVBtX0bFg7KEdSmUNmszAqss/bNS3v+8tC4nBM
	RFdB1Gbh8sZwNlQ2s+MSwpHpa+duk+e+5otQXqoAxm5Tm1PvO6ikcrFDOiHNFVkZOm5Nt5bfeFq
	RlQ+F4SbsHWbfVUvgz8n2LfwHV/0ZxB3hQZ35Sol9/1RZw==
X-Google-Smtp-Source: AGHT+IGEXEEbDuDzwKi4k+vJkd3SyYQ1mRIpjQ1XjrU9M/ldV4p5zj2O9ZKURS7MYfi9C41Ss0G/Ng==
X-Received: by 2002:a17:907:3688:b0:aa6:aa89:6d5e with SMTP id a640c23a62f3a-aac2ad7f926mr1174889966b.18.1734887143441;
        Sun, 22 Dec 2024 09:05:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:43 -0800 (PST)
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
Subject: [PATCH v6 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Sun, 22 Dec 2024 18:04:18 +0100
Message-ID: <20241222170534.3621453-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090545_235124_229DA5F6 
X-CRM114-Status: GOOD (  11.27  )
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


