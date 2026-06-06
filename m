Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222B8CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 05:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qd5esQLYkEp9qLYF3uDQurNkA79QQQMRr7j4ojvsKBA=; b=qjT+/eNlbxSF9+HNZfMvuf1mBJ
	viBIvkRZvviXKmmIQ4cFPZCMoRfcxHgeflkJh+PTSy6eGj6XA+jBHubLN1myeeFtncsh8hsjmS1fz
	/0R66gJYrRpW3WscGHs2b7bh8/tthGSoKQojo6FWo0pULJN/JKfCRcuJ1RhK+6gWfl6PLrGVSDVgg
	TTH3aFnpNCmy3HZ7hrIdCOqZVpCxelJkNILGn5FjDVg3dmhJ9iP1oVdlHB3Y4B+AZQ8yCxcGRgKxP
	RSREaIbwKFk2l6Ta+gC/EZ27C80fImd7pvr7YMKRa4Qj2JRdDaVQ9PbJJOvjN5hCw2kwqRCBcHnLL
	jsXwI+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVjvb-00000001T84-2dPE;
	Sat, 06 Jun 2026 05:50:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVjva-00000001T7u-30BO;
	Sat, 06 Jun 2026 05:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F7214087F;
	Sat,  6 Jun 2026 05:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1A21F00893;
	Sat,  6 Jun 2026 05:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780725038;
	bh=Qd5esQLYkEp9qLYF3uDQurNkA79QQQMRr7j4ojvsKBA=;
	h=From:Date:Subject:To:Cc;
	b=Yc4pfBcr8gFeMuG0vq66p8dzpYN9BM+hwza4eVwJDCz1PwmKRHWTM7lvahzg5v7KT
	 RDBqACQW8/eUYCkoKaOfkXIXwiU4LVYkvPRYVVlWQib+JSPY5UoxTzsd/xh2KYQbhk
	 A4wOwSJ6i3mKIuGu0URERl3ePZcJbmtUhvWxcQ0epTP4G0QOH+ow62bu9mchPZrRAD
	 xdijExBBMS3kfET120DVOjbOaeQeZxFLDqaOZP3I5oXEUWo8nQf02a4w6eJhdjBlTl
	 JTXTQOesP1SdzBIfffPC18UsjJuwbozUl9uym1Ma+pryWMuVBMjiyuKcxNIRN+On/v
	 abdb6qcbI1FDg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 06 Jun 2026 07:49:59 +0200
Subject: [PATCH net-next] net: airoha: Use int instead of atomic_t for qdma
 users counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-airoha_qdma_users-no-atomic-v1-1-86e2d6a1bfaf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDMBAAvyJ77kIMtoJfkSJrXHUPbjRJiyD+v
 UuZ0xxmLsichDN01QWJv5Ilqkn9qCCspAujTObgnX85A0lSXGk4po2Gj8UZNSKVuElA1z5dCH5
 s/FyDHfbEs5z/ew/KBZXPAu/7/gGNKAtYdwAAAA==
X-Change-ID: 20260606-airoha_qdma_users-no-atomic-0750cc2b42f1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

QDMA users counter is always accessed holding RTNL lock so we do not
require atomic_t for it.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
 drivers/net/ethernet/airoha/airoha_eth.h | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..a5fe08864fa3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1809,7 +1809,7 @@ static int airoha_dev_open(struct net_device *netdev)
 	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
 			GLOBAL_CFG_TX_DMA_EN_MASK |
 			GLOBAL_CFG_RX_DMA_EN_MASK);
-	atomic_inc(&qdma->users);
+	qdma->users++;
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
 	    airoha_ppe_is_enabled(qdma->eth, 1))
@@ -1863,7 +1863,7 @@ static int airoha_dev_stop(struct net_device *netdev)
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
 
-	if (atomic_dec_and_test(&qdma->users)) {
+	if (!--qdma->users) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
 				  GLOBAL_CFG_TX_DMA_EN_MASK |
 				  GLOBAL_CFG_RX_DMA_EN_MASK);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8f42973f9cf5..e89c2dff411f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -525,8 +525,7 @@ struct airoha_irq_bank {
 struct airoha_qdma {
 	struct airoha_eth *eth;
 	void __iomem *regs;
-
-	atomic_t users;
+	int users;
 
 	struct airoha_irq_bank irq_banks[AIROHA_MAX_NUM_IRQ_BANKS];
 

---
base-commit: 903db046d5579bef0ea699eae4b279dd6455fc9f
change-id: 20260606-airoha_qdma_users-no-atomic-0750cc2b42f1

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


