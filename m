Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190F4CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bYAiVP56Dv81HYzoSnLTHH/+rH2qlhip5rWcnuT2XGc=; b=fdybGmpSUvZVh9
	4IlXSPcbjLlwxQ3nJ2Hz2ORudEIIZasGek8uA9+WykMlYw7weA9phCBBijO3k3K1mNk4vqhQnL/G9
	qznx7M/C3HMAkL3re8+4HIsTGGX68GX+sF7abjtdTaoiORLQHIMVHiXLNuEBLZj4VQR8mBpKWvyu8
	gM/O4MBfkgHFHcQjACPP5kbszTgG0BqZHrIxlV+D1B4ik/F9YfA/oqOQZ6cjXSfPCAqFVwj2ZsuPp
	LWsO68M17KaA/XBX6YMUZRpch54C4BjmNpBLf/2xhNa05597Ua/NS7BnFk/5jLqWiAysZ0tpVugQG
	YHwYDuptPBda4ZMPknqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upR9C-00000002Wk0-3mA7;
	Fri, 22 Aug 2025 12:45:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLzS-00000001n4z-29fb;
	Fri, 22 Aug 2025 07:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD377443CD;
	Fri, 22 Aug 2025 07:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB10C4CEF1;
	Fri, 22 Aug 2025 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755846909;
	bh=CVihnyQ1lbG3xmCXsosuDlSrApxiofSs6sf1IgE+ifA=;
	h=From:Subject:Date:To:Cc:From;
	b=oa/ZsUGG7trUDAixHJsonNxYZNWCwSb8P+uTbXcAE8amhNjWbpWjMJg9ji3Txg6hd
	 HmN3DxcKfqw5wcddTVeNZprn+1oDMWwIpNYHblE+Ioq6KUCeiH5i2CKLXYCNt6U/od
	 +/yIcZpgGt/aKwXWfLtTgxGAoyZ3IZ/R3IQC6Sx6v8LpUW8UuUCQQCnvL46K/5hQ++
	 v0NnVYhOhoZ2ZSjB5rpA9LuyxaqxdgfR71O2hgDKc3CwUtht2Jb4nQCaMLEzROYUWa
	 aV2cQSbciDRugLbe5uLsz9jSapNHDygScekpo/7RLxAPNd+Igb1wkctIAk0GyPhCyl
	 sfl7oSsqQzm5w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/3] net: airoha: Add PPE support for RX wlan
 offload
Date: Fri, 22 Aug 2025 09:14:47 +0200
Message-Id: <20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcYqGgC/43NTQ6CMBCG4auYWTumU+XPlfcwLCYwhUbSmqlBD
 OHuVk7g8vkW77dCEvWS4HpYQWX2yceQYY8H6EYOg6Dvs8EaW5iaGmSvcWSUUBU14XvigLpgdG6
 K3CNZca4sO2fPF8iNp4rzy96/t9mjT6+on/1upt/6b3kmNFgRm6YSI5bp9hANMp2iDtBu2/YFA
 OL89MsAAAA=
X-Change-ID: 20250819-airoha-en7581-wlan-rx-offload-12eff66cf234
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_001510_582427_9075FFA7 
X-CRM114-Status: UNSURE (   8.35  )
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

Introduce the missing bits to airoha ppe driver to offload traffic received
by the MT76 driver (wireless NIC) and forwarded by the Packet Processor
Engine (PPE) to the ethernet interface.

---
Changes in v2:
- Rebase on top of net-next main branch
- Link to v1: https://lore.kernel.org/r/20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org

---
Lorenzo Bianconi (3):
      net: airoha: Rely on airoha_eth struct in airoha_ppe_flow_offload_cmd signature
      net: airoha: Add airoha_ppe_dev struct definition
      net: airoha: Introduce check_skb callback in ppe_dev ops

 drivers/net/ethernet/airoha/airoha_eth.c  |   7 +-
 drivers/net/ethernet/airoha/airoha_eth.h  |  12 ++--
 drivers/net/ethernet/airoha/airoha_npu.c  |   1 -
 drivers/net/ethernet/airoha/airoha_ppe.c  | 113 +++++++++++++++++++++++-------
 include/linux/soc/airoha/airoha_offload.h |  55 +++++++++++++++
 5 files changed, 151 insertions(+), 37 deletions(-)
---
base-commit: a7bd72158063740212344fad5d99dcef45bc70d6
change-id: 20250819-airoha-en7581-wlan-rx-offload-12eff66cf234

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


