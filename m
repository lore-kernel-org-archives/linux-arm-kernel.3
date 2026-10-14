Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58B8CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=; b=IYuWqBnCHMX/tVlk9mnoc0uG3u
	GRowxoQk2p9ctdpx1qQn7m+FZ0/QRrglqKxu7ycIMyTA8z57YVXvZ82dny9K+rvUjMeD9w/rB+uKo
	On2Lw870HBwcZ09wKsjQ0xEjoTzOWWGVARCSM9DULjN0IiRTphgDxQsHJVR0gZKpdMf4RXGOYD7cy
	AiIiIQ2Q7DmwQymcRewKyVOXs5239M0KmtYdQItrwRdDlqJDzQvW1LiQ0WpJEucuXp47wMDpl1l40
	NK7iTwemqNkTXlFU992E8D0Fg+AQYWrhdyoPEHpUceNa+glR0wAhFY+VbNXMgnXGai1F586RYOYC9
	CX95jPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA0-0000000FJhb-2QdW;
	Wed, 14 Oct 2026 11:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9w-0000000FJdu-1G9k
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=; b=Gm0Fc/U5/Se5ZlRab0XSzgPnmX
	2RKsTXo3I63dZbE42wGyF7aOGjhQKOJvzDOgmWuP8ktPHOn/kEG/96z6pavcfGMnyeWoLJC1BLgVU
	+sJ2wHCX4KCAZMfgLZPTPy/OwKdj0r9Vy5IynEBvVHkluw73eDqW89bfycPIB8ht9kJKQzB3IG6JA
	cfbHy+F+INQ/kHU83Z4jvW4g8cY+48z+2bK+bcznXQXdQLG8U6+6eSDToS4YW4CbcEEOhmQs4wwyk
	sSZ2j3yuQo2brAQmfVdTN4qA5psu+rFOl0lHCkTr6RRoaV4ubhj4mHQkw8ExM4fJgZvgR2IffDBmm
	TZD+yOXQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGx9t-0000000GgZO-1QeL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so157838a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977311; x=1792582111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=Gwx8Oh9t8oyMHI63bpDTrYlC4MFhQ1mjsBLVFH+Pv2FG3XkJ/95/bkfK9B3uynVvw9
         cwG5XOT6sHEsETV7wekrASWiJ7sKEheHweIK2RZjK/1NIy2V9wfHPDGMKzwLspaeoiKf
         gC6MpGbL8Wm4JQ5j7qh92vPWwsRHVtCUoxAaNKt4C4IiWsCuYFhL1UeQuDID5stVII5s
         OpZm4K5CEYXg6G6qhRmALkRT9Et0PSKCUYT0iBj51u3LwWBn80aoV6mK2/aeEb0yW1b3
         E2Eyg+H4/d9iZ6TX+NrDafeCDeCynRqRyyw/yi8mUjm6eL551r0U69Zc0UQliCZvlxxQ
         EoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977311; x=1792582111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=uC9PSh+JzYuaTAkEUu/Q+MnvD479POdXyWEzm+83W8P8CZWRlU0ngf6+IqDJA+R1d8
         xms+Y48317mxDCWmYbxQc0+nUCmE+f7EYPD6DrDt5AlKgOQNfgMjU0oyQ3kOCovilKk2
         7cs84XHJIncXEnhrQ7kBYmMPt0vw5v+/axRr0Vn9fwhOa8Ko5WOhP051Cw2MO0f5zY+9
         bU23/Jy0yMgLOG8xmvHsvLp2L8o83e6ZlfJvLVDVx3sodSrlELUVyOl/rNcSGcO0Nijn
         h1fBcDhlsHfLfyPBfRHfGHyJcUd98fILTxNjjIS34BIlRyBb14bE52wW4uklwUZAuq2X
         ZGyg==
X-Forwarded-Encrypted: i=1; AKwUvBw2n3AB6lV+IJFpffEgG9H8PDE4vnXvGg7eRJJCbsXXBnn/ib9XzsX2/d0PW0iyCMsmaUF2kpYLaa8CpBpt3Muu@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2iMAOilYl826WMV1KU52eJvl+8cnGB0tCLC6hy+YKlkVXq6lk
	eRpQVdpug+Dx4e5Q+AThfDR8twnC+IE3S1w20OM0ge73i7tisewMHG6drZvPlw==
X-Gm-Gg: AYBFou1x7JtUFCUZF2D6IzL+E7xesgII8vOH0PHMR101ELo/IFFOTYAzGVV1WiWThky
	PqNB6V5G9ojTSo8p6Gp+xvZ67FCVmbmoqIuErXxjlVDWm4YW1C42p6ZT1t/CY2oClfBfGxqHcGS
	zG2tT2WOsTyq3VhGGcnpiGU9rVKOpVmIm8ZGapEkEdNZDYlCE+57eOAQ5gQEI+FodiR600mdn3r
	HmCls5SFpbQEg82EHwnVcsrdLwxUB1zfReb1vezqw2PkCisCPcsJp9xT7CpcUmJHQMoec+1/9UT
	8T/3vQkKKM18lS2hS6Lc1rRM09VROqRomJgOVtXWGXKFSphBf4eUQ7sjpPYOuJBQGcwWTLk2+GY
	XFBhdsy1lj+EPYrirbsaY5iUk1uJ6WkMUYFz4jMQ38TyQjFvclmwtJMVBvJhy2p9ysiNgh36mqc
	Oe3WOwJ8RBBIfd54EQOq3LIjK6eO3m6paZcddnx7uSSSOSbT0XQFwBFiSPokUOqnTuYFMUV+hDZ
	EHizLXXjHT2vPx7N9eKrdEXy6Xesh+fdE/CRUpoWDC97bmvBtQzG7ZyZerTkW0+Bg+LtD6lL/7P
	YyP0fWgIDiBB7Ls=
X-Received: by 2002:a17:90b:528d:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3ac6e9140e4mr1552762a91.22.1791977310692;
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
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
Subject: [PATCH v3 03/16] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Wed, 14 Oct 2026 18:27:38 +0700
Message-ID: <20261014112752.683032-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122833_513571_C3F0EBFB 
X-CRM114-Status: GOOD (  16.32  )
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
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


