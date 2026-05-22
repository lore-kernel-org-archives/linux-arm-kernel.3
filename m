Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCEBCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=; b=QhdBFL4Ak9ptzjt9wZtLaiYG4s
	yA0uIdYHsTkS6AwATpiVejmiOZQYWLh8Sjwwp3N3hXFa0p8prQjNorD315dHoY9cl9B0bBx+b/rIz
	mCtrNOCgaMFI6ZueI/zmhbaDrvJxskj4Sb7d2Jt7WP6+KCpHvjy2rh8s1+5MmmxJVxWiCohpIqbvl
	hGV9tu4E/vEKr1mVEpmwAGcXbU6gcgcj/DvtzGUajqRzuG+KpAt0E/oZG2AARuh8fBat/30hQTbWr
	e71AWGzfcTM9/Z0DFOsWQaIbla903aBfZBFuVJAQme8Z6ZXmIsnGCNr0TH9AMnZ9DrlS0DI6Ccxub
	ZJq3GuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaP-0000000ANW6-14yV;
	Fri, 22 May 2026 09:54:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaM-0000000ANUr-2Gvo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:54:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-835386ff122so7310013b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443670; x=1780048470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=;
        b=jokRnPJX2JGIIeiHYet3ru00g07uYGm3q+3iP/67NBH267wYuLJnlNZ8Qq+dieATeu
         z4Z+TzBY2/unfDKx//U7dG68qsZKBwRW4xz9MDjuzGkv2HNcBezFGJ3hKpr5iN7Atj9z
         CTNqRcZaQHihlh4RZqrgM/hpbTBcuKXhbMugsdAHQeEW++NDXmjgOk3pjoAIHshIZyAU
         tLV6uSiFmauP+AtNiK/sLFT8l8rA9CdyUFCsOxf6ShB2Fv+y7IlXuBeiKZ+rmdpapIWO
         uaL/7OsJ1H70FvR4cc2exNo7m7XEnJQis/xhz8gcqA6YrX4+Mp6MKHCxTqsqUeDEWItn
         D/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443670; x=1780048470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=;
        b=Ea/6K3LacbkczVl08zAzolj0t6KjrSEar5ZUPC3LPRaFS2qSM8gvqiFWt+YNOBE5UR
         hi+zbPqPwdW7IZSgP3+KiEhq9gNYbJrvU75TfVcXGoe3cS8klk+ery2Q6YpFGYG+mtGt
         HNOe9ctpIdaooCvtE5WzsYHZn6DGv9XkxqkWSUab1zvqbIK85MlyJ9b7QP13ZZ7/cMxw
         h6zrHgr+3cbHD2gOjiB+CDuj0E8l5v68LNEYb2vzdTyHr1NT8SmcYfLRK7xVtlarqjYY
         AXaAfV8XOq+khdK9hRZvagXa+2Ixavm+XPvDCCTopKGNoDa9fTlTGz6Y4cWVeueuu8/x
         XIJw==
X-Forwarded-Encrypted: i=1; AFNElJ84u5EoJ2V+KlCw4NdIY2+QdlPfBRDjLkpvUrxLCJHtCscYlED+n7fyywazzHGKjQv9wZ9AAvIwEjvisyzEy+3g@lists.infradead.org
X-Gm-Message-State: AOJu0YzYthX0pL0Lm+mM/HJZ5xpkbRnhOZJSXgwuUPaXUgmQYxEegN9L
	/S/CbWa5ujKe1fFJn8npBbAq+wZv+gup3oU0FDrm/Bx7L0WTr57BxvHz
X-Gm-Gg: Acq92OGf97n/ANOBwW0aS2v2q2OtewCIZTGzEHlZhO43dXuiMpYvOfIbKFbiDkM67Ef
	BwR+JRk8gIKYt0hn62wm4z8VVmo74WTvoEa6PeaTLQEUjeU3lbv3FRxoX8PKe/MTBWisbXeqtQl
	VcukmF/TO7EcbCk0/LLk2tGS6HiwMCfPOW3G9gZlBJsyFDqPyszUYUVwo0f/m5iOYeDZzW6Qpg5
	tejxWGXG7N5aUVnNQzvBuOc6pkOYUuMuKQF6bDfaMEEQr43AwMkvzRoN9hdayNEPcRP0Z8qaCF+
	6w53azStM/DMDMOjohkSUQ7JULd7wz7OQPdgaBKr9YWmmCWFq+q2ZfqCOOGgoGP5qpsbZzbzDNl
	wadOwsfhn4ohzS+PKKojIv15KyObrpL4+HKkbA0S3zjaPDuXrycQc9svvFUeBRy8UmXK2gwyvcT
	lAnT4ghxrj9HLyfBCTm57N3yosappTn6/88gaEzhl0cNkfJ8QmhY8iPvc+mpnaz5oSMf08
X-Received: by 2002:a05:6a00:2447:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-8415f65c44bmr3236104b3a.42.1779443669845;
        Fri, 22 May 2026 02:54:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
Date: Fri, 22 May 2026 16:54:00 +0700
Message-ID: <20260522095401.72915-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025430_586369_F5185B13 
X-CRM114-Status: GOOD (  10.89  )
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

Accessing registers while the device is runtime-suspended
may lead to invalid hardware accesses on systems where the
APB bus clock is gated during runtime suspend.

Ensure the device is resumed before accessing registers.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 89eccc83a130..f54eb14c9ed8 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
@@ -443,6 +448,8 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 		status[5] = (reg >> 8) & 0x3;
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return 0;
 }
 
@@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
 	bool chg0, chg1;
 
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		reg = (u32)status[3] << 24;
 		reg |= (u32)status[2] << 16;
@@ -479,6 +491,8 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return chg0 || chg1;
 }
 
-- 
2.43.0


