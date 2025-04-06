Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1789C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=; b=cSpHzRf2ChMuO7oceKVYIUlBmy
	re5B82adRHAV5xBWBK0xqLu/ppT5/+ckFqeU7edqDhWLR3MDZJrUF3z7HMk+A1n4d7eclzsdjFuFw
	U49vxh1gnUAPNRJPY+ETJFoiEDvIRPIMHAPDEPzWCn+mqzpSTbcO+0EDvlRt74MogokmjlijzP3Ry
	Jdm3KL0OfwULoZHu1KRh30BRS4UiBqXk8u/EO8TQSyHaaNvNpZM2bXIZ8HxZpZJprY/LbgoqMFA7F
	e3409SIkpSDssbDICwhCLgSTcQRk6Wt7FQATBjT/Gm/K+642LsfceTIzRY4xIL6NTnYR7q/vlHsSd
	0kjVgTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XGW-0000000FpLm-2Kti;
	Sun, 06 Apr 2025 21:10:52 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XEh-0000000FpFj-1JTj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:09:00 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-523e895dd3dso120072e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743973737; x=1744578537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=JoA1nYnY+NoZ3QeJn1j2isDF/vuq9Ynneapzp7k0fSHtDS9ibQMgAu357FSYHxEAYr
         rehZyuR2iRhMt5RUqArkcha/gZ61PFPQjusmqN0d05O4ZViv8YzirJzfQvgP5CaRLMVP
         w6A0jOwbs320bVmyM3C80U5NwKK6BqsmQOQ8yUNgHH+MZb/1ruPHcP6Yvt+g+OBkwimF
         wEaza38r7iAZjce5kz+CZSdeQq8n2twTvdPo6etMBwu1NsCEt8ItKj8WCmBNCdL2R4Zh
         W6eCiyjkSCLTp16fQnpMEwkH+lSuK2K4TnLlH3Dum7kTJ99qZZDPrPVY5OSmT9QhLDp/
         Q4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743973737; x=1744578537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=qd15Bp6qJ81S5Fit19GqrhHqDAYqnFG83upSz6MTInfeNHDe6CXOXMplIkKAmu1vwe
         KQiBbjAFON8t87pbyixSguv8WjZI3MArkSDasrKL/rML+5WzXWXhjQBKwcFWB2QNgxOH
         6PSbYcv2j+CCQIEgJ8lW6HrXzNoSx+nhazzGJws2Vr3ktPedEBCyEhsUYAyCebWFYszi
         11/Hijb8waCWpFWTSSGwoVSOS/5293dgmQgN4x3s70WUe1+K7p4qGbN384l7ro1lAlps
         gGcrjT9Mn5cFOctUgOXLjGKVyNR+uU72rIe+CIkVmFk/MQGl8fobyAIGmse0vI1dx/nZ
         KQmg==
X-Forwarded-Encrypted: i=1; AJvYcCV6532NlGD/j9MJwNMuCknWuchHHm3rl1N+sEZrGXIO/gT9MtTTlFIN1KP/Fsn+soT+5j6aawR94oBeSf+e8sVV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx0vlPebcUlx+mlZziLfvhtqEeCyWtoIrgZyr5LEsINLmeqFzY
	XrVGLgQl0RfbOpp9r2ceyf+yCT1S2eiHUMnSmO88RdSRvOgEiCc=
X-Gm-Gg: ASbGncu+Imct8HR5oC+0fK/kgbqjFa3D5tkCmynOpLvUtu5KdwLVOOTJ613ji7df7UX
	QKeGc3VHBOBKxwY0u+3YJGuTk2iLelIgd2UlMOC7bl2IVciAhBnM7vdZlaVWQorEI0TYFMmtKeR
	kuCkL+rGF8KilOiFQ/2v/Ym64vF1rNSKCt8mKTtKX/6BUUqs5tY1T5oJz0zpXKXKXik2dMGydpr
	tcPesaRqOiwmVr2VQ4Zi82yV5HGpmjQAKFqWedR0TgycUM4ilDBHM/NC8EfY9hlmgtIQn9QsNuL
	Knj0jQIjG+VeP/WmLJnzs2PCbMLWsuGLtB5bbi/30IDRuS6jj3h8
X-Google-Smtp-Source: AGHT+IGTpGiCEbxTarSt7y732oj9f2PCf4kNvnO3XFvF0pPA3Ka+/n2IuVGjqKpGPACv04v8yPFYeA==
X-Received: by 2002:a05:6122:46a0:b0:520:3f83:fdca with SMTP id 71dfb90a1353d-527642fd2d7mr2662608e0c.0.1743973737408;
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275afa73b5sm1615080e0c.41.2025.04.06.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Sun,  6 Apr 2025 16:08:54 -0500
Message-Id: <20250406210854.149316-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_140859_378821_02D26D83 
X-CRM114-Status: GOOD (  11.13  )
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

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..45e000f61ecc 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.34.1


