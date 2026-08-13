Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF73C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 04:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuAX0QZtIVEwbbkqe3Q0lDnHOIC7HPwgoRkKSD2AJfM=; b=qBl15h3xDjkqODffc4Po0yFeEH
	0Mlp3IrbkWcjLfjb/bbDx3bK8VXnvwwWDAoYmeAD0IfZE8ZgOvBvuk+IVqxxEmD4Yed1XPpAe4Rix
	3awYep4IRbfWss0uzJAu1zouB1hJTODaIOGdqQu5lrQZYu7JUVzEjD3EJ2eQf19fs/+ElPOERp2zK
	bWBoLRLiLEiXOOx/mAqv5C6ouKRdRJdRwx+DOt1Rn1oUyjNW3MXcQp2piDdOOshTSSzKhAUHygZcy
	RVhxdifvUc1J5LrGnCIAUz1kaaBU+FsbJkSyWcjBUqf/PNuA0t1dGStQe8mmgtua+kSnzvK4j3CMs
	PSlFF0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuMvl-0000000HLnz-2Kpd;
	Thu, 13 Aug 2026 04:20:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuMvj-0000000HLmn-2bb3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 04:20:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caf228a910so2687795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 21:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786594835; x=1787199635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuAX0QZtIVEwbbkqe3Q0lDnHOIC7HPwgoRkKSD2AJfM=;
        b=iDTyB/2Ivi7WRMq48dtXRdL5Czgxy8V2wrG5cqfoV55XmIijxkAamQ+Vb+x5gDAOta
         YIGCcw+3o+vE6z5tE94rIK3W15TBDwh0c/zcklCDb+CRTZgGjKu9h2rQ8ywCrArTfRNF
         HOK/P0EMIlyL5m/yx0Tv1Qax7Z1yW6yX5d1BAMWCBbNaoz8sz/zAZgwVk+WrZX9VoW8Q
         sQbzntXIIRTXEz2/ruqvGEqdPlY8GOh82+vT3+fvv7Ey0jtHgEIXGyPQBURf+PZcqbR7
         RuRq2ORyzkuYVVOwoUlIpOBTb9UUhqsQY9pYCAkw15lP+2+keAPvedH8h8UdDgWeNXAK
         VdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786594835; x=1787199635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JuAX0QZtIVEwbbkqe3Q0lDnHOIC7HPwgoRkKSD2AJfM=;
        b=CrakRrbJ9r9mucVGjIaEwvtT8NCXmEmTOokfaWibQBCJgR23xWtrPsXIQNQU48LjrR
         b+gz2zgIwpISRS3Sa1kzXS/ghx47tVh50aIPL50AzRKWKB1/Sir+93vVxzG0gjW7TP3A
         IpPvxW49QDl0Zcywl8IhZx7G3UoS2UzBaCfN6PCjFhqD4QxNON/xtX7kaR9NPI5e9Tc0
         HUz+O3fKQ71sQXfs2V/piBBfNq1LBr7ofTu8J/P2SRhCQbYY6rL7XeSjN+smuTTjK98b
         q6oY9ujAub8NXi1ZC1x2T1eW55YzmtafDoXKQP6iQU+db2FCy7rkECQlCpzs7azhJYl4
         0zUg==
X-Forwarded-Encrypted: i=1; AHgh+RrTOmP2C3IZ8cQra4q16N3K7Yfpg5Gkjf6Rk0X45ZKbDFq/01Sc4I+R4ZzSQ4wBnMQ/GV14CvEKqozGusAQ2rZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7WBuESISoRGnsdGaRtsfeiwb4ttqUzKauMzkHx+Ej8tRzULY3
	UVqdXtwabi6aU6bfyouhJPQsco8ojnaSnbzwt5PS4f1wvdJneg4B7A6g
X-Gm-Gg: AR+sD12LS0nWZgGhPRrixJ5RclV2cPVKKArim199pc27eUqGrMtDO+HSRs2Gl/p6AeB
	CP6zU2xAoBOPAb813TqrC8b5/kMMirxcs36UdyoMmcP0Y1J3SNAp242wc21iHz+NS9TbFlvSscD
	3M7Nc7fuYCn41NNyE3xq8gym8v8PcKQXAX76z5+YW6vCXFYdEF9Hy0EtHCQvkt+kDPfBqrG8ZWn
	cbUXsYrzJP89m/N/xKNXg4TnCSor0bvNvCfuY6YG43QeTFJzg0o5LXfbUwhSXchMtiRIbLPApZ6
	079D4EuVmhQ35DV7MYweXNCsn4QBasDQaHGjyWMoCLIn6p0Oh2dKxgRZj9s5Jz8x/2S69tmmS3P
	oGzyqnSdcoiaJWNCwixXwbdjDRkGY9G9EUM/k4LiGYMoftXEguoFjQPyRJ0VFzfbu08HMX+8jpn
	tBrXCIy/+F0JYy03ID37ZrwHhjl0al3AHbyvJIuVpV4b2tazQlJGEXAAFmeYYPWlamLylwA9c4c
	V4APMOJh92F1m18azbM1e0R9paU5WH0IN+KjFrKbv167eowAvpezb6kXShjCbbk0YbAv9z7xSlk
	5cKA
X-Received: by 2002:a17:90b:3c41:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3931e0393a8mr3833257a91.8.1786594834730;
        Wed, 12 Aug 2026 21:20:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm1700084a91.7.2026.08.12.21.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:20:34 -0700 (PDT)
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
Subject: [PATCH v2 2/2] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Thu, 13 Aug 2026 11:20:12 +0700
Message-ID: <20260813042012.17631-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813042012.17631-1-phucduc.bui@gmail.com>
References: <20260813042012.17631-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_212035_668801_2056D516 
X-CRM114-Status: GOOD (  14.68  )
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index d23e9796725d..7ef099db1bcf 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3051,7 +3051,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0


