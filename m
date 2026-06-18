Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F387CD98F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GHyAIZOZzbxFz6Yqz8TdYynWjNFVnvZCYDit4EZpysA=; b=ru0LTBMRQe+Ho8
	BqW6CRDAVc5mZLpSZb4tIfL9mAPiR0Cgo0oWgeENfDnz1/jBq946hiftdCekd8HV6wmjc62I/IcGZ
	O7bL04Yb6X5PvP4vFqzr1w7xBW2HT1aUMFKsMj6ad61vGORhyoIkmLq5YwNlTZC/p3sn31+KM3ijO
	d0LR/erpOKcq9ki9geGbHmuzdujFBA0cCluT1Mrq/uHLATmfl6sC7uWpL4lfmj/QjFN1agCIcQtjz
	wkZqMOdMIjkVgzePwFMIfToWbITI0KgQ1uYen6MPgR762fGtzRqlZWQbi85q9Jiiq9kQyzY1HVKal
	K1ytWbx26wOk+/8s1heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5o7-00000000ftL-36MC;
	Thu, 18 Jun 2026 06:00:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5o6-00000000ftA-19E3;
	Thu, 18 Jun 2026 06:00:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B293442E34;
	Thu, 18 Jun 2026 06:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1597B1F000E9;
	Thu, 18 Jun 2026 06:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781762453;
	bh=GHyAIZOZzbxFz6Yqz8TdYynWjNFVnvZCYDit4EZpysA=;
	h=From:Subject:Date:To:Cc;
	b=bjxnLSiSSSGGUa6neya8uGz9ktAUxE3ZDHJcrZDm0GoVSlLaZMdSca698vzEP6Ibp
	 2AIvZr8lRTs/COauJY3RIdHzyLiYN01o5IrQaVPfAGcKjY64XZOXlfGE7Z59NEnC2J
	 m9e/32ZwsMyv3QK9YZDVUomajV3S7YciE1ZQXO5gTAYN9c/jZfbf8eg4H+U11JxAP6
	 wkyNA2EKLq6DP0gFHLBkMW0mGEZhCk9A4LsTRigOtr2KVCnXSHH4hSMG1WFLiSNU/8
	 mgdyDr+yD3bx9yCDipshP/FrFvh0A2CWEeMUxMIJuE/S41Kgovbzq48sab5M9q/hqA
	 EiySo4BpvXNGw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net 0/2] airoha: fixes for sched HTB offload support
Date: Thu, 18 Jun 2026 08:00:28 +0200
Message-Id: <20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LwQpAQBCA4VfRnE0NMW1eRQ6LwVx22ZGUvLvN8
 evvf8AkqRh0xQNJLjWNIaMqC5g2H1ZBnbOhppqJK4deU9w8HtFw0VsMR26YRnItO4K87Un+kK8
 egpwwvO8H9klWA2cAAAA=
X-Change-ID: 20260618-airoha-qos-fixes-b6460b085680
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org, 
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


---
Lorenzo Bianconi (2):
      net: airoha: Fix off-by-one in airoha_tc_remove_htb_queue()
      net: airoha: fix netif_set_real_num_tx_queues for sparse QoS channels

 drivers/net/ethernet/airoha/airoha_eth.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)
---
base-commit: 7d8297e26b4e20b5d1c3c3fe51fe81a1c7fbc823
change-id: 20260618-airoha-qos-fixes-b6460b085680

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


