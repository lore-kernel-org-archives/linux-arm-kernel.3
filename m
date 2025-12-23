Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40997E748F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vYW293xHQuJz6+4Y84n2DviBhv8RPC2IFpqi18Lt2lE=; b=ylmdfu3+eUbsQGBi+w6/od9DGe
	O4lzY2ynppFTRQcAB18WQd/T+pyJLLu+1JPeWb/YY+LmFObsbpyW4O7+iDG/09QkITm97LEq66Dwq
	hzObOQ/jElGiG25YKxSMc1xGnPjdjcEmUR0uXrUdITjqDri1Yew3w0SrCOwlRCxJ/TmVNTFogYgbP
	KrGbEJFeLNO/yNKDZpOfTA+i0FrvPlV8t0UZMTKL7WYPvXqyXVlz1HonAx2YyXhvQmc0AkT+Njhln
	vpJTIzlBbCeUEmz2akXAAAXsv71DWYdtIxeYKrwC3siQkIeW9PyLDoWEzpVAl2dAweeu/qDPlB9Pg
	EDZTMXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYANW-0000000G7pH-06Oh;
	Tue, 23 Dec 2025 21:57:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYANT-0000000G7ot-2zIY;
	Tue, 23 Dec 2025 21:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F22843E13;
	Tue, 23 Dec 2025 21:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7E2C113D0;
	Tue, 23 Dec 2025 21:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766527030;
	bh=68ngR6r337s4Uq5yOPMzXnBFuiUfzKPli0oTxvM83W0=;
	h=From:Date:Subject:To:Cc:From;
	b=b4QZGC50KfAQ7gYvxY+MWAp22RzTzyQs67qxPcvyZINmf/y593JrBMcKIr9mwpFp4
	 kq5jHqDCVY1ljeblsmZgMHxcaZW6qY/p/Se9ySRO4uMUB6VWwKj/yWKbhKzS+7OgPZ
	 AzTvcFMkCoCGAMci9KltNav+y6hcOkjg/YBr9gxo8xjjV70WWSRtZb1KlK+o8qiXJD
	 s/fLIFy5sXSiPomYSW5iWGczGPYdLGfxSzOafAQU+DxxvOGVEmsWyNMv3cHJF/mfeR
	 YsLP7AaS3x02oqd0VT96zSTd9OR1ktQNoNpDLkhHUJwfjEnqy98b8OfadfRKbKKgxP
	 rPf8psNWtTkWA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 23 Dec 2025 22:56:44 +0100
Subject: [PATCH net] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-airoha-fw-ethtool-v1-1-1dbd1568c585@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvQKaG6SrSwGnMgMjQqiO6et
 HyL/x9IHIUTdMUDkU9JErYMXRYwebstjDJnAykymqhCKzF4i+5CPvwRwoqknalHRVPbjJC7PbK
 T+3/2w/t+3r/+5mMAAAA=
X-Change-ID: 20251223-airoha-fw-ethtool-21f54b02c98b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_135711_800172_D69FDFE9 
X-CRM114-Status: UNSURE (   8.56  )
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

Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order to fix
schedule while atomic issue.

Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 0caabb0c3aa06948e46ad087c50eba5babc81994..2221bafaf7c9fed73dcf8d30ff3b1c5eecc463d4 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1547,13 +1547,16 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 {
 	struct airoha_npu *npu;
 
-	rcu_read_lock();
-	npu = rcu_dereference(eth->npu);
+	mutex_lock(&flow_offload_mutex);
+
+	npu = rcu_replace_pointer(eth->npu, NULL,
+				  lockdep_is_held(&flow_offload_mutex));
 	if (npu) {
 		npu->ops.ppe_deinit(npu);
 		airoha_npu_put(npu);
 	}
-	rcu_read_unlock();
+
+	mutex_unlock(&flow_offload_mutex);
 
 	rhashtable_destroy(&eth->ppe->l2_flows);
 	rhashtable_destroy(&eth->flow_table);

---
base-commit: 7b8e9264f55a9c320f398e337d215e68cca50131
change-id: 20251223-airoha-fw-ethtool-21f54b02c98b

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


