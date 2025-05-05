Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7D1C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrEtGi5abC1WLM2ZvnZwtCHhEKLW3HSUqhJ6mSB73+0=; b=MzxM3xkY//AIZFXTdnUv/nZ46w
	nbRq7Zd1bT9afO5eDCv08trVR5UzFawijcAr+AYNkD+VWs+O5O7KBeI+D0rhGfO38yhwKkv0QnEiq
	f44rGAhuN+YwbBGqQhS5Yc+Dha9XvTjeXmKI75msT218PoZcnivOERcifdN2Un5oDWtMgJFWwOV/b
	h4BK6aX6ue7mDlLdoj/TT7+clBexFZbPiDqL+dUn7+8YuA4bJeBxSKczCNlXl2utnAFLSmjnyfctF
	+MtL0H/mn2uSwS5tEApOUzJDBwTCgSJE32yZ5JjuOuMsvu1meRmeW/KHeD94q2lYjxnQ/hYoyR1aM
	8ZKcaDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC81K-00000009kZv-0H9u;
	Tue, 06 May 2025 02:26:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4kY-00000008usz-1lGk;
	Mon, 05 May 2025 22:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6EFAA4D035;
	Mon,  5 May 2025 22:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E17C4CEEF;
	Mon,  5 May 2025 22:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485845;
	bh=PE7Vp2EO7oix1ywNeZXCp3CTiaz6XzQCRZFHSUhhTFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qeYmz8uW3u4Imdnh0ZF8V9d6QToUHLbMY/Mw9K8zukZLJ4hI9LnYTsuRU5OpHy8/9
	 E72vNwPseaBTK4ZmQL65w4D8UivpMDwULNMHaZ86pGYItgCbeBdfYybhX76yUG3Aw4
	 bNYLnzCQf2Wn6a4tHuKZ/LYUIIcrbwZDip89Kak4p4hMqoYAClB51zZuktZMC4WrRQ
	 YnFZdiP+7c5Hn4JC6VzcXxcJ2Tn4VshuAPqTsx1NQ5s2LU3IME+hLfb4PuOl8+r5PW
	 msmeTyK3RcRNuEO6mfMqXkTHlx1rtFAGRTdl1V75+hQB4UKnxV5Xx/nNGCpd+qnxWD
	 Z+Mt+eYBXXvOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luis de Arquer <luis.dearquer@inertim.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	heiko@sntech.de,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 025/294] spi-rockchip: Fix register out of bounds access
Date: Mon,  5 May 2025 18:52:05 -0400
Message-Id: <20250505225634.2688578-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155726_533369_7B054C20 
X-CRM114-Status: GOOD (  10.50  )
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

From: Luis de Arquer <luis.dearquer@inertim.com>

[ Upstream commit 7a874e8b54ea21094f7fd2d428b164394c6cb316 ]

Do not write native chip select stuff for GPIO chip selects.
GPIOs can be numbered much higher than native CS.
Also, it makes no sense.

Signed-off-by: Luis de Arquer <luis.dearquer@inertim.com>
Link: https://patch.msgid.link/365ccddfba110549202b3520f4401a6a936e82a8.camel@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 1f374cf4d6f65..1615f935c8f03 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -542,7 +542,7 @@ static int rockchip_spi_config(struct rockchip_spi *rs,
 	cr0 |= (spi->mode & 0x3U) << CR0_SCPH_OFFSET;
 	if (spi->mode & SPI_LSB_FIRST)
 		cr0 |= CR0_FBM_LSB << CR0_FBM_OFFSET;
-	if (spi->mode & SPI_CS_HIGH)
+	if ((spi->mode & SPI_CS_HIGH) && !(spi_get_csgpiod(spi, 0)))
 		cr0 |= BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
 
 	if (xfer->rx_buf && xfer->tx_buf)
-- 
2.39.5


