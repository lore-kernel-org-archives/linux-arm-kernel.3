Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092EDC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AXB9IQGSbDb13imfwWL/kXTtQeUapOU81HM4JBB/5w=; b=BjuNOgpjslq9YFWnlcMdTNygoF
	tXOsVkFv/gmZh6ZVBODiCYtG8Uyy6OUdEYWCeZFFp45o0QFSLqjeL54Vtj6z9FjBX4QnioCVFX6Ft
	qSbDO9A9oUst6bQ8EQIYxkGKhpHt2NN+30LvpwpXbxZ2+DjMKGxyP962bSxgHdSPrMV7G/DMVqp0E
	Jb65LjoZyAJHqQrjhPKuaBL2IgkXwPzHeZxcHcLwKYUYCYZu+Z5z8f+Qi9K8xj5DlHHqQPyi8k7lK
	xCTNJ2fQEvj716UxeHc/C1ns/dVvjehlKW9zmqqe8drm/NX79mq+8UqUF44GQEfg1x7MdydzQtr/2
	/XLkp5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOR3-0000000DKrh-30FB;
	Fri, 21 Aug 2026 12:33:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQz-0000000DKpe-2xpl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:33:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7265875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315601; x=1787920401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AXB9IQGSbDb13imfwWL/kXTtQeUapOU81HM4JBB/5w=;
        b=LId+jGacR3ocbUWUA/hW8JFJQerKtpYAup8yTiOSImcK8s8u7qm3egwcnk3kNUkmDs
         bN076NNCBwZDYlYpTTWeLEzCgr/OynYCwHR85FOyzYeO/EuhN0HT0DEXBqRicdC7PX1K
         p0IckS0jEoeq4JUuhgjiO6FeqcW/vlJUwyMhFp4ABtzHtg5wMRUY1DMTpWQXxmPFdreK
         vGFeooFV/q9n2wmqITjilRiodCqHmnA580V62sSho1S0xSaonWUKg4p2k0QpBMdxZCym
         DwKO5q+lvSTRm42o000yvWcFjDUA34NjMxNjSGK0oxUNJtiefRIKwC+MNnMe+V/xuZeL
         7fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315601; x=1787920401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AXB9IQGSbDb13imfwWL/kXTtQeUapOU81HM4JBB/5w=;
        b=lB1Fuk6iFaxvAyuQxryTqUrVMjdpJ5PaW65AVE7dZhEc0p9vrJToYuGFvz6TqZ2Rn3
         WD3YSYoH/aejYttuTQXSJkQ980fQmYzIthQM41539+1n9YXdHuGaKibxKrckM9foh/xN
         uNeSKQ1APqq0WIXc0i61vdCYKkpfniZxI+vQt2rVtJYuY4V8pt9Y8Xp7En7DVT5sTWiD
         +Km+VmaiLFo+NhD5NtM+cG5tHqbFtYgNug5K3Mp3MzK134wBHO367d3rPvXXp89qn3Sn
         lg6aVGorOywr4drrhkiqvIyfjD0A1ajhbMWc8kmCndgQbxMn+wqgxgY9bRN66sVXymls
         +1Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqQscrxI8YogfwZqs8ouEp8/hofEHh0MB/D8gt2ttOrQunczvz8ABoQwNZBw+Lq3fWinwrCU82Ps2OZWD1WXHWj@lists.infradead.org
X-Gm-Message-State: AFuF++lhryuWvZk5n3it60b+eTyZO2ZqsdcA3m/EafBCje0YBQjWmglG
	vOAQRHu22FnZ0j0Te2HOTXyfsmHZbeP2BW1jdXJTvBoInx4DuVZkjvAL
X-Gm-Gg: AR+sD123KYBcR4Q7/Hrp6eivor3Lj1YhkniBQoVVi2kJzziVTHvbt2fL8q77t4BCfQA
	6+vN9qxBQbBhh1X6gUadYRLFKF5crsteJMHAydPgLKTXBU7hMVx8n5RTpANUXZDy/XTVz9RgCv2
	Zd6U67gbj46NU8mxBfhiGep3wF7PkuvtP1TEoi0LCn36HaCEEOArjCV8dM6jRJXecp0TsxjWsyK
	i63OXy7Mgkp3omqTlvjA7xXubvV7sQmlMftLtPU3u0QH2WuxABAKw0LqIlF0K1FQTmBvhdoUGue
	IEHH1E4Uy5bUhnVj3pShYirUG4q5gv9ybKBm4qCtaxLODtQ/MPJ7RMeljo3b+P/ZVOai8RGNe0a
	MNU7x4ujNaN/zEzKHEGZeafUIljhDgXJecZE51BuBdyHjGMclJkxpg4ks3WBPpjPKLsEtakXEas
	3nOQWwUm9Q41U2SqQ5ofmezba7Dca5HNbz4iPKBBcnGR7/YG3JZ+6K4fAeuTQ6eWDWNnBc86h1i
	PcW0uJvqOVgxmDbHybFGdbZJfbtgxG+xBIi+Km5gCQIhpEDixrp96PTq9QG8EQjUVKBN4r4zKPb
	rN0N
X-Received: by 2002:a17:902:f70e:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d64afd7c86mr130049755ad.11.1787315598800;
        Fri, 21 Aug 2026 05:33:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1d8sm18402285ad.52.2026.08.21.05.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:33:18 -0700 (PDT)
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
Subject: [PATCH net v4 3/3] net: xilinx: axienet: Fix IRQ error handling
Date: Fri, 21 Aug 2026 19:32:49 +0700
Message-ID: <20260821123249.41527-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123249.41527-1-phucduc.bui@gmail.com>
References: <20260821123249.41527-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053321_796138_465A5786 
X-CRM114-Status: GOOD (  13.56  )
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
Handle both cases and preserve the original IRQ lookup errors instead
of returning -ENOMEM.

Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute optional")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4 : 
 - Add error handling for irq_of_parse_and_map()

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 3927ababf833..68b580191508 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2971,10 +2971,14 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not map DMA regs\n");
 			return PTR_ERR(lp->dma_regs);
 		}
-		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
+		if (!lp->rx_irq || !lp->tx_irq) {
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->rx_irq < 0)
+			return lp->rx_irq;
+		if (lp->tx_irq < 0)
+			return lp->tx_irq;
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
 			return lp->eth_irq;
 
-- 
2.43.0


