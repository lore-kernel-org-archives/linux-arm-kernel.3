Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFDCCD3420
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AS93n7u+mL1S7OPp/PoO5Pi701E6fS59BvUwhYSShuE=; b=y9NsIjo3wrh9tJqMdOrNwriIZG
	pIOwSZWQunumADMQIejNyeKKOxFQUD6TlaG18kt+Q2p+NZpRMN10zlopRr6BM60nQ2Y+K7mhCxK/o
	w/EbnqpcncbA/wSn6Fhw0zqzLYRDut68ywD860/RLIaWv9uisUSizRNOSD+ukARmDxtD2KXbzjEpK
	EFBE60DtmHnJ73NLIP26w3e/0ajlEV3oHhbr8q3tRGhNzk4cvOvHUocodKLNKu3bm2wW1TOCITI+L
	21cZ1JO2UukLvtY+Rm0XVWsjDGr8rNecsf3xf0yBexjenbXGAkGlExHhK5m31L14Fc+Ba6EUYcVh8
	Q8qlM30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkE-00000005gK3-2kaI;
	Thu, 30 Apr 2026 15:56:06 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk0-00000005g9z-3N8G;
	Thu, 30 Apr 2026 15:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AS
	93n7u+mL1S7OPp/PoO5Pi701E6fS59BvUwhYSShuE=; b=XlMGYU/qi9Z9z5RAyA
	E8DfyMJQU7Opp9AdAjrKlYYcAUb+esPSxKKAB4/6GvcFG1iIY6ADtLCwhG4rpbKt
	gKagWqTZUSAK0R0/FFwXRq0OtcMN+qiJIXCJ/iujOlDnYc016qBSpF2kks+wUIMX
	ll9lkzrcEYlut1ljJU3R0Uu9c=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S3;
	Thu, 30 Apr 2026 23:55:01 +0800 (CST)
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
Subject: [PATCH 01/10] spi: amlogic-spifc-a1: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:47 +0800
Message-Id: <20260430155456.36998-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4kur1DKF47Zry7Jrb_yoWkGwc_CF
	ykuw4kJF1jgrsrGF4fJryxur90gwn0ga10gF1FqFyYy3s8ta15Zw4qvr1DGryUAa1DCwsY
	9rnxZrykZrW3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNMKZJUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xVL7mnze1VOMQAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085553_160193_5094A506 
X-CRM114-Status: UNSURE (   7.79  )
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
 drivers/spi/spi-amlogic-spifc-a1.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 7ee4c92e6e09..77a2c11bec5e 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -206,10 +206,9 @@ static int amlogic_spifc_a1_read(struct amlogic_spifc_a1 *spifc, void *buf,
 	u32 val = readl(spifc->base + SPIFC_A1_USER_CTRL3_REG);
 	int ret;
 
-	val &= ~(SPIFC_A1_USER_DIN_MODE | SPIFC_A1_USER_DIN_BYTES);
 	val |= SPIFC_A1_USER_DIN_ENABLE;
-	val |= FIELD_PREP(SPIFC_A1_USER_DIN_MODE, mode);
-	val |= FIELD_PREP(SPIFC_A1_USER_DIN_BYTES, size);
+	FIELD_MODIFY(SPIFC_A1_USER_DIN_MODE, &val, mode);
+	FIELD_MODIFY(SPIFC_A1_USER_DIN_BYTES, &val, size);
 	writel(val, spifc->base + SPIFC_A1_USER_CTRL3_REG);
 
 	ret = amlogic_spifc_a1_request(spifc, true);
-- 
2.34.1


