Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=; b=1bFwRyCn8cdrpsdn6ZUP7dMmlK
	z/zq6utF/jQJoWA3Gnq6rQHyxlmPw1Qa4l9dKx/Bx45XDgwgnLw37CzpyO4VG4GvoSBxBzqR0tXky
	XV/qlM5V1/w2RGg7c9aiHrM2Cp7Ojn95vaLqV0Minsqdb9iTh1egg4JVlsh4R7dIVX9mZjduMxQO/
	aWPjE04qSJ/Xs31ZlN55/Qb3+G90VqQclx9qAntmE5285PstQBsRFQ+dX9Ib86q+KVM4DxwnKIj7r
	GFnWuc1X/+KtyMIN/Ebe2nyUtB+1L1hC2ZwwOtu8tjp2lfoa9ZkuDkXsiMeDzU8WkDlHweMHpNXZX
	quDJjM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5i-0000000Fz3D-3wbt;
	Tue, 30 Jun 2026 06:37:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5h-0000000Fz1J-2RW6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=; b=jZeWbCoDcwr6MK+HzK+CeZuT3I
	aHOr3DVloZQsdA/Q4J9ikKobfk4Vs1o+kruiwed9oT6WEQv+cli5r+qWNFhiMB24j0HvZrMl/NlzQ
	G6GzQqaOyi83a1ewGhwy4qFyzz3dOUAufvVtKtJb5zWI3UBrLu/MGVC+tP0XFGcX/X6xr9mB7DFgq
	PxlDRIy9nx84zR0T0fEemCZqx1EzyCQe+wOMRPF9I/7nq4Pkw1LSjlL+Bz996vIlCsyrER7oLLOpv
	zwV8+oV0mfTqBpkycRVUw3zB3Rc/dh/bffbu6Ku05wNJsoil/cwOF9JYQ1GFG4UU+OYsmpsIBoHDn
	K9A22VFQ==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5c-00000001ZIW-0gjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84783bce476so1652055b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801418; x=1783406218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=R7BS22vxKMQcjVHsROt00mlq6Tmc3pjsxg9NwkMOTCc6GDl/mSYjhBAe1PW/0CdXrL
         BlJghLFCjP3gNFk90NXZx0XKPC7usiUrc5S8JiPJGfce1qqRMv8+2094h0eqcPlNxfoJ
         eGrg0fKQoVYmw/kkqwuJ4htureZ4Z/mdOT5RiW3PMGCkHKz6I4OXyA7RguPgeEM+nWja
         Xs/UZStOJQGysP0Yb0oD60/aS7By38Uzi1bkUvZMoILMod4NiDxfEqFEKZiX3derxXaK
         BG+AhraN6ZEeKGZjKSGkRLqSaN23IC8ZxFvlHPmiRRf//LnNzR99XCNoIiRjGu3JnfDH
         k+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801418; x=1783406218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=Fxlwb3WQsOWX2T7gTY13poANF6lC/SAxh/O7CX6PNmag/ryPv29VAJdc5aqc62rBqX
         9tUQDtEFR0HTwgVefi8IUAEAgkAilIzt47T/u9PnJygEOQdJYQuSLltXnWyJRzcciSfz
         OaDgy/u3lRrf1A8bJP9Bu12ehknydglYoVzg4CYAE7wBMjvlJS19SXG6I3IzIzINW2VT
         GvLIvFjKsDeFpOS0r3GnjPdUfwYRkTOo2cqk8e3SqOf6+9Ejs7kIFySNXPiXVtpjsxlW
         ccEW0KxzN6mh3kRZrz7crYttJshhJoeGA6K5B6pIv9trppuo0zgG1pP5SjMbF9yO3yRt
         toyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI6+yopm4b9f3kDeyE1T2W4tSe0lj/oHExks5X0hjnnYzvYIOpBWK6Y1k7/b7EYSkiOSq+EtztmV3CdElo1FCR@lists.infradead.org
X-Gm-Message-State: AOJu0YxV4ZMlIBjh5FV4aRKo8zoCQtgawEN012UiUSWd4TeXkkw0Caiw
	9RCBEf5oXro9vgaUrkQ6Wj7aGsaJ3mxhEz5w+oYsgCvxLt2COmvpISQS
X-Gm-Gg: AfdE7cmGw1Y16cdpZe8/h9WCP7ga2IpIquZuBYBgJbaFTNP1YwZoUl0iTA0KYGnRnOY
	iJtOTBO+EB7GeQpZEVM5CLAYBgNg3Ix2LU1XdPxK1blYcZrM8eAxRehZrtMhbxjgImPDTy+p8Az
	gql+PPCBfXSb4fkxx+cUrTNezelEWaKu67zdz7X+nhmWklb70wV9k/LT0miGtosyPvacfQfisH5
	gysyD6VdusFKHMn7cMy+9H07di/RdA7i6bwFpBJ3DSz8GuhNP+Ie/rRERmwHo3aQ/jEO1IHkHJN
	nE1qnR7m2LpWnb/VageNBUwxLmE0k1pxiOkx3PBgUSBk5+0XyDE14shMDKdnhsKHoKVCX4FDf05
	zn2psIZVrvXpvg47+Fg+7Wu8HCxrcv5ah2eVYM7eHMchDgH8olsKjHoSqBEuTcH8TAAwQNwxEk5
	SE61X2Ox19jtLMOC8IaC7/9EHRGgV/uOFk1HxYYNw8YxANRuI=
X-Received: by 2002:a05:6a00:2912:b0:847:98b2:5a13 with SMTP id d2e1a72fcca58-8479f29c1cdmr1995338b3a.51.1782801418236;
        Mon, 29 Jun 2026 23:36:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:34 +0700
Message-ID: <20260630063449.503996-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073700_555123_043A8A9A 
X-CRM114-Status: GOOD (  10.73  )
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0


