Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7809BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wADUTH6wrn4QqjRXW3GogegKwrALuLScsRQU3AVWT8=; b=QcDJGc3EMVoq2+3jZUQM0Rl47W
	r+rnndutd0gWdL1ep8XJ+T19DTuGpIx34LQkkJX+HNzGSIKw6J+g00h0YSX4bA7o3eFtwLUeskQZM
	EVlhjboPArjOsX9A8VOeet7qW8lv+zqvH185pwPLJG+uSFfaM0graZkLHBMKqLI5knsYafuhv+iuv
	IK9xQJeOjgSnyyHTrItkqIu1CiaaTzuFUnVmjUiu4565cJlns84J8veOmz0om7oamuWwjgCkaYfaS
	Sog1Y/DWGgBJT7np1PID85uwfU1G+1uLQBSMJNWUXoV8niqFMmkn6/jP7KRiTQzSo+c18H5OHF361
	OJzk1DeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH84G-0000000AYXZ-0h2o;
	Mon, 19 May 2025 21:30:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7wJ-0000000AW4n-1iKR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACC855C05CD;
	Mon, 19 May 2025 21:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746E4C4CEE4;
	Mon, 19 May 2025 21:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689746;
	bh=cw6Tkijcuttb9ZLMtOBWn44aOyeM3pb3rshzRVE8F0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXlvh++HoFlZzlhRFKHtN4xARnAzfoWTM6LyP5lcEtWyZsIwOROcdAh5XwD6lNtF4
	 6OR8wa7J3bGD9xkUwS/CycAf7em1LaVn6Ys+QYAeXMMn+0AHQWhjoVjDGaAq8qSy1T
	 Va49KwNMnu2cDGKlmVV6fGNg/zBYAZjB2AFYJiSr3yihRcXc8Wt2lrWNCcVUZu7AWt
	 UNJHaiUVYVOXQkjGZW9FohxBBUzpvgcu+adVg+QnER+05jqXge+id8p8PkQNfL365I
	 b9khkGVw71vNZXVRwKTTw/YfNd7jTP8AqZVmE2Y/er5IEJsWNf1kCjRe8iBoHgxqle
	 saSDpCxSOxxCQ==
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
Subject: [PATCH AUTOSEL 6.12 11/18] spi: spi-sun4i: fix early activation
Date: Mon, 19 May 2025 17:22:00 -0400
Message-Id: <20250519212208.1986028-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212208.1986028-1-sashal@kernel.org>
References: <20250519212208.1986028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.29
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_142227_489861_E57D75F4 
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
index 2ee6755b43f54..3019f57e65841 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -264,6 +264,9 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 	else
 		reg |= SUN4I_CTL_DHB;
 
+	/* Now that the settings are correct, enable the interface */
+	reg |= SUN4I_CTL_ENABLE;
+
 	sun4i_spi_write(sspi, SUN4I_CTL_REG, reg);
 
 	/* Ensure that we have a parent clock fast enough */
@@ -404,7 +407,7 @@ static int sun4i_spi_runtime_resume(struct device *dev)
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CTL_REG,
-			SUN4I_CTL_ENABLE | SUN4I_CTL_MASTER | SUN4I_CTL_TP);
+			SUN4I_CTL_MASTER | SUN4I_CTL_TP);
 
 	return 0;
 
-- 
2.39.5


