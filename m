Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF7C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hWHLReiVEFXDAdvhyF4GcFfDKUrHwAoJwgfx7kXGn4=; b=3lh7ANOrh/eblJR1BkTHXAZnH2
	SH3n3rrYbww4Y58M+0jFAKVpMyQ+lOgnKTC6t3e0TxBH9YW4fl8/8+8ddCBQFMJ8OZJAwtBjd0WNN
	EwnLjYSazhKmzrRBoFsPHxMjgmn6WETpM502T5sBq4jacE9eyKbYPSg4FX2O3PQCXIKmiDih6w7BW
	tkA/T7H4X2F9OgopV7MyhliLOeq5rlMoQK/bqhqxQ+FF0KQVcIPrs22l+hAtLmwUwiTOV1yYkTl4T
	dQ974pQqtupEvXl/BTV7KkyAMxxrWm/Akt3DdG1LAgHIEbM9xAAeClUib11Fj3KdSXvTmUUa4s6fe
	Fj9BjkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZA-00000004xiS-37Ys;
	Thu, 06 Aug 2026 05:22:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZ8-00000004xde-1eIm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:51 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84a652535dcso1204198b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993769; x=1786598569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hWHLReiVEFXDAdvhyF4GcFfDKUrHwAoJwgfx7kXGn4=;
        b=WfPQwDZUEgWXCRfsj5U5Ltis8NkptYrGo8ni3A6Wcxm/elGLYkZBZhD9Dsa0G1n4S4
         m/TfrBGJi8M5Zz6e1eceODlirr+um2AWIvSl9kkNnS5JJPDmpmtmea0W2SZl+v6NoNml
         FacgC3XgnFq8oKzVo5vTIjZYjp4mpqYTIZsttGEtAX1d/UhegCdtmdX3kMMYS0tWoHA9
         FlcqWgJXA4XRbR4+E65JV3+vf8qw6x5e2igbNRsAGcK2nL3w0e1RQDuCdCj5OG8OivTi
         l212YjaSBaYYOzhPLwlf4EGSi289kDy3Ut1TDL1bj1Ru+hvhPYNUP/XeyzMUaG0xgfUH
         zt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993769; x=1786598569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hWHLReiVEFXDAdvhyF4GcFfDKUrHwAoJwgfx7kXGn4=;
        b=Udo8X5qVKUGQEUMJjjYX+3nzRMqyUvOEY7ChaLp/v976NWA8I40tRjKOzlR6x0mxqi
         vCun8pU+XkYgzoQ2bsagyOz83516/ze5MZkbd+MaVKLOrmtIQGBoUNrE+ZeZbCisV9ay
         6lMGRAtws0LBJBg5aXSPleziKNX71zBfwb9kEfyuYDoIdtP+xe2V1hdu5+URKuNuy1Rb
         PGdCiCGrjWfCejUOIXII3w/y56OBG7AQC0XKm5gUXsQCZIMHHQboVsi4+E1Ix+3eZ6aB
         vNwxyp6gwqClHT6HZoD3Kb0d5c5QsP5vjGqwPn74q7etjvODGBk34DGh1qFXfi3qdKJz
         SeoA==
X-Forwarded-Encrypted: i=1; AHgh+RobxYa1TWH1ubsz/vnEOgfEWpablFnJ0FP8VcV8ah2mIA2qbRRz8TR8RGdgndeRN5Dlq3LrEhQeG4BKJOs2rr1q@lists.infradead.org
X-Gm-Message-State: AOJu0YyEYFkfMJ9qA7Y5n6fPM+ZrYkridlpjVDaCKJynCBBP7JTbA8Gr
	/YUKNrQAWpOr38scP4vMY1KBMV5R3lS1NrAcehagPW+c89mNgTr2Lmu3
X-Gm-Gg: AR+sD129FTy0Dr20cwcqOx0EDD2CgGpdq5UCdc6BH0apyYCPqZrjjHoa1Xcym897YC9
	rArqNqFylZOHP6EMSH8XVWw+UHy1faddCI9vjKQnPKCI2oWYIcgh2RACnsIRgCgWMmKUKMKbxMZ
	z1cX8qXD15gBr4J2rbQ1JGXr+k2m/jModo4adQZxBUS3TQrJAJLD/buzLlt7M45rAc2QJlIbbc1
	5YdXCm0ugADsaUKDbVAucsSKMI75C0GV769EKKelb8jx5g95UTdoaZ4PSBJxoUGqPrVuOA84vVk
	qrvbFRhWWnijMUMSFzZS5FFtxart0813Egn7uQdOTLJjaeuBCQKKyJB6HbehlkvXzd5s6mS5sMQ
	O7aJWSv/3sngn7qOz/XUMiSJL5ff5m1hLLaXOnIDC1crMi+ruWcUjxRdLCmDZXGy6LFO2NfKB1c
	JY13GXauA34obJGmqeNNzTjHFH1LDCAiJCHLbZMwipg76X7hSTEN6e4ncDfm8HpchqrS7PU5ga4
	A0oM6E72jZ+cpxFD0Bu4/Um60cmd7djq84fsk/u9jmqdWdRnzoHWFKLRBUxvgd78GOOlovEJMdc
	AI+j
X-Received: by 2002:a05:6a00:2295:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84f2e0402b9mr12960128b3a.16.1785993769555;
        Wed, 05 Aug 2026 22:22:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:49 -0700 (PDT)
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
Subject: [PATCH 09/14] ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:31 +0700
Message-ID: <20260806052136.21034-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222250_428969_C7B16F75 
X-CRM114-Status: GOOD (  13.00  )
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
 sound/soc/rockchip/rockchip_pdm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 115e90d3bbfe..343fda478901 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -630,10 +630,8 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 					      &rockchip_pdm_component,
 					      &rockchip_pdm_dai, 1);
 
-	if (ret) {
-		dev_err(&pdev->dev, "could not register dai: %d\n", ret);
+	if (ret)
 		goto err_suspend;
-	}
 
 	rockchip_pdm_rxctrl(pdm, 0);
 
@@ -642,10 +640,8 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 		goto err_suspend;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "could not register pcm: %d\n", ret);
+	if (ret)
 		goto err_suspend;
-	}
 
 	return 0;
 
-- 
2.43.0


