Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F85C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGaNvrdWrI81wJxxoSDN2zk2fUww4x2xHVeZ5hAGgN8=; b=pfnNLQ30R+lOhYgaCSsdQRxoHU
	cclyyLSWgsMsa8eRcSRhuZDMCpKi+RGBDhIXD+is8w7tcsjv8Nz4uXADwoWVpXQw/ui31YdC5+h9+
	Cud3WXBmGKKSk6qzktnOLJCiKAuMe1jDLVt7gn+VENGa99EIs84oSe2xFR06KagxVdmkwRyZJnAdM
	9kSj7X58HDXLQipWhki6g5hw7IwzLs7tn4hZyorE3LVP3GL4A7hiAsQ+LiImeXeEElDn4cB0Jyq7j
	OyZbWCsWAZP3nxCh26vpkelEbokdqgJnivLrDG1Y4SP0lffNsh9Q2v3OXdIGzkOlJD4Q8zaO9bciV
	01nj7/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlics-000000067QT-1ehk;
	Mon, 20 Jul 2026 07:41:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicm-000000067Ns-2vbF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so9327103a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533276; x=1785138076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGaNvrdWrI81wJxxoSDN2zk2fUww4x2xHVeZ5hAGgN8=;
        b=e2ujODdieT6hemNqZjPx6LiTWHhOYTE1orcB0rv7kOpEeSNbuOwu7EYJNnYEWX0Ts/
         dn/bSLhPCz32dBmHtjeQkT7ezEUQiPcCoFQaT6Zgpb0o4SPO3DQ4Ky04CgXYXwlyJVH5
         hD+RE8vKmDvlThPi8r4c0WFgTha3i7R52n66w+sLpuWRoErCm9tG1bMmmlzyEmcm0F6u
         W8iPL3f7p/Y840GgFagDlW60yiNo23S+CSmUMu1eYYdHWvtOx9AqrmBGJt2su904Lqlr
         tK1KdOgJW8xj8519ygxvKaTOMVT0kQxsmniRTU5kjuxKLf60zCIf3fVVsKN/Irdlov92
         HZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533276; x=1785138076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGaNvrdWrI81wJxxoSDN2zk2fUww4x2xHVeZ5hAGgN8=;
        b=hmuM8vmQlDzLRha0fWn6MYyliLD3ZT5FNsunPlukrsf5zteKD+Le9/N69LXX8cSfNp
         AEEVf2hee8tVu9oOHaR1zxkuBF7CJ6QYXcC1ECYExGY7qKfHhP1M7CnTsbkcQPViL/xP
         tIXjU45GIBQLe/ZymJHFn5yIgpPUlqp94H9i3KEHMQbE/DCpdaX6MtJnDAi7PaHNhR3e
         BD66/WFCP+XNoDJrfpP5DtKAXE4lqs5FaORfIldhrKpwM7+AGFSE/1KQeWhuRUU1UT4W
         WbaxpnoOZyCTVZryvfdOLZci2oTovk7xxFeB2FzAgAZ2MQzR2VASJcS8NFlQCo7NV3B/
         ggaw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw26Fsyd6N6QAnGV8CLZ/f5x9Ab+G6YXGFX2CMc5tzBNHI4yOolO2AsUQtRhZxFtgkZLuR1fx1gRaQZ+2/vU/L@lists.infradead.org
X-Gm-Message-State: AOJu0YzlMd5YcbqCCYIc3xiEMCwjtg7Ph6o4plpUChY994zytp612iPH
	GkyEwZyvIV5aoaogYKYBuCyxWhImvb8kKkpIFtoVtYDX6gxRp3l5w8Wv
X-Gm-Gg: AfdE7clrxDHHPj4BHuLmObqa1MOkKdpkLnoyOs3E8kDH2Ek2ep1lo7IO2xQdbfhI9nl
	pgVeB1BXYJkLDZqSMQHY9HhX+adYuJWokarVE8H/GLlTcSjhfxHSnmT6uRh4OYgfgD5deI+vKxg
	OCDJkNun82kBrM3HMGeNKJr9MpAKoKirAjIPV/FH9absMZmghI3oLKL0f3jzo3v32Jxa1Dd99gT
	xOgWgzVrH/aoY2sdeHJTRpZMpWKntmCRVvxFBbgihY9dTGBHb8+c4+K0iml5r6ceZAd8f2Mr09Y
	Ffogc8DAIPLp1RwJMJlmoPcEnAAiHrq3JH/IIjLrYFeNq/+iO3M0wGL/YO5pc7txfNEFfeWzEqf
	FV751K0NfqN0u1wp9iYZAKKA9AifOpXsXrAcAxmq6KHK294+QqBFF6jkB/KnBD34VosAEToY5x7
	GwUImkgYudzlVka+Km0fdXIn0vzlDdqOub7Hbd
X-Received: by 2002:a17:90b:52c4:b0:381:85c0:1d88 with SMTP id 98e67ed59e1d1-38e4b417454mr14266360a91.9.1784533276029;
        Mon, 20 Jul 2026 00:41:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: stm: stm32_i2s: Drop redundant error messages
Date: Mon, 20 Jul 2026 14:40:41 +0700
Message-ID: <20260720074044.87528-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_004116_740347_74E67196 
X-CRM114-Status: GOOD (  12.16  )
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

Both devm_request_irq() and snd_dmaengine_pcm_register() already log
failures internally. Drop the redundant error messages and return the
original errors directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index ae9e25657f3f..83b51893b37c 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1238,10 +1238,8 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 
 	ret = devm_request_irq(&pdev->dev, irq, stm32_i2s_isr, 0,
 			       dev_name(&pdev->dev), i2s);
-	if (ret) {
-		dev_err(&pdev->dev, "irq request returned %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* Reset */
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
@@ -1295,7 +1293,7 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
+		return ret;
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
 					 i2s->dai_drv, 1);
-- 
2.43.0


