Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697A8CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=; b=zl24+tLKcj5Ur1EEWFAO4+Wk+a
	3ZnU23p9jQNrBEF66bArhJTZC8zJatbz+APkMz+DhTPyNRYD5kZfDaV0iai5ED3u/Aiwzl4749hh5
	i4k21IzF2B/Wg/Vyybi3A4ESie/0O3HzxLjos1JuUHNgT1lvLXh9Lu5r99mhLFRU76onZpu5K/9/Y
	WBWdtkwdImnrQnu/DnBmD35K+Xr3KKpxdRbWcvlLEwOyfAT8AmEqWmLS7iItoNXJy8o3TX12yb7CL
	ywtuB6jnLB6+BUkGoTYYqjUyTo3/dWvYrU/g5dZ9DJt70zVYq511TM+ZJSDV+qDxix0/H3aQDv2Cs
	BrJSAsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrx-00000005Zx4-2vaL;
	Sun, 18 Oct 2026 05:55:41 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrn-00000005ZtT-33jT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1021046a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302931; x=1792907731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=B12RPDjIA0RonOda1TX2ciyi5bIvzdZnTydj01kK4R9PVDgO0Lc9upPKdou+3eRSJt
         ehs+J90LOlrA+2xIn4HyKT+8xbij0gHoUyH3qzdg2XeppbOsO4ZzMEdeCDxWO1H1nGH2
         pMIl7jGaCXFJjAX0zkC3utlc4iMCiZm4KVKBzvWrwmmwf3QkGzC7Mtjp3uS6khvKUgrR
         mIeSaUjCUHwgDBD6vAGXK68YemIyBKdgMoNCB+A0abRZAOQ0rFNPiVgc4sto86qkA0Ow
         hYZuTYKVb+/6qe8yWhkicPfakqDq8uhDpFcnG3Voc6EbgvQjf9NPhRM/0cMoY/iAuUPe
         LdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302931; x=1792907731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=TVbuZ+3642+XgsTy31Uw7rwVnvT4ubwfbu+qRHCAo9rS+w8lQRDy8Tua93msm1d8Y9
         +MkRET5ZT9Q3L9ZrJYKlW0gGjzyNHSVRY25gT4rQ7rGFtUNbSYOWHsLEf0Iwjdm0IK4f
         D/I3+NvGGrgfUZIIKZAxgX27EkgZ5NcXrSnBabBK8VVqTkD8Q3S0tiy/IzYGssiAxfvX
         /4G4UdsUSGOMwv8+m2WfEuaKOo6jkAolzL8FZffFTJCpePPpqityuLVPqgKf5HpHHTBn
         76GH3o1Eu1q9Fyr6yusCRU0HyDOx+MAClEOtM+SNVLZpptZkzrzKdtWHrw60zjlwJmmS
         eeLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwJsimkCEpc+xQs6+3sQnBypKZ5/dLLG10efC3LJ7Rkg+lMqTwypJ2P7p09GxE8FVwKyBA2cx0wzEPef9P3Ypl@lists.infradead.org
X-Gm-Message-State: AFq9FYKiz4u5BBZAnuHk6BFB2uzDGE5UN3nTXTqXzSDFNPOmNeLpSXyM
	+d+MMIC+wTZQ5RDbxUTzXygTr63okjfOndaOBKMRYTF1yfx8pQhRU++g
X-Gm-Gg: AYBFou10Nx26myn4nvdASqiUJ9xZOjTalTlgErZd2YtirVeQXvglUXpDLEcGImfwgdB
	t4rQmmdEmWppkuwj/hAnndWRKV+F8lSkOAe6q14l6ULkRPq8kTHYiiYzjE9oqhvcnPJWl3D5KWB
	4eoa9HYgJzpWac0reiR4sfcDdmvUWxfnXF3rP8cdyxhs/26K3rrg20UEJD2+WjT4xOFn1PG7/ol
	4lNFWl2h4Im3DcFs6M8Qlv6gmQNDMUzOhG40VjC2W29gxay2I/HopFI8kGYspHUDhkFha0zdBgX
	bJDUHwNhecgJ/kLnvCqDKgtoKhjII06Zp7KPdA6X49Jw2NVdq7pkgL7O5QNAcK0s9nZ5W5Iy3sf
	T3ddLemfL+4iLyyHtPbT6ebxup4HFgEQ5yxnHcrYb06SqWJYnvWqjr7EidpSNHOfhrUC8pbim5a
	XydbAMSQoz+jVoiUn+bDw590lRiHyEwRKAfWkYVr02aqSGWvAuNADvVrb52qECZYCbhDPp1AE5R
	NUw6MsCPVLiAdk4lGy3/ijFNsI5lBCTE+IJXaPtyPsU3HX58xqdQQpeVaey2rm6+mhqHs360P0C
	kEvxqM5YakIsNOZYwRYA47k7ljDKhmXiC47WrEK65n1Xng==
X-Received: by 2002:a17:90b:388c:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3acef17b443mr4199337a91.28.1792302931040;
        Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:00 +1000
Subject: [PATCH v3 06/21] ASoC: card: Let 'fixup_controls' return errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-6-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WKyXFBYrRnpsdpBs7slDgKqmeLl5GkYhostLo7OTo0E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl87T3eH52yiC/OL4kx8RDDVXlZQf9lU9a6vbxw9
 +IPh/hjHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKne8ZGRYX/F3ut5WcfvqE5O/rHN8cD3KUEB56UknrrOjWb/crB7ricjw2Vm9hK
 RRfx77sqoHRCY9KBn30OXzQzajz/9dbPNujk9jgUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225531_777906_A9BA05D6 
X-CRM114-Status: GOOD (  17.67  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index dcfd706a73ad..a3b9d2610514 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.56.0


