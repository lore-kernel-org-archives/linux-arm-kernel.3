Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40629C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4XxRWAN6GK6Fax7SJc+elPB8a5y9AgMJ8ypCAkVheY=; b=kVbsH5CkL0W58kzDwPk92IOjHL
	dlLY6gIQsufWpqXVW1gxpLAGQ2pfwkWNK2yMrHoI8rmHmKtjc5q05487Wx6WiirRMZlNUPMfQij22
	ubYeZUpP1TZpcCNh3IGx8d/Wn6CD3SLRJlEglyGOzKRFg1wGNflcOdNgM1w4s4e/2Nj2RfLztAAo5
	ASRhMv7CC/LSfB9ZKkFCYzvhwdvhwoeES4FrfQ2UwU8ZPuza8/Lt9v0RxuMqvYvDx6xP4/uKfm63B
	PGsdVFX7pkcvPDcE1k3ls/n+yRbkL60SwR0RUOCk15MJJ7s+Zi72uxLIv9FOXXd9BAYQaROzBbNIb
	ztRgJG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7cQ-00000009e89-1MHM;
	Tue, 06 May 2025 02:01:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4UH-00000008pS4-2aVz;
	Mon, 05 May 2025 22:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8CA24A1FD;
	Mon,  5 May 2025 22:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D41C4CEEF;
	Mon,  5 May 2025 22:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484837;
	bh=bvXbAwZuQg22ns0JxMDE41OePW9+9SN2J/jJtCw8lVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uK91PWci/810fdqb6BtneZ4X9u+2pcfR7RbRkbShgcJgjuKfkgaWwd4zMWbdD+TGL
	 fy+G6KKfvh5zskXrWs+duS1c+pGSVcGqZKM6cVG59tVBynEHlwQpv5DyXycUdsG065
	 tJP5UrpCvxBddtuIjyudAvsMwb6OzlKNF1O6r9wvf+UdHyUqbkduLAZHBaJyN6WGN7
	 pSJCgnAoZSvvOv+BN/PjeCu3P8cYdb6YCsOn2DbCUFruvHIVDg9uUTGrBJ4ZPu1ek3
	 mzI5MiNqpz/XZ3nLjSsH+HLROM5eq0d1WZzoGcQs8N5/BxBvp3aJk9y51dFPFH0IL3
	 gnkjuN6QUZHiw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>,
	Pedro Tsai <pedro.tsai@mediatek.com>,
	Felix Freimann <felix.freimann@mediatek.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 039/486] Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ handler removal
Date: Mon,  5 May 2025 18:31:55 -0400
Message-Id: <20250505223922.2682012-39-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154037_676210_86CF9EAF 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

From: Sean Wang <sean.wang@mediatek.com>

[ Upstream commit 6ac4233afb9a389a7629b7f812395d1d1eca5a83 ]

Ensure interrupts are not re-enabled when the IRQ handler has already been
removed. This prevents unexpected IRQ handler execution due to stale or
unhandled interrupts.

Modify btmtksdio_txrx_work to check if bdev->func->irq_handler exists
before calling sdio_writel to enable interrupts.

Co-developed-by: Pedro Tsai <pedro.tsai@mediatek.com>
Signed-off-by: Pedro Tsai <pedro.tsai@mediatek.com>
Co-developed-by: Felix Freimann <felix.freimann@mediatek.com>
Signed-off-by: Felix Freimann <felix.freimann@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btmtksdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 11d33cd7b08fc..d4ea1ff07b3e7 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -610,7 +610,8 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status || time_is_before_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
+	if (bdev->func->irq_handler)
+		sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
 
-- 
2.39.5


