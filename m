Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B235C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=; b=aD8uEQjvP7pJt26/gic+mSAAps
	XY9fST8lnMJ81XSs6zuiVyGBx8qKmoG7Ihgw1JKIxfg3EyeyEqJzqvfFfLLeI31sZci+gw1z31lg6
	P3X6dDQ2S7BwN6IRHYUaxqQDlq2NiiU0Cd+SM1WMn1aMPIxpUjENcRWX7fUdO8AdIb9hLuJbmb2eV
	vFLTKVcu1Gay30jH5/p1X44XrdHnU7cM/5zYbsbZFZyOdF6nf26GxwPbWfaQOCE6Bxl4a/S9GYJJt
	JES9FDPQb580mzwLF7vU7QiOCgtGabF95ItnLpD1B8Bb3XkN8EMYrxJyKtKkM/8nN3gV6PiNy0Kjw
	IwATWI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzonE-0000000585q-4Amq;
	Fri, 28 Aug 2026 05:06:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzon2-000000057wJ-0wNb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:06:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so4288335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893567; x=1788498367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=Irw7bDMPCtb6uaudl6UcsAd9/DJgI6f1ZCzGdPXrvpC71fprhxFfUUIMk967ugMZ6a
         PDBk91sow3pa3FpcWYKZwFCeRLoeSw7gW0H0fNoLqPjIQf13jS4IfMDXC5ke93Uufeyz
         VtIxK1/avy5YltDDBf+dEWezJKxALwjQvT2FUeCU657nKqjlrne89/Ej8NHhprbjS2+b
         Sb1LJ5ayPmgNAD0kJNGwBx2js7ynVeqxDBkwMIv5I7jjCMv0i7NRAVqvP6lGTf4XH2co
         vY98oM59sqpSeqneAFIi2WZ3OoV4c3ztTSoq7YZ8/aZJroO105Mx+Flf+lTtoHnS5L7b
         30pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893567; x=1788498367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=gJof5XAyRM/Q2nHkEp0W0pZDZcDYaGpXswO0wDE12nlvP351AJQhZ1Rgta8mR4J8du
         ViFoZTMdi4vPECrLSMohZD+q1tbyoDH5owfDZpNdV4D6+sASzOLNBxqpK/3IWtwSyoSg
         e2lDXTM+JY8BeJ0cFikuUXXXo8C1JFod3pkDBoL4BodZUGUReFwKLxjanQBwEicM/A7Z
         CodqkDKmtxai546izy4qfbdpBBsZw0qEfcEMU0670D3FWTqI7keYJ1lT0FjGy/Yisodb
         1nRmJTjf8qLRvWHwIJZfaldh97H7BFSpZ4Pe5YjbOA1xreUvWkbLVlKNAlYkUNmSVePK
         LthQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9/VmawyJUqCfHR7ekJ61FuP6Y+/cghMHGl1d15gM84P34V0cK4KpdWngEEB7pmoRFmD4KZQXdjhTra2VxnOQY@lists.infradead.org
X-Gm-Message-State: AFuF++mIhaF6kLwPMFTJ8PHgcvN3TOUWPpwI3IgSbEqYa2IyEkZ8Ngpr
	rBc/VWPFaUrqdgdjZwKVI+reoARLEDPORXmcvrQwB3d/GaruXnLckZHH
X-Gm-Gg: AR+sD120fbIG4Ql8os3o9Jw4LEGF89iJWwYgMG86gZY9rt5g4UXvLNVr2W0P5BfclcU
	dRb4HakpJQlsjCJHDCT06j6n20OUFjwahh+ZubDBgifzLPQgADJRnIox91Oq+jADnaQcF16ykvW
	DcLxhojg1GI2IrPgZ2uPHX4n9PqtZE6UAk+dYeJ5mW5rjKB6z9faqu+LBvxsjbXHX5Ip2nbV9u5
	vVN6cxDqI5s0pXkQ4kcPxto8efnk+qMW8UAMaM3kYrMw82LM9GnoFYtkfkoHwCOEDYxf2QQDSo7
	9MU9BMvzxeFZsAIWP2AwrvoMqGv28nE1dn95ViPkVx3t0vR89xk8dv0IWexyMqBnSqjspdYa8bl
	Y3owee8+Fi47FAT2NeZO9VPzM3Th1RMo+3KS5oNK9bxXEJJs5RQNDx91Q7n5HYF5ld0rr2elhQT
	w40Hkn5YaPisLgoNKzyA0Ai/kRp8VSZ6tz2Y57uddtTsDPvAsNzQVXOmUdG4y2H0cl03I13NNe5
	X0StppmoEdh22pfsiA0ohMozYGfGhFuZJjSFhY/RyLA8XGJswVMhiwFIskALyjWYhexMOYIM4wo
	ZOhxuQ==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr8743391a91.14.1787893567319;
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 28 Aug 2026 12:05:25 +0700
Message-ID: <20260828050526.590761-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220609_710995_675FDD6F 
X-CRM114-Status: GOOD (  11.89  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 43d5898357dd..c67424bed329 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


