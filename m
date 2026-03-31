Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E428FF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LuqzQ5IN4wJBD5Vpy9Nvs/kGXlWi6ezevgJi8fXP8GQ=; b=uY1okg14vujczQchFqCLv95qFB
	EqwqYn86POOHnBWwOGZ6oqDSGJc5UzzQxAEUlCXJ8VfkRwNHgRR9vHyiEE9vYDifI0m0cVMFmcc7X
	17Jq9RodwyZ2JZP88tkLjzZ+0ZdWLj0KYHgmXVkR5xud11J8rV2Y+5Iy4mbIXBa/3+C3UdQ/d2zdb
	p3JRuUTE91R+/fh+paxeQ/3QmizeigGpbJT6v3wxhvfS8xBXD0fWjOQU8kLJOipxg8HDXMk9ud+aL
	NVspDdvV6yaDGUUFhNSvd9oKnSnME4F/GWQ4Yc7kVwBDIFaJ02k9EnPxz4KN+qEmzpFdAaJ9m/Ea3
	g7OgIwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WPl-0000000CnAG-0t2u;
	Tue, 31 Mar 2026 10:33:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WPj-0000000Cn9t-2TLr;
	Tue, 31 Mar 2026 10:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98B0B60121;
	Tue, 31 Mar 2026 10:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05C0C19423;
	Tue, 31 Mar 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774953218;
	bh=ESnoLg0mCBoQiyMnraEo+1VzlId+wu6hkJDsXCapeEE=;
	h=From:Date:Subject:To:Cc:From;
	b=X/X5ldN8LCV12LwezC558JagYwFdXc/h5/lnI4nPz67+neLXhwoUnhuo/ial+zSPM
	 zev6zYZVnYvf6AFpfF02y/zzD9oGI2K8COdrvo4TnGD/UL9bzF0uV/KJ1EyzjGPy9e
	 WiMQzz3pX40GkDzXbFfyY9XfDyv4GU2b9xzunKgLyjdHq1nUXuLrcGEvKl95wWrX/h
	 cwazMM/YmMzJcU267LyHD5nXMUjhN/lnT4faDyZJ5gKqIy4jhAO4Rrsiz4+XhSraaM
	 JhS403JyqjHtIK+u4B3S3qSfApIiVIhv4yHX3RYq7b6C/jynwLwe4MZTScuvz4rNnK
	 M8Jl63lR9aJ2w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 31 Mar 2026 12:33:24 +0200
Subject: [PATCH net-next] net: airoha: Set REG_RX_CPU_IDX() once in
 airoha_qdma_fill_rx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-airoha-cpu-idx-out-off-loop-v1-1-75c66b428f50@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrDIBBA0auEWXdAjRTMVUIX1o7JQHFETRFC7
 l7J8vHhn1CpMFVYphMK/biypAH9mCDsPm2E/BkGo8xTzbNGz0V2jyEfo3SUo6HEiF+RjFaTt2/
 nrLIBxiEXitzv+wqJGibqDV7X9QfOVebedwAAAA==
X-Change-ID: 20260331-airoha-cpu-idx-out-off-loop-41ea4b99404c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

It is not necessary to update REG_RX_CPU_IDX register for each iteration
of the descriptor loop in airoha_qdma_fill_rx_queue routine.
Move REG_RX_CPU_IDX configuration out of the descriptor loop and rely on
the last queue head value updated in the descriptor loop.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 82e53c60f561f6314fbf201ba8bc8711e40edc68..e09442580f376b6810b6e4023794e93f63dac209 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -572,11 +572,12 @@ static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 		WRITE_ONCE(desc->msg1, 0);
 		WRITE_ONCE(desc->msg2, 0);
 		WRITE_ONCE(desc->msg3, 0);
+	}
 
+	if (nframes)
 		airoha_qdma_rmw(qdma, REG_RX_CPU_IDX(qid),
 				RX_RING_CPU_IDX_MASK,
 				FIELD_PREP(RX_RING_CPU_IDX_MASK, q->head));
-	}
 
 	return nframes;
 }

---
base-commit: 93d04e76bcf1e81f36f5ea7ad620a07747f1527c
change-id: 20260331-airoha-cpu-idx-out-off-loop-41ea4b99404c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


