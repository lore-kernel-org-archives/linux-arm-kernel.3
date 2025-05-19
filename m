Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA6C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4savt1oZzFHTdK2FXDzF5yFP5dIEMWAQtiWse0iDXzw=; b=rgcqzXhEedNUbEme6xMUajRLE9
	q4QsVT0uDB4BiOCeLHllRtExy9KQUAPbQCdWKhogR/gyMZvgRz6x1sPQsun1GYn5MbphRf1xSPlPr
	87kQsZkZMaoYOOabVDCdtZqeYDZXmwYyukVFA9GC396Sak56Hqvm9aCHSl+KIF2zUe09rxDz9NS7A
	pD2Keu/EhpkR/GbA7Kre4HoskAWOO57Aoi3ZelnY8cxtkWzyd8wVu/v4GBXStiRTbY4kYG28PQjy6
	aVVsMfsAtkDnX2iTVUhqqwmJ2cF6cgT7SHeWACIAVi0eKYSDUQZ7lKyXBQrm2bUh6uYDo8U1JWxp6
	G8mDxctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH86M-0000000AZ9G-3bCq;
	Mon, 19 May 2025 21:32:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7wh-0000000AWH2-3KnJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C145629E3;
	Mon, 19 May 2025 21:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4374C4CEE4;
	Mon, 19 May 2025 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689770;
	bh=D7IBcVOI+yPkwGYr35IJjIYa1iRv9LBRLXIHo2RAt/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guL1eDFNIKRtaBNuiuxhOr6ObFUgfWKK+PzlaoM8mA4ukHV7llx4ZN3KCqOr0iaVa
	 PXiNKGRW0Co6C2yL8cI96uBdTtC2LfHbfJQZZxbkpF/SVRs45C5Wvarx//J1EzMVer
	 Ri8MdXJA3xQbk1TDQnh2gM7I+zFA0sA/ujKVD5eK7bNqGZE+vjgDloMetLk4U/s1iL
	 1nLo3c8THNh/MT3XhBrBodkq2AGd2Xi3+ZvMfhFpeJMFDSV48wXzNyvap4Zc4CGJz7
	 hx/ZnAK1lNghfOm80w3q+UX9rIy19nzAXSn7dnQya6pO1Y+6iQQDJQp85oFp8Ij0KA
	 jhrq+8IPNPYgQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mripard@kernel.org,
	wens@csie.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 08/11] spi: spi-sun4i: fix early activation
Date: Mon, 19 May 2025 17:22:34 -0400
Message-Id: <20250519212237.1986368-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212237.1986368-1-sashal@kernel.org>
References: <20250519212237.1986368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.91
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

From: Alessandro Grassi <alessandro.grassi@mailbox.org>

[ Upstream commit fb98bd0a13de2c9d96cb5c00c81b5ca118ac9d71 ]

The SPI interface is activated before the CPOL setting is applied. In
that moment, the clock idles high and CS goes low. After a short delay,
CPOL and other settings are applied, which may cause the clock to change
state and idle low. This transition is not part of a clock cycle, and it
can confuse the receiving device.

To prevent this unexpected transition, activate the interface while CPOL
and the other settings are being applied.

Signed-off-by: Alessandro Grassi <alessandro.grassi@mailbox.org>
Link: https://patch.msgid.link/20250502095520.13825-1-alessandro.grassi@mailbox.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-sun4i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index b8947265d329e..5b2cb225a4198 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -263,6 +263,9 @@ static int sun4i_spi_transfer_one(struct spi_master *master,
 	else
 		reg |= SUN4I_CTL_DHB;
 
+	/* Now that the settings are correct, enable the interface */
+	reg |= SUN4I_CTL_ENABLE;
+
 	sun4i_spi_write(sspi, SUN4I_CTL_REG, reg);
 
 	/* Ensure that we have a parent clock fast enough */
@@ -403,7 +406,7 @@ static int sun4i_spi_runtime_resume(struct device *dev)
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CTL_REG,
-			SUN4I_CTL_ENABLE | SUN4I_CTL_MASTER | SUN4I_CTL_TP);
+			SUN4I_CTL_MASTER | SUN4I_CTL_TP);
 
 	return 0;
 
-- 
2.39.5


