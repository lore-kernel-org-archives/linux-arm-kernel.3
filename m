Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF97CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axjDicrKppounBiGYtfzHy2w7g0lf22gdPRW8ADstbY=; b=EEa/FiRBFvMul2kQ6B5qTvK3SI
	S5qdvgKgNmd+i0fRnpilPgM6PO/Nr4p1h2dxVzyXiqHutcjrd4oZ3Jk+q02ayMDy+mLr+fCkl3bCL
	rVXIEaQEVoiQ+/qLaypHD27fn/XkOV7SxXavne0oo5Rbnj9pbKuEuSGJxjX2z1CQYZH6wayQL11MZ
	glRAq59AGCOyMnAbblkpwTXThGfqZGJ+0NlSpFBnDYKCS7WziicwFXUQlsfdO8HKFZqh8yPUefWTL
	IiCQGm6fokB4t4aMqj5+nio96ieuuvKeJLuG5xlTdG/QImllhZ7nWr9Iip2k0wO/x8yoKZfAZZK8t
	YNceDGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk3-00000005gCu-3YXZ;
	Thu, 30 Apr 2026 15:55:55 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk0-00000005g9x-1KmM;
	Thu, 30 Apr 2026 15:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ax
	jDicrKppounBiGYtfzHy2w7g0lf22gdPRW8ADstbY=; b=FAsoKEvVljxlWVKfZp
	+VnZlXjh13cnAHhJHMU4ng+BEMP9HEPIPF8XeTzO64hMaJuwRjm48LTek4DEv46P
	0vieuLj1/nU6KQnOdQgsqzHTC9tjDoMQGzj02WVpeGPI7DQkzQ1HrbdYSTluI6uf
	car78L5nAbibcHquUFbDryNqo=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S4;
	Thu, 30 Apr 2026 23:55:02 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 02/10] spi: amlogic-spisg: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:48 +0800
Message-Id: <20260430155456.36998-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4rZr4DKr4xCryfZwb_yoW8XFW7pF
	48JFW7CF1Dt348Ca13CF4YkF1Yg395Zrs7Gw12qw1S93WvgF1DZFW5Kr48uryagFy8XFyI
	gF4kuFW5KFnrA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE2Q6gUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBZL7mnze1Zj5gAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085552_662084_6BB9B424 
X-CRM114-Status: UNSURE (   7.86  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-amlogic-spisg.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 19c5eba412ef..4c9f4088cb37 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -601,14 +601,11 @@ static int aml_spisg_prepare_message(struct spi_controller *ctlr,
 
 	spisg->bytes_per_word = spi->bits_per_word >> 3;
 
-	spisg->cfg_spi &= ~CFG_SLAVE_SELECT;
-	spisg->cfg_spi |= FIELD_PREP(CFG_SLAVE_SELECT, spi_get_chipselect(spi, 0));
-
-	spisg->cfg_bus &= ~(CFG_CPOL | CFG_CPHA | CFG_B_L_ENDIAN | CFG_HALF_DUPLEX);
-	spisg->cfg_bus |= FIELD_PREP(CFG_CPOL, !!(spi->mode & SPI_CPOL)) |
-			  FIELD_PREP(CFG_CPHA, !!(spi->mode & SPI_CPHA)) |
-			  FIELD_PREP(CFG_B_L_ENDIAN, !!(spi->mode & SPI_LSB_FIRST)) |
-			  FIELD_PREP(CFG_HALF_DUPLEX, !!(spi->mode & SPI_3WIRE));
+	FIELD_MODIFY(CFG_SLAVE_SELECT, &spisg->cfg_spi, spi_get_chipselect(spi, 0));
+	FIELD_MODIFY(CFG_CPOL, &spisg->cfg_bus, !!(spi->mode & SPI_CPOL));
+	FIELD_MODIFY(CFG_CPHA, &spisg->cfg_bus, !!(spi->mode & SPI_CPHA));
+	FIELD_MODIFY(CFG_B_L_ENDIAN, &spisg->cfg_bus, !!(spi->mode & SPI_LSB_FIRST));
+	FIELD_MODIFY(CFG_HALF_DUPLEX, &spisg->cfg_bus, !!(spi->mode & SPI_3WIRE));
 
 	return 0;
 }
-- 
2.34.1


