Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444AFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TbHeSy+jX+aKGdzJ6PWKAT3NQckL7Kf5JvWuYvDZ0Fk=; b=NPu88Hz9Znltj32LFjM6pGPFYy
	/jyOM5tmwPxanBq63yu+E1K/qGlCFxMPlc6ch1myotfOqFZOOVZCddFU4F9nf3Qg+j5hQGCC4UbFQ
	sZBlfwkzvFvr//qC+0jQ9AwPysf1Vj36fVtAX3mtV7LEqarzhMVYximPNlaEkZCBLSlb28nFjygqc
	4gHr6jo52NGGjTmgJaD7j/jZi1bnOdsVAD/OSYfJIr68Ga2Is0HEnWUXpK6c71JgDoJR09hMI7Hzk
	q7QUbgjd3K+texljYX8OB+DFR4Q5ZqTUcf2VEVXzF1DW7kXEE+m2HfYrh6EWaDbvwVywwQcOHAq4s
	YSoxedlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8cd-0000000GUE3-14l3;
	Thu, 18 Sep 2025 07:00:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8cb-0000000GUDX-3mq7;
	Thu, 18 Sep 2025 07:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49B3360010;
	Thu, 18 Sep 2025 07:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1EDC4CEE7;
	Thu, 18 Sep 2025 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758178801;
	bh=GYQQZBRFtvo1wyXj5F3TK1koEo9eY7xeSRvG8LEDgI0=;
	h=From:Date:Subject:To:Cc:From;
	b=d8grMfXRdRd3M9C9BtlejCL9yVW52ikV/pMYn+LBjuSxIFfD2fzW2IwFp57BMXb6y
	 iCAGvdkM16oYI+dPYoIdEmUa6KBm3fNkvTrFQzrlteahCjfaWMXWKFonXhNfQuYFve
	 p1ExhG2VOMbGyzYQaf+ltk6DzUsfHsS/2WNSCKC/1YnFdhh6Ajc2ezlZYrWjdnh8yo
	 jrCzHi9wNGtcA/KHM+zk+GvbtuvSQBq+/9ZDS4LKKAJRCvHTim11/8arP4IEbd9GVi
	 4peqAa/yJQxK7XbxhUoQPayr9L9xG6b5QBgx4VC6FkSZ0gq3f0uubq2DKyuCF/v8Th
	 K3iNBia4v2Qwg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 18 Sep 2025 08:59:41 +0200
Subject: [PATCH net-next] net: airoha: Fix PPE_IP_PROTO_CHK register
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-ppe_ip_proto_chk_ipv4_mask-fix-v1-1-df36da1b954c@kernel.org>
X-B4-Tracking: v=1; b=H4sIANyty2gC/x3N2wqDMBCE4VeRvTbgsU19FZEQ7bQuUrMkIoL47
 l28/P6LmZMSIiNRl50UsXPisCrKPKNp9usXht9qqoqqLV6lNSJwLE5i2IKb5kWxN+7n02I+fBg
 Az3pE6+3Dko5IhOb7oB+u6w9dDuLXcAAAAA==
X-Change-ID: 20250918-ppe_ip_proto_chk_ipv4_mask-fix-eee73be5a868
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Fix typo in PPE_IP_PROTO_CHK_IPV4_MASK and PPE_IP_PROTO_CHK_IPV6_MASK
register mask definitions. This is not a real problem since this
register is not actually used in the current codebase.

Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 150c85995cc1a71d2d7eac58b75f27c19d26e2b5..e1c15c20be8e13197de743d9b590dc80058560a5 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -237,8 +237,8 @@
 #define PPE_FLOW_CFG_IP4_TCP_FRAG_MASK		BIT(6)
 
 #define REG_PPE_IP_PROTO_CHK(_n)		(((_n) ? PPE2_BASE : PPE1_BASE) + 0x208)
-#define PPE_IP_PROTO_CHK_IPV4_MASK		GENMASK(15, 0)
-#define PPE_IP_PROTO_CHK_IPV6_MASK		GENMASK(31, 16)
+#define PPE_IP_PROTO_CHK_IPV4_MASK		GENMASK(31, 16)
+#define PPE_IP_PROTO_CHK_IPV6_MASK		GENMASK(15, 0)
 
 #define REG_PPE_TB_CFG(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x21c)
 #define PPE_SRAM_TB_NUM_ENTRY_MASK		GENMASK(26, 24)

---
base-commit: 11bbcfb7668c6f4d97260f7caaefea22678bc31e
change-id: 20250918-ppe_ip_proto_chk_ipv4_mask-fix-eee73be5a868

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


