Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116AFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=; b=iU/7FV5pqPvJ1BXMXNQEjrvF/b
	d5u/IL8hSvCe9ze060kRx7oYC+z9CGiK7RdPtZk0vQFwQgsjw8OdWehSpWON7KeLcz2mqnchTRquO
	eCJ1oAic1c559k2dnYCAOZIgaL59gz/jAxYqFYzE993rVfixlBYhmMvk5hLJMKJNAmwMK9AUHwyHv
	lZWlT3f65cdieLkBXoBhwUCmgljS3od07JUliBZJCQLEHmT/MLbYDlBruK9aySt39P63BHccoFOAp
	87F9QPTNCzI26ftleBbaZELyB1j4nrwCJQ7xNET9ku0rBt5zu9Ymsy+sR+r+dB8S7AZEvMbaCMwiE
	ak9QTRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLU-0000000ENiR-046n;
	Wed, 15 Jul 2026 09:56:04 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLR-0000000ENhn-2rOw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:56:03 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1231249a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109361; x=1784714161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=;
        b=j+czZYCZJALoTG6z/gJulRuHaU7FkeZ9EhMHKl+ivdIQTi1h2eGEcPgElsMO+yvwoG
         C0cyALn7tbXyjv+qsiA9vl5A1pXlhfu4e4DqNHgNKlurJl0oSXF8RuVxjITx1xL44J2x
         Aavrmu9x6He5Qy2mgvFz1v+4w9MBmBjZ2/UXGIRQAK52HVJaZT5qVZeubeLo0AIICWO+
         0gqAgFijF/SpHt70/CpsB2YYy7AXvWdfw0/RmdcKkVUQ11OEwLyoqZRCl9CKqwwljimm
         roNN24G2Abo61otigLqsJd88hotq/cj9Y4OGs0uAtHi0bdLfqhzqTl68tjR2gTlTrWxC
         5wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109361; x=1784714161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=;
        b=g+lywzgXL8dL8Xt2LUhEz/C/lTSSsj8C183hUQeLlbRBDr+nDCMFAJ8oVAaA7JJaZz
         RU5c85+yMI4fB8THD3w13bbeXJuDHWYpCh9XdxS53cbp9bI3R1H//4ohOoNmA3bqmPvq
         PUu9cZf85fSrTcb8etdqu39fx90wItFn7dIzF74qn9TGfh+de5iy0pxj6DGJD49Mg/tg
         0x0J3afxre6wqkeapUUjius+gSuwfaivs3MBH+Enqr4eakFxkjVKD3oIEsHEUxlXdy8c
         oEkzChFsoaJx0Y4ZqMlgbtqvggKj8AW3PfsWIF0BMYMO2U/+UJhipRTNHf7gQSyA6Ohc
         /Z3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqIEAuIv/eJWcrqywebR2xbps0Hce0QPnZyNIj2iallc5nbvXe340iHum54qV9UvkTaN7x/lVanFvzVqAacXvL5@lists.infradead.org
X-Gm-Message-State: AOJu0YyKBYVncJtvcbzWmqShY5GrRgDRvg1RQiarebxkobXsmpmKyp9f
	d3joUtHc9IkVwWJD3lz4C6BWndB/m1d1D/OkklK0P8bfmK/jZn+baYc+
X-Gm-Gg: AfdE7cntK5AB3FdJal6oZE2cdLfvX7GaWboazwLljb5uESfI/UcicJ4PGJYkbT0EOqO
	hV37lIxUF9TqTJnRIPmlguujjYgdZoMXErJcscjaPmgLWc5X+1bRdQdNCRq/6ZwdX/jAGRYYars
	6OUXKk/NdxGwijC9gEv6BTpPhkZ0QNRp3FuD8/knmzdApEGsR9RoKVio1DMJnHPgzZtRttJPz2S
	PFE2PwlSe/jY44x+iyylVpv8JT+iEOHEO/M20SN2OfmZCoEIrlMA4m50weAe6BquGOeMd+KYf6m
	P5IhqTpJFnRBaoV2L9VZVP8V6iWXi7AuwkoSxf3bg+r5/pXR2tjmKu91/d45YZTY6wMJhf/TNYO
	izUb7h57GFBhVZcUjEM505AwUQ/VdJHiVfJ93LEyLWvtUqsVCDd8yHgnTn7igcvr1i9MRoKiwQ4
	gi5mpD3YBvZ4T5JH8HnkaFfva2P1Mp0lPIGyff1SQtJIdmyaw=
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr18474760637.51.1784109360730;
        Wed, 15 Jul 2026 02:56:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:00 -0700 (PDT)
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
Subject: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
Date: Wed, 15 Jul 2026 16:55:21 +0700
Message-ID: <20260715095525.40668-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025601_890705_A42D4D21 
X-CRM114-Status: GOOD (  11.48  )
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

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 05308df3ae5b..71f7a1fedd88 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2380,31 +2380,22 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, quirks->codec,
 				     &sun4i_codec_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our codec\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &sun4i_codec_component,
 					      &dummy_cpu_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our DAI\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
+	if (ret)
 		return ret;
-	}
 
 	card = quirks->create_card(&pdev->dev);
-	if (IS_ERR(card)) {
-		ret = PTR_ERR(card);
-		dev_err(&pdev->dev, "Failed to create our card\n");
-		return ret;
-	}
+	if (IS_ERR(card))
+		return PTR_ERR(card);
 
 	snd_soc_card_set_drvdata(card, scodec);
 
-- 
2.43.0


