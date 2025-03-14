Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yhxswbUrfve21rLacNTEFd3IhTVcF0hrGTQPs76z8LQ=; b=tN1yiKC7798S+pLyCPMlr0Sjuu
	L6LXasgTGApZNQOn7KtGI3qq9XTwSsVycbkxIIgBI1T3EBW9nFBz5YdnFlLjrU+NskGMqRuqQlk4S
	nwQkGVu3NWubrVb2CmUMxvgFLN3qTP+qceySS2aIeBqS2QlKM79BwdM+QM7V/jRoMpMnjisDnb838
	70A7pqmyX+HGAzT8NVe2C4B2bxpFND0/HpX7Qc+lJPFJyQnjbVecvqd4nTMBBOsnR1CEJ+hHafL0A
	9CKA88G7T6knYpgFxIfc2TjOkt9y81TBrNbSPflcno1HYxgIE9gduzCmG+1gOCYTxZjBJDMzaDUqh
	sXlTBwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt76M-0000000Eanx-40Nt;
	Fri, 14 Mar 2025 15:37:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt74g-0000000EaXM-1TaA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90FE15C117A;
	Fri, 14 Mar 2025 15:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C69C4CEE3;
	Fri, 14 Mar 2025 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741966549;
	bh=QRq38aB1YYgf1DqT1XzB4YAfEYRe0Kw3c+SXSC0Um9M=;
	h=From:To:Cc:Subject:Date:From;
	b=rz23vvNe2MXgI7lbIHxxZ4a3gpKLJY5DLSc7EvVQGRbMFcftDO6y6jF945apwdB+M
	 9BDsLpfpTgq3ylIWIgDr4qY68o+7s8/3T/VTEGHkTD70w3jnP1pTlbRE1zKmun04DM
	 ZOFjaYBTagkJKiqg8BBUMQpeJ+TAn5v7wSkvkPqK9cPG1H2dwexyIvtKZOFSeNH8nC
	 bZKl9LgpQjZtWSY/0wQGp7y0/MhF8sURrCtfSC9cKBenRP99WhQ6QYRluwOJaYxB6s
	 wURaYakwQxU66/XdcDTK5yo2yOmDt4gBkYKa70wI0AcPTMTw/jSqlKihB94VYp7kvE
	 PM3QvJDR5MHpA==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] reset: imx: fix incorrect module device table
Date: Fri, 14 Mar 2025 16:35:37 +0100
Message-Id: <20250314153541.3555813-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083550_444453_222A9395 
X-CRM114-Status: GOOD (  11.65  )
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

From: Arnd Bergmann <arnd@arndb.de>

The ID table is for of_device_id, not platform_device_id:

ERROR: modpost: drivers/reset/reset-imx-scu: type mismatch between imx_scu_reset_ids[] and MODULE_DEVICE_TABLE(platform, ...)

Fixes: 6b64fde5c183 ("reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/reset/reset-imx-scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-imx-scu.c b/drivers/reset/reset-imx-scu.c
index d3074eaad4c9..919fc29f944c 100644
--- a/drivers/reset/reset-imx-scu.c
+++ b/drivers/reset/reset-imx-scu.c
@@ -85,7 +85,7 @@ static const struct of_device_id imx_scu_reset_ids[] = {
 	{ .compatible = "fsl,imx-scu-reset", },
 	{}
 };
-MODULE_DEVICE_TABLE(platform, imx_scu_reset_ids);
+MODULE_DEVICE_TABLE(of, imx_scu_reset_ids);
 
 static struct platform_driver imx_scu_reset_driver = {
 	.probe          = imx_scu_reset_probe,
-- 
2.39.5


