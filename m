Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73689106B52A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1+00FPqAZdZFOBnToh7PSc/BbUeRaxTEXoOHmtGunL0=; b=SnHvFbo5yhf5zA8sAANZH9np5c
	aGGKIr6nYD0rWQgRUKw5D20Gc/jliFoiuHai0EykD873cCPiqZQFVl0XCI1kiEQMjGwlLCINrXxg9
	+3xsQkEjDB5ezHBx0CWbDeTFUixBcxG0cPMGHUTbdcHTqJi5GpZ4Z36Xw8mkSRRq7SLEKJIsyJVMX
	BMSHNuV7H3c+COOtzr1NxbgId7Z8//sBL5L5icKQzaIfj3TkjtgtXkS0kZ5MMzeFOse36A5+XEJ15
	xmdKTAtozPPNjuTvEdSbxHKgFnM4sV4xIgn25Q1xzEfn1J/6pjkmAHZVuONemebKikIw1+VmKgKhy
	yljaBFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Nhy-00000003PUr-2Zdf;
	Wed, 25 Mar 2026 12:51:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Nhw-00000003PUT-2aAk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:51:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4730306f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443094; x=1775047894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+00FPqAZdZFOBnToh7PSc/BbUeRaxTEXoOHmtGunL0=;
        b=QDaL+BNZAq/pB0LhSqwbQKxlX892t8T+219pR6LuQnSiNSJkxuaY4iuZf4VZKFUE5P
         lBxyUqpDYJx0QVhUoYDwrT0jf/qJCuk1fNd7iZ0jo2ux+PbD6UNgTd4K86JMA01EonyW
         pLIaE1ZlExiIBsfVOfmLGOP6XpW0wBuPj3Tl2zwHrdBIbeioZgwePf1ZbSUrYisAgkQW
         2EoM+OfYoDjqPZYKye+j6mtRRbhh9B9RhZOJufzwICymThOVvLguvVFgaHlWoF9e2yxP
         hr4zGPZMRXoHAglbLpTMLnjb3u/9pydJbFWUaWPZmQ6F43Xcjn+FzKv9fIc1H7svxzsS
         xS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443094; x=1775047894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+00FPqAZdZFOBnToh7PSc/BbUeRaxTEXoOHmtGunL0=;
        b=kh05Al0y/GTjcutNQOsR+LmSyaC2UVQ0S2sVS/8TOjpbbTTVoXv8yrOcFx774mFGQl
         il9Y7YOI74hW2RnlL8iRK+EY+5PvG4zVluvDkH+UX0v/39kSJLn4jFjrA+yfMBdLDqjZ
         GwnSTwT2HYQSuCk3Xehjd7MqsF3dGU/k6lgpG0SJYLTSxEI4sfkabyF2i3BLxaWaK2/R
         La78YB9FrJtFfEGWfzGOMaKS+D1K6K5Dyr1echmvvLqqF+cHSMdBjC11GJ7RpHUGBsYF
         KCie/u/g1yAZWyvbKpkx32xNCYzLLGNCx2MuTRveKOufGhqVuXpjSvb+NBYNA7ppTqe4
         x/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7e3An+aXksdd3/OrP/ngh3ObxsBoE7VfMw1hM/J2mo8LsTxAsoHRwL2WKvds1nQnuBv254iMuY13sO79R4ZGx@lists.infradead.org
X-Gm-Message-State: AOJu0YzUEVFZtG6RLmRqayjR9JPgnwEUmB+Y/iShPqnV5czfPb5lbTs2
	m7OgNF5o0HxECrvwx0ZSBkat0AVGZcamStROgAuAYFGF7PG5KgY3meGn
X-Gm-Gg: ATEYQzwDbfn3MmlH+ZA8FxiI2Ku26DGQAVaUoeW7rXSdy8n+J/apAQcOnT7maqcq358
	DvzshRmR9q6Pn113clI+pgUIYxbRgyGlx5gImfRe7UGXCBNhWUFUXQL1O2BW7VG12t0suXOl77H
	BRZhVwAU8dyFJ9aRVB7eOjEn/GmEcu69p/cm08J+3FWlvVFdhWdyQVSPJO3lZ3ZpCMfqgMAFXWV
	lYF0splHu+xaf/bBgZFKKyViXiBPJ7Q3PLPhRzrVKTQ0T/3e4JHwd0FmKPU4x/vMkdRPerizZlY
	gNALTV6ueKgI7auB9a+e+gM9Ny1U1pw7nOIQ7h8U3c/YgCDUOoAZxhOfP5n913d0Cp42FkASOzi
	gPqAXzWOI0eUfRbjRqlhlXvjEj6xSM0EbjNvHS74WlCrLJFTBCjxmfoTXjtUhEAh0E9aC8FZZ8R
	cnVvB6MIUTDw6XXQZ1WeosET9OWTPGPliI2j+hj9YSFquRXGirwmQdsGfefeG0fsMfsJPzDi+L/
	jS2ivcZbnJa
X-Received: by 2002:a5d:5d07:0:b0:43b:4ec7:f924 with SMTP id ffacd0b85a97d-43b88a05423mr4922876f8f.34.1774443093930;
        Wed, 25 Mar 2026 05:51:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b90f170dfsm543125f8f.5.2026.03.25.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:51:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: m-malladi@ti.com,
	jacob.e.keller@intel.com,
	horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] net: ti: icssg-prueth: fix missing data copy and wrong recycle in ZC RX dispatch
Date: Wed, 25 Mar 2026 12:51:30 +0000
Message-ID: <20260325125131.53399-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_055136_670571_F178BB96 
X-CRM114-Status: GOOD (  14.42  )
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

emac_dispatch_skb_zc() allocates a new skb via napi_alloc_skb() but
never copies the packet data from the XDP buffer into it. The skb is
passed up the stack containing uninitialized heap memory instead of
the actual received packet, leaking kernel heap contents to userspace.

Copy the received packet data from the XDP buffer into the skb using
skb_copy_to_linear_data().

Additionally, remove the skb_mark_for_recycle() call since the skb is
backed by the NAPI page frag allocator, not page_pool. Marking a
non-page_pool skb for recycle causes the free path to return pages to
a page_pool that does not own them, corrupting page_pool state.

The non-ZC path (emac_rx_packet) does not have these issues because it
uses napi_build_skb() to wrap the existing page_pool page directly,
requiring no copy, and correctly marks for recycle since the page comes
from page_pool_dev_alloc_pages().

Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index fd4e7622f123..a28a608f9bf4 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -902,6 +902,7 @@ static void emac_dispatch_skb_zc(struct prueth_emac *emac, struct xdp_buff *xdp,
 
 	skb_reserve(skb, headroom);
 	skb_put(skb, pkt_len);
+	skb_copy_to_linear_data(skb, xdp->data, pkt_len);
 	skb->dev = ndev;
 
 	/* RX HW timestamp */
@@ -912,7 +913,6 @@ static void emac_dispatch_skb_zc(struct prueth_emac *emac, struct xdp_buff *xdp,
 		skb->offload_fwd_mark = emac->offload_fwd_mark;
 	skb->protocol = eth_type_trans(skb, ndev);
 
-	skb_mark_for_recycle(skb);
 	napi_gro_receive(&emac->napi_rx, skb);
 	ndev->stats.rx_bytes += pkt_len;
 	ndev->stats.rx_packets++;
-- 
2.53.0


