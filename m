Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA8D65C42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 06:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGoYnzAkye2XRSHlFnjsiB5wtXc3shy1u0416dw23FQ=; b=l2xWIBBFiXM6nT8gK49fg9hxyE
	OLFKRtj8/kp/8PHGev/9OUasolLLLPZdD2jUOR92pP5xyxbQoCMZ9rHCeeSbjLDy7huu4xnigxEXO
	2H7bKS2Gr65wYaDSWbUcZFxKfiK7nz357GTr5NJQ6dGAu+Q1WRZEXDOG4+JWuFMhAlybeK9ATeM27
	CE9/BJKsbZrfsV/rCUFjqePx6IFEXEU0JL6YwNkYn7YgzgCsQGuxVSK/N5Dk+ZnGExutyQb7e/v5i
	BhH2BWwr1JfT5BJuu+bGpDmesAe0ddwMhm9I5OOGQPmBGppTa2NoqorOMhxKJwAtg7Y0LSTsmn3TE
	m04A07Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSwM-00000008vAp-3vcM;
	Thu, 14 Nov 2024 06:02:51 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBStE-00000008uhs-0SAU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 05:59:38 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7673591bf51b-1f538;
	Thu, 14 Nov 2024 13:59:29 +0800 (CST)
X-RM-TRANSID: 2ee7673591bf51b-1f538
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee8673591c0612-ab314;
	Thu, 14 Nov 2024 13:59:29 +0800 (CST)
X-RM-TRANSID: 2ee8673591c0612-ab314
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: jassisinghbrar@gmail.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] mailbox: imx: Modify the incorrect format specifier
Date: Thu, 14 Nov 2024 13:59:26 +0800
Message-Id: <20241114055926.38502-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_215936_730526_5408DAF0 
X-CRM114-Status: UNSURE (   7.45  )
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The format specifier of "unsigned int" in snprintf()
should be "%u", not "%i".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/mailbox/imx-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f815dab3be50..3fe51b2de89e 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -782,7 +782,7 @@ static int imx_mu_init_generic(struct imx_mu_priv *priv)
 		cp->chan = &priv->mbox_chans[i];
 		priv->mbox_chans[i].con_priv = cp;
 		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
-			 "%s[%i-%i]", dev_name(priv->dev), cp->type, cp->idx);
+			 "%s[%i-%u]", dev_name(priv->dev), cp->type, cp->idx);
 	}
 
 	priv->mbox.num_chans = IMX_MU_CHANS;
@@ -819,7 +819,7 @@ static int imx_mu_init_specific(struct imx_mu_priv *priv)
 		cp->chan = &priv->mbox_chans[i];
 		priv->mbox_chans[i].con_priv = cp;
 		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
-			 "%s[%i-%i]", dev_name(priv->dev), cp->type, cp->idx);
+			 "%s[%i-%u]", dev_name(priv->dev), cp->type, cp->idx);
 	}
 
 	priv->mbox.num_chans = num_chans;
-- 
2.33.0




