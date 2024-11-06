Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F92D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=; b=DZYCMoWvBkvwiMnfGF9itWWeLy
	gvWT5FQHMcJLqr8UeL5zx2/LmnKFT7ebQbN2tc0Yd24Xh01brJwHrHC0MYk24/k2Cpi60wN1WPE6v
	XMrARpHo4ff9AGESA7X2kqWTVZxstYa+N+sbUXBJotq8F717JDlUS8EG6C/LuMul7kFMBDfjiVUmS
	K28qDnrPGhGbZWvjanm345Dvq63m8hGYsrGb4NAAAF7NRtY3e3j5ugZzPW4ZQAMbNFe5hj9Yn+G4r
	CYsm5U7/9hzdvj++RpDcHXcuutkcchI877/tu/z4vQ953ogXfr4Y23UiilXD5df3rkHnQQ3wFHncE
	M6Dmy+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cXJ-00000002aZb-1Qen;
	Wed, 06 Nov 2024 09:41:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bzY-00000002PJb-1867
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:06:21 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso854695366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883978; x=1731488778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=mM60W6xslKb9fdPxe43MsgIUk69QgkjcqbyhpsNgwv8UvGY0v8NYvDmjsktu9aEoFw
         uWRmtfHcej9i2QNzB6EnzlUmFO0ZvcyOfZIjcNKciyn9I3DCFZbris/vu4vl+3XmI54y
         3wmYu0onif931pONUvlVaAoQuhEZ7mmGYWyBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883978; x=1731488778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=TDlKk4ex9cCM+OWAxoomHNavE2NwuhLgOdCF9M0aPVcS3Fg3yfCnPn5HgpGCc/MiRG
         EVxbQLffRm/3MyiKrbRqVF6H4ZuGe94B/97yIjrtg1ys1HTsLpMvxFw6I+StxnkRuFbW
         VoX2kW3yHGor8ZAip0THMMEKKo/jdwctcASIt7V6AG8slT8iEbI0HhOv1EYSKGPg+3wb
         r2/Rb0Bj5U4HYJusnBx2u9QgBP/jTqwajfNrrcU8CDgGplzh051a5a32tc/+MZ9jLnmo
         0D1zN9pAKFdwOSCGe3QO664VeuKnral8Pf3OdvbjKLRvsq16SLQPULdINfy67AvNhNGM
         0Ueg==
X-Forwarded-Encrypted: i=1; AJvYcCV7o7C9P935tdnJhp6Lh8UQYLcld/D51Rg90ppDPNin5FAAhqiDnG54tKgoPDTotqUebrEwQAO4fjAm98lYC1Pl@lists.infradead.org
X-Gm-Message-State: AOJu0YxygthpvgOE+1LuuTOS2hi2U2lVINSmP2V2jNHHz4vRaS51XzhE
	JK6IBH1viiNa/HuNyIOUlZWfyLah/8YfD2pYHSTvskFHNvxdwtTl0noc3NIj1Io=
X-Google-Smtp-Source: AGHT+IGhUhFhDLrkRIYlsMo40Cw3IMcOnJmroZfmc07tt3QFWoaWVS9zSxCeYKz7sxTPazJhdIC8uA==
X-Received: by 2002:a17:907:9724:b0:a99:ec3c:15cd with SMTP id a640c23a62f3a-a9de632bf49mr3313553366b.54.1730883978186;
        Wed, 06 Nov 2024 01:06:18 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/8] clk: imx8mp: don't lose the anatop device node
Date: Wed,  6 Nov 2024 09:58:03 +0100
Message-ID: <20241106090549.3684963-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010620_370627_E307A91C 
X-CRM114-Status: GOOD (  15.37  )
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

Setting the "clk" (clock-controller@30380000) device node caused the
reference to the "anatop" (clock-controller@30360000) device node to be
lost. This patch, similar to what was already done for the base address,
now distinguishes between the "anatop" device node and the "clk" device
node. This change is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..b2778958a572 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -408,13 +408,13 @@ static struct clk_hw_onecell_data *clk_hw_data;
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
+	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
 	int err;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
-	anatop_base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
+	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
+	anatop_base = devm_of_iomap(dev, anatop_np, 0, NULL);
+	of_node_put(anatop_np);
 	if (WARN_ON(IS_ERR(anatop_base)))
 		return PTR_ERR(anatop_base);
 
-- 
2.43.0


