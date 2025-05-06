Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F710C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UBhgoSu/5IdrEt42iorbB9s12SvmL417LsGOIHBC3lA=; b=d5zllvePahDDo4uHt0vy7ViQci
	izNfzUe9F+0ceJP4WMCXOmRCHGkKoLK3sl4JzwZGrcs1+QrudJEeBFyh6V5GFPCh6tLDJ/xeCKB9E
	YmT0xoEK72oVdCq5TseMRB+2idWrmEHk03RKcrEOsELUBo/6ig3bwDL34MOuKDHgLzOueaQ7sB+7H
	UpK+3/FX/xkoRRqm6Uwc9l3jKzLaEIoe2re0UcyNjmK3ZF+rJGSNseE3kAO0DvbhNvMq2ox/I4TAj
	/MVmur2p6iNpzaia4eJUE4zbUnv0pbB9CkPxA2/5+euDAdoLLtTOWgxjMq/cUZEj4/36fvcHNbu/C
	dIa50BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcE-0000000DxND-3Sgd;
	Wed, 07 May 2025 02:34:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPy4-0000000DRGo-0jBK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 May 2025 21:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UBhgoSu/5IdrEt42iorbB9s12SvmL417LsGOIHBC3lA=; b=Pa6Vd9RfI2PLhn7XdY5YUePv8E
	MoOFjm+XrGzxKkvjJhfWlBokfpreRJqSHldubnjVAmv+to/f7WZx7N2wDIlE84FGHk4l54IrJpZ/x
	c3o9HToIMyC4kf2fbIk5g6Syw69sZEoxMt9c4Ip5TJ/icl4EdMGoPvxfw6Wgi41NsOZ/2aVMYiubD
	lIM3Af6MWXQQq57a84hmtaoQQ1lP54uSnrZvonrhZvQg4Q7ZkwwCqBBSu3cwH2q0CoPromOXgg8UT
	5gRuU1kUCiu0ewghQMgWzDJNEgjhnUg//PzxMGF3nou3hOjuLNc8Imxlpa6WpQYPyt8thkELT1fOq
	ekpghMmw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCPxn-0000000FhJL-2oXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2C89A4C3BB;
	Tue,  6 May 2025 21:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20E3C4CEE4;
	Tue,  6 May 2025 21:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567375;
	bh=yBu1az8/OZoi8PDKYPnp/10aiX5KHCwBplGq28w4TsA=;
	h=From:To:Cc:Subject:Date:From;
	b=dKl6VUYJMX/9CDIRIxh4vgqSY6j7YnuwWCtY00dsO63ca5MXGUmNHEi+pIBV8Ed6v
	 Xx0nX0J1fXsa32qQa7du82v/3d+mR4Jfw+7nB9igMxxgzIZrKcXgWNYs/66tLZlzN5
	 o6/mw0NtkejhOGrMQims4ChvY4JoDgkFmyDddnNsBkr+pzdtg9D4CQvTiCng4RzPMU
	 H8VcYre60/8HIcTI+a9Xhe3r0Lub4LItq8Bj1YVELSAR84fCGCF7SaCmZF1fgF69VB
	 Vgs8zeaB7g0FU3uvPfTkvUS5x3j3+ZKr5jqIJdYQc3q0nhh+DGpr+gKs7Ejlu7FMKH
	 S3SoVOm/sKk8g==
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
Subject: [PATCH AUTOSEL 6.12 01/18] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:35:53 -0400
Message-Id: <20250506213610.2983098-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.27
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_223632_920325_547D6BBB 
X-CRM114-Status: GOOD (  11.29  )
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
index 93dbe40008c00..e5ae435171d68 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -516,7 +516,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5


