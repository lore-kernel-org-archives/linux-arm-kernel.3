Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1369C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Coy7dRfnlM/7E3bFy4Om7BHxN6AbvgNVq2ZuMHIXKLE=; b=nQH49lW9TcSiqz0SH//T8IkqqH
	Ei4YTCPW7DmFWgC7V+GqD2G4ICqHlu3VAXeurcAifrLTEQvRUZeaDqG/muaE4mdQjlWk4NT+/7UgB
	uMv5evJzfnQiLYFl9BzUKxqNOfPIgy6QY0dlReQ413khbpamiwHShJy1AY2JBoPWo/Ri9qT+C9b0l
	A2YvsuaQgEYYmbbfSDvgmuW3c+gjbA2NHF27O60mD7pLAAUX2O2xcS3YYfAkW3tAhz2CRopRmI2AE
	eXy4Xivldmy+1OpcgPTN8f5EyXA7Vc+VcSUO9X+AiJhmfDxXknPHZPgH0qmaG5evjkNlGhpRpWffj
	ak1+UC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC98G-0000000A22Y-1GHn;
	Tue, 06 May 2025 03:38:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4vy-00000008y3D-16nW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:09:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A663F629C6;
	Mon,  5 May 2025 23:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A421C4CEEE;
	Mon,  5 May 2025 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486553;
	bh=jsoHvHLDzA/XTT30/MF/phkHAm8+PsqfqsZss3bnfOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oaUpI+aS0ZlRP1r+uvpPVTeNEDKcfYvvVD91kqCn+pRDGLDQJP6jgIcYwnFzjlFTV
	 4c6VP4sriPhuZDVOpbxFVyVLkWOzvwnEfvZ6mSCmSb4uOfnzSZqQ8eDuw4g4/tUwKK
	 gQiSS5xYr+YcZ2x9kr9heYEfwWv5EZm58Yuz4OQFZ46QIEa4VMc51IfZ7TJJwrYicc
	 M7EW/2Izc76qR5+8HWhJQRqBB2ebOXWUWaHjKLdnXGAw5yDnhgG9JfV7ydY4D1cJWp
	 P/BRDOWDO+JOuj2fbVW09c9Gqqh6oC4CuFfd+z51StMkHgJq+HGVxmEVTAdbd8NMeG
	 VdWy2pBREhi8A==
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
Subject: [PATCH AUTOSEL 6.1 087/212] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 19:04:19 -0400
Message-Id: <20250505230624.2692522-87-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index 1dbb89f0ddb8c..b2a977f1ec18a 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -802,13 +802,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
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
 
 		tsin->rst_gpio = of_get_named_gpio(child, "reset-gpios", 0);
 
-- 
2.39.5


