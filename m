Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEFFCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=; b=aL5eUUNchDuj7kq93tnUuemih/
	Nz4UYmXPEEHXzWb/3argLuJjmcJ1l8U8qRuiJerfBsHGGdMUlNVWknzhQ5OqHsV1JHIo5RHYP7EPf
	kg/OaN4ThTc74DWv+t/4h/1NOq0Z89uIUoEXmkEwuZSqYPYXk1vVhQhEzZrKMTIsYCbQfXCcbamTe
	pGgz9YoXnhTF/HjkubtTLQ0zs50Rc14q4lIdNdqNnspiFaeKHycFvQ4Va1yK8oAMgeeXOGgDrERvg
	xnblU72txokVoDaVwxTektrd0REIPuiiYHwqm2LCBnwX+UOgNkl14r4jyICJwbilTuvFAx4whY4UC
	q2OBEcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaP-0000000ANVk-0cii;
	Fri, 22 May 2026 09:54:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaI-0000000ANSt-1FRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:54:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-835399c11e0so3267843b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443665; x=1780048465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=;
        b=LqqkYp+CLVc8vmbtpTu936J7bf5VwWscImRrtuRu6qeWDFVT4hUrqaTrBgLEGxbmxn
         Oc6A0BrwfcNnOxDAuGyNIzOLwuDgsE59Yw0sl0gg/9VV5xL2uD/XmFoy0wj6fngx0ohh
         rmSRj6N+0JHDHnLysIx6YODne4rGZzlPY+WK6M/vz2FzgeXw5N3YDPZoe1zawQNemuE0
         SbBzixHb+agGsEzFvVZ7IcoZTtEhjxVuOqL6Bh8es2HAJATlFM06PNqW9Vlr1D8iSqUQ
         wuvOwB0j3WlPbrLITdT0RNUdkMstGTcz1OblmHDnC0wLjiUMWKhHkBQZbHGAZIfF0KHD
         a4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443665; x=1780048465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=;
        b=T78EF1g6dwV/W8V8KjbmPd7OIvK6uXfc+ARXj4d0mNNsRNPTo+xE/nUGagPbIe86cI
         j2Nr6rUzHvohzne7vbhtCESmnnGMiYJVA84i0ETypShyMLoi4txHbC3xg042PqG23l6l
         zR5Z/pyfsq0/Il+lG4o1PibvRd/z7tylMZcGGDAp4oJNhCe7HiwdeOk/zHtWszacL6Z4
         lpoW3LUNy3TCj3bBgId+egxZUBRoRko4s+W7XidBsScFpKpnOY7xypNoxX1CQjn0XK11
         FkJi80+Hy4Uu9p60D8uKdECQs9YV8uJ8AJriYTeKS5sw5/uvWICoI4CKu8Dx616G8h/K
         XZ6A==
X-Forwarded-Encrypted: i=1; AFNElJ9PmlPflDfbGI6W4sxpJHJhYRFKDRZ50m5wTbsw+ZS//EpYePFJ2pHFXSFbkiSmlwBgQ6wK9jDsxhh1z27QFXc8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi2pmsgJ1vsAqX8w6IhboIxwdtvJVdRuTB+QiO6pBHIpUXOTwD
	Jw4c0sy0EYnvceOu3JNOjb2D9PQxbtdcU1FJ9suJ7Pl+zdLLn+g1SZHa
X-Gm-Gg: Acq92OFC881BZdlIPSGfTEygJdVaIcMcxtErUrsR4j6kqL52uEI3pWX9l+UzhRwQHda
	QFa4zRjHZeeI4WOn5pyk2j+Dy1WXddYeYCvp25azHJkr5IQgpRQowYmBkf7hZwVXB/v/Tm99Pju
	3kqlxSeIPtW7OjJdgsea0Z98ceK2scmPEL+Y24ofx9VJ5RlD2KSLUP+JR9nI1zkx646Cli4nj0I
	CJ4HHpjl/uS8d4cAO68I6P8smUbiK0LGIW1/opbkAlfaUBszukF/tIqDz2eyfj1rKQIaEMaz374
	R6zgat8PSPTlqRVD3GvVGuLMxxBgxLUWQ3cVi5blmOGMAoTvdkiTh+HBCf3+a7kMzBK11yxmbwz
	MGYoFjnkneOxveqGMeMACSj55dK9eI3pnZSZ78619xj3RBseNqJOJftLn28+EC5eAIH2F6LcUYr
	Yt+xegfTdkCYZR00slZpT0LZkFO2DrPbeqBEMzE891+o3tkUiDk4gp0bYTJg==
X-Received: by 2002:a05:6a00:4b45:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-8415f5ea4bbmr3190006b3a.21.1779443665338;
        Fri, 22 May 2026 02:54:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:24 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
Date: Fri, 22 May 2026 16:53:59 +0700
Message-ID: <20260522095401.72915-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025426_346297_A4F824A7 
X-CRM114-Status: GOOD (  11.50  )
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

Change in v2: 
 - Switched from using guard() to scoped_guard()

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


