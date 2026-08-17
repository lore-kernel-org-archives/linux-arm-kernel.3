Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41513C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzF2gO3yryR4hhBOXhCUkhPNTB2+8HWWPpLokgJWGQA=; b=XrJCkRLz2t5Vpg98c2shzu0VrI
	rILFQDlJdGBc3A+xqpZ8TTvMphqBDg/HTc25u7RmQ1FACmbb761lz6Eop1v/Kxo8XcsGyA2jeT+TJ
	w0/pMwFx19ydtAOLBvY0oOrzSVbTpv/fafxJRFu1K/GLboI8/e0DH4/TuDepFBRHIR6ZEvOZMkrFS
	UnZJNgFywf8dSS2/c3bE5T3ZHzzAJNE28s4LOl88dfIHSAliNIJsD95qgPs5Ca5oFBC+a0do4R8QZ
	KPPywZxWC2AYTYDks+dx8MuTIHUUBYwFSRymxDfUf5S645WUc5K5Z65qTXQN/a03dSGLtNI1n3uvY
	F3KK661w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxp-00000005y7D-2bO9;
	Mon, 17 Aug 2026 10:53:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxn-00000005y6M-1a19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:53:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8486672f03cso3149772b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963986; x=1787568786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzF2gO3yryR4hhBOXhCUkhPNTB2+8HWWPpLokgJWGQA=;
        b=R7ms0YWt5VeskNWqgrlas0l3jwhg5JbyAq6+PE+8+S796U0m+87bR7HPci0v/9DV9R
         y+9hW7u0XSOJmG3GW82B4m8QemqzRvVw6BeqX9dPWBcsxdeRo9oyRN53xkF0FB0noAuL
         UBy0Lo9mq1kcmGvER7j3XuruozU+/i1lL8oVnQXs/iVY/hQi1opmwXuyq56MfipFQVs8
         FVKSf3OVjz6rHZ2vaNxzgtta3CRIH7utDoVc7kR8lU+eNvG0y8nY0j8PMWsvr0rA4kw4
         lYj40dbGGkEOXswAhTv8m2JT6XW3HXAXc9o/Lf9QtVd3VeZw41sEjZh8tvQ0LCTHzZP6
         +ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963986; x=1787568786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzF2gO3yryR4hhBOXhCUkhPNTB2+8HWWPpLokgJWGQA=;
        b=LSM35IKgdcS5EgaKe8Vd6Vt/DGHn8AikfzKDMcqbSHXTSpcTrbXleDAFWIdlytjykQ
         iR+Mzi1d4lgJ/Z9b/Inxz59J/XSwCG8Lg1z26NSVxfErCXeBlwlGsSJkoRQLx03BBkkH
         +zjGUQGwQAgxvgKKgMkSvXWhsIIhT+YIWUvVxkecM4fCL0UR0IiknOvKXWq51Zlk8uef
         ocNCqdQmxhuR52/l6m5hYpqVtnf7VtxW5ycSPCg7MleSINGeD1JBfXc5OHwBZwm3fxnJ
         KJI3NLiVW7nGMhrkycAhlwgNwgBUiHIydOXyTjRnH7h5yRRdOaSjIf06RQHihhMiM7Cg
         kwhw==
X-Forwarded-Encrypted: i=1; AHgh+RrwTI9us5hQVqSoRavf2j+8Ltu3TMFS5rfGxvR/TvDpdiTczbVzH4L1aoccKwYEjCzkTydIxtc3+7TBHvdJnl0M@lists.infradead.org
X-Gm-Message-State: AOJu0YylhSooDWeGeHEK9SYiT+yMEHLMDmig/TNI+ApyLij8Ql3zZG9Q
	hZlV0HhKn1NndNFdLDGoRDuluzt1g7U8J+Zwzq+Kb32R86mIyFyfgESw
X-Gm-Gg: AR+sD13Drd0G4aHWCt04OtmsMIZ1ypt1VYsR2Kg6gPOGNgsHdjINc7zBQD3w6OrRu9+
	MBrXbjpCOR0J/Uzk8BQyol90VzO2kkeAzPnRiY/bVVE4Aqk5FLHY6oZzwdyDnI9eKhlqExLJJ4z
	WCfoJP1dJSa7HpkbPWETPdwm8KyYhCgGrUZzEddrCDOo0BEQ/sl34PjvCZ2dLeJeaGIxQ8abVUJ
	+5SyUQhqrCZ0FWpDaIBjYPQgzu1FcW4u68mN2gMTWO6tooRnX2bfofadqiObOPZl5RLdevItNXA
	r+aWW2DZuXVfNpWubO3/FUHM96QcRyIGjE7uCIgQR/VKQnmCImqI+T/6WBqjXVDIMz/cCaDi34h
	r/scxS1MqEx4j1OBPAmvnuAftryUMzAGnZOJeRtDGegEvFy81dSKtgYuwZfLWUN34T22ZmTTYOV
	blV2e5RfbbGaRwwip3tajfrEz1j7PvVznXESK7sW/RsmEH2eUlRIkxTCU+YumqPU2I09muGu1g/
	gA+lKh414WcMvHu1qIc2AE4N3kPJkl+cqsMPDfe2Rv2Cwd4G8lYUd98jYX8VhsKk0et6EFHb0lS
	6n25j1/9j5I0DUxA
X-Received: by 2002:a05:6a00:10c7:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84fde2a110fmr19733226b3a.32.1786963986480;
        Mon, 17 Aug 2026 03:53:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401ec98sm354846b3a.6.2026.08.17.03.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:53:06 -0700 (PDT)
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
Subject: [PATCH v3 3/3] net: xilinx: axienet: Propagate errors from platform_get_irq()
Date: Mon, 17 Aug 2026 17:52:41 +0700
Message-ID: <20260817105241.63345-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817105241.63345-1-phucduc.bui@gmail.com>
References: <20260817105241.63345-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_035307_421499_748E3C7F 
X-CRM114-Status: GOOD (  13.57  )
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

platform_get_irq() returns a non-zero IRQ number on success and a
negative error number on failure. Therefore, 0 should not be treated
as an invalid IRQ number.

Propagate the original error code instead of overwriting it with
-ENOMEM.

Remove the redundant error message since platform_get_irq() already
reports errors when the IRQ lookup fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 50f88a38b6f6..d982ab6f8a4a 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2968,10 +2968,10 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not map DMA regs\n");
 			return PTR_ERR(lp->dma_regs);
 		}
-		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
-			dev_err(&pdev->dev, "could not determine irqs\n");
-			return -ENOMEM;
-		}
+		if (lp->rx_irq < 0)
+			return lp->rx_irq;
+		if (lp->tx_irq < 0)
+			return lp->tx_irq;
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
 			return lp->eth_irq;
 
-- 
2.43.0


