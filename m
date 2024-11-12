Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354ADD32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bizc0V0N2h71e5pJ8CYQEZpt/ecQWCz15rmQxuZ7VmM=; b=ttdMZRqvUsqKz8si+a5pZBvbHT
	onn+B/43kxgosDJsVGHHchiV8Cwz54sUaqxEAkWPVGd8wiHdksZtNe7hnaQdzHfheFQiLbo9lyo9T
	B2lgOKkyEER1CeuqUnRqM4vKexW7gKabtCV891GeRKiTEZCkDHDriRmBsaFNtqWOEg2Ux3UAoeh/L
	nzWw982iXIyAHfQn7y4s9vFAuo48KzYAknpKIvNaQf2yA/lrRFEQGAG4T96SR/rHz2gMxPyVpdjNl
	Da8pvcpPtKgIMCx1YDL3sp18gm+7maiif9xrZRgsTG+FRE4ibdfY/SBVvUggNI5+51yB3CLH2AAWJ
	FuTSlY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp4F-00000003Dvx-0Wio;
	Tue, 12 Nov 2024 11:28:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHv-000000034ma-3xfv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 080E8A4196E;
	Tue, 12 Nov 2024 10:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4428EC4CED7;
	Tue, 12 Nov 2024 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407903;
	bh=UTB7rna8C2SmXb+CbI0L9/7fDGZHifqbzEw4rtLnFu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZU+52KJQQgkrYNI5B61TS9q6rdaiMEtzK6rre/DUOajJoqzkdzViES6v+9ZAFoG9x
	 OJUWBnLO+0V3xsxLjmTeSJ3fsFarvyOVzUc7jBsdgNTAz0fuoDn0p4cfZ5YlysB4R3
	 Nxx/Xmu85BQuEO/pKp0zwDw6IHXisWdm26KAP53O37/7zm0eRmWdBQCnYoAQUEhdI4
	 KH5reP0zX7ftooBREJJzyQ9mEWbTB3AZLqEBU6JSiGfqlh1bhmQQDYKNnogEhOs8Ed
	 WLpaZ9M0t552MBi7sTMIfjxIWlOd5epNP6hRZyQ66Da0BSYZgQL0NkJxnZ0xdoewwd
	 RRJD1CuqqCH5Q==
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
Subject: [PATCH AUTOSEL 5.4 3/5] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
Date: Tue, 12 Nov 2024 05:38:13 -0500
Message-ID: <20241112103817.1654333-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103817.1654333-1-sashal@kernel.org>
References: <20241112103817.1654333-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.285
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023824_069718_92798170 
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
index 7e965848796c3..b7dc9d3192597 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -379,8 +379,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	div = stm32_sai_get_clk_div(sai, *prate, rate);
-	if (div < 0)
-		return div;
+	if (div <= 0)
+		return -EINVAL;
 
 	mclk->freq = *prate / div;
 
-- 
2.43.0


