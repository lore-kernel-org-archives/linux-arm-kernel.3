Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F258DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=; b=J4bWbqiaR+K8Na4oOnYYPjn4ga
	mw1EOTJAggMirJQudQqMC3ZyIDq4dc12aV4Wclt5qYXAkcackV2czelOm/o37PUSrZEViDnQ1vbUn
	xHEYkNWkLWpsYqtuBGilXN9O9mmSboXDVTiy1V6uk1QiGKdBIxrN2X4nq+WKOaDNXgV5NG1pmGv4/
	QN9ZfI4wyuMzB5YnqYrLwUwuFPqeSucQRi3aPwWN8YcLkkIsj9oxh2R27uRHi+nFb2PHI6IbfjNtx
	PIYsVp3VuCeR7fpsNT8493iMHVmPGmQWK6/WWSff8mKAtiHNQpsg5HeYeDBssMMTUEn5HjImh4mNi
	H0yEaX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkh-0000000GNFz-1tX1;
	Thu, 03 Sep 2026 05:12:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkd-0000000GNAh-3x3Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:42 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-398b3d66515so2488809a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412359; x=1789017159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=Q3tatcWHwCVBpcStlIEPbM035hCZ5qKUnhtes1xygXf4OSDTKVsO9Z5VWL80nV4tuf
         xwImAUuGmJizNPI8F0VL8MviU4pWVuxz572az2k4Pdcg/pcxfMt0Wl5c/QUcyVks/kYS
         TQii71Vu3Y01VgqNM6MYgqa3j22jBUyahi4EegTKSg7l5zCmYa43oL3FA2InbO2nZ9ix
         uHhg7nSy3kEEJNeNT6w3l+GILSv0dJyR9ZAoDKc10654JSUVi+exyBfb5jyx0tAr97JF
         kWDVMcITHTMhyAaUfL0SDGhxYx5pf1+dOxwAcfGDusWCPP/Aw4rO8Vwu+2vSPScO7ej5
         McyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412359; x=1789017159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=h2H+sVLgIU5scGeeqGNO/jfcdxbSwJXOpAA3Qg2gtsOMNWs3mV9HdjW6MLnDzLxbG0
         zKn4GZ8G0wmVqSXD/CSXOdrrQqF61Wk+NLSNKgkB4k89lZIgBGtdxqzZ52+KczcSfvKM
         nrjH4nh1RTb2mYTfK47g8rXdC2e6vIn9N8dXMMz3NiPufTsy4OZw6rRuXHOFIMfY1A6l
         lTKdl3Nbz92iJeDUvapOfNNQg537Lug+xtmCGblK43f/WhJ4Wfn0qlEIVkkfuKlNQZua
         nMUE3kBTDz/6tm9ralLJ65rM2TsZDBex4xy1SWb6FLGOOIE+yOKH1Z8cJpR+dN2N8Vi4
         LnlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxca+82GpFX+CyXe05QlZ2zuDRB/UQ54Lu2TwX1BPElFDLWOub88ZaVhn5f1Wx5InE4cvulGQM83RHEHYDRT7he@lists.infradead.org
X-Gm-Message-State: AFuF++mL0uOeSWH3V1x5RIYrNjVcne26svT9D+kwFqLs09jKt43nFyTJ
	9GSAwGXeJKYIiSf3dFJEbgACy0ItrJSlaQJsr8dDXrqJmLnlBZJHzNwJ
X-Gm-Gg: AYBFou2uTcLCq6y6VFCZA7RuDVqZKqjQEhp10s2mfa8ZSysj6xlb+9YphaJgmCmKR5C
	qHsQSqDmYO1Ui9avRoexFZ/A+AD1qHpf3CTBcT/gwwwNzhLvRLbDtwxXp4rySfUUPpEx9auXzj6
	Kv/jEFUfAE8/zaICurruODbTpXrccfn675jijdZb6LGA/V2PdOy+dD+9WKBAUBPVgMPmOIBD+yX
	efc6AnKmCP6Ut5s6xL06/4F55cegPuvul8qY+xWFqlWXZBX/JBQuVh95wzVG+kBT6qYbPa/nNSC
	Bb0+8MXNKaaJFIl9/HuDlv8Ei3j4xG5szxXTWqeSUkzBhyyFhAY5IhSHIxEGixgyFixa+ux3/K+
	U0x8+0/6iZZyqD/EugmXmtF5J7Q8ioimca2EbtU5NiqXCpnrQaEIbsYdpgdQZZO2BU5cs4Cx2ha
	rlm0QkjfhiYbIRQ/ep2tb/d5xpuRB/uDAdeu+BQxPzYVhPe3F7uBpxN9PyiqPzhI0Ddh5zQCXU6
	FQTaRi9GygJmUIYPQ70EzN9LGl8fOHgalRBpwJYvG1CtPOWojvFjzBX819exaQ+JVckIoMzJzP5
	wKL6
X-Received: by 2002:a17:90b:3842:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39aee22248fmr14029377a91.23.1788412358993;
        Wed, 02 Sep 2026 22:12:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
Date: Thu,  3 Sep 2026 12:11:49 +0700
Message-ID: <20260903051150.178057-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221239_988946_A0DA1108 
X-CRM114-Status: GOOD (  12.13  )
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

Check the return value of regcache_sync() and restore cache-only mode
if synchronization fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..143386c54dd7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2743,7 +2743,11 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		return ret;
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
-- 
2.43.0


