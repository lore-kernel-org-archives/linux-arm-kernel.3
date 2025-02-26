Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2150C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pnuI6sBYlkwLaLjuQ7fgcpXHpa/8YRA5z4IIzVEteY=; b=bZhTrk5qkoZ8ISY8Yeb1b/rqPU
	VWGW8IG9SVlDyy73o9XeWjcg344VzkpQbdpwfNCD8vqYz25NWs2E4Z9v1uj9LJwWlMqT7Unk55bUW
	P/WZPVKmk7JvuPONJX4ZxjTL+CyGIS4qwVgFXgG9bn/e1Qz1ExZ4WtEhi3fRHNtw+JTYkfeeyOt/+
	BQz5af0FlYJh70v/G9jYxz17GkFPoDknhluVu+vtSZuGxgRDoRvCRbEkpKGDlpgOKWYfrRXt5r4j9
	VreqkDcyUjvZTcBOlylawSjE/1dbk1IlQnfzlN0Jl8AHSeldVbDf/jZagEZSBgctrJKUzj7hgAX4p
	WquDNX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKcz-00000004afF-2DSv;
	Wed, 26 Feb 2025 16:51:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKYU-00000004Zpf-3NTx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:46:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43994ef3872so188465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588401; x=1741193201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pnuI6sBYlkwLaLjuQ7fgcpXHpa/8YRA5z4IIzVEteY=;
        b=g5wB6Jz50Sb8byoeN3IPLWJ8IqAVx4cChrNAI5Visct5sjCAeX+S6Gs4M8I5pPbcDr
         xq5qq1RR1Cs+IcqB+t3eiDhO48ig4fuiQ7N3BqEQAmR8GC4GETev/bxhyMwpk3VJR6OS
         5Vg10gofs+LHqyUUW2YO+OpAq2vsmXmCVGbbyX+6uqVj1axsxc8uafw/XAV+YpLjpWwp
         kJAZqKQowigmNgwGrVpMxGK8XoIFv2ARXQq2cOr0zDHcLdHkI5E6+6wRnP8G8lYsL4EU
         v+X/3s4d7LUBIbKBLWw9/K1QTEcgTqsCOVGfGDEzbIC0hxLEr2WEQ/HqCkj1y6+SpV/q
         JVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588401; x=1741193201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pnuI6sBYlkwLaLjuQ7fgcpXHpa/8YRA5z4IIzVEteY=;
        b=taO09D0YoHkzUBokug9ewQN0IbwpVj+mNJlw8tU3ydErBAS0f6WbeMiJsLjeZOiuG9
         +Et4VJCufFoaShB5ge/kCqqirYjrpyDZIZplxUrOnvRVTsGkYO0V/LdhvNpzuQTWcazY
         mcb+4mOL6dUgDYtjymDqDeHSHR+EeCjqBP9NQHNlACPrpM5WMVmw5xSRCjBNRP8tJWdT
         JxTVUJV4xOhdl7Lzd30MewO1Miv47kP2Ycb/KogKRRdw3u9cGK6yEltNuFD3Q5nadIyB
         XDpbH59R6HxQ+mL4op2dq6RLH7qtpa7omlStKrmlgzJO0X5Z7HugFQoJLkRh93H/ulUR
         0UzA==
X-Forwarded-Encrypted: i=1; AJvYcCVqn+klp34R5f2wldLgLcOf5qn7qr7k+rgRwHhjwnzh0HsIszwuWXLO6Xy5nfrz3Kqq4XkI+4zT516yhOAKkusz@lists.infradead.org
X-Gm-Message-State: AOJu0YwP40b09O+1OPehdz4PYTAFd3YsB53l5C/QQMC82eqfXFkeR3l5
	iH0wAoD0x0TNABj2c35giBVmGQm3ucPy2tXqJhc2FV91Ao+2hUAF
X-Gm-Gg: ASbGncstLl3VAsvcdTDm5TZUDlhBHpo86TOTkAIOUPpjwwiZUTeAki5PKQJzBTRyqes
	hZs4Wm85846F+Jxj3yvkvcXtZGk1QWdnJUFSnXk21AKT5HNNaPtz0D4odEZll+APBR3oA1fESN2
	EHjcTs9rxDVX64IL9/W/TfYI9gKXUwymKyqQs0HdF/TCvn9giIN+8GaBPr3dczLih/lSwVfBM3i
	20+ot66i3h+QZSaGQbkP+PGXsT+qnR7HAmkosS3fvL7Ap6FwIasVVMMK8Eb1Ke9R8rwPpNKvmqb
	LwOJ7jHVboELQpXyF8qZh5vx+EgP9LN1iCGPS99ugEMDVx98D4vo0bpESLebhszN
X-Google-Smtp-Source: AGHT+IExPqM/gnSNIKRczXrwwSNY2JYUNb14I/Jluil+QDW7N2/0KA9eUaCIBmPYlFa5rXUAj1siew==
X-Received: by 2002:a05:600c:a01:b0:439:a88f:852a with SMTP id 5b1f17b1804b1-43ab0f6deb8mr72370865e9.23.1740588401209;
        Wed, 26 Feb 2025 08:46:41 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:40 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
Date: Wed, 26 Feb 2025 11:45:11 -0500
Message-Id: <20250226164513.33822-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084642_846260_9CFFCE7E 
X-CRM114-Status: GOOD (  12.02  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP and OCRAM_A modules from AUDIOMIX are clocked by
AUDIO_AXI_CLK_ROOT, not AUDIO_AHB_CLK_ROOT. Update the clock data
accordingly.

Fixes: 6cd95f7b151c ("clk: imx: imx8mp: Add audiomix block control")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e0618..775f62dddb11 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -180,14 +180,14 @@ static struct clk_imx8mp_audiomix_sel sels[] = {
 	CLK_GATE("asrc", ASRC_IPG),
 	CLK_GATE("pdm", PDM_IPG),
 	CLK_GATE("earc", EARC_IPG),
-	CLK_GATE("ocrama", OCRAMA_IPG),
+	CLK_GATE_PARENT("ocrama", OCRAMA_IPG, "axi"),
 	CLK_GATE("aud2htx", AUD2HTX_IPG),
 	CLK_GATE_PARENT("earc_phy", EARC_PHY, "sai_pll_out_div2"),
 	CLK_GATE("sdma2", SDMA2_ROOT),
 	CLK_GATE("sdma3", SDMA3_ROOT),
 	CLK_GATE("spba2", SPBA2_ROOT),
-	CLK_GATE("dsp", DSP_ROOT),
-	CLK_GATE("dspdbg", DSPDBG_ROOT),
+	CLK_GATE_PARENT("dsp", DSP_ROOT, "axi"),
+	CLK_GATE_PARENT("dspdbg", DSPDBG_ROOT, "axi"),
 	CLK_GATE("edma", EDMA_ROOT),
 	CLK_GATE_PARENT("audpll", AUDPLL_ROOT, "osc_24m"),
 	CLK_GATE("mu2", MU2_ROOT),
-- 
2.34.1


