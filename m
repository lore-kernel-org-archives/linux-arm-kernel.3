Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5651FD32D94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkZo0DD0ObzKG5WB3JUFxYlgDR0jsxtGn00EuevkP+Y=; b=nVTEL8Mub5EI2yhLM2oXfOoLiz
	30MTv2QunbjXMlXXhUckhwNOcVgU5MwLSPVDNVEuZhvS7KTrChXqH7OP4rZdw/YrSDtDFCDWcu7yT
	xcy29RCODUquUZAmwqjZc8c+egYnY2eMfbjMsMT7Yi06KCIJdMDDxqb4af12fgKjJDbcldsmTBHSM
	idreKbtexhzKVN4f9vGQ/HaTSz846+fA7tUyNeCTLVc8twZifcI3XLtmYulqHuQm9LNr4hnRF07K7
	vKTT7a609WkSQC4zPgwRHc8pc3/OtIN/5/2pJ1ey/6yvZp+q0udG2lCWxJgHZoUkWJZ10molL4XUW
	euo6dE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoyv-00000003Cuc-0OIg;
	Tue, 12 Nov 2024 11:22:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHk-000000034k2-1GHC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55F2CA4195F;
	Tue, 12 Nov 2024 10:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B449C4CED4;
	Tue, 12 Nov 2024 10:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407891;
	bh=QhD5Wrr4zZ8WGJRryVvw7+4qMinM3ZvNb9LGCp/cyiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UxioDTNU+dwIPLLZPVNlDm6PoZKAfUNFRfJfx3+Q1QElgmFlopY1OF7yn4/kKofk4
	 ZZ9j0n9DTlDjfVMX9oulH/a+HEf/LfJHksk/7SfpAZnRwzV8wEI2DiwKzJEdWWS/YD
	 oQq4dGsTmfgs73biHX8QqzJPIkh30FZHvqt8C1BLl4NukzAFNE43yctvf79niOeWst
	 7VwIsnW9xWjVySlGeIMwSRdSW4NWSO1bkthvkbgibov236YrlwXzTSXh9vcLmccvqA
	 tJC/PKuo+9nazM10KwJtZgAnfwjos3og2uX93XCeRN07Ds/ZSwpeA2s4i19aAWKKGV
	 dx9TdfQ6Jhk8Q==
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
Subject: [PATCH AUTOSEL 5.10 4/6] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
Date: Tue, 12 Nov 2024 05:37:59 -0500
Message-ID: <20241112103803.1654174-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103803.1654174-1-sashal@kernel.org>
References: <20241112103803.1654174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.229
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023812_498979_55B7668C 
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
index 3aa1cf2624020..3a7f0102b4c5c 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -380,8 +380,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	div = stm32_sai_get_clk_div(sai, *prate, rate);
-	if (div < 0)
-		return div;
+	if (div <= 0)
+		return -EINVAL;
 
 	mclk->freq = *prate / div;
 
-- 
2.43.0


