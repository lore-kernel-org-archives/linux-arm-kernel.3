Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB97CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=; b=Inp8QAURHwbdw8f4Q699vMsUZG
	vpATXuJfatJPJNu4ChMDPuiA7bS+csss5CwSOL7ZDAg1kXMrw26k+MWHyMRdlCbjKsKioWK/MdbBX
	Au6IrKoMixMuoay4lLvf83RApJiUPjB34pryrtfHSkiuiLU05AHjHALNNZHJk1ptDdEzYSkfx/t2m
	FzwTUhfdMOzpv3YBM2lRq03+UVnaDzZhpNz2iBnDNj3tZNSJmqFz3SL6ZDp7sADVkuEVqHGcrOHIV
	KP+fjv25B+7NjtmAYFp1/OK9N+YjrYOnwBVFZzJt6L9bxsKkPN/dIRO6Vv++Ni+O+4l0AhEYPNvGV
	CUkNl98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYS-0000000CuAy-3qUX;
	Tue, 02 Jun 2026 11:45:08 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYQ-0000000CuA5-2uxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:45:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84237c55ef9so1047439b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400706; x=1781005506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=;
        b=FCJKMTQGvSF2eNggbTN+ZbZlr6RQoQmkZgR2ocZKHNyNuhv7uIui2PEfRk63SsNKn4
         W6c3ocg4YOes+2X9f2wHvHlMzBaeppGboEzfT4SnzH5PAD9044W1E88cDmYwR3FpZza7
         1kz6+IXlE5OQ142OjcRFrqH26nWZzbAbS+t86dwBKb5XMlV/uWBcrKo0Fo6D8gyzbmPP
         DZdpOfmidUZpUOZQ1FYkC6rsTh8nyubvojd8c7PgCIjdDgHcvoJSJKFcy/BWNCe/xgZh
         rL4OJY60tJKibLB1r/+eiZjRN4FgYr972N67PazSIU1T3ivU+5xnH2FtGeQ0110nLpRG
         m/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400706; x=1781005506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=;
        b=GLxPm+scL538IfD4iT3sUfd/11k1MakeVOIVmgOuVTUP6rLscMC0XxCpbAEgJG0sJY
         gLdkWZyzHP0xWq5M0+L/8pyEAiwsqCwT9kGEFVY/Pq4njBmAYH/pN/koFzWv6oKt2UJe
         tcNQ2vMmZtBaGAV85wLsg17i9i+zY8OjezKXu8+7HLJcYGhUMfV59JHPtnW0rH0bRVJb
         hncFWA0gLrU9dmkx0PQcbvXEmyaiD3Fpl/ILviETWaQZ0MZTtByfjth+NT7bVsi3gv7n
         Veio1nrub1oSAvCCbeP9VCRUQHXM+i2Tz5vRs8mjLJYGSzqngX9mDaaco99oOY+T05iA
         Vw7A==
X-Forwarded-Encrypted: i=1; AFNElJ8vN9r4TxGA0TReBAIByxuarK4P7NQymsYtKGASf4OZJSz801NiqQfGH8YRJ1VBzxZrOJk6giBFruigoPMVi439@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf4oNFmLEiaWKH5sZWX9DcXlvCUIjgJxM0XF6Z7FXErBTm/ieU
	t7zcr476Cxx0LnRNu1K61W0qx9j0UNoFGY+M7TAYaMKWosxKPVO3Yfmx
X-Gm-Gg: Acq92OHl6ZmXgB4RErDRuEZKUybQJVj8igAcUPtq9KgJ9jfX6cglz99dCAcl+f8kKLD
	jgo0wHTXq/qEvdKTx7v1qkjzkb5LhjL4/+V4IzgLwARPq+sF98DYj7m7MCICukJhojqsOV3DmVA
	mphlBWzXORrpzF6STswf4FDHohHMOjofuBLvWYosnjmKwRDb4mL4Cayy2d+xdIGP64YN+J1LMht
	TrGAluUtBGswf8q4yl2apCnmQ81V2lSttmUB3wQazbbQgTybdxBKIFZsjtJFOc/v8nVqjUq4RkP
	PX4GTH0Ns9fxDMviGfV2Sys3+4uUDhgKZSepbwCQ951cwaFVp+LKdQIy2h2hWDRFdzAfgCOORif
	L6B1IAcwfQ+Aj5nGFi6gxmLI8VxLTzu2qfM3YJYSgfJ3pTvUavAklgI/DvmClaCdZKZx8dSdkcY
	lj2wuKqOfT3tST0tz/vzDaENkXx0Ou/CtnzSjkI7JrLCc6G4PLkSzKNl5s2+e5XD4cPFN7
X-Received: by 2002:a05:6a00:2d8d:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-8425b856f49mr6797766b3a.46.1780400705444;
        Tue, 02 Jun 2026 04:45:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:45:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
Date: Tue,  2 Jun 2026 18:44:36 +0700
Message-ID: <20260602114437.50324-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_044506_741394_B3406560 
X-CRM114-Status: GOOD (  11.19  )
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

The IEC958 status kcontrols access hardware registers directly.
Take a runtime PM reference while accessing the registers so that the
device remains active for the duration of the operation.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260514043314.62222C2BCB7@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v3:
  - Add Reported-by tag from Sashiko AI review.


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


