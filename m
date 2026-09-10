Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76399C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=; b=bHc2+C0hSQZx4kJCBTmD+BSlmB
	MM0lRZLVhCGzqLbvoYv4aVijurQOsx+TQZXDknUAhl8V9vLrhafkbDwU1vkv35Rd7ZEdIi1druEDw
	UclXdBwtuV9INvBCROWhueIm4bJ6IyYwVNQ7zyrT8k7bMH73p/inc6hS3LpPWPWvKFX9YS8Dxp8Pd
	hmEy3zlFx3MSznRDk/iq0prnSmY3wCzsOLDwJT+OJCwh3TmBjBGN4kQI3kwr00UiUQ2PQZ4//t0uG
	iony3usowP8OTgAscWzxjW/GyGZil2KBAc2gZXVPgcVZjAxSWip+OcWs/4Xbk70F51RMex8SpF8I9
	GD9feAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMD-0000000EOXs-0GTn;
	Thu, 10 Sep 2026 12:58:25 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM8-0000000EOUf-1Axf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:21 +0000
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7552879a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045099; x=1789649899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=pVErvkUQLtXiON6yH2ST4mfEGNFHu5fmfcOVFXdi4ePpsnDjQIrfV9UsGAF7+dHjRK
         b86Rockea2R7PcBckJXKBz8dQzKpYEdNsPh26Ar5IdYHBrF77ypuQuXbYIYfjCTMSuqo
         /Ug8XwV+Lr7dRnotGFyhIzUMJPqhtCCUSQ4GafikvCi+EVEhLF5tMbf59urX1uTtsxnJ
         GtfKu78crQzkvpxXLuGaQgZ/M2UyDfB/DvqZ9yJBkojIfna8D8kGTC0FTx6EwL6k6Yhd
         uCFUBOBNt4lTeSGKqwtMB5wu4Vh4QzxfUmf+XOChEbw+t77C97b9MnR/8e7N64MT60Ws
         O2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045099; x=1789649899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=IriyZVNkPPn2wZ8/sRxHY7woPltVaFuV/Wcx52aHk+cGAelT8WCAwX/uSJP6DWL0Ty
         jgef4JEpwjHm17kaU8AHOoIz73YXjz75vBclTLQYAgA1TVLbWUYn1w6rWZnnEwoqmBcg
         q3kjZWfWKLZ0E5U51V3GmlQQuLxEB2ICWdqm661WGEotPgzJgUf/ReKK0qKKghYgq2iW
         Te1BhEKSd986qvFA1EN7jS681xrdvwCjjPY+9QmV/OiO8fFPe33J1dWxD6S+boy/Pb16
         skgmlsOJLlD7cCOICcfytGlz9sRv1N4/I3OvONivNVLkUKrV12w2cVJHOIdcn6TWSSOM
         jBXg==
X-Forwarded-Encrypted: i=1; AKwUvBzh9oYBrpDwDT6fY7pWEhb97o7/Z8iwLZ/NpHurRmeAlnP87LR+XUbtjd/ivQ7g+oSD1LfwUzmNeRzxeM34k3ji@lists.infradead.org
X-Gm-Message-State: AFuF++llZzpYuWGfcqRKsGXVEodH0qaCM0PJ0gK6mXFv3a82fsKamkQH
	WdSRuoEsCZX7PJJsXtj6+M9VctePo+TULb9pMJVOu2mpvz4dxOf8bzQw
X-Gm-Gg: AYBFou0YR0wsXHV4fqzbwwfVTURWAvoH0Wo7DV5wn30faaLgTA3+fq78W5XustPoouq
	zbitGBhXs2XYkrPxqtoUP/WjR1cLcqW/9fKursJUaMQ9baKwPx7chcXR1JwTJiolmbVD+FYpyJi
	nXlNT/7wydkwTEeGsbsPUsRuVWGlkZDgPpMj3p38FU6awnFzu8V2OmK6r88ikgkzO+R6MBj4oDU
	ntMXw4QywSmKgsPY40R+e/x7CIyKUCwCQaltl05KXYDPjY9g3c43c41qij+rc+JcGQhoMqHzqxw
	wu4vPh8CXcDYZJ8eEeNrrYGK/SzIr2sW8eGuwFMR1u+FdDIMLzv+wfOluUzhIn4R6P6ngaaDZnP
	+BtyILVo3peEagIKvvMX2kQkXOtQZYLyxc1UYs5lsdJwm1kV1/NNhaZ/1JI8FO9hlKoS5G7XWXt
	goqP/ztKRj/hj8sX9Pq4PhkrdR/LDPStyFqUeEL07mGroVFkXqS3TNCoCYADuOPz2/6j66LM0Xb
	zKO/J71KJhg1SIVfHJzwov1UR0xrMoYin1NwMdnBoossn6miF3m1+MOw4GPUY7xX7KkPh0uPBrx
	7VSVc3B2krgrzPY=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr58655781a91.25.1789045099266;
        Thu, 10 Sep 2026 05:58:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Thu, 10 Sep 2026 19:57:33 +0700
Message-ID: <20260910125742.150902-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055820_321675_0E2DCF0D 
X-CRM114-Status: GOOD (  12.37  )
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

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 933179f2a5ba..88f15a9c2513 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0


