Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EEDC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKOPXeX6sbg57Oy8s17k2ZQyCZqfoLnDjsHi21Xikr0=; b=wWfKnFwB47S8xq
	Hviiqm2vMWh4XM2woaL0VFrz6ZKija+S+gizW8Dx9uRlM7mVNWCCy9tzKIEGDOWzP0HlpG5rTERPI
	+3X2b0KQAa4PioZcIJOZY5lfBGiQ3SXx5aOCrR80uszhUTrvPBg05NsM259ZYZRzooNpdfotclxc2
	5/NrA7Dp8kI1TWAIcCRE8cPQPhGod2r75KOluqZIQ4WDdFTmX977j+Hl8ot229V/E+WVdCUCD4Hef
	frfbnwWvJM20/i9drfd2DLWiXG28kaMdvJ3ycWjwXfYIEirBCxVaGer+m3KEW4OFcIhn2CRcFOrfD
	RgJLb5VCamAjipAsuYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLjp-000000024Ye-3CDb;
	Mon, 27 Jan 2025 09:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLfY-000000023Mx-2t23
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Jan 2025 09:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JKOPXeX6sbg57Oy8s17k2ZQyCZqfoLnDjsHi21Xikr0=; b=Nq4kRwJKjgwJ6af1+87NeA25P4
	H9lS8/Ef8mvfhDkLQxzXAxR89LWbpzvpOlyMB2LAsiD+MKTmorhh+UIlgwMrnwKofcqVp9JXEcUGg
	Bi7uZPg1fjXkDcYUYcLeo+8wlPmr4q+szIJfYqNOsEtLwJuLQQyrH941dqjt946x8CGCK/nsMd0DH
	NpTVYBeu++LZ4+xtNztJHft0EfbprPvj/2dAVVKz6WDFXFUJl7HgZHv6117356blkMDU+f8LWufRE
	otzMVqCjbPPaOgkMn7izu/AHNhrLqRt78uY1Y5DhWiHy8k2iflDjCWfaMtzWfQk8GT47aDDEVdJmv
	aK+1QCtg==;
Received: from fw2.prolan.hu ([193.68.50.107])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLfU-0000000Eg0U-42lY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:44:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A90C8A047B;
	Mon, 27 Jan 2025 10:44:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=JKOPXeX6sbg57Oy8s17k
	2ZQyCZqfoLnDjsHi21Xikr0=; b=McwYYo+QddYExT8iA+HlNAvkIIjjvupac1m1
	1lzb1hUixnG4FW6CUuIVZMnvPziv0MrS5TRofzvB3EHYNAmqCEPgcLpJVkngdTZH
	KUXcuLtnKCKkei1turpmiUipTKI2dDUdipF9zuIsfu3l0qrUaifkUja1OvS39vZT
	QFOMUr2HBx82MKWL8R58aQtXIBa5i3uJ1VR8x1LDYWg1mN2vQYw8/yDgwfi6RjbM
	2oO6ShRygpBZiXFiV2DpA8eS6Wx5CArBibm1EbcO/pERdnbF2WkqfLk9mir27XxB
	H2aNA1JHI3hcHevDymkjGKnyuOfjGsNYMQXRM2o+5Dm5kOG1SS/mHaFujsvWqIPK
	ZZRyeEs6ToFTv4vvXNJX/Ztf+iOl5lp688AhJeFUTueDtUygU3aCWsZdUCo7Sqz9
	ERVqJmIa6W127jJVxRu+N4+dX3iUoGyfI1qV5yPLfLlZNhqEIBKUdG95yi6Dz+6I
	wmnC1cWBay+RTl1haZpkRuGJqF8K2+f9KjdJ7ExY4A01f0wV6w6Fv5mJkSWFWC/G
	o3286I702pjXnvhV+0FCh6OcobsHsWgrJWmKTskZWc9aFmtgNARz61SAn4l63+Y9
	aOM8Xjb+LYNjbSFta0/AmbIMxbap2vLcXZwBE/qtSaXYgo6qlaemOmsZABosB/Ef
	R5Dcf6A=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH resubmit] spi: atmel-quadspi: remove references to runtime PM on error path
Date: Mon, 27 Jan 2025 10:42:58 +0100
Message-ID: <20250127094258.841684-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250114172329.1013770-2-csokas.bence@prolan.hu>
References: <20250114172329.1013770-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737971059;VERSION=7984;MC=3820151323;ID=88924;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485267726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_094433_614902_34041DE7 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Durai Manickam KR <durai.manickamkr@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

There is no need to call runtime PM put APIs on error path of
`atmel_qspi_sama7g5_transfer()` as the caller (`atmel_qspi_exec_op()`)
of it will take care of this if needed.

Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20250109-carat-festivity-5f088e1add3c@thorsis.com/
[ csokas.bence: Rebase and clarify msg, fix/add tags ]
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Rebased onto current spi-next:
    commit ff9e24437b18 ("Merge remote-tracking branch 'spi/for-6.13' into spi-linus")

 drivers/spi/atmel-quadspi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index abdc49d9d940..e2235d71c822 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -930,11 +930,8 @@ static int atmel_qspi_sama7g5_transfer(struct spi_mem *mem,
 
 	/* Release the chip-select. */
 	ret = atmel_qspi_reg_sync(aq);
-	if (ret) {
-		pm_runtime_mark_last_busy(&aq->pdev->dev);
-		pm_runtime_put_autosuspend(&aq->pdev->dev);
+	if (ret)
 		return ret;
-	}
 	atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
 
 	return atmel_qspi_wait_for_completion(aq, QSPI_SR_CSRA);
-- 
2.48.1



