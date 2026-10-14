Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B5FCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=; b=KEneWWurSwlVxPqWsPlQTyaQFx
	o6qZ1zM2vvIHpVm9TLEliwAbYUFwRnaLHnG599R9d6KXTyXhV5KA54h9wW0SdE0oCujD/6R3NFea3
	Ss5oxkb7iWIcoE793nrT2sVEKm9NGwbOhu+f8mC7b4rK9PdHH3cws5Ul7S+FPxb4vzKAQVhbJI0Pe
	Wd0lqxqsrC0SP4FqeDtp0CU4oWe/QXrc+eS56yqgGCLcPW7z87yNz9fRWG14LHc5q/OKyqiRSe+e7
	o74T0cAqDpzDL33ZlqvlEy4XH/pzSZdunD+xa7+qDXm2xExujNVp2I41NTRymA4SZ+9Ge8pvcxqlL
	pjuv5keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAa-0000000FK71-0KC1;
	Wed, 14 Oct 2026 11:29:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAP-0000000FK1q-1GHv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=; b=XWn0umZgk3W/XZA8P+YXE7rRgo
	1X6eRlvmmTeW1KeiP204Z7pmianeSqBiSgbzfOsa2zMcLIlwIidEWN8EzrlLQV5SGVoTX7lHMhsMN
	YIebbl8ms3xh4pdIx6AvxGUn8Akk/CE42PI5GwTL/azuUGYm/hdYYv5SaiAW+2yE+e1samSLi8jq4
	bHyxwjtcGtYfNl62bMAJrnUcKiv6r2H1eTuVBllCWMc/zz+aMsziZ4E73X+u9GUbDjbNnoST8Efci
	do+HQahe5iYo385pr64nWcS2vfXQbAtUM3q3XQSHXH8TX5GYJx680QupUSSrpeHp6ATFuEnkxmZX0
	/445uMrA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAM-0000000GgfS-2ewX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e86dce4510so20044705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977340; x=1792582140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=PAyUS+2KMFEoL4gtb6eANCGDbm92sv2L7zmIlfrjbKmDRheCQrushOHCyC0DBxe17E
         ejRQDjYzxB9XtlhJZu7eMEyojwYSMUTtcZElLsgtfVI4L6NbitXuv+7Bg6NENfHVbwzI
         OCaxWKFPexqztlQX0+8HWXSv6YIwFWpcXurpx6QfKq1ox+3cuRSKzENJsJCiiykX7Y25
         IBeT0rB8y0wVZ5tRaSo5Olr8kmUuIny9xbcT8hS7TsRHYBPeBuHNHVe4s+jygxrxwkbO
         6z59j4ZODEIgPdyEAzU7e7d9Kg8rdmTGriAWDQ/coRAaFlLhwb+7mwZxu3qqGdVn9UDX
         8gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977340; x=1792582140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=vnIapzFi1NshlvJGoKPY0mLf/oHkXJWu4Ke4vkWzYDWoYGOgwA9ziOVhh3VkO/99hK
         rJhTFeWoXtzLqID0rMaYTtLs2gNAHQ0dSIhbmb9zaSPgnrsFA3eTbSIka0b1REJp/tbo
         +YhZeivRjSZ2BOh7cISKPs1wil7yDGiPGIOMNkGmt8BFQmKbD6XAszEL5JBygZAXU9qz
         nAdaiaao23rHJa7IHeMp4kkNrg2ldU1TCc4pOr5sW78oZdgWXhBCJyDbsb+OFCvNGFMr
         aZ4xbWmsCe/OP2ETYz6EvVUgpaznnGmEblQRHajLkwoyUfO6+lSF/1P0oG2AN8hoFbnE
         iNAg==
X-Forwarded-Encrypted: i=1; AKwUvBxpDUC04bEltV6jVnhFNh3uptrIUjmf5rYLNCDQApQ0BWOdWvUpNbuBozmDjDwL5iymLM289lzQ1DIngPGKiOFR@lists.infradead.org
X-Gm-Message-State: AFq9FYKXr+HZ4Tx2lbB/4gKK+LyKcMd01Q3ggOUMY/Wh0OoO/d8ewn73
	RyEd9xXIvUkFptPqy+odthfof5Pe5ekdJWsRE6nW1+ZJU+TuIDoDK8es
X-Gm-Gg: AYBFou05RRlg1tuAn8xhaS2wNphH8XN8fcfniC4VAWTAogGmUyZHgaR/1u88wBGUIjS
	KNdFbMvbTq372ECLQpoEhwpIFM+JqNTqxPr+Z9wT3PE4k1g/FPMnNWfU2q3PDNvMld9X41qqiJF
	uR5oDNM8nwpAWbh1FF60fsiCge9GQl/m9h/w2XdYQlf7mAIYS3SlCChvjyo2Yx6/QnzVkb4nTVI
	2wS4WiMWiPulk2s05HaxC9Ijzpk9hEEC95HR5ezPU8RiacL88DlfYeXBwWf13FWQ50KXqXWhbQK
	ySoCv7qtVpv7KdQs8r2fCPD7FwUtTbD7IdMp9DKrkSTRZ1FhLWHXGBD8vdMXJray4eyIkNCSTB1
	XaW4dNpbx9P0ubvw7wRL67V/0nAG62JHWulAlr84kGmWjeeIp4CF5dPy2jfy0MvPIX20H/aQMOI
	KwVmlKbPgeKCZZTk2y6rX0iYTdiKetgZu8ABs3agXJLJIS5io7p99SEhkCnbm+uzF8TL36H9PVZ
	KOgba0az4ep2u7PslEUoVrswh/Lt2BAtQkfThD2QkIPF1eAdPMT0KUv/DtErML61XnDFdLAerUt
	jBOaIvTYKXzLqw==
X-Received: by 2002:a17:90b:48c7:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3ab3a3596c5mr12440768a91.4.1791977340498;
        Wed, 14 Oct 2026 04:29:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:59 -0700 (PDT)
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
Subject: [PATCH v3 08/16] ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
Date: Wed, 14 Oct 2026 18:27:43 +0700
Message-ID: <20261014112752.683032-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122902_789122_5445CAEA 
X-CRM114-Status: GOOD (  13.37  )
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

Check the return value of mt8195_afe_paired_memif_clk_enable() on
START/RESUME. On failure, stop the MEMIF and disable the channel
merge before returning the error.

Also skip enabling the paired clock if mtk_afe_fe_trigger() fails.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 02736949ae6a..4216c47a56c9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -466,7 +466,14 @@ static int mt8195_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret)
+			break;
+
+		ret = mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret) {
+			mtk_afe_fe_trigger(substream, SNDRV_PCM_TRIGGER_STOP, dai);
+			mt8195_afe_enable_cm(afe, cm, false);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.43.0


