Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dmc+uDkGRA8+nNKoNoPVSJ4jLO/CyeCEX7kamtthljo=; b=dqJnbI5jeVH92x
	0DZe+J4cymFCJiIXZfrAz707eeBF2gwZlDbY96d2TRy7u7+alb41AuAUdFHU99TaUGQSm3Kxpd7xS
	PHDq603ChV0CHU0mAI//4zEyKA89LRtyZlhA29RbftWSZ70p5zJ8utFMmBqWAiygEE5+bCMHXNWxX
	2Mmk2u/2D0jwnr7p9Qvg7LYq3Ku6yDQw0yJyKukT2YGmiDuyqy8USjH2Q0u5RZW8lMm75dv2bX6w+
	UEOyp2idlNEZk6nP/nNOnKBxJWD1d0x96jmbO4mxAtcS5EnaNcfyMxshyMPuSijqtSxP4ccc1GT7K
	9rWfXOJWt/fogQJ+1PEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9v6-0000000CK7W-2ycH;
	Thu, 19 Jun 2025 07:42:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9N1-0000000CFye-067u;
	Thu, 19 Jun 2025 07:07:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0855761F1A;
	Thu, 19 Jun 2025 07:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F62C4CEEA;
	Thu, 19 Jun 2025 07:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750316853;
	bh=DS6X6Uh+5BAdzn781q2Z39tpJGkQGohp1jR12NcJK9Y=;
	h=From:Subject:Date:To:Cc:From;
	b=NZR9kFMQFXBcMXWLxUtQNQci3YLdZ0Z/CLi0P9oiowapdLkqPcaUp7ZBmSWCjPnoO
	 9D/A3zZWufkdjQ35sMPLsg7JTAC5X7fg3qO3HpzT9tHKngNJAd+E1l9k2PejHIgc3U
	 DbSsWuJm/4c78Mpru0gZug3vzKzmrorsbcdjjfN6uAhdnm36HSBtE79RxWgh9b9mYJ
	 bIHAufP9TJ4uH8RbUCwGQe/Ob14Yq33yFM7/p2MLXwxDOWc+kdV1AKlLPLzVFp3n2m
	 pms6WFZXDOZvm2LiRo2530OJ3eKzz+Ba+F9gK28SKDiUkaDh/APvX6kBr3SVMRJB0/
	 hKhiqdh4TgvzA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v4 0/2] net: airoha: Improve hwfd buffer/descriptor
 queues setup
Date: Thu, 19 Jun 2025 09:07:23 +0200
Message-Id: <20250619-airoha-hw-num-desc-v4-0-49600a9b319a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACu3U2gC/32NQQ6CMBBFr0Jm7RgEWqor72FYVJjSidqaqaKGc
 HcrB3D5XvLfnyGRMCU4FDMITZw4hgzNpoDe2zAS8pAZqrJSpd4ZtCzRW/QvDM8bDpR61E6dtds
 7oyxBHt6FHL/X6KnL7Dk9onzWj6n+2b+5qcYSd8bqxrT90Co6XkgCXbdRRuiWZfkC5qYkwbUAA
 AA=
X-Change-ID: 20250618-airoha-hw-num-desc-6f5b6f9f85ae
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

Compute the number of hwfd buffers/descriptors according to the reserved
memory size if provided via DTS.
Reduce the required hwfd buffers queue size for QDMA1.

---
Changes in v4:
- Fix commit log for patch 2/2
- Link to v3: https://lore.kernel.org/r/20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org

Changes in v3:
- Target net tree instead of net-next one

Changes in v2:
- Rely on div_u64 to compute number of hw descriptors
- Link to v1: https://lore.kernel.org/r/20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Compute number of descriptors according to reserved memory size
      net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1

 drivers/net/ethernet/airoha/airoha_eth.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 9b70c362a9d4ab93e0b582dad73acb2a953ef797
change-id: 20250618-airoha-hw-num-desc-6f5b6f9f85ae

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


