Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F144FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mR6jaRrQtul9BjU1rNfgdz8/F4zlTqQGy4RoZ421d4=; b=FwhJ2zegALul9FF8njYQ67S2WS
	A3FtX3+DvArxe2lccaEKnHnVXAnt9Fc5SMGath+cDaBVmTNJEO/W2JyQ2qvpiBSIjSzt8F5Xnsw8h
	t2Ed7jlKd3JeQkdIoKBIQGL62NgwZfgzV1zd5kYq41Uz7SfyVIbQPOnRp6QuSPel6Ft7kKoyP83FP
	09RL3jHlReGJSor8cKGU2X36lo8A+nSfV5zuASQsNgsOgd0loRzhp06haAzJbD/iQD5KG1HW/6ORa
	py5tAR7RU1ICCwyq6WttMngByfZJzRJjaRFzRM2hNV8hT4VxKI3GAHwFAM0nZb8W18j+CufEwttUK
	SWuL7FJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI12B-00000003JbP-3wIJ;
	Wed, 29 Apr 2026 09:16:43 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI12A-00000003Jav-08e0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:16:43 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c648bc907ebso8096609a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777454201; x=1778059001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mR6jaRrQtul9BjU1rNfgdz8/F4zlTqQGy4RoZ421d4=;
        b=pt0+SS3hpDGC1WWpTxqG+QDPv2DN1EaTZtsVKSyozDRCM1fD7QBzoQtyNASxMUw0o/
         Dxdo3pmkaFKTVlTASp8XEzJx2dMuSKI7ng0zLM1RFdiG0OoHo1ztZK6iM0qMX2uphOOL
         A8XjLmdBEHrAwmm7qaWksPZ9e8ZVeb8qU8XmnbERdpU+DcLEqkdcknTT6Kn9bOtHHUYF
         XMPpR1jHrv/fpG3DpsDyMycga0gbGEYPFZD0EwtHyhXKnRorYMpYDSkN9g5GgSMME7Nj
         QO3vUGWO1DabioTY8+ddnXRuPqsmQZW2zbU24yVYYExcBmnHvwjAri23gT2IQt3NZXSG
         iejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454201; x=1778059001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mR6jaRrQtul9BjU1rNfgdz8/F4zlTqQGy4RoZ421d4=;
        b=WBibjpGTjrwvgpemVicUN2iZTfytqt/vKc5/m+JIVc1Ma7HwKqAuiAYRkekPWAbYd6
         nIh2rjVTHXjGClId66USpUuck94Ijckv+7p36gG40RngZW5l3lhEt3QeBAsC+4qkLzH0
         2TtGTAC1p4x/w4/Q/mg0rQblgXy3ETtRyuQxSG1q8ocjlNN/BHCJOWzbdfOEmDNEJ/Ed
         D8OIpvztSTdGm+jg5GtcJIlClJvSzBNmOP34zoWsuHsSQwg5JtIyRKzTpvcbEvQfjF8c
         NVlCfeqqHtT1lxhTh1zJCj7wWXK0tGx5Eh1fB3Czs/ECuLzyOGsSAiH0jwHsTMKPJdJJ
         Cr0g==
X-Forwarded-Encrypted: i=1; AFNElJ8z3NOswMSAkCwG228wEUWiQtZi2RSCZv37Tv/8M2ELr8jvs0yKCaokHuuFtEipROLeZF54ZwDuAKvbI5TFEwop@lists.infradead.org
X-Gm-Message-State: AOJu0YyX/CjcJAi/eSTZkqISZ3BHvGkZvP68RiRV8ILwC15r/uQZl+oC
	tZuo6H+cyTSVWZyyEhAh5MDA/rHbmKCfMsBkWV3hIY2q2fg1wPMiMA3U
X-Gm-Gg: AeBDievDbVJ3+E9hNpOOgOeFjYi8sPJTvS5sX+W9XC2R3s4QNk4cUhppnHd1RgqVsAa
	yOmUdnUUzEUu+qxIA24S9nJNVnAz5OPPVUKbKpA2VROfTtwa8gJ++pqDtBsKF2i1OZfYfs/k86e
	u2GT5SLuQjqwZe4jB6/Ru46A+0Qwup56Jqr/OnJ8K/W4AjqD18N/LcRHjTNYMP82DtxR321bQNH
	clmFEai64F80MwJm9IHgC+mldMO38ys/R3XyvI6hP4aDR8T05W7EZka88eY+UfHAXJmQwT7RBS8
	DxW73WHTEp66UXQ/juMJkQZWgcQsdHEvENcTeW5mFSXdETuraC/04z7NIsDuZQhGFsnvama48I9
	0s2OG6SNE+hrgDT5GIRzzorNUp1Kp1QPy5rz1rrLMlYgo2GGVGxKPUn4FPJrVcLsV/dV3KzgQAO
	2ZbMxmaMI91FC7F4WSjqtk1mJJhxbaCSLwofIowB57xYp/nFyop+IErPxgru7tdMwMZDTP
X-Received: by 2002:a05:6a21:e082:b0:39b:d937:8010 with SMTP id adf61e73a8af0-3a39c388dcfmr7710744637.45.1777454201088;
        Wed, 29 Apr 2026 02:16:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm1586865b3a.16.2026.04.29.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Miller Liang <millerliang@google.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: uniphier: aio-compress: Use guard() for spin locks
Date: Wed, 29 Apr 2026 16:16:13 +0700
Message-ID: <20260429091614.96667-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429091614.96667-1-phucduc.bui@gmail.com>
References: <20260429091614.96667-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_021642_099432_E5D00A9C 
X-CRM114-Status: GOOD (  12.80  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/uniphier/aio-compress.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index b18af98a552b..57247a03b5c9 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -183,18 +183,16 @@ static int uniphier_aio_compr_prepare(struct snd_soc_component *component,
 	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
-	unsigned long flags;
 	int ret;
 
 	ret = aiodma_ch_set_param(sub);
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&sub->lock, flags);
-	ret = aiodma_rb_set_buffer(sub, sub->compr_addr,
-				   sub->compr_addr + sub->compr_bytes,
-				   bytes);
-	spin_unlock_irqrestore(&sub->lock, flags);
+	scoped_guard(spinlock_irqsave, &sub->lock)
+		ret = aiodma_rb_set_buffer(sub, sub->compr_addr,
+					   sub->compr_addr + sub->compr_bytes,
+					   bytes);
 	if (ret)
 		return ret;
 
@@ -223,9 +221,8 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->fragment_size, ret = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
@@ -242,7 +239,6 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 		dev_warn(dev, "Unknown trigger(%d)\n", cmd);
 		ret = -EINVAL;
 	}
-	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return ret;
 }
@@ -256,10 +252,9 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
-	unsigned long flags;
 	u32 pos;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 
 	aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
 
@@ -273,8 +268,6 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 	}
 	tstamp->byte_offset = pos;
 
-	spin_unlock_irqrestore(&sub->lock, flags);
-
 	return 0;
 }
 
@@ -332,7 +325,6 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	size_t cnt = min_t(size_t, count, aio_rb_space_to_end(sub) / 2);
 	int bytes = runtime->fragment_size;
-	unsigned long flags;
 	size_t s;
 	int ret;
 
@@ -360,7 +352,7 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	if (ret)
 		return -EFAULT;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 
 	sub->threshold = 2 * bytes;
 	aiodma_rb_set_threshold(sub, sub->compr_bytes, 2 * bytes);
@@ -376,8 +368,6 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	}
 	aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
 
-	spin_unlock_irqrestore(&sub->lock, flags);
-
 	return cnt;
 }
 
-- 
2.43.0


