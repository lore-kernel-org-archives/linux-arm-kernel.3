Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F410F995C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sx4zp1EdB2uDxCISzytLgCj/xVDSdyBvPkC4Byie1/4=; b=dugEoaiM2h2vo/noL6ysFDf0ue
	XIXyrdPJxzitu/dZujRgNwrtnHeXRUx2LOZ67wzw+ypEHRN8Bh0uADq0cQKsZtjuhV3cla+/zKj/1
	2q1vcj5o886NhO50M2wOMUXyFo6GYvLGibraBt5bxy7DkaRSCl1rM+/jXt+ISJJldrlC1x49jWG/Y
	zg4oOPH983rgWGpEnYQAlHf9++glb0JcMbWUkqVv8aj1XM3Xd48UEE8EbyQOdGIXySinbwgKLECRh
	YM9kWHVcgsPVdXZFs5S3ebHAijSnrHqEHKAZGJlgWv8ys3kNahypGJRTCuoV+9xHItQl/pA1uLlJE
	IHzqKW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAXcm-00000009Fma-15Ov;
	Wed, 08 Apr 2026 18:27:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAXcj-00000009Fm8-2scZ;
	Wed, 08 Apr 2026 18:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 593914020D;
	Wed,  8 Apr 2026 18:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB8DC19421;
	Wed,  8 Apr 2026 18:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775672852;
	bh=CfAlUusSjZ0wcqcNUqCtpQrYzlAuAjxX2Y/xcgidRyc=;
	h=From:Date:Subject:To:Cc:From;
	b=eq9e0skW6NWZp/g+XSib6ls+XMic5D9Gzda3j+pyy8ZN7zOzZp8Z4HWcO5Dn0FW03
	 BSDJAsxmR42QFzQDypqbudDg7SWNjJ/tbJ5+R81I6F0/x4pgJjHkBy2pRG1wo3Ec2h
	 CXVlXiyP1OR1CLdc44F+osZgzmWhKk4H+SoYfJxqLfv8uoJOe9WTY/sXfeaojQozJm
	 EXY9GcToa1JEQC5fNSNho0Rw8pXh7h7m4IXminNsYR1XQv9HTJNRW1rFOkZ7eYxynP
	 k70K4sQhnC9LSROeRTv7uRAbVL0JgAqpM/op3qpV2EvGk2qT1P68JD1MMMrQWjorUw
	 NAo/Nr7xWREAw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Apr 2026 20:26:56 +0200
Subject: [PATCH net] net: airoha: Add missing RX_CPU_IDX() configuration in
 airoha_qdma_cleanup_rx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-airoha-cpu-idx-airoha_qdma_cleanup_rx_queue-v1-1-8efa64844308@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3NWwrDIBCF4a2Eea6QG+llKyXIRE+agdYYrUUI2
 Xul9PHjh3N2igiCSLdqp4CPRFldQXOqyCzsHlBii6mt26HuukaxhHVhZXwqJf+pN/tibZ5gl7w
 OWW8JCQqzxRU9T+fLQGXRB8ySf293cnjTeBxfT2KBToIAAAA=
X-Change-ID: 20260331-airoha-cpu-idx-airoha_qdma_cleanup_rx_queue-efde9e4ab786
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_112733_752078_2B6C18DB 
X-CRM114-Status: UNSURE (   8.90  )
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

When the descriptor index written in REG_RX_CPU_IDX() is equal to the one
stored in REG_RX_DMA_IDX(), the hw will stop since the QDMA RX ring is
empty.
Add missing REG_RX_CPU_IDX() configuration in airoha_qdma_cleanup_rx_queue
routine during QDMA RX ring cleanup.

Fixes: 514aac359987 ("net: airoha: Add missing cleanup bits in airoha_qdma_cleanup_rx_queue()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 91cb63a32d99..919b7009cbe5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -819,6 +819,11 @@ static void airoha_qdma_cleanup_rx_queue(struct airoha_queue *q)
 	}
 
 	q->head = q->tail;
+	/* Set RX_DMA_IDX to RX_CPU_IDX to notify the hw the QDMA RX ring is
+	 * empty.
+	 */
+	airoha_qdma_rmw(qdma, REG_RX_CPU_IDX(qid), RX_RING_CPU_IDX_MASK,
+			FIELD_PREP(RX_RING_CPU_IDX_MASK, q->head));
 	airoha_qdma_rmw(qdma, REG_RX_DMA_IDX(qid), RX_RING_DMA_IDX_MASK,
 			FIELD_PREP(RX_RING_DMA_IDX_MASK, q->tail));
 }

---
base-commit: f821664dde29302e8450aa0597bf1e4c7c5b0a22
change-id: 20260331-airoha-cpu-idx-airoha_qdma_cleanup_rx_queue-efde9e4ab786

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


