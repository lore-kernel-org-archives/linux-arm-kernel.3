Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62669C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJadDqh/AXReHASvk+eJve0FUluChS8L4Z4vpvFJSCs=; b=1LyrZ2SAEzaat3SseuP17RWwhj
	vBEbn5teSA1JxIrj3wEvs9PniJlpip/RwImnQeu/nzqL1lFBUElxRbSCmi2JGFu9b4HPdRqA6OdBn
	QkzgYQcpIREJDqDKpWkO4clSdTKljufKkuLQ2yqrrLHeYXLt5TjuQ47hF3VxmHwHrTIP/mnr+VuR2
	drRkpWWX/KmRBkwLT/5rAcbj2ekRW89A+HfGlX3UW+7zw8ldFcshmPatw0jkwbGtf1HS9zaIwSbvg
	G8s4b6aIEom1Yj3N5lSyd9kqWRPQRVwQfo2XltTAI8+xXeA487TLx7V3mJmxuP5yVDzfR5jGhMF/M
	m0fe8FQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZ3-00000004xW0-01Sw;
	Thu, 06 Aug 2026 05:22:45 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYz-00000004xRG-0GVY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8484f229529so1551776b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993760; x=1786598560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJadDqh/AXReHASvk+eJve0FUluChS8L4Z4vpvFJSCs=;
        b=SQ78KBmgrGa5ICusVoSUEDKXTlKS+jkFjDyp91865hPOv8m8t/fOxYFIAytHXtkO3I
         fjmocy+ZXvtTixgk1aS++9R1LYwb4JbIRlu5t/ai1IkXFKhQyIRnQj1YEJhoRyQowiyp
         P34+++fymsddsk62/qtIztC/Oo1jujlFIZRoq1WS+3svTCtRti878//UfUYU2dZVBdMJ
         fc0nUzTORR/1oh/1027/DJiqX66acyXns3dRU7vWCBxnnr+uD6a+CA6dwERVTJwFAMLo
         pP+SvJ39DcOt9FpJoz++YRdHZnTxS3eg3HfzaTswnpGKDAQ40RMP3c1E+TXmPRImYI0h
         6TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993760; x=1786598560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJadDqh/AXReHASvk+eJve0FUluChS8L4Z4vpvFJSCs=;
        b=qUh0GVJueQ+reeNsL6KQE4bAxMU6QrghzqZgx+pf79mOFP747Pvm+xJdEyHPPJdpKW
         3mC+KRlAvDlIqTnEg8WRhq3a5etwtDmqGCCI9YVhQssq7IwXyIxdsA0Ux7Y9qjzB/axZ
         D3npA9w1M8t5flCs4ZE4tIDtPzuyj0rpOzUtQvja0yv0XUnpjGhPcZxrlobezLjMhvpy
         roAAM2sX8/zpBu7wJkb4ICQZCvvKwVPT2iVdtJvzbkzDrI/MxzL561ykpRm/GqO/TeG1
         76nNblwUAL7Os4esdFyBp1clPOa2Dywvz5sTVEXWbsoy/CqR0vHZvDQp8JnQlADpdWbF
         FqBA==
X-Forwarded-Encrypted: i=1; AHgh+RqBlmetGNoQuGf5d+Tlz9/KazaMZHmL30xUTRjxs3A+SYzrF1ZP0BIsCrO6Gd5QJLeDg8zE/3X9ja8fJeMicI6G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9yWA8BDwtQeKVo2MYUZMFKnFVw3ArEGi0qZvx4EF4pQ53jeWM
	NqQjC+YturM9eZhi5ayiNE2KH/tCWyVvoEhGOjABcPaMuHlq7fP94jlZ
X-Gm-Gg: AR+sD13dmG8voqdAe+jeIA3v87E6zN3xf79xedGVCEfMaacNzg9rL9UZmb3B/3N87Rf
	CmCG516k87Jgmuqw92D/VbWvtzRUXecyllwCAGeDxRO+13ZSzyvB85YflsS1lLGMmTdMJqHN1c/
	uiI+efHAiC8WDMkSk3x+hIXJmygnKi1f+1HUkGlKYhLfPtNkXdHBQ0ONtW2Z8uK7hxhZLyjPoPK
	Ho9kAyOnVde3jq097VO38NrpY0v1FfSCTy+g/72sFxt5BH7+2+8PCNGJehCtDIyN2R0f+cw/5VZ
	Od5vHxwQ92y3lGO5MvP+boJ9UixnwX9aG0/wLkXt5p/cxsqyFZeOgNk5RBivu4yfNTLzDgbn7P2
	Se/k1MXM5PlQcmQzNj04jvIUfdzIKr2Mq3nddRDUzkW+MnPLh/XD5PD9VuwPCq1sWaPpkgPjw9m
	BwoDtFua5in2kG/VwG27KoDU3TXCTw1iIfTUSyVB2e4zIv8dUVMCH7+KcX+UyC2Eky4lsHDIM+m
	RTia7pIAGuNmqkxIy106yGR/a/dMabMqYqsWamZ+1ZiOPsW92hSBduusFM0nBGdWqN9yiLPnlQs
	Hiid
X-Received: by 2002:a05:6a00:1250:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84f2e05124dmr12546494b3a.16.1785993760355;
        Wed, 05 Aug 2026 22:22:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/14] ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:29 +0700
Message-ID: <20260806052136.21034-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222241_129133_28E06F49 
X-CRM114-Status: GOOD (  12.80  )
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

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index c9ad769a4072..5ef7f109706d 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1361,17 +1361,12 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_tdm_component,
 					      i2s_tdm->dai, 1);
-
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
+	if (ret)
 		goto err_suspend;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
+	if (ret)
 		goto err_suspend;
-	}
 
 	return 0;
 
-- 
2.43.0


