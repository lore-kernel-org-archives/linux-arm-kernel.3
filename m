Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A554CCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ozD35iR9TDRI2lBCUU7LMJnxrdEvxEt00ifZZ7HNWQ=; b=jRIYUafz2HjLXKhPrdkE2lf42q
	hqlPNdfeOpDzaAZC4r9c50goxE3qUiIO9tfkEdw8cQaxS2X9o9cx1Fpn30BYu6GRKq/jcPzLRvGzw
	hrR7TOqHrAOaarxPsVLahk9BJ+BMsqmJmgEGVf7a/DFpdZC8KY5PoyeVyqLSZ3H0lQsU9Uf10AXo8
	LP9x5VLVFznutso0mHofJldq367zIG0GfhLY8EFOVVeTQIbJ7LaPbH2bVYamrlCgDNXhZgEdt9TCL
	r+VhFCxo8K90qrhJUk1oeQR6l/+oysRKkXXlRFN/2g523kXtYZ/+khXktiBsXEc+/UBKcq+z45SQj
	KX6aAYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULJe-0000000CdoD-3F2r;
	Tue, 02 Jun 2026 09:21:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULJd-0000000Cdnx-3jeO;
	Tue, 02 Jun 2026 09:21:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 306DC60098;
	Tue,  2 Jun 2026 09:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BD11F00893;
	Tue,  2 Jun 2026 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780392100;
	bh=2ozD35iR9TDRI2lBCUU7LMJnxrdEvxEt00ifZZ7HNWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SfFGG5nMCwVxiOLBCjmPHMoL5FDCnu5sFBYm/mByxqwCaOHoOwkDHlmL20gLs0c1a
	 3KcLi4KdgfMP4nawnHXwZ+875HnvLoX9cHBxgbkW9lLFq3XtYMoaexLTwzQo/Yvmwn
	 ROXi2CmhAvcahwq8E4Uk27BPm4LjXXn/DxGYj/Bmk+Hub7n9Nw46WZxa+kKmku1BCs
	 I1RaPoHf/QD1YTdbfhMw/WFYoAWLRKTPAKujB4fW2mgqTNuMw3sO6i7/D7GspKFcb6
	 SnwZ0S5/c/bWeDa2wDkdAZmUJfOZEG/VwI9sllmnD6+tCRNyzAs4WWV/rxgstXpwFI
	 nm8cVvjexWyJQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Jun 2026 11:21:04 +0200
Subject: [PATCH net 1/2] net: airoha: Fix use-after-free in metadata dst
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-airoha-mtk-metadata-uaf-fix-v1-1-3aaa99d83351@kernel.org>
References: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
In-Reply-To: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Florian Westphal <fw@strlen.de>, linux-arm-kernel@lists.infradead.org, 
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

airoha_metadata_dst_free() runs metadata_dst_free() which frees the
metadata_dst with kfree() immediately, bypassing the RCU grace period.
In the RX path, skb_dst_set_noref() sets a non-refcounted pointer from
the skb to the metadata_dst. This function requires RCU read-side
protection and the dst must remain valid until all RCU readers complete.
Since metadata_dst_free() calls kfree() directly, an use-after-free can
occur if any skb still holds a noref pointer to the dst when the driver
tears it down.
Replace metadata_dst_free() with dst_release() which properly goes
through the refcount path: when the refcount drops to zero, it schedules
the actual free via call_rcu_hurry(), ensuring all RCU readers have
completed before the memory is freed.

Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index cecd66251dba..eab6a98d62b9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2936,7 +2936,7 @@ static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
 		if (!port->dsa_meta[i])
 			continue;
 
-		metadata_dst_free(port->dsa_meta[i]);
+		dst_release(&port->dsa_meta[i]->dst);
 	}
 }
 

-- 
2.54.0


