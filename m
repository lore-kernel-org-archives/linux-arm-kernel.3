Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A72BC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WE3Hk7lRTT+a0M6s1YLVZX9XatRGh6ct0lOQcz7agLs=; b=v5ZD/pQrY4VjXP
	ATkISw+IBHcrOq1Cu50WuP275rr5HsYEeBsMFH0mrc+ylRYx2HrC0ZYhxyIM+3xukWloCkq4lYJWp
	WcbfW0iLhYYavWXefTYlBnzmkIjWPY+yGkfRE+W5S1w1C6ZNS3dPvWxLtgFed5O9slsduDE0MteaL
	88mzQ3ByAKTp1ztn+6xbc05+TgivicvXC4Wmid+2+SJq8gfPHTo+ZZPP1QjhY826EOUxtGrMwZc7o
	bmmSras8A+AeergeAkJPeqXtQLXNsjS/QWLoUd5p6c9Va7oFq8klcKcGN2en425KyKrw31aQn1fVE
	t66hktWiWJ5iv9hfSKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNQ0-00000009VG6-0gaU;
	Fri, 07 Feb 2025 12:25:12 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNOb-00000009UmT-09Js
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:23:46 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1D7AAA1084;
	Fri,  7 Feb 2025 13:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=WE3Hk7lRTT+a0M6s1YLVZX9XatRGh6ct0lOQcz7agLs=; b=
	Uf4ZWP7rv7+w7P+nZEd1CYtR2+nuOfLFPJgyfUYuS1tk108HJ/NVdm+Ix8YkkpFu
	FWpbhsPS9tGfiPh/xGDBeEEnemnbbja08uWGuzJ3kxMOMIp58TY0qF527EWy7Ayo
	dRlunxQQLcnp+Z76x+ioJDrtHUNQarl4ceAugEmmRJ4EwtzMOq8dEb6Rm+eqTlG7
	/mP0D6eQHd6BK6O1q5fHEc23dRRarSrth7c7BDIwahLre1XiPLRy0ASme18poDd5
	tThkVKWPO0GVr6CI6EGSX2TzZl+UNIt8bCMJVGypKH/f/VrmIfWXTwlGzWl5Vo4T
	Vs1tEmz4JXZ0vLw5BNJYg2fVc2MvvsyifP9Atv7GxqF9zDxB78y0FuEa/eA3iLwN
	58N54r2rkCGr0jYHJMyAWl6mELSqYu42FuD8RVZENRHT0N2eZc/v/vOSeKMjNug0
	o3Wv/XaWQEoOaK7MigJzyax7u02zr7/Kc+9ppO/BwgmGctCZqg3ZyWTdl35dbASv
	enAW47CbeYwq7e0r6ivpPxmaW8Sp7Mw+faTQY7fdCIIwwrWtHUtmSViI+YTYJtou
	D1xHU8vJTHU6kxeZZx+Ap9VzjrwGva/L0Rtf/Ea20vYT1UnMTDBC5DGppRN+cipR
	RfQ9O9CJVWcE89oOHHQd0a9HHSM0QyQasmGM6xcJ4J0=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Mark Brown
	<broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH resubmit2] spi: atmel-quadspi: remove references to runtime PM on error path
Date: Fri, 7 Feb 2025 13:21:45 +0100
Message-ID: <20250207122145.162183-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738931011;VERSION=7984;MC=693355485;ID=413155;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852617560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042345_238204_3AC06CBD 
X-CRM114-Status: UNSURE (   8.82  )
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
 drivers/spi/atmel-quadspi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index d8c9be64d006..244ac0106862 100644
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

base-commit: d64ebde2a5acd9a516f6ea97ec2c9e6fc697f584
-- 
2.48.1



