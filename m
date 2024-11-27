Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DB8D609C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jb0Y1dF2tosHQGPB8IaDnTH85DqetT79SPymVo0PUi8=; b=IGpkhNYFz2AvcoMNvw6KIWu9EU
	+AYazlq1Ti1y/lySTLRxG3xrGAJX5y516fOW3Q+OdL9z5xo1Jm+TTL7zvOzvgqwc/tARjvXxne8Kr
	dZ6bqoCKZkzdpCE3SuGvIvEeaeVAIpeI96T5TaAi+rF/+JC8N9v5k0XqBPOwTb2FvCq1M7pElIvJZ
	Y8PQaXcoeYaaZMiB8EiCh5vfoRb3BI40Cl34PS/z5ZNBYjikkHxRP5fjwE1bZ5VESWsKtwsnSF+be
	oScB7zahUPeomX162AXbWM1ByCQ9zaEb2mIqK4UXtVo8e5e8WZP+0s1ku1hUdvfqsAkHi68WrGJ5+
	SF6d8AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGETs-0000000CiOf-3yLR;
	Wed, 27 Nov 2024 09:37:08 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGESt-0000000CiEh-2kZ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:36:09 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id F3A40518E779;
	Wed, 27 Nov 2024 09:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru F3A40518E779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1732700160;
	bh=Jb0Y1dF2tosHQGPB8IaDnTH85DqetT79SPymVo0PUi8=;
	h=From:To:Cc:Subject:Date:From;
	b=oPslwh63qVaA7aCPQfka1iCGuSGyXsC1IwVnOuBP4i5TpiiEaxdqDpuFeCsgASzMh
	 wjVP+6g3Comis+VZ/8sQmdV1vFtaFtlLy5mrRTQaP6eHXuawTUGOnmg0cyCRzTpXlB
	 VCaPaqGLLj854fBYFPem/bqgYdn4h6xvoX95e+Ak=
From: Vitalii Mordan <mordan@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	stable@vger.kernel.org
Subject: [PATCH] usb: aspeed-vhub: fix call balance of vhub->clk handling routines
Date: Wed, 27 Nov 2024 12:35:47 +0300
Message-Id: <20241127093547.3000267-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_013608_191206_9595FDD3 
X-CRM114-Status: GOOD (  11.29  )
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

If the clock vhub->clk was not enabled in ast_vhub_probe,
vhub->clk will contain a non-NULL value leading to the clock being
incorrectly disabled later in ast_vhub_remove().

Use the devm_clk_get_enabled helper function to ensure proper call
balance for vhub->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Cc: stable@vger.kernel.org
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index f60a019bb173..7566594fc447 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -277,9 +277,6 @@ static void ast_vhub_remove(struct platform_device *pdev)
 	       VHUB_CTRL_PHY_RESET_DIS,
 	       vhub->regs + AST_VHUB_CTRL);
 
-	if (vhub->clk)
-		clk_disable_unprepare(vhub->clk);
-
 	spin_unlock_irqrestore(&vhub->lock, flags);
 
 	if (vhub->ep0_bufs)
@@ -337,14 +334,10 @@ static int ast_vhub_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vhub);
 
-	vhub->clk = devm_clk_get(&pdev->dev, NULL);
+	vhub->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(vhub->clk)) {
 		rc = PTR_ERR(vhub->clk);
-		goto err;
-	}
-	rc = clk_prepare_enable(vhub->clk);
-	if (rc) {
-		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", rc);
+		dev_err(&pdev->dev, "Error couldn't get and enable clock (%d)\n", rc);
 		goto err;
 	}
 
-- 
2.25.1


