Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B93AC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiAYhnnhs61WtKZMJIh7R7XvaVkzgplipEpTD594EKI=; b=IBBdAfeB56+aX5paVY6VsW2mUy
	R2V/5a03ONwRq00Sf3QbO8tPoUMaXm9sNVZCx3hzwt2PD6zNlaM3lRsUeeX/7p12hNQi63UnnxJ0g
	H+uqytdI0Pb7eTK3NKAAm8hvcY1+wxOLdVB9S75FfvjEZGolYOWY3vg1KZabeRXknFtnSwzBqzkoW
	mKwDA8TaTvV/oSUce6yfRnkifsT7GFDgxBvWQVQaa3MgSWHgat7BHlxxzTT95hCrVqYThWXk4/WME
	/Q2HD2oXMAWslV+BKD8KTNspggHD1yIwtYE+2LbVWoxakd0qpCXiF+7kCBPPcdk9L4wnuuxwrZHD9
	hA6DPJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ALD-0000000Am0A-11P5;
	Wed, 09 Sep 2026 04:55:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AL8-0000000Alyt-07Ru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:55:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d9201076b3so59680045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929717; x=1789534517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qiAYhnnhs61WtKZMJIh7R7XvaVkzgplipEpTD594EKI=;
        b=r0qINpicpwvODiT7HgZqbVzufZYxPx9+2P9021HPA1dSaqUB12GIUd91v+y0lT0Nwn
         T53PkhT0N/ebk/BMr6tzQoemwj3UVWuwsYzc8dDCQYMUgop4iGZUResqBzu2eryJJM/E
         LmEzhnIlQgsMdDEQP40EINyJG+/nvJ3k4gj9QhW5arV96obdJYTNIVKLtVZ7Qz1tZ2Qb
         0CJ63tvngPKsO5OwtXNC409ULEG8zaWL5R0MV+Ih9hzh8jS8gRifaPibbE3mYkZI7n5N
         dX0SKhCGoZOWo3l3y1lfb2TA0eLjxlMWRMAaeBSi2OtHlZ1I676wQR2MfofFonRi9+Cd
         fTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929717; x=1789534517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qiAYhnnhs61WtKZMJIh7R7XvaVkzgplipEpTD594EKI=;
        b=f6zBuX+BCyrAoq5xRdKiyhm4byTuGx6Yne+qfoY1WJdVazj3gZDIFv/gezbNLboZkh
         sfzLH+U0s/L0Myq24I0Bfh/2dREFCCivlm5TVv/hA9NCPw1sC74pGu0bhLyiRHWFHVbf
         uu/j3pl9mTnwacFKTDnxXlBb+naXlr1xyHfEjRggPvRMrAhxMdk1aiswpJbqu9mF/cIl
         6+K2tQcy2+hk5U4YvWa4bTrq2GrReHqq/7ZYHZno0uroRys2GxLzdD2eQ9Nq0pcd3Hb7
         KVzb8WoZWPN9wHC+/qmt+wGueZ8rYTc0pgR1Runs7JB5C4kiZYJPQ5iFiBJZ03UXDvKW
         76dg==
X-Forwarded-Encrypted: i=1; AKwUvByqQnkxEid+WQmcLHJzhDPmjEaco32rQpfg58+xtLVvi1FL2SDbFCCzZ4qK0jam7NdgQVWs1O9WAgZbUvzUmY9+@lists.infradead.org
X-Gm-Message-State: AFuF++ktmpvGTPzC4mq7dTBFh2buLRBqGQPWIlpT82YeKyRQr3CMLPD7
	+3iuEtsqjoXLyXX9Odvf1CROqp/rqIem2MpdM7Ja72/d/7YTy0jAV41i
X-Gm-Gg: AYBFou0v9+nGfkJKjbXlpdtLYAseupjRlD9qHRSgUi6Ath2PlJ76Vti0dFNz2nV3XRs
	9Wcl5KOxZh7cDgGgbSMINditjrbOoQpkazG7UGXVhNtJHOkvFaGueKKdPSJGFwy3T6MvOYViUxg
	aLnMzt5ssE26QDWVhBWqhsrjGjZ+P3E5DxzMhJoDjpl3EKZsFIQ/tVsM8T9vwbccU8R1zaRO/6S
	mq6gYdxz7XDE+Euke8RlFKnuyR8LWhNcIVhgmWhZ+TOhmJFUXG7Yc2HHlFmLlVwrV19TP6VCANV
	nRieza4Wx5iJI9jMii6mjAQ75bQK8aPj1ZAAXhwW6oerhydcqrRtBB0eslec8Wzt85xW/QRgQzY
	18u6quj8CY3KyrHmQQr95qYUXFRcpAF+I2peP+DeOU0n4ShOnuqRwWapcKC6n8drkb+goNDCTZe
	wcC7zXZgsJ7ktH+10fvMRL5My/PQycRrGlQLd4bbP0I6mGUXF9B3bUXGnyWyLuTbsaj+G+xSvjL
	IepFKQeZkI6XwfML3/zCw2mW/f7eUT8cvZm6zfwfjaXkxz7DUsPHBafgB6MHH1cDr5DDEdehd/s
	nWnTEN5maCfwdRx4
X-Received: by 2002:a17:903:32cb:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2db1248c3f4mr422794085ad.7.1788929716983;
        Tue, 08 Sep 2026 21:55:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:16 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/3] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Wed,  9 Sep 2026 11:54:49 +0700
Message-ID: <20260909045450.16176-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909045450.16176-1-phucduc.bui@gmail.com>
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_215518_073077_46C31959 
X-CRM114-Status: GOOD (  15.37  )
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

lp->eth_irq is assigned from platform_get_irq_optional(), which returns
a non-zero interrupt number on success or a negative error number on
failure. Errors other than -ENXIO are handled before this check,
so -ENXIO is the only error value that can reach this point.

Check for a negative value instead of treating 0 as an undefined IRQ.

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 207aecb5f8b9..3927ababf833 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3052,7 +3052,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0


