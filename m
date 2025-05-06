Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D49FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwgYvqopAzbsE+6lk2Pi2aF4CcdwbioO2BdIZ6OFToo=; b=hyyx537smNnJVKmSuQjvXitsKv
	kBaAm9p1Lpx5OA2x5uyggAkslbmOiLGY451ZdlRL6yN3NalaF6M5LbPYj+/h7101oTZ3k8U78/XWy
	cgQf64Jmyl4uI0G1kPDNML58qKv6jJiWjoHoxBWdCvc7c/ihtxlfbM2M4dAQcpDt8pKZIbMQxcy9Q
	h8knGrcqQYkRFPFNY3NIcJhiQndGyip9UIAKttHQkTgZlVCH0/vzF1tsvepSL8FFjSBrAC7O+mm8h
	YGpOo9eKzaU1nUiyXKwkiUncGUAjR2rvdBOLQjgBZp+FzZnxGChM8NYjvF5kwDx0V89XhFZ4poCuh
	q/IcIQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbv-0000000DwnQ-0hhk;
	Wed, 07 May 2025 02:34:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPwo-0000000DR41-1yEr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B294DA4C3AC;
	Tue,  6 May 2025 21:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512D8C4CEE4;
	Tue,  6 May 2025 21:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567329;
	bh=TKtp1XPzEnz0nV/IHJfa7zuMDZxO8VXjrfb3mToz8VE=;
	h=From:To:Cc:Subject:Date:From;
	b=CV0IYFxEGG3ggtbFUnwPZLVjTKIO7or7fTpnCNZtuLVBAoENhSCQ+NeDR95PU4s53
	 JYd5MDy5T8UqM7Cdl65/pNb28ZEZd4wNyYmP9uky9ecK8uXp2U5eG/dNTvUVwbcUXs
	 gF4gnwPQE5imHi1UT1L5m6Lv8Bs3vdzHqxLOs8EKa3wkBTJ7436sLdf3oFOVVB/Spf
	 SOeqr73xkw8iSUULpqYI7hRsnsrusx9G9yrarLU09r36tSVGcm8F+id/jrr8axyKRk
	 PHFA7SxUW5Mge0tKAagVbXNDtQlj68O+UBVnmeXYw/DrsbuVlbluQt0LbHj44EGkAx
	 gqlRRnkk3Dufg==
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
Subject: [PATCH AUTOSEL 6.14 01/20] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:35:04 -0400
Message-Id: <20250506213523.2982756-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143530_577663_CFDE0B58 
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
index 21f617f6f9fa8..566214cb3d60c 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -543,7 +543,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5


