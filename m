Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C69FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 02:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cydds6dcxAFRZNEZZYF8UB6twxkEdfSrIDqXvVzSON8=; b=NwKHeFKlQNTFkGqBjgnTrpocTR
	DSar4MC8oKPlF4UYl8i1dxMJDGmUFCh9BhaKPweVurxIw2plodBPA4FayCXpTpjaqHGg/3cri8TLv
	0y05sr5F2EL9Jv7cbna+WkyasTYrwKsK+4nzkdbbU3K8/aBnjrkVE88uuJd5ZPvKDXGt8IGjwVeWR
	PYfFBkjP/sq5Mp+NQTUKkk33dQDoPGWLo9u0tGq3Hm8KaWPiJneCLAyh4W8hfIAkmPhjessxoD3hw
	XOpffouUNaTYpFW5XGfB1oidaVF/OKXvx3oHrvTvG8erPkzxQ9veYbJ/Epjcj+ZwwteZXP/xuTB7U
	7LOVCVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1IT-00000009shF-2lVg;
	Thu, 06 Mar 2025 02:49:17 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1Gq-00000009sW7-2r2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 02:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1741229251; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=cydds6dcxAFRZNEZZYF8UB6twxkEdfSrIDqXvVzSON8=;
	b=yh+HaVB+QJxXRAXmfr83X7KrqeVB1O23VDiBmTg+A+fCeMbxl0yxASWtHWWJWUmLNF3sULYWOXBqwIpvvn8QB0bdSLpyiG64S424imckcFMGdN+1pg9mYnVzGDcvZrrp7VKl8JdllbmfCJ6tx4/Bb0nd6xQZUki9YccoyQzBTcY=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WQn5zoS_1741229237 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Mar 2025 10:47:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: broonie@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] spi: stm32: Remove unnecessary print function dev_err()
Date: Thu,  6 Mar 2025 10:47:16 +0800
Message-Id: <20250306024716.27856-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_184737_642461_7CF475B6 
X-CRM114-Status: UNSURE (   8.04  )
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

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

./drivers/spi/spi-stm32-ospi.c:798:2-9: line 798 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19220
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/spi/spi-stm32-ospi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 8eadcb64f34a..114ebb1516d4 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -794,10 +794,8 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	}
 
 	ospi->irq = platform_get_irq(pdev, 0);
-	if (ospi->irq < 0) {
-		dev_err(dev, "Can't get irq %d\n", ospi->irq);
+	if (ospi->irq < 0)
 		return ospi->irq;
-	}
 
 	ret = devm_request_irq(dev, ospi->irq, stm32_ospi_irq, 0,
 			       dev_name(dev), ospi);
-- 
2.32.0.3.g01195cf9f


