Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A79C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ZIjmuEHE9Rlk5riwplSnnGgEFCzgmjA3IFA8anx86U=; b=ddZiJ4zkRTLlIA6X3X1yEYsOI9
	jHgChhHd7Pr/uD8ivs6nBsXqvIgAN6UX5z7M38D3JhKQjsYTuvKVn+FQoSWkcMk7eaYi/pTHOXJzK
	xSPEuV6szaQ86n0cNEYlI9FoNJsJyuvN54h7LdfcGseSzPLlecU4YxoB61hdZqY7bnhzWRPsYIvTv
	Wi9oRSRCU/A/87wOnApTGoXLuoQdp5zXGF17jqDHT4HF/yaP+tnNSdADtWQFUYnqZvrdV/qeOI6m/
	fDu7zsVRDAsVaKialfDIxFT0pYn3taDt/gWhT4xm/9VE+rp1qMS5WbZadD1iiGQao/T3olNIFPnSX
	F3dlrD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrra-00000000vls-2sWD;
	Tue, 25 Aug 2026 14:10:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrrY-00000000vlP-0wrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:10:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ceaf8a1265so54468615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787667051; x=1788271851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZIjmuEHE9Rlk5riwplSnnGgEFCzgmjA3IFA8anx86U=;
        b=p0P1nccyO1Tx7kNXJn7iXy+tD4I0hIcnoQut/qLFiqtDVqjSSwdxxMID5q9UkWDXRj
         1H0HEAKcoQHqIS2uyGFeme8qHt6fRn3snU6c9NcpfF89r+5FlskqoWkog+cjyRf0UulP
         U/47wqimazRQlWldWplrxqE6tHLrylo/Z9ZyCM/XjY8Y/Fi9YzAuSL1t5oZ8l2clmerE
         J9vyCVSIBm4ZYvGBoZy3x00Jjdaa6bORROd7SMLxGKDOTKEWtvcvpUPeOx+0H+jFRtXc
         sf9OSDF7DZibLRSoufVz000anEiUKXwN6X/MNOzJAq1kmDVk0yS7eLcRNboNt/SMJiki
         Xzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667051; x=1788271851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZIjmuEHE9Rlk5riwplSnnGgEFCzgmjA3IFA8anx86U=;
        b=syPp635jMfNMf91XkLNVUSL83SddTSd+DDtiGaiMQ3j+00NTKlihbN5MLrF+OSO58U
         n6iYUIvqibCxgckyKJpd9HOTuczDfJ5W6vkRFgTcq/10F+yHlBbi3kMLvQzKDkzipRQI
         0SYO0DyW44hanSLLHrwxMcBTzNsAvwoc+3NkXknPWfZ12Y6iVcxNn1MWOTLH9JCx8eDF
         1nX2dJpZkkxvdJ3DY2CtYx5VE4kerrXbIOR0V6st76mk8L70cF/SJ6G4IvPMsPP+e45d
         IFaGTw/kIcU+I+VDwNNjlZPnYR869F2lifsF/C+VRDzlAnG7LN9Vx6Q7EGdXNhil7ULQ
         u6Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqoYAJqm+j5+TlbylgTTH/p+YQS0HZS7tEPTocspcsqEZQ0bkW8YCmNL1FMdns7Wj5PZKbskZVTdGA4WvuDeFZJ@lists.infradead.org
X-Gm-Message-State: AFuF++k9ucGZE3qTw6kpet78Ywv7uh3xxKldrNKf5PG0s8l2Rcbg8Uw0
	cQAGcsQm8tbRmjO9WEaRjfk0szRYU6JfP6Q3HP6tgSr14ocI7yjqaCqy
