Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BD2C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W9EpIIvGZC026Xhg6X5Ld+DXQ1Sos6ZjcJn4ZoAt1Mg=; b=vYmJXUdKAfiJkcwOQ2LyqTdJtQ
	REr4gO1B7LV1guO0nQ9psH/JcC+smVvTBYIgu/NO1efxnE/yEDjuLEdSZUE4JGZTwQwKL2be8Uz70
	/fTyTaVghzIT0e9uKP0uSH1GNaMf5abnyatgmwkXmxUINJvV0gl7yzW7leCzwBXZQit2FNYKJyVg0
	e7GRodmA9Nkbh+2+49+giGQ2ClebsLCYMwvUkEqGRXgIF/9MoIJJ7uWQCK4uJz8wDFj/VfU1v0IcX
	FPaBMgODElfas0mCBnVz5cbPADtvFgveFl86CQUqPILRTQvsKRGjCo6Cf82wdaw7P7JWb/afIA8ht
	7RCHYbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjl-0000000E6qP-2WQ3;
	Wed, 07 May 2025 03:46:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPyv-0000000DRVW-0ReM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BD0D5C31A0;
	Tue,  6 May 2025 21:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3F6C4CEE4;
	Tue,  6 May 2025 21:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567460;
	bh=L6Tt2ffMkg9EVgZa42tozx0zcdnP3UBkZcqvblRNdv4=;
	h=From:To:Cc:Subject:Date:From;
	b=hsWNs7U7gMY5LY7oLi3jBIWTu03Lv4lLsUfyUU3Z3tucFubQgZIj8ZKg+2ZCiEEFr
	 czKi/tTmSeQIDa1PJwUz/H83sHV2yPeu0jqmyNhT2Lq2zl4KT5lWCrLbKMncaahM2O
	 Lwz01Q7PX2TV/tx31W1ECr0ZhsXncI1ebgSppGLPRBzX1nZh1Iok3+2NNcSvtUY4Hj
	 atKyBez0SG0m2GbJjfAqyaXmFvs4P6REkoojh+Hvlrqt3WG0AoWvWOXCBIj6M9kfTB
	 YUobReJ/93Jg9MFnZM4XyYJl0S0Fdk2gN/bjyztcLeOaW5abUtbiWwURpufeDy08A3
	 eSxGUtxBlzW8A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/5] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:37:30 -0400
Message-Id: <20250506213734.2983663-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143741_183525_D661C560 
X-CRM114-Status: GOOD (  11.34  )
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

From: Chenyuan Yang <chenyuan0y@gmail.com>

[ Upstream commit a9a69c3b38c89d7992fb53db4abb19104b531d32 ]

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Link: https://patch.msgid.link/20250406210854.149316-1-chenyuan0y@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 2b64c0384b6bb..9b14cda56b068 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -517,7 +517,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5


