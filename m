Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9A3CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=; b=1ExtYspH/IQjvV6/AERmOJpYSL
	bEjQHXEz1XISjO1Ft+3f7K3edCVEcKXEDeDypX/um9kBD6DAqTvb2wO+sBbGXQH/LhTyqH9KY8Ao5
	axoiI3EhH/eUOgVENCd93CpLFyfLGmi0S/ZgXMlfNH6YNzqAayMukI7ltXxI5hbF6Cv56lpciJRz0
	6c0uMMpNeDUwZDdbDNWPYvoXHQgsQzJyQziM+YyBg2ltVfecVNF1XTacwwDp68/kkI4PAXGq9AQu6
	6kjQcjHEMqDrOQpIToyMfO8kKX7cd5gpSgf6wl7jmuQ8jESdaI+cfFg2LiOTrlQb/8CIng8AewA6x
	loxMdLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNLg-0000000Csg6-0lPr;
	Tue, 02 Jun 2026 11:31:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNLd-0000000CsfM-2kxh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:31:54 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so2349672a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399913; x=1781004713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=;
        b=T0GOKox2TEmEzbGZeDsQVraVy3Qk8DTd0SBAzQZTKaKn+tZdsnD9VAHtfE1bYHZ9eN
         XPKh3TZKfG+vFmz77h19K8mt7Vy2BOa20rfrwp663oreBGoyjBtbVlMsn002NHjZCAV/
         M1JDM5goOMk4RWu1LsnKh2V2x69K5Ldb5DuMEkNQZkhZsVmjrTsp48Q/GGwF/CUnzUry
         y4fqQgVs1A5YsyYCcJjklF7RMK44NBzSTfNocIvMe7U8nxpQbGOfjiiuAG/uRX31wJvY
         rP/MIs7fPmIO/lcnM4WK89Tj7eqYbq9VUYsno4iRxrcPcdvAJYR2tOyBnQei4aDSxaGU
         zoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399913; x=1781004713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVXTLc2CkVj0LT6iBpJofb0Ww2wTBXQmu/ysCtlatmY=;
        b=nCxpEMbkBn+9Nk/VrR6DJRR6ZULJV2FgWRLZO1qJKGeaFONLpSXRAc6qlTCPEHWFDh
         cPvlWwI2jK/FUd1qJePLsR46Vvhf0RmjRPJsQ6s+FdXOj2RYhCGxPC/xtpS4XuWj1fKR
         iIdBdZogidikzLqK5a6xLHl7gg5p2lQFNYG3zy23xNSnFGIKzek+MIAF/IQLnZLXC+4k
         Z2TLHRQeDIcRrAr/rzGlEnAnxBRWiHAzd3/5DRLoePiu/BUgjAJQztghfF2maWRKcMge
         ccwVTLQE0ciUU+BTiioWyfiFs/pnORO0rOwa4W1rRQgJWKx2BCjrcl3Mlm/dK+67vqQD
         e4QA==
X-Forwarded-Encrypted: i=1; AFNElJ8VUjM5gz+G7ZqIdcvttmBJJ6D5B90dOQIrKGOJ5ta6UYVb2C9tcgd+Hd7Vlf5CMn0wGL1DRyZlBSuzr5NbdIIN@lists.infradead.org
X-Gm-Message-State: AOJu0YyRoJSwShz8GHm7cT0ZYnZ1Q2YwxypiE15giFG5U9U01NhuflGW
	uA4WPzezoxzSHvcisrNl/2V9jkYRT7P2N+NKji1GkfBVTTMNdHnDVHvC
X-Gm-Gg: Acq92OGuhQ+F+Fq12Ft+ZiW9Trc40Fiq4SzmB/uGG2Fb/TT60S/QeJUl+zAJqKOCcq5
	6EBd0U8VdZjhBC1TpaKb5JhrAD9CNei4TaEUZQXxBVXhbvOYAWSibzih98JX38IN5Z/flWxNItu
	gu1b1y7A2PzIe/IqFUcamJkkHPQmDq1yD4WD2K7WAKK1QL1NCrEcl0zcGVz7ZYxLa5sEd+MEWqg
	hovGN8s2SGcki9kOMiovUqWZfRx3iFAUNzFWbKuNnwhB8OZrj1h06N2TrguNuzzE9nyCUsENx7+
	Z9U/xbCEeE7llF63PgI5YOQA0y9ClRsY9KluNNhg1naOCRDYFtZUPrfz7DGwv+3TJ+3b/S8Uisr
	+iO+lNWS8BefsTahXT4E63Lii/KFmXm/VvCRqNS1liCNlDKKAzluFLFkbpp4sa9/6sB+9qmOWyM
	s37N+2lvyerLXdCPEf783Etq76Eyuw2IP8JGeVryga1AJ4ic2j/sluIrHIbWBTCRDZxP3Ro1IQh
	MZJmNk=
X-Received: by 2002:a17:90a:fc4c:b0:36b:e109:1e63 with SMTP id 98e67ed59e1d1-36c685a8f89mr15745380a91.27.1780399910741;
        Tue, 02 Jun 2026 04:31:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91820e6sm2617126a91.1.2026.06.02.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:31:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ban Tao <fengzheng923@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 18:31:36 +0700
Message-ID: <20260602113136.49494-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_043153_703573_300D1E2D 
X-CRM114-Status: GOOD (  13.02  )
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

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The bus clock drives the register interface and must be enabled before
the DMIC module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/sunxi/sun50i-dmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index eddfebe16616..7aff1afdf265 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct device *dev)
 
 static int sun50i_dmic_runtime_resume(struct device *dev)
 {
-	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	struct sun50i_dmic_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->dmic_clk);
+	ret = clk_prepare_enable(host->bus_clk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(host->bus_clk);
+	ret = clk_prepare_enable(host->dmic_clk);
 	if (ret) {
-		clk_disable_unprepare(host->dmic_clk);
+		clk_disable_unprepare(host->bus_clk);
 		return ret;
 	}
 
-- 
2.43.0


