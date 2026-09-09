Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F420C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5IgLCU04RRBc+Gwx3mrSW66CKoAgwZR7YrSzPsHUdM=; b=nyU4/D6GWLP0w6woj48zfIMt+Y
	wS/t94sCJkntXu3ea6pMwTMsFn6zxp4il1jThm37RH86l4uRMkLW8dtjSJh659AkChcnn3+ilrk98
	v8jMf0SX14PLleGERzfGQCdiv14MgMQ9OjxGPf6JySUXXf5s5PIusKNYeLprTL5PhsNYYgyMs5gx7
	Ikrni2zjcD65qA8lcQqI/2afBxpMSEiOhVnaa4KPOk0EPn27+ttAnBCa7S6F2a5Fmzr3cSgbFjb+3
	U1S5rkc8FtK4tLdqlqu7Erk+z9AP3J5aZV9bcDjhknA3ljLP/4CWJ/HkiBGpf73KvmEiOCRMEUGtV
	cWVapddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ALM-0000000Am32-1m1d;
	Wed, 09 Sep 2026 04:55:33 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ALE-0000000Am0j-0RYN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:55:28 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db1ca06b03so7251285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929723; x=1789534523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5IgLCU04RRBc+Gwx3mrSW66CKoAgwZR7YrSzPsHUdM=;
        b=aBEQrbbwAWNytQQlHeKGOpX7oqb6nRZ4ExLL4PWfu9R6Gb4yFLnOzA0zchg6TKvU6R
         LLMJ2VlZ8TivM7ATMl7yOam2bJqw16F8yh6gjNtGep+c2BlroRwsxOkDM6vch01xK0Oe
         RlDQZ+ANDfzTjxrrKeuZ5dpOaAUzorXWwyqtPd7M1bbugkxjGJ8UWF0hqe/VrZQmtF2P
         UOymy9gx6B+C2K83Vf+BSqxxok4fYAYiq/2F9xUs8hKSXh8+zfbmOvCuyy8poLH1zYNa
         vgi8ra1g0Qv2iexbk0aSTpkVCizgS7TbF2r3WrZko4cQpUySDumqEmOFXfjdzISmsBMP
         sfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929723; x=1789534523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5IgLCU04RRBc+Gwx3mrSW66CKoAgwZR7YrSzPsHUdM=;
        b=XzPQWCDsI7W2pOkV16CO9XlwypDzp1wdO8JsUfOy8TRM8cAGqNz06DHAXCdH9qz4XD
         EXExwMgWAyFSRmR9DTwi0rzwJdyojRqWy9hlcF1vZevkWXqUeeU1Hy/B8wU6sGREh5bG
         JLTcAco8EE4cE7SgRGU9inIRFORp6lKrFKviKvypQJZPmtx38NiVqPZ76zl4g6NlHQSm
         w2fY7NbPesyMyNcNA4YsTHfm+LKApbrMeEurJplbFNydY2oQXxEkQvak/F5lYw7jfK3g
         um/jfNPQV/+viFH3wcX0f3SikEQmvWIEinIQ8RKqKHMHWefpPl37ZPOzpt+4CHPrSf2B
         ERCw==
X-Forwarded-Encrypted: i=1; AKwUvBw9gEgaUq6Kob52cFnOxR3A48lmHeLhQL2ulRRPARDd9KLKKymUSritVys49a6LdrzMOd9EsK2ROOIAO/zGw5yU@lists.infradead.org
X-Gm-Message-State: AFuF++kGG+alwlxHI2p5dasTC5QxJYMJOPt6FWPN3kXpj/lk0ss0bfY5
	QSd/0aTDXjJLaOa7SeR+7g53xgXuR5N7N4D4AYybHPkSF5KA/wRYpM4E
X-Gm-Gg: AYBFou0TKTe+YRD+Bqwyv9yKlWwIC5mlL7BymJuJR5ezriSxHEWTp2/2lcdOsaVsBvI
	LlLmbva3GxETJ4zGgxvyBL7uUFTk77rZZUDpN3AP4yepSpT3H0283DZGSnKHfszKB/+dLLqdZZp
	kiRzFeANdVv0eYtCdV50HqhF/p3saxW14/L7eifTIuZH9AsqRXLYVYuOZLguJIew6+BDN9Unh0k
	MrPnl0FYAa13s54rV6N5KU7NZESqQBy32SU8s3ZCy57DWviFrpogtqCDrGs1t0f5jtv1jSTymW/
	Kfk5R4GYEzJlqKlHIAmFSl0u96cAtuG2awrPCAQNYzYCgEm7sbCkb7h3q/zhdQC1dzZhdnrrG6Q
	52HnljxXa0AIdmnYnskoazexwpdFmmJh55mvFyPf7lQrVrGwBSkRdHDcKRd/vFZDaLepl+rcCp7
	esn0Le/Y9ybHZJChbNgjQYYC7THDxhrJZdsJ/0QZe0ddgmhXD7fyBtm6kq9sYvQ1bwD7VSadho0
	cqtp5bLiYH6TXgzt0o64jUtknJGYvnirjdKnGqhKgSK5GjKAoOpZkP0FDFbAoaTZERoN/OBUubY
	K+WmD1hcMVG6gj22NMfPPOGojA==
X-Received: by 2002:a17:903:40d1:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2db6f91506dmr96058075ad.0.1788929723024;
        Tue, 08 Sep 2026 21:55:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 3/3] net: xilinx: axienet: Fix IRQ error handling
Date: Wed,  9 Sep 2026 11:54:50 +0700
Message-ID: <20260909045450.16176-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909045450.16176-1-phucduc.bui@gmail.com>
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_215524_167031_61A88E55 
X-CRM114-Status: GOOD (  15.58  )
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

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails,
while platform_get_irq() returns a negative error code on failure.

Handle both failure cases appropriately: return -EINVAL when
irq_of_parse_and_map() fails, and propagate the original error code
returned by platform_get_irq() instead of returning -ENOMEM.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4 : 
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.
Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 3927ababf833..782f903d318f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2971,10 +2971,14 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not map DMA regs\n");
 			return PTR_ERR(lp->dma_regs);
 		}
-		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
+		if (!lp->rx_irq || !lp->tx_irq) {
 			dev_err(&pdev->dev, "could not determine irqs\n");
-			return -ENOMEM;
+			return -EINVAL;
 		}
+		if (lp->rx_irq < 0)
+			return lp->rx_irq;
+		if (lp->tx_irq < 0)
+			return lp->tx_irq;
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
 			return lp->eth_irq;
 
-- 
2.43.0


