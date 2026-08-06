Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC2FC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS5N1HI6JBb7BYnde9ZKmg1y6INP5OTp62HALVYGh98=; b=Mv8krQLHmvjkyPX4QpE+8cPVDu
	Ss3PD0K/kG6XhRI9AbAiGw2pXal9RCelS0aif+RpRBLrcuBTUYNuQQfo7BZ5VVxzUmeXYvzJa1XAo
	ROrxzMB+AX0ZFgx5LjVpMxJz/HSbctvIOk79peyNxAvsypm9yQHyJMMpjaeXsxgBD1aHD0hEQqN6y
	M0hHMOx300Ydhl91TOtTCqczr+UmdEzNdFadzYUPYgsc3eQW9ZL5WJlxEMtYSSTCiXpT5FRAvQAXy
	9kRt85IK7uVU9D+E7Lej+HzP6Owyh5W7bqduPCkgLfwmRQigqDpfPDkXix6g5o3bpYaXrL3xGRtSx
	Xh5XyyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYU-00000004wyP-2XER;
	Thu, 06 Aug 2026 05:22:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYR-00000004ww5-3deB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2203448b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993727; x=1786598527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS5N1HI6JBb7BYnde9ZKmg1y6INP5OTp62HALVYGh98=;
        b=UUS3nayXgJSnILk0u5B5hn4YR7qGO0t9iijv6Tf2WO3hRDOctXkJD0wlRL3t1FB7Rf
         FEuSBY90qpc5PYMt8JArO36PUEpYXI0Gf2IWrtvEp8gnageNH8psACvwor4qRx7Ce4PV
         Qnq/vyVpUgjrQ8IrCTDVmq4sxm3VeUoL4h0CkNfaVo6dmwmhnkSPZutt4KFLJGhlRFGK
         gMJqTeCaknUanmemggZviUUQaLWpRzUlMSn6GJxowVL+HSqxbI7UxhHOPIyZNZg4xoU4
         bcr1ZaqAt3kbK+2SZm08+XVg+KAgQF1t14mFvEcEZLT4/oERbN6vD/SVuLcYyxliEiNG
         rO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993727; x=1786598527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS5N1HI6JBb7BYnde9ZKmg1y6INP5OTp62HALVYGh98=;
        b=GOV3+Aa/4NS6KAEqg2VJWydU76oi3l5avNh19W4M/kZqfO7NxT2OVG/YTXeQRE0pEe
         F0cRrLfCOt6mLjP5u4RufS+TWYvZTAGQYQmuwHcf4dJiAg72Ek6ngLqZ1Q9sS43d08Tt
         udVD+M6D5gOS3ylX/saiAgQVGUVD3qQ2lNCDsppBIEpObUlVoVdDxcC82OSx7Zl6MlHR
         EWc846IVvPZ3UD8hUjl9RIm+MlM5tUVaHDfY/ip+kFxfu82kPRavhAQI1RuplgpKwzcU
         M6nFTneO63BLsyBBybsqaz1iaLFT1evQgr9jMMccA12x+W4ci6HxCk21LHTQMq32BIbN
         Jpcg==
X-Forwarded-Encrypted: i=1; AHgh+Rrla4We7Ci1tTzOPq0nPFBs7nn9tSaP0sHXbcD0uTn9SAmxa1i7tVJH1ARRfIJTpIWhrowayENP2AO0HLT6HHYB@lists.infradead.org
X-Gm-Message-State: AOJu0YzyWACOeLzxZBtmHjiDLMKJdQ9bjS4MP2aYaGnmaK7N4SD16mPa
	AOL/pqm+4ZGkhN8s/CEF841/W2HC6In5G7M6btGghyAn8fZXmc3VQEBR
X-Gm-Gg: AR+sD12Z1SX54pWtrFSl4f65kDjtZDZbOCWyG6tiftbYoTKhNdDfo3u3mXqRm9sisuF
	pDX7T19mwmzsuAfG8lB8lHz0BgChnq2WCNsXPMuEkuTfWhucNiR6wROc6/Z5zDzn8Y5d9H19nPW
	//wi0ICdfz6Znd0kuOS7ZwpUYmYTlMrOjs/MyvsD9svFb3zM4yv/3kd6/tByUTGhc++EneBQadE
	XDSJ5xM2Ancr1NRr51iDW85aK+Aam59fyng0uu1idnLk6kgJ79bTmbWYw/qztIVQK91xBCjg03B
	Q5OaaQTny465TFbaz8hnfNFcrsZMo8Velu5dKPENi7IFmsMVOvtAzy/enYTlDTrOP9YpmVZ7X9l
	PHG+Lu8Tt1ZZeKuqckR1xJRNK5iFFExFYFdu1ciVBkblopmNc0RPmrJlNomKuRUK9EIdR1KgpAz
	fR5N2rW8OogK0+y14p9mPRCF0iTD30jdnb2oVsV1QXrmymP0+ywE5BREOy9J/fNGS2RAC0DBaXR
	z6897T8UsHNb/s+id3gkqZuyoV+Q7jfRDGH5jPdUV0RCj1Kw5XCVxfvvdQWr7UsNUMDJ9kB8w80
	SVFG
X-Received: by 2002:a05:6a00:4b05:b0:848:56ff:6ced with SMTP id d2e1a72fcca58-84f2e0148a8mr13181609b3a.8.1785993727007;
        Wed, 05 Aug 2026 22:22:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:06 -0700 (PDT)
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
Subject: [PATCH 02/14] ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error handling
Date: Thu,  6 Aug 2026 12:21:24 +0700
Message-ID: <20260806052136.21034-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222207_909063_61479FF3 
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index d88d5ccfcdb2..541163ed56fc 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -205,10 +205,9 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_get_dai_name(&args, &rk_dailink.codecs[0].dai_name);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Unable to get codec_dai_name\n");
 
 	rk_dailink.cpus->of_node = of_parse_phandle(np, "rockchip,i2s-controller",
 						  0);
-- 
2.43.0


