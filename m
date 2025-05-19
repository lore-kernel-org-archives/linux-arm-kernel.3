Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F13C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC05k4FOdJD+8DzLgjtsRkmi2UAg9CR2344wE+ZnR/Y=; b=JO14WmKwY4zOh5jg6zxiIGhmWc
	A81e8yy8eZDam9uh+Fvfdn/ymgA9x8bkKVoG78qj+e8N+I1ahCr1l2/ieKmuGUzxSQNvtLfFnjz28
	U1+b0S1suPDEPeo/g5+v15zOP4mIGqIEQPVfAK1FNKuWNFsaiFx0ecPoHP9egRyv8PaGNNzXj3Ofq
	Sjla0BEU6RgtKzlbtpYL5boOUyNShpbU8bQQmHtkq9kIQpluUw5dHnzlThzIjZsf8j3BjaBs4LQmk
	wde9Ycxml65wyVDpFPKRJlTVDE7b1uEfVd4XkiSlHayc0M2imRlKGDZ7yQep9AQM2dziDjKTX+zt5
	zLBEgAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Aa-0000000AaTH-2aAb;
	Mon, 19 May 2025 21:37:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7x8-0000000AWPu-1abg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84B555C55CE;
	Mon, 19 May 2025 21:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504BCC4CEE9;
	Mon, 19 May 2025 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689797;
	bh=pOFSHYTAt9k+byuw5GnkOTfdc/p6LzC2lKTZF/eBYfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiYJLWd6gLDu2O+0iYStgFZBhJo0PctqhcF8IkVBBRwXPuEMIXgO+RHOk9jb+8zRy
	 MV2/gc+U0DNXnqI1BOshcsLPGl1jl3mF0CJFdceRrTSq4PzEgfQnG7Yd0xiPr8s2Pe
	 lQNYhU633lDaGvnIa6BloEKz8Vm1fzYIcoG/0YSpuKP9Pb8yTo8Hn3QvF+/lFS0NKW
	 p/PtCew42odVHlpCNXpx1v7rKfIKzirRFFga7ea2vDeLIg6whBQBiT+/ZpRG3mFwzW
	 u8JO50TeBbq4BRt33JtmE5McfAai7HTyaa74YGReaZ7HqDE/lq8G0QuI+OW8ny7WNC
	 sJcaDeQ6IlQPA==
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
Subject: [PATCH AUTOSEL 5.15 5/7] spi: spi-sun4i: fix early activation
Date: Mon, 19 May 2025 17:23:06 -0400
Message-Id: <20250519212308.1986645-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212308.1986645-1-sashal@kernel.org>
References: <20250519212308.1986645-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.183
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_142318_478498_D5AA0B75 
X-CRM114-Status: GOOD (  13.33  )
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
index 1fdfc6e6691d2..a8fba310d7004 100644
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


