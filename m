Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB907C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=; b=oVHC/AmaNWrq+TZ7Mi1uzIIr4L
	3IyKgdtVxtcWdhimAiCnFR0Zc61+LS6qodgCzm4t/0H/k1AbSJLvM509Esf9Qpc7LNtwa6fxtBPUZ
	kIaEbLL0XF+WCA49qBysr2FCMDCVDrgSvhqxehrjoFmO1jiIAvv/7swkSWvQB4CTzkc+i7kMsG6vy
	bhC64By7jDbVtBvDrdd10ynikh9+SicyGcmSC5AtqzVAyB5VhO81jzMjNsOq4DgTauUD2gH+YrzIG
	Y/mVPSDKtEaXvZ8zHjEd3fRIc1sELof3HCk2KqzIhczVgTvlkdwRqwB9UQbO+cSDG6ZSgqN5hAOjT
	XuAA8OCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLg-0000000ENoF-3VTN;
	Wed, 15 Jul 2026 09:56:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLd-0000000ENmE-0Pj2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:56:14 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-848882fdb18so1961702b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109372; x=1784714172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=;
        b=ZNb2mZSH37i4IAgW570yvCgk26zj8jUmngY5RRGTcCDvtkub4gi8g+asqwbMZIldlB
         kvogtY3a9CMVIv+uE/Bb3j4m6oR2sK2wpSqJCCERMGp11iV8FLRUojfijRWwtckJF2mh
         ymBIOsqJzGSPnph3K/W2U71sDAI+q402NrEpucSihFItNBl19yEEt+nkgL6Q1SYRKTrf
         HRIhImi2yXTGNpgRhhlRAuJeMRCSg3QBaD6T4+P4q7rRBLAzud7A0p6EuOkOd3anweyK
         aWQ9TsQz7qyFO4ACd9ib+XLbR098/O2/TxgOL+KkWDq/PkFo9EIF5fhsIJY7NKDQRU4J
         YzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109372; x=1784714172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=;
        b=tKGbG436he9fOa0YAQZHhv275VL8bzbEiwy6mGjZNIjEJ6NbAM5rO/yqpkCE4hEUoe
         VmxnYNhm4OqWmMAmHI7HzgQ6TsLrCOT00p6e+fQI9Il2GSoNrsTrKkso+SOdwq5BCssk
         6WozG/jVsbkzG0icptg7dFTLvc3TZ0exp53gd/iudMEwuMOQJfMcl1SIAkiqt8ATnqCK
         ZjQorH9VCwjDM6pFhWr8a3X0Ejh8aSCkRoPRjTxW3vSNElB3yRW5lRDT5nz51hge4iRm
         zM3XaEaI7QnvnZCGci1CtroXwnf0h8zrPQz1KlOM/T4007HfdTz/B8Dz1UUGDXD+mpfE
         JpMg==
X-Forwarded-Encrypted: i=1; AHgh+RrcWBAtX4UiN0OFtAB8ZBemp7Bq4ullVpu8GV9pvO134retxd6YZrzSwWYWt5rTDYgmh1s0OoxsPcy7RQEcUyrK@lists.infradead.org
X-Gm-Message-State: AOJu0YxwAV21EbTGkMxuIRFiV6zLcD5VOEv/kPvlR3h0NfDhN1iu641p
	30fCnQegywxVzOxxxrAg0qAa6Y4u8jgoTWS0QHS7LFfkHoHXMBDjEWHt
X-Gm-Gg: AfdE7cmTXqGqWI1h7tlOukAtMYtev1HnEl9O6d7pdtoi8MBdanpNPfaROYEwo3+h2mB
	COvI+1xVuRDxeYB/zMtGwtt45feyz6uqlrzLt48BZX1g9MA/wsFN+4/VdqgP0ar0JenGB56tHGy
	wfNLwnTjUR5yA+hfpAjEcNcmcpMM8KqPgYXw3KcnHx0QcC0EqbbEel/mKYmhMrnnHmTY5fzuhoY
	dFtzsXJ1wv1CopW8wN/LCogPMIXxuPymx302DOSQ8tc6YQk0kUwvYiijTU1CAk8soOiCXcUNcoc
	Pw7+r8jybFygRpDCDdQX/P4/xMb7bQheTMZjAbvC59IYOvFfWAogQvc+6z6u9PD97TSVMltg4o0
	Jueiff+MQDAYSpBjNhdyM5jYUivexodrEgq1iViH2V3l33rora15BpIZJ9z9geQNx7jLV+IFEMW
	Ivzdfy1WUIdOSihJxoaKQ4JwqxcmANWJ3yh8BZddRYf6F1HC4=
X-Received: by 2002:a05:6a00:10c9:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84a6733bf25mr1897232b3a.48.1784109372039;
        Wed, 15 Jul 2026 02:56:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/6] ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:23 +0700
Message-ID: <20260715095525.40668-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025613_143758_B0C15C75 
X-CRM114-Status: GOOD (  11.81  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..d979bb00312f 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -684,26 +684,23 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 						&sun4i_spdif_regmap_config);
-	if (IS_ERR(host->regmap)) {
-		dev_err(&pdev->dev, "failed to initialise regmap.\n");
-		return PTR_ERR(host->regmap);
-	}
+	if (IS_ERR(host->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->regmap),
+				     "failed to initialise regmap.\n");
 
 	/* Clocks */
 	host->apb_clk = devm_clk_get(&pdev->dev, "apb");
-	if (IS_ERR(host->apb_clk)) {
-		dev_err(&pdev->dev, "failed to get a apb clock.\n");
-		return PTR_ERR(host->apb_clk);
-	}
+	if (IS_ERR(host->apb_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->apb_clk),
+				     "failed to get a apb clock.\n");
 
 	if (quirks->tx_clk_name)
 		tx_clk_name = quirks->tx_clk_name;
 	host->spdif_clk = devm_clk_get(&pdev->dev, tx_clk_name);
-	if (IS_ERR(host->spdif_clk)) {
-		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
-			tx_clk_name);
-		return PTR_ERR(host->spdif_clk);
-	}
+	if (IS_ERR(host->spdif_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->spdif_clk),
+				     "failed to get the \"%s\" clock.\n",
+				     tx_clk_name);
 
 	host->dma_params_tx.addr = res->start + quirks->reg_dac_txdata;
 	host->dma_params_tx.maxburst = 8;
-- 
2.43.0


