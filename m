Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B26CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QPqBcezv8xW5mApCdOc1gSfedv0YvcKSgG7urTdN4Vw=; b=edOz1m9p9tGvozKZzM2LmtmAZD
	Yd/R+p5+7wLl/w/svx9CG4Vc9ErbhfQ2VtFL3i9qHfE7Re+zSwWh9+6zZo8WYXN2sG5Ltf5hAb/ul
	BwKUScnUTZFugrsWho1xGo0LsRo04m3CBW3P8pax3oONDFYS8zwrJwS0vRHY1pILe/Zxz7RLwPvlm
	IKrXDxDyBpkvff7/6Ta6VR06xBk89xZ1JiY9GIBNoLeGoPQDLs7N7kOZHAgALFq3drLnU0RaaLLNk
	0vxmXnOF02E6U4AIFDwZInU1oSn/WmVcbuHH5Tifkqx6+5EIVjBN3QXEhXAOv5Ucbhxjup6ccFF+v
	BkkKXUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iZS-0000000Apc6-3Wh8;
	Mon, 22 Sep 2025 15:35:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iZL-0000000ApYx-23zm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:35:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77f343231fcso509845b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758555311; x=1759160111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPqBcezv8xW5mApCdOc1gSfedv0YvcKSgG7urTdN4Vw=;
        b=EPw48Cw8Dot97g/YV7UH/ulRi0SItQN2TYRvOri2uFxwlZUNOFWe6jpGJTuyRzv/rC
         4gOf430Xt6z7pXqpSXDdxRgHB2WAJB4lAbH218+RV2OXB4vkkxl9ZsDb+RZhw6S8w/u5
         z2IReUBTmW1ODtcYl624PmN8JXd9Xcxd+453hNEQMJuL0588qr2J0DsI+3CzWS9sya6r
         xuERRKIsFd4V60ya1a2e6TZAjJl7lumSHLEFysfnbf1Ic57MLOHcemijS+WQ68NnKojk
         3QJU6MDiOJaMUUfScWhfqRnzaIFfp78ID83b3Jzx7hP0FL1v+9gOn8BYQyr1TwTyqn0G
         P+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555311; x=1759160111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPqBcezv8xW5mApCdOc1gSfedv0YvcKSgG7urTdN4Vw=;
        b=QHtfSYN6jDmAyLXzaSfal5jSmrI+spHIxSvyOcuyJAhxsThxQuDyc9K7tKDe/Biz5R
         HToBQjzvM4CXlxpELXjC78o8znQmKUd3CebA5Tar3Y+27vlZz6n/w3p8zPSzNt//YBGW
         ANwQ7E1FYt3IxXB6Uuf9djIm/S3FLcxdoE1T7zjslIqOyEiM59fdEKt8Hq8LfllIbgTF
         jwZdt8EHJF+FiSssjsFKbgujuuEBBz0kjx0HhRsp31Os6mvgTxIERbQEh0r2Z3pXMVsT
         6jpXNh7bpzmjBOPVWGvfw7yV5YVfjczOqBr3ww22QNbFcLtwe2eac2P0JeVEd0HYsEOu
         Qx0A==
X-Forwarded-Encrypted: i=1; AJvYcCVGarZ8KD90rKogRzSQg3TCdxbWRi3wV/qqHf2nlhV9Lj121NbWNTBbCzMSh3R7qfxmBOCd1lEGp52JFoQu6LpW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy85J/pdMMTZ3IKDJvKXR+3bVyb9guwDGpJyv5AwVd1thCde7r+
	g9ssbYEUhSKPM4Zi/Q8rrQYTa+sKRNvhg6aCIj2rBTDQiMdbymP3+kn4
X-Gm-Gg: ASbGncvpULG2oG2I9HLIDxBtOD0CRnU3a2dKFdTaNv39EjqFmDlG0uCiX6v10v1+klj
	R+fJWOPt9penCb7k0mipoHpDQs+CKyaAoBVxS5c6ScWQK8qX7D44Iq61StT5Z/MhmIcREKbz29M
	0vgqfaW6W6IKz+uzot2DYu9Q/z3H7MKYKF0wTm4xiJTVXLySIsBBWgyM5YrFJRNbqLgC+7+qvNp
	JWNkfTTy3ssgI0EpItcBdhkUermSTMByVshL26bJIbUew75wHEPenBN8YmX2LyrXTV9ppbXQxMs
	o+Qs/JM0hO2tM65VAL+TLTLWeJYdBzpxOnIQ36dNOsETbFmZ2YCGpr56dNOqlSTMqYQmdbCIY52
	MuSlhof+MqnUZCADhVWEotyx8
X-Google-Smtp-Source: AGHT+IH18SVWKRivLhs8wCCIP9cmJ9yWScaF5ZUPDSrGGLbbr6gElS8sRBQwR6sHGpWLBmjI6JFxRg==
X-Received: by 2002:a05:6a00:929f:b0:772:4226:13b2 with SMTP id d2e1a72fcca58-77e4ecc36cemr14924105b3a.25.1758555310572;
        Mon, 22 Sep 2025 08:35:10 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:3d9f:679e:4ddb:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dfbab0d7dsm11069712b3a.60.2025.09.22.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:35:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Mon, 22 Sep 2025 23:34:48 +0800
Message-ID: <20250922153448.1824447-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083511_553048_EBACF348 
X-CRM114-Status: GOOD (  15.24  )
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

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock via the existing error path to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
---
changelog:
v2:
- Return -ENOMEM directly on allocation failure without goto/label.
- Disable the main clock before returning to keep clock state balanced.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..55d832e05072 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1975,11 +1975,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
-				     sizeof(unsigned int), GFP_KERNEL);
-
+				    sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
 			    &afe->reg_back_up[i]);
-- 
2.43.0


