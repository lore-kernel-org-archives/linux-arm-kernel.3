Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1E4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHrOgEgzQLtXqfjmHDjsKinl4MI7A2M2jyU12+oKmNw=; b=mosCHO1E7q74xIKP/UuJPlfJjW
	yY+gxJ7Ria58dka3pqprqgz6Y5U3nInZvc/SuGGmjy3y4CgilZ6zhqh9CAh/vh9Yl4Lem0bgyI229
	SSJSK/WiZW+g2ju4lkNKlg9Hq1iFiJzwwDyGCSz/ugFn/3nRe+nu2kdmOErpMT82+6fqIUnl3XL61
	IQ/iPaqAdcYucR9DtQaSJKFgUwuhh2Py+6o95EiWG11CICm7Y7g3pNfoNRFPRYbRxXT5bwA9TgyHo
	5+B1MZCStcU0LN8CCzW/miVcbVQX+1t58QVb98RtSl4NeBBJH4QxdJZazlmAp1FivLCSIpBuYdyin
	wLHnluBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrnV-00000009d4T-3uyT;
	Mon, 03 Nov 2025 10:28:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrnS-00000009d1h-4C4d;
	Mon, 03 Nov 2025 10:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB06240851;
	Mon,  3 Nov 2025 10:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33422C4CEF8;
	Mon,  3 Nov 2025 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165702;
	bh=R6HeLI7JDCTVZupquML/vCC+pYaZ4S+yt8pXUQACxto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JMBbxG/JFgkLStq6fa/BiyXiO80VoBi0IRsp5hFdV4bD/jmiAOs/xvHFFRH+hTQAS
	 0XRYH9LPnap6RvzNJp9cFYDkM9VTqIMSUOMcF3Yq357jKRJaMfI81HGOFtKJUIA0W/
	 +JkUwtYjIvridOy0V95he6RZCzT9IE5aTqtPJT0KR3Zn/JOMQtXHS5J47RndaxmkVr
	 wTiAX99PqI4r40+Fh8sggDUoW4HKMObmjgV15WT8dJjBL7LVfPp/gN0jTMAuqneOo+
	 UkObvOY7iRU4UhdCqPUoAJKIzYK4pAMvlaEQsgJz3CTjNMhvNXQxPfNRhctwWDONjS
	 9u0t3+g8qUX8Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 03 Nov 2025 11:27:56 +0100
Subject: [PATCH net-next 2/2] net: airoha: Reorganize airoha_queue struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-airoha-tx-linked-list-v1-2-baa07982cc30@kernel.org>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
In-Reply-To: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_022823_066105_0DC1959E 
X-CRM114-Status: UNSURE (   9.82  )
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

Do not allocate memory for rx-only fields for hw tx queues and for tx-only
fields for hw rx queues.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbbc58133364baefafed30299ca0626c686b668e..750dd3e5dfecb5d3d0ff754f6a92ffa000db3343 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -185,19 +185,27 @@ struct airoha_queue {
 	spinlock_t lock;
 	struct airoha_queue_entry *entry;
 	struct airoha_qdma_desc *desc;
-	u16 head;
-	u16 tail;
 
 	int queued;
 	int ndesc;
-	int free_thr;
-	int buf_size;
 
 	struct napi_struct napi;
-	struct page_pool *page_pool;
-	struct sk_buff *skb;
 
-	struct list_head tx_list;
+	union {
+		struct { /* rx */
+			u16 head;
+			u16 tail;
+			int buf_size;
+
+			struct page_pool *page_pool;
+			struct sk_buff *skb;
+		};
+
+		struct { /* tx */
+			struct list_head tx_list;
+			int free_thr;
+		};
+	};
 };
 
 struct airoha_tx_irq_queue {

-- 
2.51.1


