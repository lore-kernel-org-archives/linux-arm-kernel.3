Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB4AC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 03:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mlxhPvZm2quipPXq17CccutVkhRwgR1GhsKWvxs+kjk=; b=Sqk7YAvPHb6Usc4Z8ejg4vFOi+
	ySlobnIVu+PW/Tp41bnarAGiHGMI4P/Dwcd/0DKJEEYTYi4yXvWgSF4jYJ5ztP3tOAUMRp7xf8hpA
	w6aQ20pJcbOlggoSxm2NepxWgvIdsOpLKj3/cPRyFaw/wcic74YSImAUvq0CPF9fg5LbB2uk45DV3
	WWaK1NSi9NdHui75Dw1WqaPrw797xRDJriS76mCD8mchYLPfUESKpYcC/hAmtAI4UFKHX8pk9WRc0
	hhtsS5jJHHoBD06Ym8xQhMEeU0aM9rfNQ5tReULPzDEvctN+tQGEG0jECwwch87aDjsR6nJ9Bh3YF
	yV2QDdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqON9-0000000Cz3M-34EB;
	Fri, 07 Mar 2025 03:27:39 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOLW-0000000CyvK-1Ssx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 03:25:59 +0000
Received: from jtjnmail201610.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202503071125354834;
        Fri, 07 Mar 2025 11:25:35 +0800
Received: from locahost.localdomain (10.94.18.185) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.39; Fri, 7 Mar 2025 11:25:34 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <broonie@kernel.org>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <patrice.chotard@foss.st.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] spi: stm32: Fix a NULL vs IS_ERR() bug
Date: Fri, 7 Mar 2025 11:25:28 +0800
Message-ID: <20250307032530.116837-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.18.185]
tUid: 2025307112535a815d6c3a2c39f102f9dbacaeff8520a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_192558_654680_752CA0BD 
X-CRM114-Status: GOOD (  10.08  )
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

The devm_ioremap() function doesn't return error pointers, it may
returns NULL.  Update the error checking to match.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 8eadcb64f34a..a544d7897edf 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -835,10 +835,10 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (rmem) {
 		ospi->mm_size = rmem->size;
 		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
-		if (IS_ERR(ospi->mm_base)) {
+		if (!ospi->mm_base) {
 			dev_err(dev, "unable to map memory region: %pa+%pa\n",
 				&rmem->base, &rmem->size);
-			ret = PTR_ERR(ospi->mm_base);
+			ret = -ENOMEM;
 			goto err_dma;
 		}
 
-- 
2.43.0


