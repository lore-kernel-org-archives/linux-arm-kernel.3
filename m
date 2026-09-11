Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AADC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=; b=VjfkMgh3p2rUBMxPlS13CkUXx5
	BjyIfSLUBvofxxJdY/qb5oF/Hq8hh/OwzL9+obk9atn0wt616FqmFdnOyn3RFjG2sWDBN3Q4zwjoq
	UvDWnIBMw70eYhUT7xvXnqQdrt+dyQHY0wonD2HSXN0CwmoBu/H1XEkdzP4BSNlbHQtX+rNPy7+X1
	JVL9bMoaz1EUo3CTAtVHaTmumnGaI9ils+kXK2ip4+71l4hVUcF64ANfr+dga6GZ4Wj+ZoWd738fQ
	x+Ox7Vd9sYbujGnSYoeBqs2/RXlviDWl1hoMDy7z034XVJ8w8VtRyDHjl80+8/d8OAkK4nq4s5Nir
	5Y/9HUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tXZ-0000000FqKy-0ONK;
	Fri, 11 Sep 2026 05:11:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tXW-0000000FqKK-1nFX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:11:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d91ded8174so4378665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 22:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103465; x=1789708265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=QMuRZV8aGHNAe/WoFStPWutBlNuViRUyzsovhVm+vkNJzogclQ95edivRhoJY0jdFk
         ppDdbwBjukVpzpkygYaYQWr8tfjM1AQl+2raYQXwGATip2jYQGanNDJ6yO2K7nwessoL
         pVkCDArRlPZlWbGuKj6ljOiJp9KLCJJK1ZyxU3biSm2AgcS4ucWy1HeHmYTkWlDL+LZ3
         Naz1bmrFuAky2O6NfhK2SFT/zi9whIwB/o2SKX3gBe4wiDnUuXeP3nBOjjIHsV9PrR3k
         R22QUMU9FH1pfrWn4HZzvpm67abg7rs7hr1ADbsnfRtaI19is2Y2vEk50HDMl/seA+uW
         99ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103465; x=1789708265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=HGZBnLZSJpzTCBdcB7rCBlEYyvIomw87gFUt6Fp8OLkTisP6uhSKILJLIfRitOL7J7
         ucvyt6kTdhpBHrkHX4/4hojUp6ffDa//nIa6/hY6Bpr59az8pjD6BTRlXcFTLUM3rJlA
         Wdt0Xlr40w9wFiuDsskLygfWqJvF90WdQKVXP4XZYj93Oga8CLiIB6LY35PmerhSUC0d
         P7a2p8NlVr8wj/9DK5luyNx40WvcuQmdihmBFXzMsrjMRFioe9WysfBAUtmKgD7to+uc
         CkSjyhH8BQccfO1nmZNbRh38Iky8fjW19RmaSuFLsoBH7k4CrAdBmIGpK98xHNfnZiDQ
         qMjg==
X-Forwarded-Encrypted: i=1; AKwUvBz9ukENkr88eIWCaSTH43md8OX90QJX14dsMgoDfF7+LbEXjyaEXmnNxlxsOtfhMbW87/bqwM+/zVULCheAIaMG@lists.infradead.org
X-Gm-Message-State: AFuF++ncr+FwbqvMTlqzj1MpeG0Z3IY6Q8Q5r1MWQPXDlpNmv6vUeWnu
	ntB0wGfnkH+QioMqj4ANvMmsariBdq0UwdNOcuxXBIh5PWh0JGip/KwD
X-Gm-Gg: AYBFou10xPqaY9nHx7wfWKZ1hakx1ZzZXA8KDq6Pa7GHTzlBZ2tjxjVXGdoguoKZCwt
	Eq+xAuFTAc7RTmR/gFo/DbXyuLnyDO5lvslZ8S26noyqCCnvp8H0rUbGQNVShbL0pZ9BwI4vx3r
	e/sa1ymCkA8KqyWd15nIhGeCPl6Qbvhn/+jTc1LBlhm2akdSXTdZdQ92L61yKD3MdbIw/NGX4CU
	725a6t3Wp0+DeWWN6983oI0iDZZXTmnbBlVAhXiXVhtgqX+QV4f1rf3rM/Xonc8gD18W1sDSXQ0
	rlyamRfETdsCETKcJthmygK/weyEZEE8s1lq+C87+vweeBcElywQDhWll8hZBxfPnZRGauVLzz4
	ki1aA9vlV0nlEXmBnlNl1+c6p0N9qCR6iVPHWlydugi5bmAOmAOyYgDFSd/EC47roqy3PTeBZOw
	TgcqvDrlR9okfN34scB1/l9bz7SCt49wjSOTsuMRw3rnv38O/bh+G1AvHC/xKDxf2KiWZXs2veQ
	Fm3Zqsfmx426qgeF4UfBkI2YQxGMgPCE2mcxGPC+FjEaE3XBozmAwX80vOgrdB5ZGWqivxTiaas
	P7ZSxQjU+X2XoQQ=
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr4011103a91.22.1789103465343;
        Thu, 10 Sep 2026 22:11:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d995a42a5sm2512810a91.17.2026.09.10.22.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:11:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v4] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri, 11 Sep 2026 12:10:43 +0700
Message-ID: <20260911051043.15962-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_221106_478063_923AA3C4 
X-CRM114-Status: GOOD (  14.38  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. In this
case, the probe error path should shut down the PHY before returning.

Use the phy_shutdown error path instead of err_clk so that the PHY is
properly shut down when creating the IRQ name or requesting the wakeup
IRQ fails.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2:
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Link v3:
https://lore.kernel.org/all/20260810093112.47807-2-phucduc.bui@gmail.com/

Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by
   Sashiko's review.
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.
Changes in v4:
 - Rebased on top of gregkh/usb-testing.
 - The ret assignment for dev_err_probe() is already handled by
   1db5c6b0b983 ("usb: chipidea: imx: fix missing ret assignment for
   dev_err_probe").
 - Keep this patch focused on the phy_shutdown error path.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 6a17b22047b3..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -533,7 +533,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
 			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0


