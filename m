Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E7BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=; b=HjbmclRVsdXwF+NHk/d+Y3Qouc
	mh4HozCr/enTHGrFgEtm76fNmkHIj1TkmOrkdWYPvvoBe3+t/6vh2K5gf0IiALI4muxHNykSNtvOx
	vgUDUGdTKJhVZgRKc1P9ZP9iFBY2S8Jc99cdjSkty2kT3zPEE66hW4aVqoaP3VUymLZShbGro6uPY
	/hhr5YXnxlM44m4tVztmzNKlQYjuth7kV9EsE6B4sM4xjn0/vCZbQcjMJrYRVhvTTkMP+LJK04Y0Z
	c0jMwem8vgz8KQWpuOm2di2lX5EIuV40jB9FR9EHST36o5qFBXfjswk+XhGH5IIvQgcTf8hkJDjCI
	ZKNV/vQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYN-0000000Cu9A-3QEd;
	Tue, 02 Jun 2026 11:45:03 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYL-0000000Cu8N-1Qn3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:45:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-842273a2c4dso2197358b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400700; x=1781005500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=;
        b=JENlVoRd0jkf3fbC2brBFQQzavw+ynaTOyZak+fW2MdFlg1ifCwPPoycwgaDdMmOMa
         VdL3hKiVV+wj1gVstRkKCOFrHL4Ydh/bkKYhqAzJhqOZY01KO5P1LfrKBu5iU83Gv43c
         bOzjHhLKKnRlsjj11RRBgzMCyyVJqdEi9g+nAzHFIJUC5/hlLwVI8zipjUUHVPdlWpM/
         YAU9b2fEGU4xQ1bHBHtMxySjU2fsiCD0VgYjcUVwGgMZbLaPT5nvjjTsBJJzu7va60CL
         nVtK4Rac4anbx7Pkr+dxkUUwLda5Bxr+Vprq81oNyd1nRq/FlyUg5LWMVkApqfy+vHJE
         LGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400700; x=1781005500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmC4zYF7/VSFzDxDUcysEBlqEWK3sw1salrmEASv0aE=;
        b=bxSfBAc0hYbB9YfH4Ig8SvN6n3ANNNHQ53C1MTu+GcDTCSuJtj45UzS9YcMCQZgwAN
         UXBLCnmlJqYHlWHbqPA4oMcCrpYAAYY8aeZSE0B5v1QjDv4t5D5Rw/J5x1a3IIRpvWGD
         8OOHcuO8eTdC8ZZLWEl1A7Y1q6A9PIrvy9095RPFpqXPt8b+TCKSW/5DcWcZdr/2UIHZ
         KqrW62VwPyx47FLOqYJRFzMpt1wRnAnfiF65SHew6cSS9tNsccujKP+Jcw4KzCUEUs5V
         uUDkTjCBHhnI0JGliC4ixG34iRZ0qZTWlnPuHiLi9++MRPs0mc1Jkm2LiGz4umkqTj5S
         IsBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UKn/9wpC+eHr/reOhFavunGXqSKUcp4QSOygrIuRKwwQcB8nT1+tyzEaV3KJxSraY96KwpS+No77T799SotG1@lists.infradead.org
X-Gm-Message-State: AOJu0YyCfUta/VPFepGd83h2+iSYFaEPPSLAwZSaEGKQwMeQc8fEE7Yj
	pREma9109eRAaRMg8xc7tXnif2YjFagdMw5ktuWkJ/ouj1Ad+KZ7fxOh
X-Gm-Gg: Acq92OHDGCnNJsS7DGGql+G3LiZDvGqkuWQVDfSy20wzqG0TkitgYeQQS+yXap/4F4i
	sXEZJ5qTIWpzUXUEabB6nkhf/T4xGrvtfzMJgvFB5xpj/MKGH6GGsx6c5+iD1za/s4DgIrPENlR
	LnFVfE+e7NhybfP0WzpLrXPTx+vGcspWgRsAfJ66xoE+wzFm76/1auhaSxCj1v7z0kDCs1zFG5J
	xZCow44pWczO5VxEosEBVvkua/W2QzDHoW7uarGldobrvgxNVEZsTDarfP/BzSNnpyOfu+WjTEi
	D+4370hC8Jcl8JMBebUxkmaYYd7o/lREuD5vSpAK90wV1IpaxcIeU3xCS7NNuYcchDgDPEFVhZ1
	6zKyWxkwV5LnSLLTeo8pionZDLIj1lYtmxPBVMpp05QcZCZUt4VtEsn24m1CDEZ3mro4F+f+8vH
	0HDSW7ni6fKHYnhOF6rAHvd15oyAhXkKF0wZe3Ev1IQHoaE4BKP2kWt1d7g6FB6t2YBiri
X-Received: by 2002:aa7:88cb:0:b0:842:6d95:261e with SMTP id d2e1a72fcca58-8426d9538a9mr3400413b3a.41.1780400700453;
        Tue, 02 Jun 2026 04:45:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:44:59 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
Date: Tue,  2 Jun 2026 18:44:35 +0700
Message-ID: <20260602114437.50324-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_044501_559281_B34694F9 
X-CRM114-Status: GOOD (  11.90  )
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

NOTE: This patch is compile-tested only.

 sound/soc/sunxi/sun4i-spdif.c | 62 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..89eccc83a130 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,24 +427,21 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
+		status[0] = reg & 0xff;
+		status[1] = (reg >> 8) & 0xff;
+		status[2] = (reg >> 16) & 0xff;
+		status[3] = (reg >> 24) & 0xff;
 
-	status[0] = reg & 0xff;
-	status[1] = (reg >> 8) & 0xff;
-	status[2] = (reg >> 16) & 0xff;
-	status[3] = (reg >> 24) & 0xff;
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
-
-	status[4] = reg & 0xff;
-	status[5] = (reg >> 8) & 0x3;
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		status[4] = reg & 0xff;
+		status[5] = (reg >> 8) & 0x3;
+	}
 
 	return 0;
 }
@@ -455,35 +452,32 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
-
-	reg = (u32)status[3] << 24;
-	reg |= (u32)status[2] << 16;
-	reg |= (u32)status[1] << 8;
-	reg |= (u32)status[0];
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		reg = (u32)status[3] << 24;
+		reg |= (u32)status[2] << 16;
+		reg |= (u32)status[1] << 8;
+		reg |= (u32)status[0];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
-				 GENMASK(31,0), reg, &chg0);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
+					 GENMASK(31, 0), reg, &chg0);
 
-	reg = (u32)status[5] << 8;
-	reg |= (u32)status[4];
+		reg = (u32)status[5] << 8;
+		reg |= (u32)status[4];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
-				 GENMASK(9,0), reg, &chg1);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
+					 GENMASK(9, 0), reg, &chg1);
 
-	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
-	if (status[0] & IEC958_AES0_NONAUDIO)
-		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+		reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+		if (status[0] & IEC958_AES0_NONAUDIO)
+			reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
 
-	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
-			   SUN4I_SPDIF_TXCFG_CHSTMODE |
-			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+				   SUN4I_SPDIF_TXCFG_CHSTMODE |
+				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+	}
 
 	return chg0 || chg1;
 }
-- 
2.43.0


