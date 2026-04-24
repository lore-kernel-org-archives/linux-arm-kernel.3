Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0CFFE51ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5x8FNhQJX4eNbrnx+ErU8g8xHvVwy6ZaWN4nLbS1gmU=; b=3WnC6DAKAZvo23CDG2lSNxBqGp
	rule8TxkXqz5gvJryaGZRafe1l+oMZP79nDsuhxVx6MD1WNdL1kaCban34w4gBbsvfcxB1DNq9pno
	GqbI/P8zGxvwFipqPaio4tFVjWA+gaUaL0rlQnuJ+lj/c0t5EIKlxJLYfP382dRPB+JKTjOdioLQR
	Ams2Wf8IuyIqdqohN3y1M5u9Fp1WKbBePbtfnayfYnWRqYTGkH/kWiXJ3moT3Z2AXn0bq9Ok9qq2n
	c5JQxuq+zbLQSMbANCbzmC670TnrRtDkv1WkRg0+0A4CNQ5KLGwGv++HLg9hfCX9Mwb6Sh/EfnLFX
	sA+LHXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCPM-0000000Cubu-3WVg;
	Fri, 24 Apr 2026 09:01:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCPL-0000000Cubj-2RtY;
	Fri, 24 Apr 2026 09:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=5x8FNhQJX4eNbrnx+ErU8g8xHvVwy6ZaWN4nLbS1gmU=; b=JMzzefrsneOI1ydvmBTfcmjeEU
	AqXfzzQU3QNqdX6Zt84SZ0boyk8JSjaf79TaBPsFY7hBIH7p9XJcAS4PAyTo8Co7tdpwkSiKpqBiz
	zfsj0QgPvIsMAgsb5+lZ2wB86vRPfUSOviMTj8OSrwWljIX7XJLGwVFUCNp/W57/bQT4aBux2Fof8
	cdWTwGTCtTJZXDRFUl24oKsTiAdY5QqljfdF5IdTtbmPImFv8o3HqSGBCSxrDxN3d/BQsANMuYhZW
	T1KIUnYy4rPw42qTKmxefGOaymKQS02aExKWVsmBUNlHnRY7OlODNcPOptP/X/GHXUdvQHT64yYun
	nDldvSTA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCPE-0000000ES74-47BE;
	Fri, 24 Apr 2026 09:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF94643B50;
	Fri, 24 Apr 2026 09:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B754C19425;
	Fri, 24 Apr 2026 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777021256;
	bh=ZeT44hZbko3HmfUaBLlU+YH/qX5dhh/ai7xlsyQJ2M8=;
	h=From:Date:Subject:To:Cc:From;
	b=BOhnEJn321yXt4NlYDKi7j/HRsmSFMMl195mebaqniXdXXhlOnE/JNkt7/yR0EtEK
	 aQbxw/LUMcMlq8STkoKVvkn1cgjkZMxmqc4ZDozEoELmAgWEn6Pc/bbE+9eYS8smbe
	 gWznnuSnii7GzScGx5HhuezXmv+8gPWfOQ1ufPBIxMk7cS8bajrYQBLw/puRa9ar14
	 D53WSFzsuFhA5bE/+NjlbY9BGDby3HRt3ZJSbrPAOry+m+NWaLGuda46v2g76gl0r9
	 12sxbVZ3YR/7ta/5QJ0+brIkbgVuXCLEsLX7JZ8/BNMPJ/fGMiJehCm5ffEvui6eCV
	 zGO0fMYn/GLOQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 24 Apr 2026 11:00:28 +0200
Subject: [PATCH net] net: airoha: Do not read uninitialized fragment
 address in airoha_dev_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MMQqAMAwAvyKZDdQqDn5FHGKb1gxWSUWE4t8tj
 gd3VyCzCmeYmgLKt2Q5UoWubcBtlCKj+MpgjR3NYHsk0WMjfHa5MMiDyuQxKEX0biQypnM0rFD
 7U7kK/3uGxBcs7/sBGe14GHAAAAA=
X-Change-ID: 20260423-airoha-xmit-fix-read-frag-dc6aa001ca4b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_100101_477521_816F10BF 
X-CRM114-Status: GOOD (  11.92  )
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

The transmit loop in airoha_dev_xmit() reads fragment address and length
during its final iteration, when the loop index equals
skb_shinfo(skb)->nr_frags, at which point the fragment data is
uninitialized. While these values are never consumed, the read itself is
unsafe and may trigger a page fault. Fix this by avoiding the fragment
read on the last iteration.
Additionally, move the skb pointer from the first to the last used packet
descriptor, so that airoha_qdma_tx_napi_poll() defers freeing the skb
until the final descriptor is processed.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2bb0a3ff9810..d3a841908c82 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1997,8 +1997,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	struct netdev_queue *txq;
 	struct airoha_queue *q;
 	LIST_HEAD(tx_list);
+	int i = 0, qid;
 	void *data;
-	int i, qid;
 	u16 index;
 	u8 fport;
 
@@ -2057,7 +2057,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 			     list);
 	index = e - q->entry;
 
-	for (i = 0; i < nr_frags; i++) {
+	while (true) {
 		struct airoha_qdma_desc *desc = &q->desc[index];
 		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 		dma_addr_t addr;
@@ -2069,7 +2069,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 			goto error_unmap;
 
 		list_move_tail(&e->list, &tx_list);
-		e->skb = i ? NULL : skb;
+		e->skb = i == nr_frags - 1 ? skb : NULL;
 		e->dma_addr = addr;
 		e->dma_len = len;
 
@@ -2088,6 +2088,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		WRITE_ONCE(desc->msg1, cpu_to_le32(msg1));
 		WRITE_ONCE(desc->msg2, cpu_to_le32(0xffff));
 
+		if (++i == nr_frags)
+			break;
+
 		data = skb_frag_address(frag);
 		len = skb_frag_size(frag);
 	}

---
base-commit: e728258debd553c95d2e70f9cd97c9fde27c7130
change-id: 20260423-airoha-xmit-fix-read-frag-dc6aa001ca4b

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


