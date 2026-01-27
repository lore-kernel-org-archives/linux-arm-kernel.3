Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F516D3409E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIYO+9qJJgAJUMXjo7FOnL13CFtokcC7rDBXuqsvsvE=; b=bt4AJHFPhP3BEewGMheHf7BsLv
	euFgOmOkZVhpMSV0H8SQtpI5geG7Waj54GA2ED4LYDOsIZCZ5Uxnf9IY0xsqJYNr67lTDTFd7TkxA
	xuB7670PGUj5P/USl0fJlvqGxsv/e2CC/SnKdCdre8gODvgJ6IvAuRlnT1iFVZw3chm+GPvB3bzQ8
	k39s/4lMxV9EAThFpw/LMeemZXaPwC3bOxWqiNj7IfW9nf3Bfbj3csbce0MQ4wURV90uBkYIFprH6
	fy9gHgZwkBkGWMitTEtxnU05VBLgckdd3Q8nxNc8QovhsIvFMfCgpvXObxy1ArL8FcXl3I+WSku/8
	WaIME0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcs-0000000EcFE-0nTk;
	Tue, 27 Jan 2026 16:09:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcd-0000000Ec0F-3XOa;
	Tue, 27 Jan 2026 16:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530130;
	bh=d+gX0d6NxxzZkhFVUCkoBjMXNb0bOhfwLyadx/wVaPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gOlQz/mLm9g8TluKCWHY77119GPEm4cVrg70tEo1D8iRwMzQ4/eTKutVw3hgIorfr
	 goJtuHTvsBxalsyC/gq+IaRVjIaSX6AuVEqg8SmrosVeQJzrjS5VbnFFhwgKEv6VL6
	 /3sad+aYBYEozbpURQHzA+Sg3eO3vkzacBZyaSRtQlFJ6X1sqoKvqrm5IqUaC7CAhd
	 6u6gV/IiAT3e2jU17DsIQkU1qMq7Mi1DYLT5nbrqAGCBJZlaNH4PxrdwAzk6s5/73Z
	 OIwyfNXykoOqWt6ZwuJqXCFnS5pVauaAkiVGc/5DPB3IGHA19IEHKNdGTdLZi7LVVE
	 lAdyz7ExKTuUA==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F413417E1523;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3A189480064; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:26 +0100
Subject: [PATCH 06/10] ASoC: rockchip: spdif: Swap PCM and DAI component
 registration order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-6-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=76hJpiNaNQyorD7uRIJuETkpnuEiZXSc2DTe+tcCfF0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xBzRXHRWgbxRmRRrQSCw6JunpDqe6Lj0
 UP0AdSTGyuDQ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qarCYP/Rsr2QFGCuq2NaqgTNsjXPoC4P2+u5DiyJw6cNF4PdPdzY4wZUqnW0dcKoxnS63RFvh
 4GJxOCiiLrKHSUPnTgzXNz8j/qshvw/7iSnI0JK5WSXKUuSJFxpG5zJo4Hk1Io8CTzE59NkmewA
 T/1FPrJaeaTzmpws41XXn6+SD1zA7gPi5I6BzeQh+wGtbImOy4M8kEYWdZn2M2E3B9mVa1/zNW6
 irdqfnJIWOf84zrVdGWkoqXVGrNjkKfLvg5qvOpv3PYL0dvoIoomAHDEsO3VVMau59p6xVS/OYX
 0eBroXGXAkQGm8cjxjgQ2QBSnZ0jCooV1p2YxQFbq/9SEzsquy5OG3zhvIc81tsD8mJwn7SER8H
 uZ9IQMQaAePrw6UA1gtR6zIpOR+T7l9UvnzYUakz0vseEFt/JSKln8TX+jt1WWpr0MkQRTZj1BK
 Fgh210O4+pRvsxrZahbn/4GwOd2pb2FApK0QuJXPQBpbXnmXYRE+53YwK+XieEtUiyBrV5UFHab
 cJ0OwSTEPJiARF7i7rfi7rLUvDdKnDDVKLix+qXosevIEkG3CGcgM5rz9WwLhrys59dU2LFkIDl
 RE9rvAR87gjJSGGi7nuzfyrXgHc83k+8Lng3b9WEaoiT5gJZzNrQ4MmeUuFLhuwtEN963cgblb+
 l+W2AyXzaeTvRSfkA5AQ3Xg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080856_081358_0C15F687 
X-CRM114-Status: GOOD (  12.01  )
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

PCM should be registered before the DAI component, as the second one
triggers snd_soc_try_rebind_card.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 80fd8f53bb2b..1a3b0a8e556c 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -325,16 +325,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
+
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
 
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret)
-		dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
-
 	return 0;
 }
 

-- 
2.51.0


