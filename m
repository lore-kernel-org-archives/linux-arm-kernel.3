Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD08C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBK+k3DpjSm3fu5kk5NiqqkKTtgyJPYe4ia8RdreH3g=; b=WNMIay0KKmqOosj5U7ytlzZFFC
	XTpydJ/Wwe/7EAnc9SAOEYX6f9hLiy1gc/q6B544aAhAcFSebuIht8+/QtI+S42wZorx1Rw2yu867
	9QNMBMOChvmv8PnusCpiyZeWZtLdXfMV4HO4f0UmGWkcRJGtep9e9haE6VW3kVfohb4U3SZ+3JnkK
	j43ywhUZeQWUo8kUA+1stOy6fz2NAexHHjibOXUyOoPt01hdzHlgaeGPYcmpIwWU81CODRv0OL1Dl
	FfgQvYz6yadayaebqY8dEeZqA5tiidZ9kGvHfTx81FVTcsKRMA8tMA4l4pj2gL7xk8IMv6ejK4KcJ
	dkNoC8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZO-00000004y0b-2FxQ;
	Thu, 06 Aug 2026 05:23:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZL-00000004xws-3EWk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:23:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8486672f03cso2196791b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993783; x=1786598583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBK+k3DpjSm3fu5kk5NiqqkKTtgyJPYe4ia8RdreH3g=;
        b=gOOV0CRI5A6aN95cRllJtZJLwKeZnPMsul80UjHhaxdA912dpjP4b1aR3CHdpTgsUe
         eg1lxUBItHUmF4eXcJOTg0JhjOJGfloGznCFC2PKbUkgvyGvJgaxRyBVn3K3kxYDb7M6
         S1MffKdJCYNh0U9e5Gb9zfA5N+BTBStIFSe6K4Ha5okmYsFoNFidhgGSRf8ZudjA3atH
         zrvEux+daZMjFU6/1vPauSAz+YZDkopLIW68R1cNN84ukpztpHJLf/w17v8THb0RQE2Y
         jcq7nSJFFsm/YRB/KPxR7qhKPECHPay8aDs98biOpW/+o48NOmLCuO+5e2yJt1wBaUkK
         mixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993783; x=1786598583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBK+k3DpjSm3fu5kk5NiqqkKTtgyJPYe4ia8RdreH3g=;
        b=rgoslq1lXHA0YUGQGLwLl7GFUcXFlDEyDdvTacPX+nmxQPQLWPiP3jmrGK46sUz6pZ
         c0cpXxLKSivWSLaplO+d4pEQ9HITpm+EArjHUDwV4pitqfT3J+gPJgpuzDkt0D8uZane
         AdISQVuQsCJk5B9CWh8nIkt7LvZv/vQzloBmy5CB1Id8aWOcDP2csRacAbZVYCj77O4s
         CHXKaDjiJZG5ezdfKu97z+V/nen3/6zy9YnvP5k/uGqNVYbCRQZEJI/6zopSgbXCMLVK
         cSzQwgg+XMkIH8YAD9saXRkYiLbgjXJmREo5SNozM43ZwCSUKvuKaek/fZjQch9t0zE+
         Bv2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Y/tGPAIBdXsACj9lAT4M2aEysmFSd3T8KlxEXkzl4W9beor9/SObTWjxH57nuujKtltcajLeDD65QJWUHZz4@lists.infradead.org
X-Gm-Message-State: AOJu0YyQx3680liMYM8root/O0yM/grZuQWyS06CGuMyY5XgskhBbEBV
	jlHySRDcBn/CRVfSwo8RySxFUst+sleldzHjtr4GNucJSnst1MtpLUhP
X-Gm-Gg: AR+sD10dsoYpayIPUhHgOribLU0g9Eyqf0lMoFrweWI77WEl3BtVH+4cf6sNgUhiyEP
	LIATAWG7m+cHi547eoYp1lnLg5Ui5tKHYrrdUSZWdiJHbZ4pm9uJIqWeHW1kIXK5aSYwVh4nPXk
	e+7rBd00QmgAn39c7+mKE0ROuSQvlmArC+jl5TVy9NQdD49Uk7pujWtgvDHN3zAefdoEYQSF53p
	VfUShv5LdfJaf8w1JflrkPbqRaFEycmBgGfoxqgtYhLrSyz+N6dRcvO5nPyfX5ShkIkQqIEiPii
	AezCluPd21Pa1Us6teRd34MM1JsJDYkIIR/u93Yx6d7nLi6cSY+AemAdfLBH1JPXQjTvQVVDCPN
	XCpR2damJWE9qUGLSFo+UssZ+eY93OXxDs+xBktV2TLaUfY0FkdliYOmzwvvFhM8qsWerCqOgWJ
	CVQqclSEtBGQGrybIkFGoQYop1HsjPAZ1H9e6KI3wDmwfsvrrpU4Lx+58OkAEeJhfCG7WOemw4W
	oBGQY27eBSBTtEs03sdFmngSIQUEv8lKJ9LqqYuFqBd6I7F8kR8sPOOYLKL+JSfMqtF7h5ELAyX
	JFM/dmNHDBs1vX48
X-Received: by 2002:a05:6a00:c81:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-84f2dfc4763mr13549981b3a.11.1785993783204;
        Wed, 05 Aug 2026 22:23:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:23:02 -0700 (PDT)
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
Subject: [PATCH 12/14] ASoC: rockchip: rockchip_sai: Return the original error code
Date: Thu,  6 Aug 2026 12:21:34 +0700
Message-ID: <20260806052136.21034-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222303_818366_2586A205 
X-CRM114-Status: GOOD (  13.56  )
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

Return the original error code directly and drop the redundant error
message since the called function already reports the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 522b4f4f6a7a..1fdec12a0d4e 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1434,8 +1434,7 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, irq, rockchip_sai_isr,
 				       IRQF_SHARED, node->name, sai);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "Failed to request irq %d\n", irq);
+			return ret;
 	} else {
 		dev_dbg(&pdev->dev, "Asked for an IRQ but got %d\n", irq);
 	}
@@ -1458,7 +1457,7 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 
 	ret = rockchip_sai_parse_paths(sai, node);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+		return ret;
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
-- 
2.43.0


