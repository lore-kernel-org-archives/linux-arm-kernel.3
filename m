Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8516FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=; b=xFas2R80O9/LkFAixTbDrmLvr7
	1cpKiZAxBxob47XwYm3I64TnohVIkO9uqyyWiPtZdh4oiuL0CbUVT9ITBzYHR3V5zd6Bhcl/kNpSD
	jTEi2GYWXobp9OYeY1+nfMJOAK6F9bTVeXgpWO4zVCAJStgG93ouPMg8DqONC3DTg5GszMUwkxyOB
	feA+iWQRckqat+i7tI63B9WTm29KsnWROWDvciCgY5u4EcC8rOxIHTmtxY1wSxm7iG5kB4o/FCWtQ
	zkX5XvVrY1Uzde88briJumTopiLW87BHPzGUBEnPSQ20HIesb6Kky+Vj1ZBv8OyHoXCZO2UNYol29
	Djbhpt+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLr-0000000ENvr-0IBB;
	Wed, 15 Jul 2026 09:56:27 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLo-0000000ENto-2qRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:56:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3790176a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109384; x=1784714184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=;
        b=S7nh8feIygMhTLeWxMObhH8f4FisRDW7zV9rYG1zgdqV6q618ADLZjC4p8NOtHpQjb
         O+KDwefDS4HcAwV5AUMxDns7N1IkTS8StgdUHJmxifX7+De0ColfaHxvilW3Whny0qLa
         fc7BVlBFt0DaTBVzdsovjfQ63s70K5f9wekeXLCJvqDq4IGDmu/TWlg3D4Xc1Js1xQNY
         jg6c2+wmiD9Rd23+cyqLST2GToEyIPHM9BfKR4mjl8vlZGVYoY3cb7gODDHHcTchWu68
         e4NdLLSWU2kdTS5rOvQWA8G1LhVTnnr8DvfOeSTvzJ4xsy9CUtE2XeQZ5er1qt8ZPxbx
         7WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109384; x=1784714184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=;
        b=Synv4QmfJ0wXcZV8pmv/2hOwFD82WCIoZr/5DR0+KJYoQgczDbnKdARgFr81LK0ESK
         WEzVJBe7cKvWeKN+KAoz9AHB1R4/G3NaCO9KFcTXKL7YKJBGrk+/6Ne6DMO6CWy4QXPw
         TIdtKfe5JOgX4PpjF47cONVee2UnHWUUipwWlYWmlUFZCzr15s4zwYS8mdifzL295b0u
         8i5TeSHzVTBsLFwja97NkA/iCj/NGQ1u+DkqA2p+4h7AqAXq7PPP4Jy3RCHKbkVRXx6+
         tu/BOp4qtrMq3FejdwGBH/3AZNSzUmwoGGHT27N7QGOuNwG4iifSwsO4mIpbJhBtdDvk
         eExw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr3fWa+U75MIcEl07RkS1+Kovpsd/WMjij+WRgUANeuKEIE1JFe+AfmeKeq/Fp1WNhQK4/Dm6bqlHxKI3x3vtI@lists.infradead.org
X-Gm-Message-State: AOJu0Yye8M+ESUUY5xYZyn2ZSOY+YIhvWJWI+FdJWd4Eg3jRdxGBB9Ps
	pwD6soSM+kxoZ7/dx4ZFFKq0aIfNxOIpNXXPzzaldE+0oBjc2fOx4nn1
X-Gm-Gg: AfdE7cm21Xe798WP7J1OVB2h2UNOmDeZJ1iixMPxN9gq3V7xzYR/9CSG/VM8boILpFP
	3rVE1wjNx9inpP4HUG1D73zuaX12znrV5dvW1Jyrlim23rvG7sr24rZ52Ln1ac+4vLySOHp9rnJ
	MPRRVbqf2u5hpG/IClGnFEr3qDbeqlpDi+kqIpmQncjEVIY8P8grEwHJS7J0rkXuPWF0+zaUPJg
	ylx69xrz/it3WydOxluwwMQivst8r4cFKoY7ty0PxDVDyK5TyimL6KUUegBWlCfqnuqNkRIapby
	8MFjg9kfpmIgoB+d6bxWBrnL9nCL1k0L8E/HXT+jeOX3R4j/QRZ1UEQ4eAs8PcpF8bICjL60dZp
	Nx017YopgpEpp6150kw2VirZLjUQcYZCsKayWX7OTckuXnUtShRiIydA9kKwlyczD82zdY55ikv
	93zZlHOKw1Crn5oifE0rH4TdFU0ItAZVE93Xt0/E17zrfPIVM=
X-Received: by 2002:a05:6a20:2584:b0:3c3:2e2b:29ef with SMTP id adf61e73a8af0-3c3575df9dfmr6494504637.51.1784109383732;
        Wed, 15 Jul 2026 02:56:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:23 -0700 (PDT)
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
Subject: [PATCH 6/6] ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
Date: Wed, 15 Jul 2026 16:55:25 +0700
Message-ID: <20260715095525.40668-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025624_720739_6E0BED6C 
X-CRM114-Status: GOOD (  11.59  )
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

Drop the redundant error message after devm_platform_ioremap_resource(),
which already reports failures, and use dev_err_probe() for regmap
initialization errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun8i-codec-analog.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 2024e2b2553e..3335855c6311 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -822,16 +822,13 @@ static int sun8i_codec_analog_probe(struct platform_device *pdev)
 	void __iomem *base;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	regmap = sun8i_adda_pr_regmap_init(&pdev->dev, base);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to create regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Failed to create regmap\n");
 
 	return devm_snd_soc_register_component(&pdev->dev,
 					       &sun8i_codec_analog_cmpnt_drv,
-- 
2.43.0


