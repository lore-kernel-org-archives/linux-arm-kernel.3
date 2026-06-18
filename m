Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE27CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=; b=oq654ZyISTiUt8hlW9tVYhh+I2
	8JonmHlUU6QnOjS8R4zSgC79c9CurT4pnfmVF/TdRFR4Xx08bztbAYUq0mx9M2OrSvhuHblVU2rH7
	c0ZAdY1G9Mtn9BkZFlqR8DC0rzDd87TpOUxKkvfvDRrwIn9CsTtzTVCJTdrQlP6ZkltOl8gBptl4s
	3zDfJ3Aa1Tgqjjd9waRUMHGLpajx90UqUXpSETaaojMPDP46gU3FihuuIkFq3CYpKoPcf92w0EbpA
	+J6inpczBhCjdywQ7O1+x0HVEJwXh/j+XD6LMSX3OSkV8ebP+vOPOffXK+eCMH7JRKytaAE/qhYXJ
	bTDGJFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeA-00000001ANw-3mPA;
	Thu, 18 Jun 2026 11:10:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAe7-00000001ALJ-1de1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c6be9cd7afso3585855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781055; x=1782385855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=HeSS04VHuJYiOp1brpIgtr5uNPGJqXovGzUY4qdbo/G4trxVq/FR8bPKGe515ZBkHX
         vD7Rd0CfeupLBx0vNVGlpXZE7Rv3LI049DVkaQ9Vfunf5GYw/duO1DNWd2IxbRlwK2Q3
         jzO6QFcOgIm8eSb6CSwkh4mXZgAyGSLO4pyLHctNNH1ifxqPF5gEH/+6cet/K6FXgFeZ
         EgkcYCS6z6+Ba/elzIiCIVB8FapaBtfWhl0Uq+DZ0XHzh0//3Et6bx1IrK2cWJs2Khy/
         TNan32y9w//waASRGZz7LscRrOgHzMnZGx0pmGqojG51z2IOGOaOQSxBhkuJJDjOQj2K
         ZPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781055; x=1782385855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=TSHamAUS8gTFux8Spu4yllB2RccXmV1R5D3sqkzb2H+5j5Ing38fxNVPgFA8QAvDSx
         BfpFhoyvDiyxu1vuWBN51utcC8XsKwqrXeish1Ia3lITzJB2c45hI0XMPt/5nTzTvKWl
         T3Z+DZUVpNS51RopEMciNcLMvoxLxjQAyYClwtoRhmjiZWeUEA2mSplKmj9RWoB3eBUS
         cvPANaSICp7n6H4olVkcgN+KO/4Thb+YG2S1i8bbyksKOD3NGK2EogEZmikFsviPITgH
         jZZGWHsS1hT1DLPgGAvuK9uaAhn6RjJh/thFAIYMA8DWk3wyko0rSEXgQnOSDyx3p4+x
         i1BA==
X-Forwarded-Encrypted: i=1; AFNElJ+aqaRBJUPtbQJBOG+yCm3BqKgTDwiOtB7NYx7TvsPtNgux9AMmZubck+Ve2ERgHJTrA2l1Z/ft7sTDblBKOJDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbrVZtF3miaIKb70tbCVhpQhWVbH9+nW90CXJflDbV2P+iu4AI
	aGlvVWKybTUDxJDZ6WsAf9FHLrhwNpJuMe7eLPnVczLvz9O4KQlbj3uB
X-Gm-Gg: AfdE7ckfoXxLAw37LO7P/y25wp40QtmjzOBUaGCFTS07FnnBiWUaVpJlv39HTAkgBfi
	hIYFXiTZDKiEdDAdxMMpjIj3WXFmM8IAHskmBs2D6ntHxaUSNSsH2/+sClIyZvXOTw6LLgjFVvz
	oxbZcamGqGUXhTTyaRtMepK6XVZMof9CE8g7L+P1PUEx+vEbTiAQljXKdD5DcGlYh22319v3nAD
	Bgl6SCL5s9uh66iQtpuKAnXFLruErzdTKXTmz/hqXMXfPLTHF8WA1P7nH4g9PLSpVRAaFv5QbFz
	qBx10wWB7r2d2GbzCEnUzKX1vFXQh95QXXKFzRqppBPd7XoPwZomQ8yTDTh7rtZgjnrRnSN7NIk
	MKmsuL/4e+zuFhRj2GrwlmbSLlHz0+ync3xURCSRe6EZYPSv+psd2Lip6pAAX4IGogE6w96kMd0
	sR3pG6EOyxTq2t54dvJhMSx5zOFuzr2/a54RXc9/Vn2ciqehk=
X-Received: by 2002:a17:903:178b:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c6e5276170mr34746725ad.23.1781781054643;
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
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
Subject: [PATCH 71/78] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:20 +0700
Message-ID: <20260618110827.232983-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041055_462589_AF62F00E 
X-CRM114-Status: GOOD (  11.91  )
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
 sound/soc/codecs/wm8731.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ff004c9e01fb 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -115,7 +115,7 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
@@ -123,7 +123,6 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
 	return ret;
 }
-- 
2.43.0


