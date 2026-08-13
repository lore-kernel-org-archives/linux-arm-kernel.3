Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D5EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 04:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qvgR15Tx+UTRmIkTVdFC4whcGk/0e9sve+h3BkqQWSE=; b=1QE9UKNJXc/l+ey7HFogen3wTK
	mXe1L2qk6qqzr4Vk2IyoAJW49GOHZ/7gOC+bs7I7cvCJh992UmQ/l3q/Zkv/d9Z2N9CrSTAV6xvsR
	v57HEtRJ9Si1RPCE5RF98wxY6oNtHjO2ApzUI4qg0JjnOICW5rGcchYj44/dpHBDn+LEdJNOYMQcj
	FX7NYRJgZ3VF5o8v9zGDiqmUM/Lh+sMfXUk48js9wi9P7WBW1OgVsW4Zb+Xg3YTdMT1lEkspQyxro
	1JP8TNqn/hnbt0VvaLZhEZoGIyBBLOwC2jQrlNzm/14Qz3yKmF/5GBFW6jvVB5NmLVT8NZBDDdbf/
	Ff1axdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuMvh-0000000HLmA-1Wu8;
	Thu, 13 Aug 2026 04:20:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuMvf-0000000HLli-0bAn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 04:20:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cca0c5799eso21097075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 21:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786594830; x=1787199630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvgR15Tx+UTRmIkTVdFC4whcGk/0e9sve+h3BkqQWSE=;
        b=NHionqdJCBs/SpLtg0uygFyO/nWzZ2Hn503jnLKUFgRpFTk3LB/Yzi9KAHTtefSG3e
         flV/n9UrvEvCvQYiWuDhVWyNqCpVf6ANSMNay5R5S/THO7J1nphFof3HP2Kz3Ffx0BVk
         SUvVGmEPZjTH1+wZ+T+P93dIsjiotvDEAzWyLX65non5IjgVMt3MQP2zyi/8izYkgvhg
         byCFK3MqdMpCPpxPaJ7shZYmG57VA/ER1/cmMeNgwxKjjhg4Ukh4Tw3j5S0A6MK+vUtZ
         XLiGlJl/W3twhUb4/OLKJDoILaXdh1793GhJaFsEgzH34X5peY385tC+36pgLsFG9GJl
         5XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786594830; x=1787199630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvgR15Tx+UTRmIkTVdFC4whcGk/0e9sve+h3BkqQWSE=;
        b=I9fiW3uYESAcwaDYAknDmjubsd0D0TSWTwV02r1gDQdqP7k6wjTKDEbnI4kDQwuw4t
         qIoil0+VMLxWnMqkOousZ+a+zgYmF4V/MA9RN7s2krYE+oGJNomVNZHYTNDoZBu3G0Cv
         Z+snTabwWkzIwOXIT70XtXkHC8i/c/smcjxPpxXwjM6DYaZ0SCLh21M6d1p1Op1dpTFi
         UCzesB5a1wN7qVwgHyF1UduaxqnLa84ac1D9s4hhPQqg7T6KdOUeZ0xV4XOh06HAQyjA
         hJfYw9glBDzjMYgfaWxHHM99i9g//VYGSI+OVU0h0h6H/v0loVZHdzIp4L8iZUkQbInk
         kmGA==
X-Forwarded-Encrypted: i=1; AHgh+RpYx3VktHBLl7JjRk/1wUZ3c8te4LCGL6DJLZ/SqcS1h5z3l+sFQeue0s1xSbGDo5YIBDNw4MhkJEYOEPl3R5G6@lists.infradead.org
X-Gm-Message-State: AOJu0YxoK+g2i0AKYG/yMOBRYy+oeD2p4Wt3OUqnjH46+7tMsNnktc4e
	d6l16Hp6xYbJoSWsk2sDbbSLkhvphmqMc1gfGrSTT/o25vNBQ7/qckjI
X-Gm-Gg: AR+sD12T123lCEFE3Y7h9FN6lPPODrSh4Gy6GW490QFQUKPGpzvEP8UmQAhAfewvttb
	gt8PrkCfHw097s0CYs+bZQPP0GS8oXXkNti1IvAq524j7kK4mcrmHkDS1nHArViGETDXD1+/CiM
	lIIFjYxQ94umd/YUL1uRkK2KEy3WKdlhWq6es8QmYnoLccFpRz4aI+0P74Yoma7xUBcB+hUtdMZ
	24zvzJ6FfmLnPSkMHAjqwAmtiDiXhRHtth+PP4tJMzjyrgjYG5gH+r1qX+rjd+56iJp+hyh0VDT
	GQr9ddlvymLO2AFuq2RagLxuXSFPJmgX56UJ9Q1tJ6BxQX+V0Z4Q8HUDkTi/BKAxK99pw06Ypk4
	3dpOQWX+ndWP5omblnOontHlLnUJtO9MPGOPZexgXr1osV5rsVS7en+VpVSpwYU1GBZzPzm5TFX
	ML9dfQCRFZZntuFgDoFT5smN8YZtZZ2FJpWYYgAnrLkBnusNI8HMjUx5tPhxvKYNPfa0F8CL2nD
	0tov/uhmFpGGO/VyJq2Qi7NRAlMkokuYaqhpdY5l9agel0HS/Uke4IE4mKvORzMMfXwGNSambw1
	ME8f
X-Received: by 2002:a17:90a:ec8f:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-3931e291d2dmr3936264a91.15.1786594830016;
        Wed, 12 Aug 2026 21:20:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm1700084a91.7.2026.08.12.21.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:20:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 11:20:11 +0700
Message-ID: <20260813042012.17631-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_212031_189009_97C2B3B7 
X-CRM114-Status: GOOD (  13.33  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..d23e9796725d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2957,12 +2957,16 @@ static int axienet_probe(struct platform_device *pdev)
 			lp->tx_irq = irq_of_parse_and_map(np, 0);
 			of_node_put(np);
 			lp->eth_irq = platform_get_irq_optional(pdev, 0);
+			if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+				return lp->eth_irq;
 		} else {
 			/* Check for these resources directly on the Ethernet node. */
 			lp->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
 			lp->rx_irq = platform_get_irq(pdev, 1);
 			lp->tx_irq = platform_get_irq(pdev, 0);
 			lp->eth_irq = platform_get_irq_optional(pdev, 2);
+			if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+				return lp->eth_irq;
 		}
 		if (IS_ERR(lp->dma_regs)) {
 			dev_err(&pdev->dev, "could not map DMA regs\n");
-- 
2.43.0


