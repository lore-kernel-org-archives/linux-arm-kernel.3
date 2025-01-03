Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E31CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vT+OupkulylohGKGcu+TFCx6Ke3he1sK6LQcIKhLYq0=; b=G3ocDek1kesC3I
	vSZ3Vk1Y6xJREHyujSeu79bC00cOhsG35ORGgBVqh35/UwQ69/6QAr0F44mfywjkPW50y2DftX8St
	CJTJiKAgsCScImzlWOWQ7nmpz9RzncTXFi3POdELI8cMZVF8uttSFH5rhhBqwi+L9g/SsMkk8ZEU+
	9Sw4PZkrnHB+YbCHG08+pNne2MxeUzFRMh1RrI26iYGHifyFhSLLNSUsiM8BTUQUynZRYxcytW0Pu
	1speSEK2vUZzqL7JGR0EbW2Szrlfhgr6kEy9BbxoZi6sPdR6wIsweuJ0a6jdRBxX4QQxnLUpkxERI
	1bfsMdteVET90OwVIj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgda-0000000Ctim-04gs;
	Fri, 03 Jan 2025 12:18:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgcN-0000000CtZm-1rNE;
	Fri, 03 Jan 2025 12:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10AE8A40AD1;
	Fri,  3 Jan 2025 12:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B1CC4CECE;
	Fri,  3 Jan 2025 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735906649;
	bh=iZkpeTvEGSmMhcQEIgKm/62l1SkHAgQRaRN1z8ZY27s=;
	h=From:Subject:Date:To:Cc:From;
	b=SvXfBf7hGV7fp4gh4aPsKb1uAnkbBn6qxysrM307b0QVf2iOgO1gy1hMuzKQY8QCw
	 1ytwDqZOzrkK2W0cokJE2DuJjpm9CcMop5ezeQjmvjPZVcuPDD1WD1aKB3KmZBWJjV
	 T1wZqwi2qxhCjZ9MnklGzTdZGT4S6wTi2GwTQOWmwmBmxwMtg2cXgj/X5AQbCsLRlD
	 iF+OCzLuVISLpBSfEFcwmo5A7fXbAH/hN5dvonR5ilDTm2QmyPdfXJ/C8Yixy4NNdj
	 ny5iRmXuyk8d8tRqYCYwm8DYvVhDU3yF8p0MYdB+GXNSR+EYBDdsKcoR1wz0UySPEC
	 I/XWbjkKcpN1Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/4] net: airoha: Add Qdisc offload support
Date: Fri, 03 Jan 2025 13:17:01 +0100
Message-Id: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD7Vd2cC/x3MwQrDIAwA0F8pOTegtl3LfqXsEDSpgaGdwhhI/
 33S47u8BpWLcoXn0KDwV6vm1GHHAXykdDBq6AZn3GzdZJC05EjIaV02i5+g1WMWeWcKuE7OG6G
 wPGaBPpyFRX/3vr+u6w/f4YR4bQAAAA==
X-Change-ID: 20241230-airoha-en7581-qdisc-offload-732c0fad564f
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_041731_550216_F99720A9 
X-CRM114-Status: UNSURE (   5.56  )
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

Introduce support for ETS and HTB Qdisc offload available on the Airoha
EN7581 ethernet controller.

---
Lorenzo Bianconi (4):
      net: airoha: Enable Tx drop capability for each Tx DMA ring
      net: airoha: Introduce ndo_select_queue callback
      net: airoha: Add sched ETS offload support
      net: airoha: Add sched HTB offload support

 drivers/net/ethernet/mediatek/airoha_eth.c | 518 ++++++++++++++++++++++++++++-
 1 file changed, 514 insertions(+), 4 deletions(-)
---
base-commit: 3fff5da4ca2164bb4d0f1e6cd33f6eb8a0e73e50
change-id: 20241230-airoha-en7581-qdisc-offload-732c0fad564f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


