Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3860BC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=; b=YYsBNAgyzXfaqTrh2GFpgWWki7
	CkryOT7hjp4xNY8SRWZzI1maVdNUBRyNgKjS9n+dNnj4pz8JJYMmgdFWjWh01JlJCqkqWCRbaNfpZ
	noU4ai75QjbKihKmJuBe4vwfzDb6NtbDbuHlQUlfHhLheZgRXjFTJ/HRN4Ko6khxpoXeQ8GeHGaaR
	Yz9xYUiSSs4A5YJBIzxbwm4E8gaFbrKSz+85ZpI4vFgNsdpbYp/GV876FngWMKtI+pUZ9BqHI7zBP
	USAsZVqjvKh+8AHQQqmW02ApcnDLN0uviDh4SsujTqxMxVLGJwOZVDjDfNNctwblrHz0BKESOhJo3
	BwG1UX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMQ-0000000EOia-0Gbb;
	Thu, 10 Sep 2026 12:58:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMP-0000000EOhJ-1b6x
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=; b=C4IC/k4QwxLOodU0cZA2Brua3u
	JTaMFQnChKt35xFuBciE9LrPRDUJ6bng3+hV5m47DWTjBE9P2IBQhk71h52YqNHmDw76yJBBmRJXO
	wm7pOPrJlvO65cXrhSNfUzgPkJZLbLX4FCvOF2aBXwJUJMXd34jk8CrvDN3BgTv70yWevX2yWS3XH
	0qQRv7oAAF9tD4d7thunjD7kgbwPl87etRY0a34QTWhrm6t1YaqQkaTZdyfg9NXq4ozWNepHbhPRa
	TiLc74qye2c//A4d7PXAIMEVYQHqDDKq2tiFSE1/UdxGxApDVKmPWOPUV41x5hJk9G7zhdlUHunvk
	f0t5xsJA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMM-00000002V18-2pcu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:36 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1562438a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045113; x=1789649913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=b5WXbnjSJUicXCbSV4TVyTzJLsnQmVllVTd05jMArO6DBI5gXr1t6qUtDlsnpHu59u
         APVNaZk9zlVb8VMdFM45bqGsW4RSUvnkTTwPAAozD8yt9sKVBLwcgnxr2jv6HA+tweRm
         R906Mjr0GQt/kvdBv08gU1ICapYZKnztm0ZQmMTKHdn8gXauCQUIJeG+X+yn7371Gu0p
         nB5uY3ZI26hxfMmcXzOh7OXVRLqj43PwckzNAnZuBcfXERiWAtB8tEMpCdaCPCxr9D5u
         fidUNc3tVm1vbWQtXYATXgUo87qdVqKTZhpxn3yXRqbMtHIbw2m46JTABc8qwk2eocRl
         FhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045113; x=1789649913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=VlKTQE8+nyzT0riefmYvrv6kNX2VmMapc1XI18ML4j06lyRQ51Ccx5tkO1pyljxaQE
         dUNJDRjJl5KxtjKChPFbi5XTZLkfYtze9NObq/kzezvQtf7moTcx6uOtkC5cCi8N9FCn
         1iYv5xuIeVV3YdwNngvN4AhwLHG8MutRrbyx6rRBLtskI7nurv29p3IOsFHKIRdzTsP1
         Quszy8nx7ETq204v81dq4cCuXo4w0cuDZxMlzhfYBA9XjptVaS2FK2ysoIj5FW2VP6BG
         CiHquvS2OUeeHsbyv/CEBIh9/8XEAkMoyKqxf3GqLh8saMUknyDTt0nkbRz4izECmhoY
         J+gw==
X-Forwarded-Encrypted: i=1; AKwUvBzF5BamNQSNSEG7mkKycXyeiQkKOCUL60pfhLEZxUdP6ZaUd0ogpzhV9CW4zlEOAXsnEy6eDls9Sx5rNyb7bkEi@lists.infradead.org
X-Gm-Message-State: AFuF++nVmjZIuFfQON9Xx/zEzkXfgSEGtldFL1HTknhIsLhrC/xVNrw7
	QKCKAcj3UhsYwBv2qXWovwzVDNZZBr1sHz31ZrwUGsd9Y2ix57+GQ12z
X-Gm-Gg: AYBFou1ueWqu8xmhSwpUyFsO1sLWGaAhehjlcYg3dU0GGVfZrhO+EzBALloyL4Dgeyn
	wCuQ10PIpvRjHOU6MlYXUuCXLh9nokNhbnRyL/qJiIzJbLH2AoDjt7oaTY8GEYy/UFxKCPQuq3k
	/AhUw7av+9MQ1eORIF5WrDehlZdFgV72gBkZsfhCjTyhSyMhTCjQW5s7GDz+lZSGrJhKb81k2ce
	zptXfFu/kCZl66Vft3+LxKRZUXZzRocHwyAiAZRYgWdofujrl0sEyoWELs7QxhXhpVtR0/WLE56
	No2OfxsxH1DefbJgGIESqOTiBWcjN3nzB2I+RtZDTxWo1JrCMLQ0j2yhx2TSK6MENYXOxPhMmFN
	r16kZUEiQZoalZ6gBO2bIzoqIHT+fqm81ZMWixM6ybRKFSgZL/pEtP/mg1JebgTgfEiJNljwD5C
	/7vMdz9EYTJqGSciMaSiGYIcujEww+qSHADh03cUanFUroBUmbpU+XYGfu6ZU+Ptob33Txp7NNr
	2SzlzALA4PpjBHji7AR4g+22DspLiZAfKAhJ4ceX4iyjXu0Xyb1/xvLcNF6p/0jx+t1V1SW3XAd
	4hP42LMW5qs77WI=
X-Received: by 2002:a17:90b:3c4a:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d70bb2226mr11925208a91.20.1789045112679;
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Thu, 10 Sep 2026 19:57:36 +0700
Message-ID: <20260910125742.150902-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135834_798387_25D68921 
X-CRM114-Status: GOOD (  11.84  )
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..431320719b63 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 
 	if (!afe->regmap) {
 		dev_warn(afe->dev, "skip regmap\n");
-		return 0;
+		ret = -EINVAL;
+		goto err_reg_rw_clk;
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_regcache_sync;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_regcache_sync;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_26m_req;
 
 	return 0;
+
+err_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_regcache_sync:
+	regcache_cache_only(afe->regmap, true);
+err_reg_rw_clk:
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0


