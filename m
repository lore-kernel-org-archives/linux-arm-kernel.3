Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBE3CD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=; b=sRH2LWNy7SrvLK2JMtxSTJQkpL
	sWZFkw91shx9+RUEbaYmwqBtODrKJc20uHRgvQLM28OalnmsPrtmjvCeYjaqps8kpk1Uv50Pf/A/X
	SE+hWT4V4b/6+JiWQ5CSpk3uK4n+PgBi3BNSk9QSQmD+h6Pe1rS1UWR81ZvljYH7v4Acs1SPUX5hS
	XxreHsAjbFtBBckHbHsUAqLZstSpTCqLAGEyl3PO1Rb+p139d/MCE4QYY+7ZYO2A8BlYdRC1VHIz4
	l/frOxKpfdjNL9r300kR0RLB3jL9WpOAXhul43aDI+M+9/BL6+YH+SChZgJUy8fRBsFqLqBkntcdl
	IsUGtwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndd-0000000H6W1-0L0p;
	Wed, 17 Jun 2026 10:36:53 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnda-0000000H6UA-3WLT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:51 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2336642eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692610; x=1782297410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=;
        b=hwUx4xGvsRiLBtFPFKT5wNXrQFTQBB8hg+5Eo3Hx+uYbfhfeyM4YLwTxpS89HhTF+c
         UGkd5yshNBcgb2ZyiU1baFsHLZrAv/ttTSqmLofSxWqBnEhAxU7TYToEBPo/7wiAUlzE
         cPdtVVvjAwy/aKyO7IBLHTTsWfWazzjxUn5i+xLufGPRAoB/dpqsDe8hrZTsdxuKZWjS
         Ek/h8dVySvLBG3ulNkUEBBn94wlo/apA2PAC5T9LEMLm7Mr8R1fIxx/X7A0TwpACsVzf
         kiWPW9J+kzxxW6uTRKv982mLVIbDbpErdRypno03ODwGPk238d58ZS6zg1i9e4JNVDgU
         c0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692610; x=1782297410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=;
        b=Erv6rMFTOjytrC4o7Ajo3eQ7jY8v8tHLIUdFHPCQQFxloGIU9iayP2F1rJgFrUO8z3
         c1Ah5G1mS3rDmExJr05H3Nha0W/hUjvm/bWJ1dWEccVO5YbE2npsSEymFjuRaA2DzLxq
         49hCcST7E2lc9wlIlfMLHpjkFldHce8V6iR5edLMtsHiwTtjHsPK7vIubp1VMmbX8mQD
         3hH5u34dTEdibgnLN8s6tuba7UYsBcZlhPbwcjZUaRgdiYgxoTn0sN6A9lSyF2QOTZPb
         fcHDxpeGVYzqa7rBfZn+1o1xrE2SCOO2LO8TDu4eSX/JepLTSpmHDuQjabQrljYuQR1L
         3mHA==
X-Forwarded-Encrypted: i=1; AFNElJ8M0Rk6Jn1848mcDskp6YXcC/42+5/SVjhMpZVEXgWY7EI6qWUtVjM8aqb18pwBguedvtnNkKjf1+fWew1s70yk@lists.infradead.org
X-Gm-Message-State: AOJu0YxIugZ3GR21nvG1fhnx++OwlBkDuKeavKHkA/2wlych4VBYr1Er
	aTJR6WuLK0d5+hRV8oPIaUFLvcBji9fQBkEjc7SCVN4s4Ow5cqYKjEvA
X-Gm-Gg: AfdE7cnZj0darmbvir9Hwh3djZdAyeojaSZqrqWhnPdx58AvNRxqBwGBibEh/rifJ2K
	mza1/pMxSsWkj/u0u3tsxu0IKKhccwKWT1Zt/4nOgAaNbgvZiGePzLDCzjX/P4wC3luQopJdtgI
	rq6jpDSLz+2BTl0rqL+WWgPdc9cLxyYbuoCXtPynfhwOr5tABYolT+rn1tvf/vmnyj9BrzRGYc5
	NyM5szF+TeoOkeJ50pysGbm2n+f7CTitN54ZUJHAS2MvDuQ9T8zPrm1rxGX3+qN3Tz6fRITaGqm
	q5UyRCN5wh00T530nN3HJ0b44+XJgGF6E8aoBXoMmktms28s9Oo/Rf8kzMmIMmau0F4QQ53i81X
	g5l79jEeLviwaBoFMSJKH7f8pIlDoM78BfrtR0GPqbf00SWXaEqPCn6iL3REw/InRa9hJtvkcEP
	ZqMOrqAEXP3gfb/Sp9bk2Qa48OjK8pGyGd7YelRGE6kU0JO2Y=
X-Received: by 2002:a05:7301:3c0a:b0:307:6e47:f881 with SMTP id 5a478bee46e88-30bc9f3aa8dmr1695525eec.16.1781692610135;
        Wed, 17 Jun 2026 03:36:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 25/78] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:42 +0700
Message-ID: <20260617103235.449609-26-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033650_874082_96FFCDB3 
X-CRM114-Status: GOOD (  12.11  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/da7213.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..384c79c7b5c0 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -216,13 +216,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +227,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +238,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +249,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +453,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +486,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0


