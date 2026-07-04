Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABBDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gKSm7rIc5n9tWg7a0XJc9GGyaUYz7rX65FqoNZLGJqQ=; b=zPag9mtpPTRHuXL40+EDYCb247
	lEnh0AVLxQ7n1j1C4iqGaEIg/iy7BEsdxQrtKI21Y9FDXhl9/EiVbsDfvjvMTKBCbvXf2wH4EhBr/
	tlJZIpRkq6ppGqjaCIG+97a4XaFhNpyd1i9uHXIGdua8ScJXXj53gAbh9HxJah+yMNAvivOn5z0Op
	00Qz6R8AF1Jjmp9CrS+IHHodLymzgKpqEgRpWdEikXImNhygrLlriEgYnXmHk97RXL0I2ma7tMfBS
	eQrFGqTu6YV7q633mmzUwn0MKQRAfU94XajXolEcgVlPGEw1FoyLgFZ9s8voCGx0Q4eopk04/6kTv
	d+yBiZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg1Fj-00000008VEF-0RdG;
	Sat, 04 Jul 2026 14:21:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg1Fh-00000008VE4-40B7;
	Sat, 04 Jul 2026 14:21:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B34776001A;
	Sat,  4 Jul 2026 14:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1991F000E9;
	Sat,  4 Jul 2026 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783174912;
	bh=gKSm7rIc5n9tWg7a0XJc9GGyaUYz7rX65FqoNZLGJqQ=;
	h=From:Date:Subject:To:Cc;
	b=mF4XiaXojCm4JUT+iUgovxPxOtZwrJUZJ/KN4x5HdunoTS2k5X5N6UhaZWfyrdRox
	 ZxMWjJqfjbnaa1zL5YgTuEEvkNvM9BXSHlaE87MHXgF4PkpBd1S/sHKWBQ7DOiLLFA
	 NDz/hnlCcgT/x9AialtNBhoH1N1SM/0vnxYHMM5OxumRHJUvajGc4mcp70/ZtMP7pP
	 /CRyLrbPRvrqLFagKdVQUHxWeMVT9mFBBlcGrNrF4imTNCUYq0Zuo5gXiyqHuO1yUu
	 qlyRQ95c5TSo5UIxJWZ7yk5OWafRCHIoLmUALBEVX7F89NBJC2mU92Sx/z0S21MXIM
	 W4XaxqIi7HGyw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 04 Jul 2026 16:21:38 +0200
Subject: [PATCH net] net: airoha: fix ETS channel derivation in
 airoha_tc_setup_qdisc_ets()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-airoha-ets-handle-fix-v1-1-42516b3549a1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqEMBAFrxJ6bUP80OJcZXARzFMbJA6JDILk7
 tPMsl7x6qGCrCj0cg9lfLXomQzaxtGyh7SBNRpT5zvxox84aD73wLgKm48HeNWbZWlFIvrYT0L
 2/WTY/O++KeGiudYfUjnaemwAAAA=
X-Change-ID: 20260704-airoha-ets-handle-fix-6c166de3d396
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Derive the hardware QoS channel from opt->parent instead of opt->handle
in airoha_tc_setup_qdisc_ets(). The ETS qdisc handle is either
user-specified or auto-allocated by qdisc_alloc_handle() and bears no
relation to the HTB leaf classid that identifies the hardware channel.
HTB derives the channel from TC_H_MIN(opt->classid), and ETS is always
attached as a child of an HTB leaf, so its opt->parent matches that
classid. Using opt->handle instead can cause two ETS qdiscs on different
HTB leaves to collide on the same hardware channel, corrupting scheduler
configuration and stats.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..fac2aaefffff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2504,8 +2504,7 @@ static int airoha_tc_setup_qdisc_ets(struct net_device *dev,
 	if (opt->parent == TC_H_ROOT)
 		return -EINVAL;
 
-	channel = TC_H_MAJ(opt->handle) >> 16;
-	channel = channel % AIROHA_NUM_QOS_CHANNELS;
+	channel = TC_H_MIN(opt->parent) % AIROHA_NUM_QOS_CHANNELS;
 
 	switch (opt->command) {
 	case TC_ETS_REPLACE:

---
base-commit: d6456743424721a837e1509b912f362caaeecd97
change-id: 20260704-airoha-ets-handle-fix-6c166de3d396

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


