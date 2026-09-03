Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19A2C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwKd+TdvIX9ZItYpiwc95hBpIK2+IZI68PvC5hF8oBU=; b=4ooHxzSaxVumjLVwEHKA5hJruM
	nnCzLNosqKMliJyMU5j4GBuVG5PJocd/2obm1c/Hxdgun7rzpq9r3AW86nqUIdteS0uQyr7hFlY2P
	q98aauyljeWEUMb45Hpwh9dze8QSub9FBlr68KpCsglk4z27Gu03Ctf/mduqmx3p3+pmt3+8SOG6o
	WeFqZWy389eRWP3Z4dJvQnDaIraIKZbfFYx0QZPThQd1JTM79wKD1Ly026I+h/r2hf5BLISS89rm/
	nrWHOhG5+WjVEfvrIlZCxy1W54cXfx7pU2P0kfO+n8XDwAHNrCdWWYHbaISTtV3b6OwssETISQcyt
	eT77G1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wt-0000000GasL-0tvC;
	Thu, 03 Sep 2026 07:33:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wr-0000000GaqO-17ee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:33:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2461385a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420804; x=1789025604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwKd+TdvIX9ZItYpiwc95hBpIK2+IZI68PvC5hF8oBU=;
        b=SDKP4DqLPPg5y87TbY7T8peSkpZ6EG4nyuC6UfImC7tYw7Oeg9+gdqJf0hVYFcx6XO
         JTmHTQfnmfN8mnv7NCXlGUSjKsB0VmVUuEjAPHe53nS8pCpheDFgd1A8b7sGCOkJb6j8
         ObIlXi8gHc/CcFIWav+e10yn3NDTfujxgiFco3mrCCUffEBw2eyH1NEGB8mC4MQuOyG7
         MWd6M6rGpVCX4TmjbOYSkjOYJP8s1mHGR/UVMhWOh9v35yexAlsVM/q/T5IP4/XnpHgb
         em4K+HKvH34d0E40ZQJ/UCmZNJv8powyvFrW1rCv5w4ikpLvbXdlj+g5YRgwrQlBBGG9
         rNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420804; x=1789025604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vwKd+TdvIX9ZItYpiwc95hBpIK2+IZI68PvC5hF8oBU=;
        b=PUZdxbUEr7X1WqhPdI3icQL1tMqwbcPP6ReU+wKCSfhP9ThZhxCka5mCoWqDNhEpGZ
         RKMIIxdGiSiRzu0layBNU7rppoJJyWULWc48P5X5qXgX+Mb5wamKKwVMCBVm0oVVicCl
         hwE1BlGN8yGnbH9Y8jnfriXBSUUdDYtdTIY/HMtKSs7UB2ZxZ8767UIcRyoNu/RfG8GC
         RTuk0YzhB6nZPDZfE4MJLnSYUBOhSADXwvD3U7DPUqdS7huO6UaRWjfljWE7wTog3TY9
         pfttnabjl1xSZRl5g1EL3mwJ06YheM35Pnt8LxxZRT22IxQciYyIDj27ZTePHYsXGcK6
         LmBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTF/5/MNTu4oVmQmimFrh+0dNzx0d4GDu97EH64ZesOjhD5ytS2qfOPqp8gg/UBRtlrB6x+bnCQRVrf8AihgSu@lists.infradead.org
X-Gm-Message-State: AFuF++lPXhiW4umt0kB0WsAXoCgaDQ4ku6oyz3/vLO4ZZZDHVgx8Et9S
	WK9afehbFM8HY5n0vJurAyJf0YekbTKgSnOUfIQhiyxMCRoOUtNCrx7z
X-Gm-Gg: AYBFou0tr85wuTng2NE/ROVFehU9gab0Y7tjKy6J6xwPEmMpXQsdfLmLReBTXfWGAdP
	KLQ0B6Y44O19AS93oe/83+T0zk+XUMCG6pijxCPYnDhNvr0CmvIhPMDnOKnzg1tOabDJpgpyaU0
	XncjTp7KTrjKfKnwcyeH0KhsFOwP9DGOx9Kqy/7msurrwxH28prUU7I/XXyPSDfupbeOSjClkb6
	UpCIHw9SRsx7y4880KM2AJ5TTBcv0PV8JC20K3CcZRzXbk6ydJhxXCVCgAIE5HPa6xTGiUqtxlh
	Fmz0Y9wyJBUasYvxm4CyrePeWq8zCu6TGf6D6mb62WPEt/DeiNJQEgq8o4b1JQ19zQCLOnRgpeY
	l8DdCX/qbz8PwrH+WypdFtfyfBT3PI0KsNvarfvKxTr8spPXLqHTtWAL3B/E379oKPwx6ULdEtz
	L4bhFYuD6L7eqnyJscV+klE1GTmmrrivqlHt2cw2Mas8RiucahI6nXrhvOYJPZXxpH1T2bGo22W
	yXTJVjbIua8X9H1SIH0VDFUihFxRi6CjD6OXtsDGnbN42KhW24swwLI+ZNeOL75gWk0vgtUqd8A
	iuHJ
X-Received: by 2002:a17:90b:3d84:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39aedf7cc2cmr17489022a91.2.1788420804175;
        Thu, 03 Sep 2026 00:33:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v5 2/3] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Thu,  3 Sep 2026 14:32:51 +0700
Message-ID: <20260903073252.339250-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903073252.339250-1-phucduc.bui@gmail.com>
References: <20260903073252.339250-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003325_311012_74BC837A 
X-CRM114-Status: GOOD (  14.63  )
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

Fixes: 522856cefaf0 ("net: axienet: Add optional support for Ethernet core interrupt")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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


