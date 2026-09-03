Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ED5C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=; b=IS0dZfvqTPYo4MqTAAN4tSYTST
	YfWRF3mU3Cd8jWmdIKezS4eftXjUkXiARw/RuitM7djcCjGpLsGUUal0eVjx7/SxVGPuQf0GCrf2M
	U8y5ZQmRuxD38ItFcpCjh9hSasJIopvJ0pStLA9dOpp8mVDbFgtOZoJqUEGJgqSDwaiap6H877F5n
	TF3dAHvLjRY1uN0gdPt4ke0+wBqAstpFxEh79ZG9NHDFDfIvyyk5FjUiqnwYUc6aFMMBfrybwfia4
	UeLXm/5UAe/wHgM58CWy62DW/lC8RJXAgQWTtgDgppaT0fHLigTLdam8dU4Gj4h4v7x2CVlZhy1Ts
	m9m6gmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRi-0000000GLmD-2yfu;
	Thu, 03 Sep 2026 04:53:06 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRg-0000000GLj6-0gUf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:53:05 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so453882a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411183; x=1789015983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=jOkTY/R1zG5uTu6wpKtjOX76YKsA05n3r+fJFN3qAcBaTv+6XBlq0miiEg1mq0x/du
         9vbjO4y7EbDRT++DcEwiNNxJHKrq4uM/jM3PFkyplggac27I4s8VmpcKiP6Xl7+KvM2c
         jCKFKQtLsMAmSUdsEhegfPCYwLi5z2gJKcqZBeBIeR/0LYogF0Okw2zxiFXVKMmh6Mmn
         mtnJuLI93wKimgAKyelusnP8wIzsKyc2g1eO38LoOW/+hkpRFW0H/6cUbaZ4+7IASKmb
         iIqIRyByVmhi2GOKFKzfMGJ6Udlyy0JzEDv+oUMFYjglHMQzm15iZXfM+XXMcNmTxlZp
         li+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411183; x=1789015983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=eKnuqS1uqoReNDyBB1rwcwEioD8Ua/65ZQv1cBHv/HAX5737LgYrzwpcHKPUq06ZYt
         2LGpprFG8j6C2Pqc6BfnyGmnmBiV8iziZimdQWSA/P5ACKp3WmJw3ZjOnYaVEiWx+HnI
         9Y06p6EmQkJGwwkk+sjFoNsi0+869xKNYBL9iVmPHWXN+qTSkI67pYCi73Mgobzmiy7O
         P3akgW4pUdB6V5jWjLvhsXGxNTNx0jbMn0G6f4dQk0DHXw8/rfWqSJsbhzc+aaoGv81w
         +HTLYNZo39+o8Dd2ZTylqrvyrDoJtEcpH1SFBk+XDo9UIuv1vdVSbk1q00sq/ulfRDeF
         9XpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjrNiB4640Db5xZ68rSySTr608VhvlUE7VLceH53+CG9eLipA0nD+/HpcpCrtXPU5C3FdoPB00fEFentCELGzB@lists.infradead.org
X-Gm-Message-State: AFuF++n4wdGPtzx6X9G/KUKDPQJDVWNB+sg41DwOfzRIcNGEvgmsPRVX
	npAvc+b6Alc2wwvXZom7USAbuZNsa2YpSIoas10jbLiQZgfEnBgi/OxN
X-Gm-Gg: AYBFou1qD1dr1t9DPaxn43SktBWYB5UhkQO9lfKJTmxym/zNjyD1ifsSwWyrwBTCrG+
	SO8s1ni1w9OxMX34SSMnvHlyw1JG6mEpVaA3lG1zq1D+BLP775Rf6G6uhWttCUHUOC5CKs0ZwbE
	rReQq4iAFAMegg3QlZftBLPYAJwzy8VZdooCoRQvqcEoQQQeaiu71p1gVuc8EKJbAfstkttt1zu
	91ChYCjBojACPKYE3xpgFwhTh/K2GXXBIpz5fBzecFtgXi0kE++5MtHmM97ALYSFxquaaYJ3H40
	w/1IdlcrzqVczUo6otY+0Dh7nd9pEdL83UdXprKbF6xQ7di02SzAbFOp00XrHaN8nSwjtJ5t3I5
	dsBgKo3njyBO55m8IRnlmOkcDFUnP4GqzBKp8hC7VehFpvLW6Ack3XKvy3PEMv0yilb2DcSNxmv
	XbmuaS6i+a5ZbqBFQMW/Nvubdkl7/9K2DCzpi/4tZR4ZDC0NufH3NwMBkrPctTwtyKB/tB16f0t
	AjnjqM4lyyK5CQLroW/x6R/zCw8fgx/SlUkui9K0qwjyFzv8QqobffZjmPvZnLXhR53ZfT8uWQK
	S3PF
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1191332a91.15.1788411183106;
        Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Thu,  3 Sep 2026 11:52:02 +0700
Message-ID: <20260903045203.175337-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215304_202552_3CC558B7 
X-CRM114-Status: GOOD (  12.28  )
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
index 06556689976d..40f9afcdaa16 100644
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


