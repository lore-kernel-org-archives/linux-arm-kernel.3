Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB3CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=; b=IsxIN3Hw1wqXrHFSK0J5nD04dd
	oac6eXsir9efrkeOCLLiAHuVkzYin+c/Bx4ZH7MJscfbLdxHCuWOuC2LCu59gzPEkcS1DTeYaD8in
	uTRFvOPDrksSeEN1z6z+vuSsTw6DkrkKcPofHL2NRcZoaDG12PIg7KXtULnZCLFD8SnKIL0olHBpB
	QaLdY8eDg4+MX4cAoM/SvwbNWD8nlI2VcfT/+EE99UeDKSCQmdBNHUhd7IiHQVB4cP8Yon2eBB2CE
	u1dSYEtA6jeiJ5s9S0GPiEAhp8tlw2zNa+okAj6I6mVy/AJ+orhGKyHcRJSyAVx+w4EbMw98wqEgY
	H2Fxl5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUF-0000000GHYb-2pbi;
	Mon, 05 Oct 2026 11:04:03 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUA-0000000GHSA-3DhU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso422578b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198238; x=1791803038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=jQYEPVB29PLOg5xkQjCIq8GLz5b71d2cFukg8/ecPMFiepsACN3Dlk4/8+JRTM4BOX
         7EzGnRpQFQQr1uxQJq2Es5kCpGWFmo1IoUIhMwil2rSqPXxeBpezAYRLwOaIOMcWioFD
         uIeHpUTii1vOP71ObJjvsNxvHkIdJObwYNsXA744TPH0iRxJ+iZ1mhPUoUC70O2RTTht
         08byhNS6IkrTZGS4Pm1V0xlXqml8RnmtLJq4SIRF4mN9V1hGeR5aA+gWsVvgJOK11nyd
         Q3VzQ9Ok9RpM0OTqs295WrjSwPRbiOOBUmiS8b0EI2ZKztNPQxzqP/1tLjBu5rv+3O7I
         RhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198238; x=1791803038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=L1Ax/zJpLwKqgyXlrbhW8TW5dNohM3tZTlvPbyCI6WFJ9DfhgiA4RLIxviCB0SUNGu
         n9qlLIH3eQhy3imIc+2A8VvbPgFJYU7wwKJ2h6m90/wbMsdcJOJ2Gck4ALpOYUh/XpKZ
         VLgKFN6J/cE+6YbxIukh6ALtKkDhRHh8qnxquYjI2+Z9stG/27h21WVD5pMmvltJs0WB
         FEg708FV2fZJhQG8vyRBdVFftzvWGMq46UINdHd1PnTU/B5ceBFPHLSILHatFrrDP/HN
         etRsYcgYDuw18HwnJFDkkRSuLUmnW2Zqf7i+sDDZPZfZcW1HH4Z68nvmoDhV/36oTWtc
         4sXw==
X-Forwarded-Encrypted: i=1; AKwUvBzdpoujwWW3aMNPv9hdqFP+EzlHDR2Qm8mmuOTzpnjgCAhvjZoflazBvO3KF70JUE1JxO8tDswCX+xf7T+vyxup@lists.infradead.org
X-Gm-Message-State: AFuF++nAv9FWIuFUjyQvR2vAB8QLTlbswElwVB1qad+rjmi3ZdM9asPT
	9e5Tb1bhP3HGpcbHE5CijnQ5IPO4XBQ55ck/DSVG57tzKVpQ1iXLV1Yi
X-Gm-Gg: AYBFou2mOHrF9B219Z2WRdweVsTpdDcXs0FvQc6NbD60GLW0Znoq61lNvzRIAAuiVbY
	6TO2ZZFXhZcdsuHvyoAP9prWInk6HI+qTJTz5sLETBza7UgtVff3v4U6Q8h5ffVHZce/ljUiyUh
	p0E3gbgxv1JxRpkiIZ9H1gT2J9WSPdeCeo07YNZnCyWZUIua21qP1vJT36/fMv+8ObO964r0VhW
	e+r9SPKrx2ujEk9LwJ9+8SDH+JBqEyEfz8DExsUM6B98Uv87fFjcZEl4dbtP06dyB2pMdUSz0w5
	UShYLvJlswzIAa+vpR83oaHupwrVF5iog09XI/9ot8uLE47HbbWroReglpfb8v2PAWIgV6L7PQz
	o9SwHH+KOXUlNCCZ27qSaTpu9A5daHkfU8MT9kSVL20ErES+pQnGS5NMWdsb0O78C8Ez82DYJcQ
	9B+ZWJplPqSUozuJAtZXJByr8JJfybi/BKSE18WlZLd7pxrsxKiqrUr3XY/hwGnS+6wD/zcNTeG
	omlVrIx3cp/O0kFxeK+kRsU9hN7gbv57k4UGipRReKg8eUfg3YV73dxC31sm7MoikfqpdrLjGyl
	8zdFrLsFCZjrAg==
X-Received: by 2002:a05:6300:2209:b0:3dd:57bf:7248 with SMTP id adf61e73a8af0-3e0d6b554d7mr6668842637.18.1791198237926;
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Mon,  5 Oct 2026 18:02:52 +0700
Message-ID: <20261005110257.50145-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040358_837119_6132A475 
X-CRM114-Status: GOOD (  12.91  )
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

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1bca2f62e76e..4ddf2114a1ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0


