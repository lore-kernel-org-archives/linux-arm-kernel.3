Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01120C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=; b=uWPVBGY1EIlPIocOA+3Lelpxg1
	+KPuUNHFpavCsSRaL16NXYGPX4erHmOCmxn9v5cdW/9x3WMNFLWPkj9/FQqvF0YZ5dYlIN4PxqwkJ
	w/F2lfMIePf2efpQ5PSFgZ6IQRZpu4MJN/KmEB0ndlSXmXCtK6F25ucv+l2PLiFgvV4l4BvmRuvVD
	khQ+8tSLARo/EEGCUDxF5ViCuZZYol/ls4eI3vswMDY05kE6fXQGTJciiux62ije9xKOCIaj04aN8
	NyNFwpYjkVCdAxkARHWyuIsHHb7LQSNMmoewP9CYxsY4vBOSN1+2YnvykfrsmK6QQgLzCdm78t/i9
	gkdTJwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpl-00000005MvA-3wCz;
	Sun, 19 Jul 2026 21:14:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpb-00000005MpQ-1Prx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:13:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11178615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495629; x=1785100429; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=LQjs9fsLHRGPD77L62+7iYF3U1s5SerewcrE+1CgGK2z2X/3QQqJwY4fWBC94QEhZl
         oIYcYE9098q1TM8f0eDfIblKCbyVj+zDSjKyIumMDmFOwyJkpAUOkEFgSSMUuer3c/3S
         N9WLjX1idisMLGceZCQC33ssSUqbTO3EvaHeQPxOfxaL6oAEKBDVOEhm2RrwJuDfBjGl
         k0a6UWIKTnLxVfGNB5hiNyF2l7XSb9G5Vx4FkKjyuKBp2HURgwCnTSefRDBTa4f/UVAI
         eM/mSxtsb5Wo2Z84p6Y5kKONYXjM841COvqSkXCEPF85eLFVXy3lTEsAE+rwfaEGC2LS
         mJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495629; x=1785100429;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=o0BPjMeL6Bk/QrDKjzxL5WueLlcCBYDZOIPM4k8/4rZP4zVrYaUxGq75y7bi7ygh9b
         /6CYoIsW2nJjklpUXlJMm1Zr0luSffi/NIvPBHzSofY/DhvRrFc2xRwNEZ36204pHJah
         8cej+L2/HnIerWK75aeCTyDKzmH5VAjYJkqtscyp1OfqyfD741XcLw9c+VRDYzxoBJvm
         MxiQI73g1PNYjXsH4fPc0nMrJx1PjzcT9YdzIMU0mYOv3NJou6Cu02KQbAibAywZMjup
         2owdalUiVXFKe+7K6D+UTlWRukRkrfuc1vQ1P7U/bckNdRdMwocn/gAvwNLZvnrWe5vk
         T5UQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFjlVxDYN5M78JkwtzyBDi4BbEukFkwXwt/dBf8Zt9Cshi+X2oFW7pupVVFfcrpl9/6B/UW5w9RLhtojZnEKE+@lists.infradead.org
X-Gm-Message-State: AOJu0YxABrpXaABb9A+dqFgy3qYKkKhOBhNgs2rQE9L+/jZKySARTyqK
	AJ6PS545uC2Cutug7RHDWJIJO/ctvfgueRbcF+psUfQZl3dakWOSHqKd
X-Gm-Gg: AfdE7cmMJKTiQkaCjNPwmmuumiDkfZNVvwt5BqVdUtZEFFrL4NCPt9ie1JQC+3xGFn0
	qkg9GnwIFr3uGrjHbOVduSFAs/LpWw8m0Zt1ip8eOwxU/SOhy1wvlI1Y2evS8Vwz+tyZob+KFWw
	RGkUqB3hdLMASUwHU/mBW4tcuT8t95gx81MbtD1R3OPcV1JEuKBIIPD2FJNXhXP4RHY5/7c3R7t
	PVRGy3oWYxIClReAdcZeOec84bKkiZZalI/LNFNG1VLSV0volhZuwcOsFwjQJOJHaDQUV9LpGEO
	DClI6SaPGdJlLZIt/PfgY28+HokfPu7picMK1zH3P4JpN4cPfQ2qg+DUmmzGBt8zOwdqDNFI2Ki
	u56oQpWaO++rmEHAAWsAt11rWRbZsvqU519U7yj1Sxp1TPrDGDYSoxfSQXCLCpqBy/PEgMCw71P
	dBgjU//2PcxUPDC4CIHCM8yz9G0z750yLGtGtX
X-Received: by 2002:a05:600c:4703:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4954e893f8cmr104567935e9.15.1784495629064;
        Sun, 19 Jul 2026 14:13:49 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:48 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 3/4] clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
Date: Sun, 19 Jul 2026 23:13:18 +0200
Message-ID: <20260719211319.982285-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_141351_395119_9B26444F 
X-CRM114-Status: GOOD (  15.09  )
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

Register the existing sunxi-ng mux notifier on pll-gpu so the GPU mod
clock is parked on the fixed pll-periph0-600M output while the PLL is
being reprogrammed, and switched back once it has locked, following the
cpux precedent of other sunxi SoCs.  The mux switch is glitch-free per
the T527 manual (GPU_CLK_REG, "The clock selection supports glitch-free
switch").

Nothing retunes pll-gpu at runtime today (the mux does not propagate
rate requests and all standard OPPs resolve to pll-periph0 outputs),
but the higher speed-bin operating points (648-792 MHz) will need
pll-gpu as a live parent, and any direct clk_set_rate() on the PLL is
now safe.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 979e53e63..4341eb66c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -1667,6 +1667,17 @@ static const u32 pll_regs[] = {
 	SUN55I_A523_PLL_NPU_REG,
 };
 
+/*
+ * Park the GPU on the fixed pll-periph0-600M output while pll-gpu
+ * changes rate; the mux switch is glitch-free (T527 manual, GPU_CLK_REG).
+ */
+static struct ccu_mux_nb sun55i_a523_gpu_nb = {
+	.common		= &gpu_clk.common,
+	.cm		= &gpu_clk.mux,
+	.delay_us	= 1,
+	.bypass_index	= 1, /* pll-periph0-600M */
+};
+
 static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1698,6 +1709,10 @@ static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Reparent the GPU during pll-gpu rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun55i_a523_gpu_nb);
+
 	return 0;
 }
 
-- 
2.47.3


