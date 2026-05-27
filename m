Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA56CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=; b=s/Yo+YLv5rLkW4uhYQO0PKYd0z
	me/u85ugQGBMXqhkv2tW/cLCXt+vE1M86Hsl3PDcw80rMfg3ctljeqGQpdVoPDVlU2hh3nsODRvYn
	hKDhz8K0KH48Fxq62DEudPcpG4Vt6fTqhqY0MlztfReM/vZ26RAbfSBzsOg1MfdsRnT1F57SkiEgg
	Z08db8irAP31BzFKEalWe0bkdVIX0dCxAQbYPrQWE3rIIjUy+pM/ocdf3ciTd3hreRVSVXj+6HXra
	ZoHSqftfffUadKXLD+SDXzCR8NTzPq/Qa0CzMgzLNTpH8Xg2zVp/TGc/oYLur7+Gjf+aw7CtXmEao
	TUz7ylFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEmF-00000004FZx-1knV;
	Wed, 27 May 2026 13:58:31 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEmB-00000004FXN-0opK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:58:29 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-134fe980658so13407147c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890306; x=1780495106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=;
        b=meyKPQwTdsYYfzpS1JLjVRAjkYFQMFCXRjKDpi5xO/0hnTElCt5Cyl/LhwLjd3fUqZ
         1nJLdXdom5eqd/9Qtbgc+GzAL0v7F6Y8JQeL6OtSvY8w68zeXLoxcNv+HxEXrZbUWIAo
         LqtTunlDx0M5IAT8xyyDC3fDaCr5wYbaNY9XAOuM624UrdWzKn0LQHrfZrpM2eV7tuzG
         KMv3MHlZeYlR/uYFQg96TguuorCoFZNytMi5RoDJLXEHVE29tIX2kCCMYOrMXnaP9qOB
         upowk6eN0EBJtLqjOhhnEUY9nC4G+AdKMn5SwftvHjBnf+o1vUT7IXssmneZhM9acriF
         ONqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890306; x=1780495106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=;
        b=IyOlTTrenOovQlAeyDh+LTkK7alSf7b0uTu++ek/YACEIEW2blYPF4Lh5Ifl08SBBr
         i+wlCkC45oKSDHVWBrVRVzEkFXeN/evNOwVQDKzbZOZ1uSYmZoZ+3pYSardh/DL4qWPN
         47g4f7zR1TSP7Lyvb9OFiKzb3f33VEB0ZflFknj7hLToqrAym2aMbD9/4oql6Kpus/DA
         bqHsOHS13iWx/ST57udY0CuskJJuq+wXCWBl9NDBOXCPCWbGESrflKQ466HUnJJ+MN0w
         1CycHfnv/nbrWVXb6ymv1f1xhePkN1gnISujshk6MYgvdlQmX/SYuNF6hVwR6wDjPpEY
         YzNg==
X-Forwarded-Encrypted: i=1; AFNElJ8XnwbFd8B+7Fzwd4fHXjxzhYGlvxkk+6uio8SR811rjc6dXD1ZD/UUwpW8QujFhpjK+INNdQ5Sd3lbgMGV5zXV@lists.infradead.org
X-Gm-Message-State: AOJu0YwPn6xKgoST6q5JCZ40iHAwu16mlFIIMbW64Ayq7GWuCTUqHEsd
	3Y7n7PbJXE1u6AcuvmpumAoONR9CNnYw8LCBmDMvbhG9lJ1WImQwfi2I
X-Gm-Gg: Acq92OHB1cKIOz6XmNxhiRxmeGcJgr4CAjYd3ad6Vti9kcSfddM7jdnNbQKhRC6RAFn
	Kt3ATZoG9y5YOfQRf2EojoHH5t0NmIzzi1WdbQAs3LkZJnwTaMmc+T+zdj4dC/jplLZGZ2teMzH
	FSH9J0m7TN9VWQSpkd0pVAtqLgJqps1ez+Gg3ZkM008gMO5Ty52KDLcGw0eI/ErZY3jz2l5LsRT
	TScCpvMT0o8DFv4fJ9biCpuuZxvfXOD7V6CQB5k3OPQRFaOQ1q1Qu6el2SHiOq5/3UFpY4SjRUH
	HYc6o1bGkCdWy0h0yqW/EBzWo9Je0rzz+gMZ/5iaTKjSF3p6uo6bS8/JxxKOUWT7C9OeMPZS0no
	OP4leI6YvocPxP4loaVhwYaE87TOh9YSo0ZP0xowksg+BD/91dQWsrdNSIXqN5dptddeGGq/5Ke
	E9JVV1fqUYwQEWl/+Ca2ifvSt2Py/Nu7YqonlEA8wIemHavTSyOLKPHPdacvgb1xLcBZbNiAChu
	uu58ZeNqV9s
X-Received: by 2002:a05:7022:62a6:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1365fc6932bmr8295204c88.41.1779890306165;
        Wed, 27 May 2026 06:58:26 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:55:47 -0300
Subject: [PATCH 2/2] ASoC: mediatek: mt8192: Check runtime resume during
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-2-1bb834d05b72@gmail.com>
References: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
In-Reply-To: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=AiWKUJ6pcaS+s2EMRR0lpjZ6dv0VklPnVPvbjxXu/dY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4pklll4m/lM4s7ZEHO7aHXznfQp56/39sv0p7Ap3
 3zr9uJQRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzkyDZGhqXrhb+oauy39J/t
 8NiuduspzslHDBLFfp62j3380CxR4xbDXyHxP0ruxx7puPtlON8wPb8vSjhoa8qtDba7ZzC/XBL
 rwQAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_065828_258802_28A24859 
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

The MT8192 AFE probe enables runtime PM temporarily while reinitializing
the regmap cache from hardware, but it uses pm_runtime_get_sync()
without checking the return value. If runtime resume fails, probe keeps
going without the device necessarily being accessible, and
pm_runtime_get_sync() may leave the PM usage count incremented.

The regmap_reinit_cache() failure path also returns before dropping the
temporary PM reference and before clearing pm_runtime_bypass_reg_ctl.

Use pm_runtime_resume_and_get() so resume failures do not leak a usage
count, and clear the temporary bypass flag after dropping the probe PM
reference on all regmap_reinit_cache() outcomes.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 9f5057eeeff9..db0ae44a86af 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2227,15 +2227,19 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		afe_priv->pm_runtime_bypass_reg_ctl = false;
+		return dev_err_probe(dev, ret, "failed to resume device\n");
+	}
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
-	if (ret)
-		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
-
 	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
+
 	regcache_cache_only(afe->regmap, true);
 	regcache_mark_dirty(afe->regmap);
 

-- 
2.54.0


