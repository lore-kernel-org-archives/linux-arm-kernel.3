Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF60C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjOMq1XsUpQov1kpLT0My6RNRrW7igNYjy0AQ6ioFe8=; b=BxmPDqn73VE5f3dqJc9yhKYPb8
	EMew/necurPNzzhkidGd9x+a2DlMC3YcCh5ZKkZalcED/Vx2/LPcX22LgufjKc9fYousVtbB60df0
	tyY7eiQu0TWL9bhM+QfoGfz6SlyAUZ3HV1PFdZgd244fCXVW8ImpLX0F/E7MLoNOTQlEV/mRElGgy
	i3T9yk0o809NPXOuJx7mK86NSuQ6NwWzRIZByi/0IZqA0aCCtECAkX0RbCmRwfqnuTV3LZxZUvii7
	T7Ot9QjLt27TG7qEPUOb21HPqfqFGnm76+NBa77hscSfda3874nPE1+rCIP7LcRuchStSh1mo7nWt
	+Mm+bnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYa-00000004x3u-3uJX;
	Thu, 06 Aug 2026 05:22:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYW-00000004wzq-1cLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1717326b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993732; x=1786598532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjOMq1XsUpQov1kpLT0My6RNRrW7igNYjy0AQ6ioFe8=;
        b=sPrVfCRTAFWcpPsc3w5vw7G+iGoS3tWH1WA0tei6eTj2vIJ5/38wG7KgkYRgsa9BbR
         YRpNZ/aoG9K1PSsucOY/tU16d2oWdTgUTdMBgYUC53Es1kn9y05KBZ7svLYjyiFBrDRs
         vbeUp3Agw261HPQozCNifX7Ub6PPja0LzP0BAN+XotCpmriEhdODzMY3SBufnCBHXPmI
         BmcXNeYRs5Wat7D+uoyH5cmnlHzkXAUUonpfupktAlZgXcGsgQV6sR+AmUf5TrLPRgkL
         z2PeyvzacJMhsqx+uyjPhldC4Md5ZlQ/5Pu8KSrJTurOvfjqTW2odNCkRNyiA023ilbo
         80uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993732; x=1786598532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjOMq1XsUpQov1kpLT0My6RNRrW7igNYjy0AQ6ioFe8=;
        b=LiGOmduQy0XDlGyuMb/vqauBn/RJPyIQrnfmpHIka+arE5sIIx6w9jxc14uNuLj4St
         /jYEHADADyS0h+VOU/JGISMMI/TVEkwiN8AoX98ayN7+YHpnRTyO5HTWiD2dUID7K+4w
         nRX1Ec6EVc9itQedTbloyh/+9OQfTJeItDZpLPWbm5GMOFEPcB7apytyIJj1BByLNjk1
         e/8p5IvUAgivg4gAW6zlqHgmWgdpCAT9uTk9CxnTmcuDWBKbEiV+ko6V+G8/7G179CZ8
         khIFU7pA693q32hs1lUAakXPlun1Kha4+87GnWfiqrpu/3M1K1L4U+X1LE2slFeNkeUo
         yHcQ==
X-Forwarded-Encrypted: i=1; AHgh+RojjIXxoOyvtUgM432NTb9LSSJiFKfJmRnMY9MaLBJxf4Fqh1DuR2v/FpHjcxDutjd7hKurAtn9tMNRFAl8qUJ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz/z5roT2F+hzus3CP8fHHeK+Y3kNz98NatcUdsqCUmN1WHXJz
	X8cL1Y/Wgc8btYgfGkvexNcwctP3hhrBEBM9bhjoexlzqXbDu3U8IqBY
X-Gm-Gg: AR+sD12S36a38qPQTSSguItf6brgS3q7rcZ/+YFrJWxzuOVqou4bg85kEPHKpanP9Xr
	MEPyqU/65rdfKqLcSVrq9mWpl2E7OS2PZjO+NkZhLX0zDo9ojUctR4W8ZxAf92d1WrgyzXGP30Y
	jcW8M+wIvHN1xjc+dp2xrYOWDjOriNX1G89MFvMxp7JEWuSaRbskSfFlCMeMRTv+vGzVQMv7rEE
	fa1F5MwbfZfNEvFa3Nc9FkoeARSAk/XFf/uy4fJMUNOdup22lZNUnNzQSCoeDlv4a2PvajnUK0/
	70uHl2mLYsJQDU4t9Wc413BPyD8d8Lgz/OnX5vXyOzHycCzyudPIXed+EYdGaA9w9y81Z/dmM03
	NreyQDK0LcEfYXwZkh8YgQfkxXzLpH/3ef03mi0M4AjDnwseEX1BLz1wZsuFP0aDeYI5AgG46bc
	IfyFg5ugRWUuGPNAOXnB0F8Q6QLZUwghM3/3b8p2nnzABGDlA5sPQI+wcCqQ1kbaevLXGLkZUEu
	GnHXm4LIpk3pl9K5xyzR29m5SbTr3HErDrodj+RDUxKmBVeHCsiNbh1yFFI/VpMNl+z7f0L/QKD
	Lofm
X-Received: by 2002:a05:6a00:3cce:b0:847:711f:49ab with SMTP id d2e1a72fcca58-84f2e006c85mr11362332b3a.22.1785993731714;
        Wed, 05 Aug 2026 22:22:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:11 -0700 (PDT)
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
Subject: [PATCH 03/14] ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
Date: Thu,  6 Aug 2026 12:21:25 +0700
Message-ID: <20260806052136.21034-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222212_416894_610376C9 
X-CRM114-Status: GOOD (  11.80  )
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 64c90316fa02..3e8d07b3fc1e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -767,16 +767,14 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	/* try to prepare related clocks */
 	i2s->hclk = devm_clk_get_enabled(&pdev->dev, "i2s_hclk");
-	if (IS_ERR(i2s->hclk)) {
-		dev_err(&pdev->dev, "Can't retrieve i2s bus clock\n");
-		return PTR_ERR(i2s->hclk);
-	}
+	if (IS_ERR(i2s->hclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->hclk),
+				     "Can't retrieve i2s bus clock\n");
 
 	i2s->mclk = devm_clk_get(&pdev->dev, "i2s_clk");
-	if (IS_ERR(i2s->mclk)) {
-		dev_err(&pdev->dev, "Can't retrieve i2s master clock\n");
-		return PTR_ERR(i2s->mclk);
-	}
+	if (IS_ERR(i2s->mclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->mclk),
+				     "Can't retrieve i2s master clock\n");
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))
-- 
2.43.0


