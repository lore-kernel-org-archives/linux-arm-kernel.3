Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DB2D32D91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiF1NA/tWDF+WPBI7j2URiODQFYkVfwnNiaINaSZQlA=; b=qpZdvKp1Pu3L+6FJoIe5or1soz
	7qWog7ntML1kFNAEdEw5aKBxmHpgEomVrhjYJkBcGtnHpbIVooKOnfUFN5FsCLC4H4ZbD9K4Qnw0p
	ZyJviDt6zmitIdczA+0rZGZ/vxW5Zb81nHfduTLQBnZATNIrJz8QoSyXkDs0lLUgTf8EIDmQP/9NM
	DDU81ZIjJ4h3qYNpwX9Ki/g7VY++wl3bsNSc3svJYof/HHtyNCMjsXJ/QGUEcb7k77Z+KOl4l1Op2
	28L/uuy9tUwNbETYhbpYDuplR+H51GVqogiHDjl80ytTbdAvkaOqAKlG094xyMki76Bvn2PO8qKoB
	Efxmrgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAodn-0000000395g-0Dlx;
	Tue, 12 Nov 2024 11:00:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoGl-000000034P2-0xXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E411A41956;
	Tue, 12 Nov 2024 10:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F037C4CECD;
	Tue, 12 Nov 2024 10:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407830;
	bh=lwcLfxHDCbI5v4tmwHL5qTHq967KNG5hV3UIWalHG6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fBpFlRIExIQodbOvLA+j0/tdyEKIabdaFcIAEQQ8/+cQ+uz9bZ+twW/h36HmJpdGp
	 XjBd4epixj3ksvTAe6Y/TN31GkOp0jhPn+nZ5gHIYKcq21Mg8G14kLuYY/LytPets2
	 ihmzGMEbx5s7C+M0aQu2Xv/LhV8mx6GCoeCuNlOFWpP5ahntNElnTFzkg5KdEDZ3lf
	 EYfcLsKMSkibxqkd2sT98Rnw6NgiKg6DIPqwQz5yAEQKBL5NdNWpI4IxSOsVhEMx/2
	 d3S6pdZie7kpKo9zfL2tz/WYQxffGmIGG6605GDCKAAAieyDoeGnmuiRfayYwC1NND
	 T3JL9JwIwzrOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
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
Subject: [PATCH AUTOSEL 6.6 13/15] ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()
Date: Tue, 12 Nov 2024 05:36:34 -0500
Message-ID: <20241112103643.1653381-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103643.1653381-1-sashal@kernel.org>
References: <20241112103643.1653381-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.60
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023711_370919_B800F134 
X-CRM114-Status: GOOD (  12.39  )
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

[ Upstream commit 23569c8b314925bdb70dd1a7b63cfe6100868315 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Link: https://patch.msgid.link/20241107015936.211902-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 1b61110cb9174..dcbcd1a59a3aa 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -317,7 +317,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
 	int div;
 
 	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
-	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
+	if (div > SAI_XCR1_MCKDIV_MAX(version) || div <= 0) {
 		dev_err(&sai->pdev->dev, "Divider %d out of range\n", div);
 		return -EINVAL;
 	}
-- 
2.43.0


