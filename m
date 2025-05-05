Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA66C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo1LKY6L8tvrFgEZf69KmZAmIlgPUFEBEVNltSCjKQk=; b=HXAAYefvVM3GRXhGvXy57hR7kH
	GtLHfEbpIh6xejkZL0S0KANmTLFABnKyA6YWnzffSIEZJK4ZAjg5sM1kYXvznIpNmw3Goo0qyltVz
	M6Wl8F7WD9VLNjKgmqJkZ/5htMmz6aVo7euz08/lhaEK7GZLQj/81FawOC+4Y/Nca79eAHJyvSNIm
	cZSunrWway8Krj36kg9LzbO0Df39U+RXaLrqOkrQVGaNr5C6gtt3Kv4gCgDJrwjbcG5CihkMuZEx+
	Rz3/kMvG2kZ+/MNfZ2Hxgw7ez70pWJHROMRmHH8ieGAEVJk9GdF0wWWWYF6DnaqkV4dVDqoiGbUaw
	yLIc5DUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6RJ-00000009MIo-1BIr;
	Tue, 06 May 2025 00:45:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4U3-00000008pNT-22vc;
	Mon, 05 May 2025 22:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13ABC629C1;
	Mon,  5 May 2025 22:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A0AC4CEEE;
	Mon,  5 May 2025 22:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484822;
	bh=DtvHFykVSDQuaO9lkQBRldoHX++x89ZUDYXZWFSdAIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gWt3Au6Oga2Hd+B8hhpeiuFy/MNmC8NbuMn5tzL80rxdeVnRlfi3WDM27EBFtSSHz
	 Y1aHzp0M28CiXGVa+GJcUsTX9OlqB9vB7dtpGG5J+WanrHqWVNdV8WYYFRWgfwINCZ
	 Guhf++53j0b7QqcRM5nC+J0saQsWcIgs58/qQuXpWFAD+W8qkHSSVBK/E4OjUTOpiD
	 ZfElBXIwCBCKq6Bw7N3KvnCmh37hQtjjRiRBkARB5b5SS+VobppRRIfbHzvVXCPHyE
	 cf78TU+UckenYEVsyuGtL6PMmaGzgCjzitrVOdfCvkEFLy/FIsq7vhI2e1HcDQbFS9
	 WIckcXpxaUE4w==
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
Subject: [PATCH AUTOSEL 6.12 031/486] spi-rockchip: Fix register out of bounds access
Date: Mon,  5 May 2025 18:31:47 -0400
Message-Id: <20250505223922.2682012-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
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
index 40a64a598a749..5008489d6fac8 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -547,7 +547,7 @@ static int rockchip_spi_config(struct rockchip_spi *rs,
 	cr0 |= (spi->mode & 0x3U) << CR0_SCPH_OFFSET;
 	if (spi->mode & SPI_LSB_FIRST)
 		cr0 |= CR0_FBM_LSB << CR0_FBM_OFFSET;
-	if (spi->mode & SPI_CS_HIGH)
+	if ((spi->mode & SPI_CS_HIGH) && !(spi_get_csgpiod(spi, 0)))
 		cr0 |= BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
 
 	if (xfer->rx_buf && xfer->tx_buf)
-- 
2.39.5


