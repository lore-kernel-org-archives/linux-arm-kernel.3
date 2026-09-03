Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21B8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=; b=zRshPh9ZkdeMeXlm41/jRMJWQ1
	rUuMs1it7dsLkqscmaUAEOG/autYFS4Qe3WEQO8R82V/JbJjQDgZJoNins4BvxoUF22WJYlCmQJVi
	MVAjoW/DdX0aAS45wAj2yL9ceTsyzyeRrpW7hVYIQpu85gPTG8mzAsZKpazHyrq4d78FSY5zgc0v2
	IXheHE9UrIQ/mmvtxWafEWNFV3NqinX8C/YujYV3u8+uAjXZC75iOsLwYse+bWsJBWIcbYlYON1n7
	0egJP3jrBkYVwOcUxY2HGb5O3bGrwZCUS7WnIHHa3RFoIFr6NJWfVVjEjPUiY4elgGi4aMnKtYAYo
	xmPTd8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRn-0000000GLrl-1MSh;
	Thu, 03 Sep 2026 04:53:11 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRk-0000000GLni-0zKT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:53:09 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2092278a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411187; x=1789015987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=jIfo2YCYf/3qYpANF6EMgvrPIcLF6/FA3S6fVEKItKDZnb3Bm7qBl/GYETtf+o5SWM
         C6zm14rGQ/rQQghOdUh32p6K8oZZZW0SITk4CJ3hOSEs4tnY4suHyQIBNfGzRDWWnrjL
         W4LHTfyHVGom+ngJ7p9WMT5hMMZg3GYmdgSUI6ulVvs2ewPTxb/fd2WEfjZ/HjHog9dw
         fpX/0XZD+KLcPMbeJQNoT1JzegaGqRECgVNGYNnixMIKaTeFiyH+U1D1rGvN37ASucEg
         S8DlX9wo3aA2ojWVD//xKzL9LygljbB9yUHBnxJOlmbtprKdSuJ+Lu8C2mzzOGsugYR6
         MSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411187; x=1789015987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=UP4idz42jwBLUa9bNUhVfBeNZ0z1Trf6G/EwNfVcBjlt2A3ANz/gGrwOR1gIh8l2Dg
         iycgzvvdvFnWfXElxIgazfEzgAuENeddCwXLSg9lsYxFywQaaWJho1QzGF8x6VumjYOG
         EF/O/VCqGUFTQ/OSttelSv+HjMNahIg1y2dQZCaqDdHJR1vs+K+gze2teOPmxdyjksP2
         oB6SggdE6Vzd3hfP//3wwkIAHIsGHU90QzzwO1iT2xqCcjgNTvdYh41aGJaJFmtPdBUd
         L7p9fCtNjt7rIxL8LNQupeKdT0wfoB3NDeogaKBzav4bgyiVc+5F+uaDSbwXM1p3fWvd
         6C9A==
X-Forwarded-Encrypted: i=1; AKwUvByVq8zUBhZmRJtvdMwY7hkzy5OLwc90rqF+NvEHj/cENK3PDFxMMgN4vzQurtSSbxwZ1MJzaGzGLCqphWDdAnWm@lists.infradead.org
X-Gm-Message-State: AFuF++ngU8J4nNkAUBn0PpfGW6Bxb2aYCS/E9E9H5cGrrAloXe6Ho7FR
	fLYqVmjvjnQ9Nd62/BF4XQpwNOSF2ViP3QcYNfJnsfs2G++pxJplcEBE
X-Gm-Gg: AYBFou2++D4AqgvFZBxx5hXqUpj8NYLbdWwVOcIDPDDymtNydUXXdwz/s26zWsK7kQ5
	GCG1ae0D+MwFSCiUPNVr1cuoEKKCCUWd6AyAstseiJsqbVzZ8sJNy+Y/nhJJsAxDSLk5AnRPjaj
	/Gse8lcvDonfrHBDiWzUACWaziOC2dJVOfLLxrcS/28chOpa8vkLNhwGmvl9HAtKJB7xRqjIZXV
	J+QyAoo6NJfCFJP6JZ6MFrT7/gbJF2HwyI1ji+3vxnUhq162sNEeifznRgeihkXmj+6C6ko0Q+b
	KUAMDOV67lpY3UTpIl+nf3XgUuBkGiqd0gAZdxPiuu7+nmlYBYMdcXujZ9bQdAvGRNd4OGHr2R0
	sKrXwbvAs+T8DpodbNNlTkZdxrzAcbvZWqSN0vavxrQmPFhJ05kHLv80GSV3JraQ/M3B9ZbdivM
	LHHWjyvfamUc5oRYST1PAl8XC85LJ4hliZHDAGAs6C3gQrAalFF+IA2/gWTgHkHkxoLrY3Bpjuy
	aUgH/Y+lwU4enTZNYBQdbohRCYNFX06paZX3uFneud+wSp5asNvBcQQgIpJKEmPl7Eg66g5l6Nv
	M9Nl/lbySOZR3CqU
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr14283857a91.18.1788411187416;
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 11:52:03 +0700
Message-ID: <20260903045203.175337-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215308_277186_AC561AC7 
X-CRM114-Status: GOOD (  13.68  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


