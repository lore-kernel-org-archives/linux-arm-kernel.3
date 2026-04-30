Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E522CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEzybTxl5A7lsGll3i9/ZIVwmqpi3pHGLUkxqxB3X5E=; b=LC/93AbB4kQtubZ0wFmCnhIxin
	W7S/q2YG8DJKf6c3RiSWPUE9wH0lUBJfLrWlsAIUEBe3JW/dsm/wwI46gDp1lfPN9kODEA9d48v+M
	fQPiHNBNgwomaNC64eAWh+N76zQSravSK6X/PmAcwOPUWsTMdYNvorb4VWJpSriQC7mLL61r6Ex9T
	0K4WVWKkF5s0p3RgslzUcoFjNmR9s0r0eHMOsvhAF3SbiiD507QWGsx0sXpdDqtbLEeDqiHXBrGa3
	A0kALd9fLk1P8Kwko6vUq/7lNBYbQp3A/Lvf7ou+pK9gUifu4eVsNeHxUjPOY0Q3FZNUL1yat/ZBP
	pMX91twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkE-00000005gJU-1NQe;
	Thu, 30 Apr 2026 15:56:06 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk1-00000005gA2-1oVu;
	Thu, 30 Apr 2026 15:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sE
	zybTxl5A7lsGll3i9/ZIVwmqpi3pHGLUkxqxB3X5E=; b=Ev0pNmK+X/kmMND+dC
	EpxzIK8inHUSw6mGkY8INdzuWZ40vLd+JHraH+juElBjcZ5RLXrbuWRJuhTrQDc/
	zOnd9BQFW7fSaHNC3dagcPLYyUBMiejx54bgWhu2fks7Fjt3fJqxc2TJeOW5FkkO
	QrPvI10tC4X+JfJtL1CtMZasI=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S10;
	Thu, 30 Apr 2026 23:55:08 +0800 (CST)
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
Subject: [PATCH 08/10] spi: stm32-qspi: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:54 +0800
Message-Id: <20260430155456.36998-9-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S10
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw43ur1xXF4xXr47Jwb_yoWfKFb_ur
	1UAFn7Kw4q9F97JF48CryxZr909FWDWa1ktFnIqayfAwn8X3y7u3ykXr1DG3WDZr4kCr4F
	9FsrX3Wvkry3JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRN6pBPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxxN8Gnze1xaPQAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085553_880129_89AA60C3 
X-CRM114-Status: UNSURE (   7.90  )
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
 drivers/spi/spi-stm32-qspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index df1bbacec90a..ea69fe25686f 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -374,9 +374,8 @@ static int stm32_qspi_send(struct spi_device *spi, const struct spi_mem_op *op)
 	int timeout, err = 0, err_poll_status = 0;
 
 	cr = readl_relaxed(qspi->io_base + QSPI_CR);
-	cr &= ~CR_PRESC_MASK & ~CR_FSEL;
-	cr |= FIELD_PREP(CR_PRESC_MASK, flash->presc);
-	cr |= FIELD_PREP(CR_FSEL, flash->cs);
+	FIELD_MODIFY(CR_PRESC_MASK, &cr, flash->presc);
+	FIELD_MODIFY(CR_FSEL, &cr, flash->cs);
 	writel_relaxed(cr, qspi->io_base + QSPI_CR);
 
 	if (op->data.nbytes)
-- 
2.34.1


