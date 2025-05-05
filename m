Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C551C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlVkZj8dxh1uPXD1CT1oixzxU0+OHNuHmUIVNMRb+3E=; b=LnkV024goLpGwen2Rf090UCwdF
	XOD2b1FQJ8kWvGMFvyhqvbXpWIOebKcLFYbne4ru3KkLTuUzwOLT8S2zpp1zaGnvqkUwMW/wVXS2S
	4Ivzr8zrVhpIeqjA7/Ss1mV+fdU15Vv3fD73QuVqkTfzoDWCLjWw+KVUJNCfbuOrpRkwgIntHFdb2
	xgG/j8xDzbKQHYq8Y2OomKmZfYf5VwFONgB9SuJVcS9/Nx0UvP8NWKQoJONehfiLSyXMmfNuvMpyA
	N8LenpFoVC40meo0kpBs0fuc6Q5FOPYrs6DknPInBhNLyZfuJGMUjj+5mi44vZJfWwm/r+Lo2CbHl
	UwWFyqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC732-00000009VJD-2YAe;
	Tue, 06 May 2025 01:24:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ZN-00000008qzb-26Ea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:45:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C0A3A4D089;
	Mon,  5 May 2025 22:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85366C4CEEF;
	Mon,  5 May 2025 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485152;
	bh=g2WEwrfaj+A0D0qzRR2dwBV3cowTvNzMAGlu4M30mDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ln06VOsVAt4RPKtyYTk/y6Es1/acfqhb9td1QjOU3dOUBeFZlcmkOaGsEwtWfbbdR
	 mjD9lj3g0mjLXWs5mxVKBGnv5WzJf/q4HoT2DAroEJjn/91ezPPdockb5/bVZPscvf
	 S+q66qCYngBAlCUqw+5zzhf6j/7wY+OgfPgPn1LqnvE1AIXtCqDRoP20XfHfRcHpje
	 fVTUN0KGAI0adVpSmSTWmHPUeew5zqbriEBeR6t/3bvd4guoqHLpbW1H7qwV12H0IS
	 SZr5OzL2m1ckB44/P9MVYVUBRxHZqwJv9IEu4ogfw95+SW8PvmQOz9/PR6B5abi/FQ
	 zwLmHF9yJVG2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	patrice.chotard@foss.st.com,
	mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 187/486] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 18:34:23 -0400
Message-Id: <20250505223922.2682012-187-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154553_636326_7CD3F093 
X-CRM114-Status: GOOD (  12.27  )
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

From: Markus Elfring <elfring@users.sourceforge.net>

[ Upstream commit b773530a34df0687020520015057075f8b7b4ac4 ]

An of_node_put(i2c_bus) call was immediately used after a pointer check
for an of_find_i2c_adapter_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 67d3d6e50d2e2..ed3a107965cc9 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -797,13 +797,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret = -ENODEV;
 			goto err_node_put;
 		}
-		of_node_put(i2c_bus);
 
 		/* Acquire reset GPIO and activate it */
 		tsin->rst_gpio = devm_fwnode_gpiod_get(dev,
-- 
2.39.5