X-Gm-Gg: AR+sD10YZtFFCeZ0AtPmJc+tI3JSFJeZuBbRO8qLF7SMa/YBaXS1ib1ZnjIz6CWWE7m
	LI/qHEG8yuuxXRMYi8sxyropPtJyi0PNS+zX5cmgzzOHrr/fzTaDQr2irzcL+OE7ef5+pE74HX4
	o1izbFpIuaKo5l1lTj1L86x3pfPg0Km1tCdSZDY5wx55xbSy1AcvsBI92K8L40DHWJJXN0LmTLy
	LjyaEOrlz2gRxMemKrw0vWd1qwXJlDExeIczb+b6yesnF8Jfx5Y/DR1N4RRUzruX1QLNr8DNEVV
	cGKvgMZPtG21/UkA6o9fBG4qD99Odot8XmfnrUU/Pj8dqAX/rbWlP7cpYKj1CSk/w6CFxSpzcEQ
	7tkz8YjTEi8p4AzVTItnpF+SUtYsVSdQPPc/IMZuUdQbzvlGcOkOpxQQXYVaNlKpTP1TkV4mbSm
	j4H5Y0JfWijN0dDAbA0ll5HTrU+neMxjK/0u57eVvf/Jp7fQU0gF23/lsI53BudN3e16hRktkAk
	WBe6w69+iYW0WY=
X-Received: by 2002:a17:90b:5844:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-395c35e1199mr72431253a91.10.1787667050000;
        Tue, 25 Aug 2026 07:10:50 -0700 (PDT)
Received: from DESKTOP-E2NGI2F ([103.155.185.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm34020361eec.4.2026.08.25.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:10:49 -0700 (PDT)
From: Sushanto <seditorofficial@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sushanto <seditorofficial@gmail.com>
Subject: [PATCH] ASoC: sun4i-codec: Fix OF node reference leaks for analog controls
Date: Tue, 25 Aug 2026 20:10:35 +0600
Message-ID: <20260825141035.784-1-seditorofficial@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_071052_291946_DCB5DCD5 
X-CRM114-Status: GOOD (  15.12  )
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

The device node obtained from of_parse_phandle() for
"allwinner,codec-analog-controls" in sun8i_a23_codec_create_card(),
sun8i_h3_codec_create_card(), and sun8i_v3s_codec_create_card()
has its reference count incremented by of_parse_phandle().

However, the driver fails to drop this reference count when
sun4i_codec_create_link() fails, when snd_soc_register_card() fails
in sun4i_codec_probe(), or when the driver is removed in
sun4i_codec_remove().

Fix this by adding the missing of_node_put(aux_dev.dlc.of_node) calls
in these error paths and in sun4i_codec_remove().

Fixes: 08289086b0ab ("ASoC: sun4i-codec: Add support for A23 codec")
Signed-off-by: Sushanto <seditorofficial@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 835dc3404..b10c2beac 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1429,8 +1429,11 @@ static struct snd_soc_card *sun8i_a23_codec_create_card(struct device *dev)
 	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
-	if (!card->dai_link)
+	if (!card->dai_link) {
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		return ERR_PTR(-ENOMEM);
+	}
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
@@ -1468,8 +1471,11 @@ static struct snd_soc_card *sun8i_h3_codec_create_card(struct device *dev)
 	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
-	if (!card->dai_link)
+	if (!card->dai_link) {
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		return ERR_PTR(-ENOMEM);
+	}
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
@@ -1507,8 +1513,11 @@ static struct snd_soc_card *sun8i_v3s_codec_create_card(struct device *dev)
 	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
-	if (!card->dai_link)
+	if (!card->dai_link) {
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		return ERR_PTR(-ENOMEM);
+	}
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
@@ -1808,6 +1817,8 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
+		of_node_put(aux_dev.dlc.of_node);
+		aux_dev.dlc.of_node = NULL;
 		goto err_assert_reset;
 	}
 
@@ -1830,6 +1841,8 @@ static int sun4i_codec_remove(struct platform_device *pdev)
 	if (scodec->rst)
 		reset_control_assert(scodec->rst);
 	clk_disable_unprepare(scodec->clk_apb);
+	of_node_put(aux_dev.dlc.of_node);
+	aux_dev.dlc.of_node = NULL;
 
 	return 0;
 }
-- 
2.55.0.windows.4


