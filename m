Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00932F8E4A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U+tOywwEpJYqL7PtvVmUg8Iaoszx4PyitKt71VNiUgI=; b=ySo+HqOFPgj3jY
	bCDoOmPDY3HnCTJIoMgCrmUm4RUCXkZ027ZOX0YcJMxnc2N77SM08Cck8W50fc7gAPP7VefL0Yf9v
	FNLl+PtnrAv5g+vnkMKVZAJNyCniIowXlCtLTLADKDYLIC+GU1QnGv4SaoR54aPqsxEeOAxgPXlRe
	Xo2GxeaLBySz686rNrizq3D8TmHZp1po+iuEAVs/Rof5o+201CtFuL5yuJFHhLCupYZxvVfaBeJu5
	2di+zurAx7YLym/yUlvDKUwDCdSyc2zTbsrNTiHwOQJI6a4nVvH7cdu669vJDJRfUZy7WrCmvGeXk
	ZEoqHh9zflwdwX4aF6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcq9-00000003Xuj-48PG;
	Fri, 17 Apr 2026 06:38:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcq8-00000003XuS-0lSM;
	Fri, 17 Apr 2026 06:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40E366012A;
	Fri, 17 Apr 2026 06:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9781BC19425;
	Fri, 17 Apr 2026 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776407887;
	bh=lI3xvJe6ThPjr4HNj7xOObldlg5IYT0lT9jqYELwQFQ=;
	h=From:Subject:Date:To:Cc:From;
	b=tad1VlVkoRGEzQywmie32odst/BZPKLRSay72O54fMwk98zJ2srDGKYAhb9tL02dG
	 oEgWhxnpAkD1+UQVvKNP8eYJK3HltPvzawKGOJx/yBJMbOsVAMJHmqcB0sh/vaTrOd
	 ju5llrriVELJKYmucXqQNiESQDPRnt3dNBlUq8QrlVLAYc7SWsQDceTmTvyD/T4gEJ
	 WygkjzgbI/+NbHy7y7YPLtZyXvG5mv8YjGCXwGWPfqrcuCY9xevwCrHCJ/0x1XYoQC
	 bPuvCuq512iov2CMFwNBmqQQP95Mq4krABHICfroN0FGWz+/8xb+g0f8sjb+rcMpDr
	 6IUg83Vgesr3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v4 0/2] net: airoha: Fix airoha_qdma_cleanup_tx_queue()
 processing
Date: Fri, 17 Apr 2026 08:36:30 +0200
Message-Id: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNTQ6CMBAF4KuYrh3TFkqrK+9hDKllCo1aoPwEQ
 7i7DSuNG1y+eZPvzaTD4LAjp91MAo6uc7WPId3viKm0LxFcETPhlGc0ZRS0C3Wl87Z46tw8UPu
 hyfspbwccEKybwGMPxySRwgpERS2JVBMwVuvMhcQHco3HynV9HV7r9MjW6r+VkQGDm2SSGWUZS
 nW+Y/D4ONShXBdG/qmmG1UeVSVFgUIaQzn/UZNPNduoJkCB37KjFVIpoeiXuizLG+VSRXuKAQA
 A
X-Change-ID: 20260410-airoha_qdma_cleanup_tx_queue-fix-net-93375f5ee80f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

Add missing bits in airoha_qdma_cleanup_tx_queue routine.
Fix airoha_qdma_cleanup_tx_queue processing errors intorduced in commit
'3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order
DMA tx descriptors")'.

---
Changes in v4:
- Drop patch 2/3 to move entries to queue head in case of DMA mapping
  failure in airoha_dev_xmit().
- Link to v3: https://lore.kernel.org/r/20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org

Changes in v3:
- Move ndesc initialization fix in a dedicated patch.
- Add patch 2/3 to move entries to queue head in case of DMA mapping
  failure in airoha_dev_xmit().
- Cosmetics.
- Link to v2: https://lore.kernel.org/r/20260414-airoha_qdma_cleanup_tx_queue-fix-net-v2-1-875de57cc022@kernel.org

Changes in v2:
- Move q->ndesc initialization at end of airoha_qdma_init_tx routine in
  order to avoid any possible NULL pointer dereference in
  airoha_qdma_cleanup_tx_queue()
- Check if q->tx_list is empty in airoha_qdma_cleanup_tx_queue()
- Link to v1: https://lore.kernel.org/r/20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Move ndesc initialization at end of airoha_qdma_init_tx()
      net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()

 drivers/net/ethernet/airoha/airoha_eth.c | 40 +++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 6 deletions(-)
---
base-commit: 82c21069028c5db3463f851ae8ac9cc2e38a3827
change-id: 20260410-airoha_qdma_cleanup_tx_queue-fix-net-93375f5ee80f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


