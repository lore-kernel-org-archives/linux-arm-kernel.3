Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24805CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31NDFIT1J77T6WgOgaD6KtRWo1pajt4U43lgn0M+eTk=; b=3AGX3zh9q6RYVidHi+ZkuvE1E9
	M/sb73JmsrQq6X80VrqjQr0rSoZ5LS7HERWjPs0Lgvon+7eGG2N/MAYSX9kPyaskMiW7lboexGP8C
	b0vljmT6xEXg4x636rSI1pYrLwECR49DqnejBY2EZ+t6mUiZYXQujyIzlhWfwkP/u64T1e0A9/pyR
	WBcEYs0u+M7u1Y+3ZWEK5jOGUawl/NWzJDR1r0qTDym85xEmazHWPTNbtc5x8GCF5Uc1f2kiuezDw
	wbKcu39WuZ4QhYhnUf6JhBmLmb5w2bz4iOeKKxDsxcODYJWOG6sc+3h09ys/Df1u2BKoAGHocGd2j
	hoOFk5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v121c-0000000DIYq-4AM7;
	Tue, 23 Sep 2025 12:21:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v121a-0000000DIWv-3oYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 12:21:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77f2a62e44dso3377266b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758630098; x=1759234898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31NDFIT1J77T6WgOgaD6KtRWo1pajt4U43lgn0M+eTk=;
        b=FnGaaT1v+NSlKBuFHrpkZflRiv4no5b8ZVeei/ZDfDMFYMOaCIyr2zSBQcjQi3YGwQ
         BSjRoqzRmSm5Luh8KsCFP8VrP4S8piYfFnwQ+6WLtQJXHU/ZdkJMrsO4wxOZ6QV64l9D
         fKAnxuY+ONKJw+aRHBESIOYQ3CsKcQKPee26C3nr3gnOC+lTl0yENi+XoeI4HxL/6dsN
         s29Pl88cNjuPVJfYtPOQIEPT60NeUDg0KCIGHQuBTyw8qnKwvN7jDiN/yxzldbR/wOjU
         gYjygdFz6bmHUMindh+sdO241Z8m10xRnwYwPCbOKvTPDN5/z6muhhi3oiw+pz1PUNA1
         MWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758630098; x=1759234898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31NDFIT1J77T6WgOgaD6KtRWo1pajt4U43lgn0M+eTk=;
        b=ZZONt1zp1Sia4+/Yt1MyiYdL4y7sOkhH6jWEQS5Mr17SwD5+MBSRt+Vn5nRu0by6e8
         rr5mMa4tykjTUX6kwcfFvkVib8jgjac/C+Csov/kltSTts/YPcvc69xq1MwSCsX9ZHO4
         tu610MHTScUMXMUIiHecA6oC/bXpwE5DFLl2UqqxpWv144qBoGDRqRWXl2DU2fuligo1
         pOqhCYqfDeEBBwNbWeFr6UY9k8nZgu8pIF91D/HaENs4fIKKbOnY1/A6WbOcaZ7rKs67
         mhhXPquifhjGSPZgGdm6VCt9qgQpJmzn13H6vmPWkS7HpfQHqaklwtMPxkDG7WWswhJ7
         gQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvxENbCdZs94OYbNdp8FQqcI0KA3q61VaIypvaYuSiG9v/wVabMcjIisz9tkTluh6VmjHxa44QCe1C1bqVOT1k@lists.infradead.org
X-Gm-Message-State: AOJu0Ywts2R/4ymmGAhzgAEXPzLnY+UU6Bbcp1dqtmV4jmMngToIY8q4
	5eRJrVjekSui2Y1bcDuOAfe50CC/QbnMsCONPNWwI9Z3IPNFSdvtV5gVrtg8SdYeauZHBA==
X-Gm-Gg: ASbGncsVMlM/1ZAbKW3rACTJ3Z0mEHaQEZD5zqziqbO+v7WM8IusuTeq61Cg0+T6Za9
	HxznR2FZksvb4yokGg3Qh+82BJc09sWc1L+feKnT9AwRqkShYpAiONcSUzQrkP5kibDqEFd/Bqc
	Hth9Ah7hbtZvb15EaQmV4RynNOBo0vDBIwCR/4FuSlAEHzOcgP04bkOUa4NPN7MWmuSEybaAMUH
	hFhX/XVwM0/hiC5LWXUY0k+2VisnA4G12/eVIqS6+4ng2aKkXBFbG4MyHYKNT0+6pKB8/3NbzEo
	ge41xkiTk8nXnba/lq1iwDqwRWKUQNjkNHpWJ717jFspiG/DqLEf/lSTkEiNC87oneHzIiOIWPl
	TspKeMuF2iUMsGoo=
X-Google-Smtp-Source: AGHT+IGapQYbJxxDclXfWf1hQJL8kcsiV3WYPv+6b0/vrntM1EgcdnY/IVTVQnQOpFXNKfmNw7kNBw==
X-Received: by 2002:a05:6a00:1706:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-77f53a2a233mr2209045b3a.16.1758630098030;
        Tue, 23 Sep 2025 05:21:38 -0700 (PDT)
Received: from lgs.. ([172.81.120.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4fd7223esm2786939b3a.103.2025.09.23.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:21:37 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Tue, 23 Sep 2025 20:21:21 +0800
Message-ID: <20250923122121.1855051-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_052138_979227_AE1BC479 
X-CRM114-Status: GOOD (  15.46  )
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
main clock before returning to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
changelog:
v3:
- Move the Signed-off-by line above the '---' separator.
- Restore the original spacing/indentation in the devm_kcalloc() continuation line.
- No functional changes.

v2:
- Return -ENOMEM directly on allocation failure without goto/label.
- Disable the main clock before returning to keep clock state balanced.
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..570fb10c306d 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1975,11 +1975,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
-
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


