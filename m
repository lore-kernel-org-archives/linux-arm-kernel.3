Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4C6CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 23:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EbYG4fDKcoYvKRRR3n3nFphtw5GjsA3PGLKKz4vWMc=; b=gFSLq9VEw92DZylHZwd5VW2Q7t
	N5tPjoQ91dVcv06QOTHlxzAPiePilE1rQ41TovrtRal7vpvUvrt4eb17jdZgxKFodllXpAwh6ePqg
	URc1KnjtVgwy3SkweelOA6bRrOCGzryGEhMkHEVk+Zpt3h9pvkZwWLZjU4E+YKvkIKHBK8MxhD/7t
	j0Wf/8EVQ3ozXz1szkYzbOJWCnvlpxVQWJQUzQx+KwYY3dv+h5kowkTGC0QtJ+rjlEFvzArPMu+rb
	lcd21p4K8rKPRvQR4eANq8UnpriPA+H+RTZsCae86wcPwsZh6WU8Qu0N6wmjb1c9LpnTlOeU92o6J
	mXJAp5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhko-00000008wPq-1XLV;
	Sun, 02 Nov 2025 23:44:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhkk-00000008wPR-0L4u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 23:44:57 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F3AAB7FA;
	Mon,  3 Nov 2025 00:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762126980;
	bh=seV/hcI/4KwdmMt7k2kHAL9HtTHualRjxHm3vdMmHys=;
	h=From:To:Cc:Subject:Date:From;
	b=Lo+ScY6iyNyKhkenMcooAlGlX1QF9tHaR/ZBA0OjWV493XSCZciWLPGQNa9ErfINM
	 aBiVpnDWrgkkgFhAsNBWN1n2BRfhYwAIcjP3Cyvj+BRbKf8KBL5qUScko595BRfYy2
	 Ab/YKkFbbF0Iz/9gv6dCbQDd+qvXtr32YP0W2Ceo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Johan Hovold <johan@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx8-isi: Drop unused module alias
Date: Mon,  3 Nov 2025 01:44:38 +0200
Message-ID: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_154454_260917_768C2470 
X-CRM114-Status: UNSURE (   9.27  )
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

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Johan, I've got the idea from similar patches you submitted for other
NXP media drivers, hence the Suggested-by tag. Please let me know if I
can keep it.

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c3d411ddf492..0f000582a1de 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -575,7 +575,6 @@ static struct platform_driver mxc_isi_driver = {
 };
 module_platform_driver(mxc_isi_driver);
 
-MODULE_ALIAS("ISI");
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
 MODULE_DESCRIPTION("IMX8 Image Sensing Interface driver");
 MODULE_LICENSE("GPL");

base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
-- 
Regards,

Laurent Pinchart


