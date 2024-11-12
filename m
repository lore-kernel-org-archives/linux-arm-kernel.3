Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71E2D32D91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INZ68V8ZzPQ+K0+6R6zWVdhvSUlfl6jPG2ciH4CVsnY=; b=cLnoNNIkgJezSVuKgNsHEs2CmJ
	Dtogr4fZnoruek18Y9H3ZsDrdf1a+feseiavK9Ac2yD90UaRyk4taQK6lq4IBGSZHuoXogvcoTzdT
	crREKILZBZoaiJXk9tBHo3yPKVR8wWz+WPS/h/I7kXBDSYSeVaK3NJX+677POpXrybxjiZdPzrPvH
	uxRwoFTQF3etTd7y9IQ99wTTRTdjz35ei70/vZ5posm20i55ioeUNLkVcQXdoRbfidUF2Re5D4y6Y
	n3iiOIwFIctz+AQLz/07Bqip7ehVXr3/PP+5Tc8DTO9wdY2gbuTUYHnAbVFsu9s8jIkLGmeNxOZli
	uqbRdRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoj4-00000003A56-3bax;
	Tue, 12 Nov 2024 11:06:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHA-000000034XZ-3msg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECA3D5C4D44;
	Tue, 12 Nov 2024 10:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4DDC4CED8;
	Tue, 12 Nov 2024 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407856;
	bh=lcduc60GNebFCYDHb+GQvYHyFjg9yhZLS6nfuLgYaqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A4YgFNSE2Js6HV9ohpgTmgXM/6dmh9kiLnKZceJF5OcdG8vPEG5Gm1eBzMgYW+H0j
	 WOumfIJDBrCMzUfnu4qLs89rQxOVipXjvlfO92xVg7a53g8SlfIPuTyuYxhV0qTndI
	 qkTd5mMWfNa3iFc4STkVI8I71Pkf8j8z2dWWlJ/6OqyoFEp7STARqRt07RZL41jYGD
	 7WpMIrtueFZbpJCh36hOIZeOcOMXd4/WRCNBpyt5Jyl7bBGxo4xezCaLmABw1nLrDl
	 SCh1mC3U78epy8gUYYYWDmH2xaPbmC5vcnlqS5LqsaDKnRyJ8pXjbg0fqq3BhjDmRB
	 huQ3nTxhY9SAA==
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
Subject: [PATCH AUTOSEL 6.1 09/12] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
Date: Tue, 12 Nov 2024 05:37:11 -0500
Message-ID: <20241112103718.1653723-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103718.1653723-1-sashal@kernel.org>
References: <20241112103718.1653723-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.116
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023737_023664_7659D34E 
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
index eb31b49e65978..3d237f75e81f5 100644
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


