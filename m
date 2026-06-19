Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C4CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mG0vyVDluQRxAy4jusCEO+px4MVfNltVsG+sO1nmh/4=; b=SgWqx3QxMMeVcX
	mOSDYYoILQlWGys5VThEJ/TfsiXGESpslXKUJqD0iT09QyugTqbvoUbOKwB1OpruwX1ZQyktIwAMu
	Vl+yxzWqZsXGEh4fTVQekfc1s9qWjJUJOw3sD7rskDDCUhkyieMMKWbv+fWkL8lg3UM/nEcFnsINx
	vPw+DV0k9n4Mxa1pCmB9ct98qwQv6lBe4r++gKD8KpQke3S/VaU3rp/aU3jQzNbDLuSrlDuLidkZ2
	4LniRuYFFxnahM8rGo08GNR9TrXhH+yBynD32xgd29zlBPj0ND05ZkZuZnTOpconWp8JvZRPs7Dy5
	8LIqWLa33BHvTFwoicPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXXY-00000002LOT-0TQg;
	Fri, 19 Jun 2026 11:37:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXXX-00000002LOK-2Mx6;
	Fri, 19 Jun 2026 11:37:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA7BD40BFC;
	Fri, 19 Jun 2026 11:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412291F000E9;
	Fri, 19 Jun 2026 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869058;
	bh=mG0vyVDluQRxAy4jusCEO+px4MVfNltVsG+sO1nmh/4=;
	h=From:Subject:Date:To:Cc;
	b=XdF8De6o26MHRFAXcvYne+qrgyDnGUcBJN4ThPYhMrGAyZ1gP2Z7LH2yGkDKsl53B
	 oJ5SVC7UToQRWLQ/Gwh6RRRQjnkQFtvFs6RqNtpeQEer89JpzVTU2Xn/r53NIupYB3
	 i/I8RwIO0FQLWHmyGTX/KyU3MZsqcZ+gKSJ2qjujbiEG9r/2AWegY9Cv9qaBQOt8vX
	 SPogv2jkRQsHKzgk74FjuTjHpgjWWBCwhbav1dzFFNjiK/KOOlMPWPshODYIShMarT
	 j21mjgal4TsZruwiEZAJW865vnnGt4Ztg0/exeD3uBm47YtnPzh+bGk8KWU2sAfHa0
	 nCxGDjsEt5maw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v2 0/2] airoha: fixes for sched HTB offload support
Date: Fri, 19 Jun 2026 13:37:12 +0200
Message-Id: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ7CIBBEf6XZs2sAhVZP/ofpodVt2WhAl4ZoG
 v5d0rvHmZc3s0IiYUpwblYQypw4hhrMroGbH8JMyPeawSjjlNMdDizRD/iOCSf+UMLRHZ0aVWd
 dp6BqL6ENVOsKgRboa+k5LVG+203WG/q/mDUqPLT6ZJw12rbT5UES6LmPMkNfSvkBWx8rMrYAA
 AA=
X-Change-ID: 20260618-airoha-qos-fixes-b6460b085680
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Wayen Yan <win847@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
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
Changes in v2:
- cosmetics
- Link to v1: https://lore.kernel.org/r/20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Fix off-by-one in airoha_tc_remove_htb_queue()
      net: airoha: fix netif_set_real_num_tx_queues for sparse QoS channels

 drivers/net/ethernet/airoha/airoha_eth.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)
---
base-commit: 96e7f9122aae0ed000ee321f324b812a447906d9
change-id: 20260618-airoha-qos-fixes-b6460b085680

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


