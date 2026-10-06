Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A20CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=; b=DyU2VBf+w2KPIupspTn/ZsLk66
	zmxt3rfilTTVWscVyKI0XducEWueCUvxm+YOkbAoM0DjHgvvf9d/txCJpztD2oIon3Mp9FyOlwWlv
	BtECgQxY/3Lp83/+cFU8viTedBr50ZEQ6TVCd7GTzaJfRsmmJEYgsIxybCeIQUIDqMr2FstUsamX1
	qARWhY5m5E3hV+Ay0pUqAUyifDjXTbb/HjNpu7SRRCQtVk8PC/wzWHMIpYLYQ0b3lOa67J3MdzMF9
	FbUO45RfCXSYWwfUqWLA5dYtmNclQ8b5//xRB/YA5gXvLDiV7BdWZYCMlCpibQu/sy/gFiFELMH2g
	vJy3mRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2EB-00000000Tum-3mQ6;
	Tue, 06 Oct 2026 10:16:55 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E8-00000000TpB-3yE8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-884062f3296so247090b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281812; x=1791886612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=qdpKQ+AqGnlWJkqmRkt1rWK1f+RSHqv+HpJ6ydGY3QjMPwbaRawqnSBvown1xv9l5h
         GMCQNj3FGwhN/BUPSd/nPM3cyRzEgs+7PZQxP/lpmwTl2EKNn/nGzItkJ4yha82JfdoZ
         1GXpTdBuZ1yXjZ74SmEg9vAOwoHCALPK0tE5R8g538iGEGPK1Ugn4joPFr9fnMLu3aM0
         vN/kGglI5+8EVVkhfMHT7bVf72ZEz7qXUpbKWrwH+clOt+r3tkcFtW6ygsEJZfS3trFw
         dIvHBfFjSwny9xjm/qat1dQGeURoz1BvztgPUDPm3553c/yNzHnLl8Nd6Ut1x9Esir0M
         9hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281812; x=1791886612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=vXhOuykj1GKM493zLeuDFXoKRS8BLmFRs+pqnqcQBQ/OHkS6luMvWLuO0a7xduy5M3
         Xmr7BaTNOG8drQiQltYzN2GtH08kO8Am6iTz40RxMqobV3zhTKmq5erSlGjIDrnqBVDA
         Bn7pYmkmJr5VS9Kb6PjpXQ8AuEW0EQnA51shsH8zqHoPqDGkKXLYjCpMBipmrmzFWDEE
         HGw/PVo3zInNqX+gtnpFIwBwy+ULXONjFJI7QliVNN5zMqJj7rUDyLEK8iOaW/z3l1wU
         jhgVGYqYUXrnX6K8rFjvZxbgpLI8ghdCAkXR3SRplEC1qM2OQhP7p0GZHe6zi+owFFnL
         CR1g==
X-Forwarded-Encrypted: i=1; AKwUvBysAKtXImT1L5Y8TYxwtmwozbzAhpsE0/dJdb9fHNvCV6MmpWt25c//2XgVGsYmlRUMNo7V6wQuWnb9BToEA/0+@lists.infradead.org
X-Gm-Message-State: AFuF++nMfszv3vcbmPmOND0Ha6FgM7p4a97yLkUTeifFcsCb2w2yT7XY
	4LNytfapxolilT+9X5WFPvke/eha19ongwDkqGVT6EVPhX6gHKlpIlJa
X-Gm-Gg: AYBFou0cHWiVMPk5xdI6ZTac7Il0Jy4N5lE/RYviBxi+XecOGca6332S847oKR0sM5K
	0M2CCl4tz410LrVOdHsOoYMfRKrLdAq4SDko2bXzRdpdgN1Ca1Rcq9fC/nB55TDKRIfv6VFKpbb
	rUmPipTJHokjeXajW4tsyV8FFhlavcjJzXJct/FDDE7o9nrd4w52tn7RovnIoBpGFjqacy8j5bD
	ge8OYkPTUry37rrFzbe0aPkkJf24Ew/dXw8Cbx5VU535wigAAJu0C6elJoo59NyuJbdk7mykIs/
	rgzcdJmC2elqUdBi/vU6W4FksARYxC+1RdYAXIjXdUv47+HZ6pDh1X30j/XCV+g/FFu9CC5u9AA
	JIRLgeChDyS2VP335hd0jnvco9QuoHQ2aObBK7/Hx4wALKcspKxwy2QYm7pgxYONypir7dV+c93
	BBBcddsKAqaOtcTlcxty7YH5f5HwXkqVmt14r0S+1WNs5m1EQKgl7exFkFL4aZHPM6k5zKpHvpR
	m00w7gEr4/iSpER8TXSM/DxQxgJnlC5s/O6mjA8WJ3Ax07euetYL6TAow0dxSd00Q2jgK88OT9N
	Iu1nRp+xszttRA==
X-Received: by 2002:a05:6a00:2d88:b0:888:add:a74c with SMTP id d2e1a72fcca58-890db797184mr887589b3a.4.1791281811950;
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:06 +0700
Message-ID: <20261006101606.54079-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031652_990512_282AE892 
X-CRM114-Status: GOOD (  13.54  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


