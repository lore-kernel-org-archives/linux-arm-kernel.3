Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1FECC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=; b=nus87cpza1scwJ5MgXXP1iuJhr
	rwvAdH6e3V2mO342sFjPpCMN8hx2pYcKLsRGCzaA+ZiQE16MMketkpom3LCAyB4I51ldhzMZGIzYv
	Oe6tWDroy+wYNNHRGXAHeJ1hqH5Bs/yLMNiKhwHqVfRzMgFKaaxFuM3MAMJ7lyGqT25zhfmtX6PKG
	SyiuGit1ow1lT+7WMp4FyM6t+WD6/dribUlbMapC6YedtC9nymGS8bOyTd9DipIHzauHtS7b3g8xJ
	BQ5rXpZjPNwipKrdD994KnYGZYwKsrfjMqXx4uhq3OfpM1n9m5nf/ryK4IHTL/4ChjhyyPgepnWcS
	3QK92+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA3-0000000FJkt-3M7S;
	Wed, 14 Oct 2026 11:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA1-0000000FJhY-0yfj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=; b=gsfDCGz6wTjgjMYcdUAcROpyHx
	7dHtFOlIIPqdsXn374bDi0nhlvyb9AUvitz4OcVEmXlyjj3LZOSeJoP4mJRqE1kKr7egJX4EqPlUw
	f/6kw7I5f+sAql8Ka/dY+KcP9vjHK/401Pqo1dldxEGiZwZcZ4EWykMzCUjEAdg1/Cci5YirYGNWJ
	6+wLwgAe31Tbc4W84c7LU9agpg/boPZuMAZqn1bcbwie3tt+nbz8K4oUWDloeJs0FdHJon0YjapIr
	DYYDNLgVYgk/eD/1TaShFtmVZBHmtNFBj8gHmlY+aTqD2cZsACegCkp8vNny0+FwTo0dNkjTLw19A
	O8pLm+MA==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGx9y-0000000Ggai-2EKo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso255978a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977316; x=1792582116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=BUXDWqq9Uf6jel6WJFtksaQEg7v3rumLvfVtnmam+6QeuEx+ilPvDxryOkV11el26+
         BvCAvCxdNsRrAmR4wgO26whT9GL4OozbAWBFlfXYc39Blkegoz2rvdeOJ2uaQFrRtouF
         dLvGm0MBCzAcCG4AtgaqvWM3pD8DBYF9cdqNjHb1AGc/iuOaf4y8h8eFpK7h6d3EhajD
         HZDWSbCnfQoZHmOsweI2lyikE0YfmQbPVXwvwDH6yK1A+h7C+6RQZOuniLMnUPLmJg3W
         qy+qJTh6ce0p0hMho83RbYAQLBvaD+M2Q8s2BWh9r6qMtRQUAeHh85goOCT2cY0NMTc6
         4URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977316; x=1792582116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=wT9yZ6f1+8Bi1UncxpeNxMlelO10MvLTZGKf+da7r9B3PrH1kblJIPaPHBa9arDh5T
         jUdVMrFwyCEMWldn7UdI2QPP/EvV6jPkmQRSe7ZqJiO7jQXiRMTx4LMuM3AaYoGttVwr
         mZ9OKk7YlZNLahMJArLt49MgrZuEiD3RqMgFfpueG1phJSrA8O3gi//ttYGOv97O+zCg
         yPZ/ZnRnTMPP4Ilpuiz0w3Nqg1OVWTgqtaYzaogV27MkEV+auP6iQmkHRiYH5lcI+QcD
         VJPm2JVSaymxfBzAayFoUIdMHIJmlPqQUT5B+yzfBQ4pbXiRtsX9pTpTyghKFOM6YYRf
         LO6g==
X-Forwarded-Encrypted: i=1; AKwUvByHax/MCRMwwqyV89hpdQBLcUckHHKZ9w7i8v59RwcvHsFqJ+mfIellWkbmP78V++2svU9vbea9NNU9VeWHAMOp@lists.infradead.org
X-Gm-Message-State: AFq9FYKJVcUzP9xM8jC2931ZNgeeq1IDv83mjxlZW+d/wLJ61jUDqlyc
	TRiiP9TeCTOZuYCIVntXTsXUUXcYD8pfpU1Na+y8NYpoN9ksbQOYFvM5
X-Gm-Gg: AYBFou2+MPU8bmrNaySfQJSN7iHdNbnmiqeTUbuboGd6cMt3ZG933xrkgs+8Hz0ffGA
	YTLm/NbdopfaCS7s+aXA5ip89i7FM8tx+LN1E+Hh8C8krZM+XN2u8H6Vw8j5PgzLb2RBTSGR4EG
	trGzvNgdlILYU9tXiOD9aDhC6xzGSsIUcDBen0neAQCqI2uS6DgIRjYH03HoS7ZVALrpoMxCrJz
	275D9Nmv1z7qjH5Xp+5wy1ZThHYYBFp1hf0PSTHlDDC+JyyDe7K9oWEUfgto9WS581mBG1A9N9f
	5kIczkuyladEzZNfTwu5XEj26sw33AURmE93L8c/gTWcpmiRvfcVZ1pm/gA07wB26O2muihukFw
	HKD0S0x1h4K7V+1Xl/orqW/qmb1Ew7AC5mgi6o4vUera7NSOdTGjxgPPumLEu//bEKZ2t8w5SN6
	0ttYJ1WyhXsoEQL1C2HuH2uyK5r60Ae1A/FEaby6pFIlikq0NkPyFqzf2vI5e9s3fHK8ExIMpOG
	PWzx/qqQGY08uEOYzmLQh1b9sPB4vbvUXL/lW+3iXmsX4GwG1loZ8P18G0y47HfUh4GHB+pr1Rb
	5ubG82K4Xhw6dA==
X-Received: by 2002:a17:90b:510a:b0:3a8:e2c:af52 with SMTP id 98e67ed59e1d1-3ab3a93eae8mr12248948a91.24.1791977316276;
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 04/16] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Wed, 14 Oct 2026 18:27:39 +0700
Message-ID: <20261014112752.683032-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122838_682073_86C0556F 
X-CRM114-Status: GOOD (  16.21  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..03d2c4fd1f85 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
-- 
2.43.0


