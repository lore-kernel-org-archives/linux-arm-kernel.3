Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E10C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 03:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fO//i2RtgcRB0nXNuwN1GB8vOhXT0TWv6CJA+FzAN1E=; b=dtCaZnXNJ/Zyiqs3/eldmwgMMK
	7Fe+yWBXbVcjSJ/2tffjio5Vs4b+Y16XzBabCC7rirTL5jvoAfmspoGxi/AIQ2JJx3KTzZzHDKUZB
	u1VjHZXoqxe69Tk6lpbt2wmy9FxEiIV1iioTEnX4L3guY8voqE4UWu8IBZgWmtNLzksfXntCRraaE
	Q1vQ/DtfLI8WQQOxrU4Ottldw+0E1NVyLc6yCedMK3vjRIEqjm/oUftmwPmYSThEu4jRD88RurUyB
	Edl6AY95ngvhSJyq5qCPDn7TTEMipp5qJ10AEGwtixw0Vi9EWAj8mkZMfPJ7z2k949usC1/eSF1L2
	LsKFdYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdSg-0000000DDvy-1ae6;
	Tue, 11 Aug 2026 03:47:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdSe-0000000DDvc-2H5n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 03:47:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so325424b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420051; x=1787024851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fO//i2RtgcRB0nXNuwN1GB8vOhXT0TWv6CJA+FzAN1E=;
        b=VuLGN+ykq8k7tEZJBFvqOlSKzt3qOjXtNM7B3DykQzwt8NW1WScP1eDJYaxl5/+6+6
         J/u8EAyXV2/8Faabans1vq6/3kh5kadPXM82A8XGBgijt2byh9rJ6/97GU4DxSdmUQFS
         ofQl22pZ9BH4pRhmOvWMqQ6zX02t0wYC2NnsFNQN3Q7cZgvqlZYVuZWE6EKtOl/Q2D5R
         cZbSPbdgyezdLnKQp1BUN2qsenHO0dl7hmHC4VvHlLOCk3/AK1KCFsVKYgJ/XZqYxvhJ
         AAKeXcYnY/qfVULGluWfldd2rn03ykvaz2x8vRlCsZbLulGq8fhExSRmFyGllbGjv2qq
         wLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420051; x=1787024851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fO//i2RtgcRB0nXNuwN1GB8vOhXT0TWv6CJA+FzAN1E=;
        b=Z0JCwQGUXaRRfs/oghLzUhD56JVb2dxUXW+wRPz9dUpEeURyldVgzXbHHqo/bHc+1x
         rhtabUOyjswHefartvcCYHV0KmuRfA61OfWivAPOm/IUqMAK2CeINsHS3QeRcxfVTP0r
         VNjLTW0CocAxPRWgJX8caLVJd1WAL2MjobXYRJ5Yo3PKpVSYdLZr66dgw39XN5j9Omnf
         49KcSGyaLMs0KZ4Nhk0a+srxp7zSbohuiRQodt/IYnb8QBbdh6tTTsO7lKwhmtiA9c6H
         EVI82y2Q9B+IyQ3M9HK+VCXUffqgTtnVNFkeUpRcTId2EQybovoIUxtxD0wrwyvyUQrm
         VLKA==
X-Forwarded-Encrypted: i=1; AHgh+RrHkipoSEEhqHmb39flJkPDClKkqzIWCl+SFB6S2tWstmvIRUagfD8tlOqwSwW1pRJv1V68WSlvDcJzNpm/ftBb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2injOAq59mGXvKTcqUKpGcNymZU3Pqf6n4wEu/9jIdjQMRZnd
	OSrBjBkqP1CLuyLPOiARyv+hnSikfJ9OnlrWBd+cGSGFM/F02t0AvFso
X-Gm-Gg: AR+sD10Wek50EiFGpN1Sqc2qzR3aqtqT0KtxAJAFG0zxTzSv4+UTznRDE8F2guDOcvn
	2n14WDt95MsqxDidaVBfBZwlhRpK/4bG2AaSX/xM3QWJcRpU7JENIZg2e3d3pygXsUlABSg+gEY
	wOEcRaQWc7iDVI+KqEnm7uqmjcSo1CNUcVpN7o41R7Bx+GReO/fwqaTvblr8htuuSnmGb8jewsW
	OzqbFdCwTez4lRnbwv7SxGw8rUZ52B/TicdhuKCK+5pOAQV51h788L+h/SF6LNDG1EXQzzWzUia
	o5/eSztb9InM9yixyDvGEjWjdrcv5dfqnY7eZ982RFl8VUj1Ndscilz+L/bb3ZFANGOkk9yDDIQ
	bXrc1IkkJfsTSBren/Ta3wAEQ6nvfGomuBLIAmw1FOfyPEQCRImPlXR3HCjouYQBK9s/uQo2XuS
	v1JGT/C6cCBp34f8r3svTYaab/A0vL7QZP+ZFzYxzetjdI0TpmrHaT6fkrz6y/qqF+e5omo/HMV
	GEjxwXrPMv0q2a7plh/CBTRGNlHJgUOjGR/oYnllCdtKy3QR2byp9cP/EB9AUyOurNFZ7B3o2ld
	lBRChg==
X-Received: by 2002:a05:6a00:90a7:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84fa8926f7cmr157503b3a.32.1786420051437;
        Mon, 10 Aug 2026 20:47:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a589d7bsm4537514b3a.53.2026.08.10.20.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:47:31 -0700 (PDT)
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
Subject: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Tue, 11 Aug 2026 10:47:15 +0700
Message-ID: <20260811034715.6034-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_204732_607786_D4799806 
X-CRM114-Status: GOOD (  14.84  )
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
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..7ef099db1bcf 100644
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
@@ -3047,7 +3051,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0


