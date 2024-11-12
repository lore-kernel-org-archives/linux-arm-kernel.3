Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A82DD32D8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8vIZESY4mvqc7VAQW9+v3DSbIxZ/ykXZHLuPrN1zw4=; b=nWo4LKsM5FSToGVv/MTIN3kl8P
	cOJpvPFcOddeboGB+/gIAAdD8RPi2VVu+qaodUNlPoS2RsmVkgU6J2UKhq9jRx6T6ansIOtexBA7I
	ilghVaoBvTjj/kfwz+LqHS7cwG4olgcalJsO2fZ4gPEW9R1zwE5pIJG4JSyAi0KsJtyFfKVnE++NX
	3+gxzO7jb0Wy/D3nPHNo+04aGhNf1Xi1PTTOtH/j88NYJO9EQW88vbnwZSYpcjVpA7RB8EBqLRos1
	rugZH/xuNJOupJn9ZRX7qJI0eN8ZEN01W3uhEvhpPLVl0BfPsDQ0nT+L3Cvq98SdLKi2Is1M3cLe5
	XIinQ6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoWl-000000037nX-2Dq8;
	Tue, 12 Nov 2024 10:53:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoG7-000000034Ex-1g7g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66FD3A41943;
	Tue, 12 Nov 2024 10:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30D6C4CED6;
	Tue, 12 Nov 2024 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407790;
	bh=4rsZ7XKzD7PO2tZLFTEdw8ukKSap/AdkY01vjvFPy7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRGOKg2NDA6ciN67AJOduf2CqZFn2EKLiZ9mxmpiV8H5Z7Zq4kdVbP2F8bUArTBXw
	 D7fHssYX5pC2UcFIvgge/qF4TiEs9e77RKc1eNfv7LfuQwx6WJOAKwEZ8HnUW1iWXK
	 qkp3NtbR+tFy5/BSJltbSN/CUiShABmN2AsCEXBu/eQ1LpxyFQEBWRB8rxbMb+Hgpg
	 wa6jJ+YEhnE3LyuBbwIlmjHrHrDTGXY0gCFpBlKIws8osa+PgGBOiQC46AKxQzdqdm
	 yvoOrzxw9G8PJNUE1/d22kodEEOe+VbKicwInS3IyaLZhX7fTXl07cQs+kR5o9tzkG
	 smyxmqqDbu0CQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 13/16] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
Date: Tue, 12 Nov 2024 05:35:55 -0500
Message-ID: <20241112103605.1652910-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103605.1652910-1-sashal@kernel.org>
References: <20241112103605.1652910-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023631_534028_03B0959B 
X-CRM114-Status: GOOD (  12.52  )
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

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

[ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation (*prate / div) is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ad2492efb1cdc..19307812ec765 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -378,8 +378,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	div = stm32_sai_get_clk_div(sai, *prate, rate);
-	if (div < 0)
-		return div;
+	if (div <= 0)
+		return -EINVAL;
 
 	mclk->freq = *prate / div;
 
-- 
2.43.0


