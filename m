Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7AFC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wed7zRTG0fPLK7b8aSvZs5TBxnd4+YK7ALZwX/ab6vo=; b=Y7uzuxhPGV3fKarS67NCKZtgA4
	LrKMjbpFFhhXYOdGSeDrPbHgR2tq/yE2COoP24ApLK1BKwrLcYh6ki+EGRbgr92lF+lTG2fOGhe1B
	eROf60uGv1JA99UvludgzgCfdQPkRvqGPuBizIW+C5YodsSb9LyIBELjcNU80ZB0NTTA1tgoCwd7r
	dfk4SIfNt8M9+v2liyZPci59ZNnCp2blKX7wsTMQDlWEP4b9oxPs1K0W75tYktselOR64lLOUAguh
	JfqASe7Ewiv17Z5DYi0LA8AyX1hnvdQIF7ujiEq1FPH86l1VAtYYxeV8JGSTxfh95DdamG24dI1jr
	CJkp4uWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZ7-00000004xcL-1D4Y;
	Thu, 06 Aug 2026 05:22:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZ3-00000004xWu-2cV9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2203848b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993765; x=1786598565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wed7zRTG0fPLK7b8aSvZs5TBxnd4+YK7ALZwX/ab6vo=;
        b=sPSEwKvsAFZsYx29pfMjeQZVZwUS9L1GBwW34QBT3MhzQvpbGiV6U0OFOaeOOHR9bm
         EK1YPghUgDNMZapTF49saWTR0cELq2btkd6+sOPYvxZsK7kEF7SqRTVs8h7o/wMC80wn
         gRrh5sFhU/1ejNB4xOJHnBnRbtNOAxtJs66Fme/ivvGZcPOAawQz8XGUjjrB2nxgZPSM
         /t0XKPGTHbMbs60zYCJbBomziC3rASfJ3EVUxbk433HH232UulBpIAOYBjr/NrQBMtBX
         rWypQA+gFSmIaI4PrR+QnJM5wxSiVoUW+WM8tdU4UiHgx+P0f8eisOCXrmtFSktw0jtA
         IrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993765; x=1786598565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wed7zRTG0fPLK7b8aSvZs5TBxnd4+YK7ALZwX/ab6vo=;
        b=p69ho4UPkGepGOtLoefYjkcMEgsxRKZ911psGYwgropOtU91wrXOW4tAzWp4tNN+I6
         b8jt7iSkc3GGpAi7A308Yk9SME2s/TuX7ydR/mCTEdD8/rNqtK4uytziGxrLB+OIwuOt
         QbMubKCatSUFftrHZrQpcld4HP3YZWD54zmBu4o3d89gVy8hM21Oa8YwQ16Z85eGgi1T
         2YWuec2sh51U3+uEZVVz/aK/+BE3KKLTbJhxW6XoA/68kpDfHRK7sH+7pBJKOQgcwUxK
         OQQ+s6a806MVhw3JDih2XyRpovtGaM7ecjFIywRG5vWv9UnkZVrs569DljsBiQY7WBsh
         77zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrks16N6ALonFHJOuSs0E1FyGB/zChNVdMfvI7qXspRsObWSnH5Y1YQtUOd/A6sXgrPwI0+JYE/PJsNOi2q3+NU@lists.infradead.org
X-Gm-Message-State: AOJu0YxyMd6jq+TXgdqn8Am01Wz4wIbVlBcOTZBWXufNlK9dSjdTl/7F
	grJLzH9XICOZeTTbH3iLh0iIU+6Hqv/kwNUmXiAYnxXEEUO2yZHsx1PP
X-Gm-Gg: AR+sD11sc91oQqEm+nN2IEZW/NG5ispL8Uz/abX7vS5ctxf7r3Bl+3UjO3++lF2CLL/
	y94xUOOrgdJcDeCThpL/t7hjGRcHU3Nal28ZeEWz5+qvsPyFUiFQs8iOZGS14dRUyugmv5YpNKw
	2/OIf1ogLzGvat1IjMBYLC8b8ZGQn7N55BIzHmXghavzOzJ1URPiDIeQhSZq04bU+WMYgInTFS2
	UdSsHCRG/8zMmFjpSNfcyHEUFKzfeQ/e3fYExZF7mzxRQPt6gG0rCwORZfvG/O3DkNFNJoGacbc
	6Y1QdXYKbSntTAGaq4n4Gni3kbClem2WwV7DOxr4AYv548CddOt5uKMka40uxDHF7ezKoSx0mAF
	EDmmoVQ9OpGXDZkgPLa9CrNr7IQ4PT9Flm2EFTs1yPwRXExfs9fGqTxvDqQt2qjCMWMMHyKmDzT
	weAZUFVz8m44bl8gPd5n6EO7QQdFY6+aj/LSr8g4k72xMuUzs5sFupg9HPUN4kbiY8aGOC9aD1P
	6xjn9A5RQ/zOPUQ2NdEs39j0Oo7ki0ma3Ewy6bMr48uLC5v3eTuj4fcx+Ai1Zjbf//BoofJsUrZ
	24F/VuIJ1DW1M5w=
X-Received: by 2002:a05:6a00:a226:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84f2e13b00emr13190693b3a.36.1785993764917;
        Wed, 05 Aug 2026 22:22:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:44 -0700 (PDT)
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
Subject: [PATCH 08/14] ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:30 +0700
Message-ID: <20260806052136.21034-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222245_697065_AC4EC8D4 
X-CRM114-Status: GOOD (  12.67  )
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
 sound/soc/rockchip/rockchip_max98090.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 075d0990a126..426506a8e18e 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -428,11 +428,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
 	/* Parse card name. */
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Soc parse card name failed %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* register the soc card */
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.43.0


