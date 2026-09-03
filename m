Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A77C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKLZ7u7XD6WW9l0yLksAVTtKwOMeF0VaxB2QRfd1xRs=; b=R95/thM3BN/4LsP2D3ufnepNri
	e6OTR5FKzbUnUORydYSZvJge2OTZc5bo6aHkpbQzLPGHqKzMEblPOaDJmj/ghGp7CBxqPkqzBQrdy
	HwQMebzVQ3BmqRHaQoQZBcmfjQpCVyFiYdglojoqR03hc9kew+W0aJrZCc75Au5Ox2oS0Ds4PY0oJ
	1kseHAioKuxcENB0vbmY0LvFGKqbo0tEJfS8V68B3QgvoNu8zzTcmT+VGDDiVRVRoqLLQo0hbQqcA
	pYaQj/XcsvXBIEj/v6BGV727sefQev6QRf7dpgDpKAi8Rmh5YAF+Lu3hBmCAfH7tQzc2iwLRGY1YW
	dG2Z3CcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wz-0000000Gaz9-22AB;
	Thu, 03 Sep 2026 07:33:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21ww-0000000Gavd-2b56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:33:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1998341a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420810; x=1789025610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKLZ7u7XD6WW9l0yLksAVTtKwOMeF0VaxB2QRfd1xRs=;
        b=GqxsuY3LZ3LB0DxlcHFvPWLNcd3diVS+olwBj7zdgBGDpnylz9bxULpf7fFytoYc9V
         b3PFvoAVPqTmO6SkSKdqzaH6C5zKqWYL54pVBUwcQWo+r0dhRDkNWD3eDN3sv0UQJwxe
         hmcpDIPt5zoTZQsyta1TR5RRX2AqstVSowmXc4OJa1wH2qrO6uFN6RXf++jBzGXIOHqK
         JLB3I7LzRkfQ2VG7vEos82HRetPfEJ3S1Fqb6gP7DAVAmfcb4dW5SNDuwn64n9MS87Ov
         6wYsGgUhO37IRhRch9itg1J8e2QXVxTvkcXFHeR+MYYfCWwALX0e67KeYxg46WxOpY13
         tZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420810; x=1789025610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKLZ7u7XD6WW9l0yLksAVTtKwOMeF0VaxB2QRfd1xRs=;
        b=C80QY74DuLjfjDszZpNHayfwz+BosfbtWptJGvQjHvJCsKeBCLOiznUD0sCprbcHjR
         JPpQT8UdJMEWkFkqZ2bIV9OB+HFNKsc7KR0bd6vhIVEY7jfJBD9oLemqfoSEKRet6YJr
         3zdlbskxuTq5ONOMiE5b5SvnmcjnGXOvcfMoK/Lwx4hB0HEL/vOWipZiN5bzQdyH0qsg
         J8UXImhRIbwaJ4NC4Rd6wQ6nQiERF69/oiaiYedNyYQKNlEIxVC+p9IZLQ+IAt7E8ghM
         vjlji2h19mUW8n8yOVy59yr9clh9s0F7X26WdJjeQAR1VcL0CtUuiODR7zVl8/lCroCi
         Q5GA==
X-Forwarded-Encrypted: i=1; AKwUvBw+MAP+hFIV5csZOZ/SMazB2ENXvHk7uuHzbIOWrlLvYeTto+3l/tPDmRQN/rukLc/ZQhEFMNZCpQ22vbvzuuTW@lists.infradead.org
X-Gm-Message-State: AFuF++kOPgMaStWXWBHi3CRNRaD606xw8i/BaRpaZjh56uvqPyk1zEgo
	bKlqQ2e0+RK5zLUYa4MoieybQKfDVlHVEevhvjDxXsP5srechw2YBQmN
X-Gm-Gg: AYBFou2GwqCVV9kjx3aBVEJbzvxMlTlJWIPkdOyypU8C64R09uOC/kXrWXl9gd0O+Zs
	GN38Lqso5rwUMyGo4217dQzL4J7bo7UUJtxpye3ovrGr0WaR+JtxYDOabd7b06U9AZFL12gfjl3
	3UfXNca5Csjal8rETiG8xulp2pVrNL49J/S0ljmDwJ/7PwpqI9/dqfgJ/033uxGNuno7wMH+j6y
	f6YmsPqzaMMO2w1Axr0VDrInl4nLhMECgrfAr6LBfSB15TgBf69xmMzCqJB40SlwutL3yFivFWa
	97XdeQd791XhEOl4FxkJZScC0pbEpwYt0PcoMZjXWxFNxDzrccVBd1Efbuumbai9qH2SVvwMGPF
	+D5OU7YvMfyx+r3Rxj+ZTVx47JxOR9qi1b+CQnAr2hWoAtg6ufkZxQ7QOEwdjQwGJ3NscjMmB+V
	FVwS6rBbYcFJi7kzg2O3uaEquKi4qsQsR2ARhsVmV8lmiiF3KbWte3k32SGMsSK0GIZeXuGavR5
	15sI95sLLCZEkMiT8/4Ys6vHbaJNposi8UyMgqhLtJ17arTccNk38feq6dedTM55JnwbouB9tJE
	TNvoCmacxkvHWg5/hKV2l+HdqQY=
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr16177711a91.14.1788420809671;
        Thu, 03 Sep 2026 00:33:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:29 -0700 (PDT)
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
Subject: [PATCH net-next v5 3/3] net: xilinx: axienet: Fix IRQ error handling
Date: Thu,  3 Sep 2026 14:32:52 +0700
Message-ID: <20260903073252.339250-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903073252.339250-1-phucduc.bui@gmail.com>
References: <20260903073252.339250-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003330_747810_3BFCF307 
X-CRM114-Status: GOOD (  14.71  )
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

Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute optional")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4 : 
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.

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


