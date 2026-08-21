Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B930FC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=; b=MqEvDGAj1eYpq9y8w7S0YjFZKH
	b3UBGYS03pMxKDIu1JFvpLqYXOTSWtPXNJjn8jl5hDfc+fLT+vHOlYthFagdEY+Ff0gxrxWqaibTt
	CFOlAxlr8CURH7UCheZX1kbRSgPa2K8v58EONVPWL8UJXZzpSZUSm5aXIfnljC26CpEyif+bjykmD
	xn097dKHBqUKzgPhuiyYbgkZ8vnlrbA0z9Q0/K+PsjqCMQPUbwI1P846WLTneA5U4LxK/Oi626CPv
	5TkHX4BLIMmfqj2dqxkTa9xCugaBySlAjj4jum/dAlEDQM2963cc+KyOFgonRHjE3l0/qgvt56OgN
	Ex4kE6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxON1-0000000DJ5Q-1EDz;
	Fri, 21 Aug 2026 12:29:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMq-0000000DIzH-20kP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cacb8416a1so8842935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315343; x=1787920143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=;
        b=HUV/txs3BatjONaCFPVUB0q4OnUvzkfG6w/dAQ/YKgX8IF4Q1YGHVEiDAz1eI7yYfZ
         SJ+prh3Rm2JBnaYeZNaGSwMz8J3Vm5bJo4AWUDQi8loJc+xU35G77zVO+LYec48vmwgy
         6Quq/fp3IYeQpQ/EJLVWvMe78MPR57IhAZtT0HdBF0xG37SVYRGCWwPMCWrexYaN/BhP
         4VCRfGkJhsDyE8p61F5UCydwZZP5EXs6hZTFMrXrIMPPBwHg3D8K1XWsyBVYZiuBTKPx
         6LdmRbRszOcl0/PI4noIsFylclu1MjBCQO15REx1NhVIQ58S1cHZdn0hcxX9w4h6+O/v
         mWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315343; x=1787920143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=;
        b=Q7bvF/PtBO+agwuewsX2KAY/Nq+qbgVsB5WqXIv6I3h8OHNqyUrBPnVrxEOQlVA1iR
         IVa1i3EbQG9whUA/QqnlKY42utm4resPqC+j4xtjZ0zCRpNgud1wUqaDxcKNUE0t7+9I
         pPIvz/PABBU+gUsEHdUkV1CZLD5ZRAiL5eQLxqtXm27APZQAQOXCpkt8sXJJrfPbgbkE
         nm6sgax53wWOpgmXcgCsyS6Fg6TOcbf2E1vykMjpU49GE0K8ts1Q9EQpSUYmOehc8/Jy
         zLoVYbWzCTMLbGT+vtvifVqIU0d0QWusJ+P0RFt8qM7MZYeHTr2SQs9fSBskao4Jwa1X
         sDWA==
X-Forwarded-Encrypted: i=1; AHgh+RpIp4Uo3LZB8eaKKViU06388U21aLYxl/w4uHDnloa+fxnNSAF1nqpDrfchPjZoyIL5NK4x/I3MsPJ1oHxVXL6a@lists.infradead.org
X-Gm-Message-State: AFuF++mVWsgiAqi0IQA3F1LKK/920Pxwj5WlPWV4UHMUu6Gm+3FA4GXp
	NMPlKbM2IZRC4X5MTeWggxnKjXqC3ny5W5ZTRkhfZ7FTJ7eRFW8jvWg/
X-Gm-Gg: AR+sD13hAzOYqEe3t6GIOs6y9VJmlNM8fMEsmgDbrJcoRq7GXdbinlslFmDyJuPQbpj
	QNTtgMz8pwFlEcm6aFlwJzD9MVmP9Pc3BZ2nRaU+rMEDkVeT/a6ZAVcYChlxXlCZOsOwYzXSzv2
	ea2MNzuDVg0T40gvj93UbRgCZW29/yiRNids2ETJZzGsuP9LR1v0Lhg8Dk8JanW7B+NS2c/Sf6H
	lgx0Khhrhczvw+dfB73MnsYoE4lu+zQxGT6DnhophZmiUziBuUjiHKtaG0jGeB27ozShaIm80yO
	SeEg1UWB10somNZ8nJGCGjCAh1a842cqF4ix3PMrwqazG7BG0u9z2/BjJumKZ7u5D+M+7E2qP/j
	/kBAGtfYCdTbTe2WeTDK5nYNoqkLTEgUmro3I9jhqbzf/tNkWntV3QCk4HUDL3qwOa+OmG6H3/0
	oKfHAtkOh5W2EU9MZ0cR5H7iY0cJ/pmBt3Y67ISx105KXssMaE2Hd3pC9Waf55taMa3Vl4L3qES
	iv4sMn2DeXGXfqAqdVMTsKayK5C7KXEiAKt//xGoQlW+F5ymk4tsrdPJlBrvnUojAEaeFTBnX2I
	Cwif
X-Received: by 2002:a17:902:e790:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d64addf4a1mr124433205ad.8.1787315343392;
        Fri, 21 Aug 2026 05:29:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
Date: Fri, 21 Aug 2026 19:28:39 +0700
Message-ID: <20260821122840.41266-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052904_522285_0A221405 
X-CRM114-Status: GOOD (  12.23  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


