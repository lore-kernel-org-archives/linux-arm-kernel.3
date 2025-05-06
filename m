Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC01C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9641NHNk5qFDO6SRPapBY7yEVofGXQ0J/U7vAQhEbr4=; b=frE4M8K/RgkxBI9D/3KLPoUxFo
	FNxuLluOwtROWFo3Yed7DYLFYrUSSx9suw+93yE8GIXs5jUBebTAk3AumSgihDa//XDjIUA+7i9jF
	ks5J0SfL/zDEO3RVdRkC/9mVL1PZQNBSRTL/uwZCJvNS554JG/z8y4JSkUtp6yuH0Vvb/9zSrV5YZ
	old7WpGCHu90vrFaLMUK0pP1kOedNBMdmRbwiBDGgPVxFaHo668LB7DkHczml9btbjC/SGA00DCas
	uc4V39xzni/3Fgnj+UOGLMx+ZrugUlbCpVx/PRkrssBU2P5y4nuFekc2Ppf/aTSGU942RWAJmxCzt
	bnSCxe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjj-0000000E6on-2Nzc;
	Wed, 07 May 2025 03:46:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPya-0000000DRPx-3hRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31AC7A4C3B1;
	Tue,  6 May 2025 21:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B88C4CEEE;
	Tue,  6 May 2025 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567439;
	bh=sDdNilLczBKLaYqH/j1+dAzPrmbkU/4O96N81w9WPAU=;
	h=From:To:Cc:Subject:Date:From;
	b=GFll7MACCfR30CYypbhc3YU4zQrW+sGnDisfzoH00p5OQqfXhoLJNyDslyTWzTgLm
	 zPgsGJ8anCr08Gku7f6TkhgldVWZFs/OqbJMJ9NzCayW+cecVJqcZkVAp10KdCt3tY
	 to1mgfK7BcuY4u8XX5Vyx4TEw2c5tL60UJhUQxYBC+zR4pDJQ5sdWmGu2202dlqvfB
	 tytHH0PNHiHzbrV6g2Czm9q7Dr8N5QpLpzkYlOPhidBAHaJVezxvCLoRorE3w4rFlI
	 WZUJHDEGrPV64ZTAamKTn12mtChhEmcejDop5wIoap5tTv6AoduUTcDWifmSZ20WIN
	 4wtYG8frBy+/g==
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
Subject: [PATCH AUTOSEL 6.1 1/6] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:37:09 -0400
Message-Id: <20250506213714.2983569-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.137
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143720_981727_DF786EB6 
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
index c6d55b21f9496..11430f9f49968 100644
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


