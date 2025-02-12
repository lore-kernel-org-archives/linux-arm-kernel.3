Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD57C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ur7R4c51nhilIYjpuZkPE02P6bkK9lgoqIhWX0LoZ68=; b=Hili/sLIgzFfdG
	HyPRnV1fl55nN+PLEThsg+KtZNlR3NLPIQXotLVL9Hj9+JwdVmPnQwnRE5VbCULbBGUm8bhCnpXBT
	w11sCC4WXWr4BV4QdzLkAOBZ1Z6u0QjOULkSN0/E2HP+nBl6aSnYImDH8z31N21GQXgX1oYYouzbf
	QLkdY2NXQfKT3zygUBveoMDbZeJbfhMaDVaaRkVd4jTxv/+tuiXSAWB+Cnn+LV4NzXtx/LDoODp98
	fVi/EDBpDj5u/Lr8yXy0lK9BC1eOJ6hqI0o1pVC61CVkESqzQR3P3uHnBgQMkY/HBwYC/zj8gP211
	f6v/8x7UQ9mzUqCJ+zhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6ct-00000006Q8O-3sOB;
	Wed, 12 Feb 2025 06:53:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6bU-00000006PuS-0AAW;
	Wed, 12 Feb 2025 06:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF67CA41156;
	Wed, 12 Feb 2025 06:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C2CC4CEDF;
	Wed, 12 Feb 2025 06:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739343131;
	bh=4WreFNYgftWVc1aDlkY0DugTCMVqujOyi80mA6w1cA8=;
	h=From:Subject:Date:To:Cc:From;
	b=H6zZRBlfnfL04nfDSsaK3d5deuRCNlXLxeQliGnDqH6igA9LJ5CqALnC35/5l5xYD
	 YfXvZF0VBFuKqFWlY3yoXeHNnE9ozgj5L8vcssKV/XUjjtzJxVfn9q5AO0RKapvZ4M
	 WSvUrw+s8eu6FFn/Xkjbus88VMOlqB9M+WrjzWWOyWtQOSTp9QK7WIZbBLWv9Ex2GJ
	 pD2HB+ri35bbTLkEDIrigjKOu5uA58siULA2uwtBaXHJsTHHO4+1IqJuyOp0y0sGm8
	 Ya20aUeNAeTaSuGfSF6tn3dq0hT15IYJdnIOxtd2cHQHpqV3HDM7Oc9zErZ7DlJwVS
	 bvueldK5b0aUQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] Enable TSO for DSA ports on Airoha EN7581 SoC
Date: Wed, 12 Feb 2025 07:51:46 +0100
Message-Id: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJFrGcC/x2MQQqAIBAAvyJ7bkHFgvpKdDBbcy8aGhGIf086D
 sNMhUKZqcAiKmR6uHCKHdQgwAUbT0I+OoOWepRaKbScU7Do+cW7JDTGTn52uzJOQo+uTF39w3V
 r7QNW5sjHYAAAAA==
X-Change-ID: 20250211-airoha-fix-tso-44a6f9cb14c0
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_225212_160878_19B4DDE3 
X-CRM114-Status: UNSURE (   5.75  )
X-CRM114-Notice: Please train this message.
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

Add missing vlan_features configuration to enable TSO/Scatter Gather for
airoha_eth lan ports.
Fix checksum configuration for TSO packets with cloned headers.

---
Lorenzo Bianconi (2):
      net: airoha: Fix TSO support for header cloned skbs
      net: airoha: Enable TSO/Scatter Gather for LAN port

 drivers/net/ethernet/mediatek/airoha_eth.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 4e41231249f4083a095085ff86e317e29313c2c3
change-id: 20250211-airoha-fix-tso-44a6f9cb14c0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


