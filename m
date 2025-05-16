Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F51C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtu7zpoEhIazPVBR9VLrQ2O+ovOuUIuW+9nEGJrTJjc=; b=xJ0KO3rVonZ7j+DmjtudCeCfcc
	H2HJmFq/cOuD4PdxTgUVq/bsWUn7fxVuq6bT/F0XVpVUMsSWtnp2MbDUiZXBdgjM+Och4fCDWJ1Sp
	6U3wu9rb2WpVeCJ9Gs4Jg5Nyz/UvZFAHXCC3zghe77RFyl3wjsRmVh1vJgJbJENuV3rkyCG+yEI17
	32ts6HBvSy63Of1mxaLvSkRcpNQrIif4vn2l5Vq8Wvi9dnqRY1IoKnVpbAkKvsa5tgOIJmn/iBaOL
	i7aOpUy+vpP0DxbeFWUuu9z+DRQAryLuH90EdwsRqzHI7KrhhacIVWozuKFQW4WkAT1nYJnVcsU0Y
	8ihJJe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqhm-00000002u49-0PQ3;
	Fri, 16 May 2025 08:46:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqfi-00000002tbc-0XU0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:44:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442ea341570so11747925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747385040; x=1747989840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtu7zpoEhIazPVBR9VLrQ2O+ovOuUIuW+9nEGJrTJjc=;
        b=m4QUWPsqRdqVk+pJ91amGUH6qT4b2OgQEmkDE0Rjp2AAyITlYcL94upaVjjmutJGfj
         jyP8MQZkVOzdGwo7i8GIy57c34NPDbyMIXI/UF6ZxdxvM65YrZp8ohqIM4TsTNjyM60b
         Hr7ofozCaUmeACjr6q+IAl1Wr/NDPBonYObOy8sMdoSCf0d0ZrEd/VVIC5zQxlvBJmSF
         Ef21KAp0GFoCwC8drJ0cYv8yg8x3KeppxcWyU+31ATYEIA4+xvGiUNO1HUCi0c+dStv+
         xs0QPTZM0RLIsd/otva1zP/yESsAFLXL3KtMFpP1ZE4iyxT5aeSduWLhMCfeLvTZMghW
         OKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385040; x=1747989840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtu7zpoEhIazPVBR9VLrQ2O+ovOuUIuW+9nEGJrTJjc=;
        b=woBuIyApmAx/ZIoHqUz4h5ir7bUwhPLnJdactnMgTPHZqITtpD/3ElLwN99mctn7UD
         LqJWdbWcBZOa9hAybZb25Pym3Y02Wa1n+zN7lFHVf7WCKIcevJYcixHAqTLLh2vbm7NO
         LZ0ocixfjwlJBETCp+C9wLtA2H1PyjZ+gHy750D0atPqIe6EBvp/ycWJK9NBuPTIUHyr
         fbgS5WPEGk+J3dYNY7o6BAqkbV0UpqBe29nZXFWUd9XIOIuMT2G1TeY4uQ7QNtf/UAt0
         R4bSCW8hYBn4gwoUsyR94saugy6ugIZ9bJuEt/I0B/WTojA0tyGVegHMKHkEJAejwu/r
         jZAA==
X-Forwarded-Encrypted: i=1; AJvYcCWmb1TWgp4igQXqFB85Xlvlz00zCMUVSrg0aJfLUOMPmbdPUxny+uLWvd28fR5hQJBcSBzAEpbKlA2JbMUaNKmv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9IkYW3LAENZoakunGKdFpQ+Bb4hBqf5UGv+nIdh5DY+uvu6Zu
	sPkDApo6nk3Y9b+immyS/kKxxcmwkLTSp0IbsWiMi5WgYT1tar6pWsmK
X-Gm-Gg: ASbGncurwFLYN+cRS6JKuqEyXfVlXWy5BUi1w9fsHJtE1oFC5+G0bDbpAwe9sO/K9eE
	RLf03YNqrff+FusL/MloF4sH//5PnFPlzuQimeaF1N6k9raFh308X4GoKnW0uHRuy0OMNkBa9jC
	qbuKc3FUi1/8fKXuj4m1nVxqMRfJK6qrilsZiLZZBLEc/n2YVO9rFeomaigf4e579j/ZyRqnIkZ
	JHmNbl5v8fDLWMyozT9hcWRMPN6dcLWdVFXpAFj+IFH/aU6oXgRw3eJIKONVwT6VDNv/CMFKnd2
	XeRhGcPhZqSbN6q4HxTRvi2QiQ6vyzDW7col6mUV5ZI1JeyZz+dQussR6A5nGHNIhCntKRqt+1S
	4
X-Google-Smtp-Source: AGHT+IEYZb/TzXzZVFqdhqGt3K1l/2137LORafBeymggFrs92Lp+L3YIGu5RsSNqD4chBhDRXMQG/Q==
X-Received: by 2002:a05:600c:821b:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-442ff03c671mr12712175e9.32.1747385039900;
        Fri, 16 May 2025 01:43:59 -0700 (PDT)
Received: from localhost.localdomain ([213.74.214.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50ee03sm25352005e9.14.2025.05.16.01.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:43:59 -0700 (PDT)
From: Can Ayberk Demir <ayberkdemir@gmail.com>
To: netdev@vger.kernel.org
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Can Ayberk DEMIR <ayberkdemir@gmail.com>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: [PATCH net v4] net: axienet: safely drop oversized RX frames
Date: Fri, 16 May 2025 11:43:34 +0300
Message-Id: <20250516084334.2463-1-ayberkdemir@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250509104755.46464-1-ayberkdemir@gmail.com>
References: <20250509104755.46464-1-ayberkdemir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_014402_173138_E54E0DB7 
X-CRM114-Status: GOOD (  16.98  )
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

From: Can Ayberk DEMIR <ayberkdemir@gmail.com>

In AXI Ethernet (axienet) driver, receiving an Ethernet frame larger
than the allocated skb buffer may cause memory corruption or kernel panic,
especially when the interface MTU is small and a jumbo frame is received.

This bug was discovered during testing on a Kria K26 platform. When an
oversized frame is received and `skb_put()` is called without checking
the tailroom, the following kernel panic occurs:

  skb_panic+0x58/0x5c
  skb_put+0x90/0xb0
  axienet_rx_poll+0x130/0x4ec
  ...
  Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")

Signed-off-by: Can Ayberk DEMIR <ayberkdemir@gmail.com>
Tested-by: Suraj Gupta <suraj.gupta2@amd.com>
---
Changes in v4:
- Moved Fixes: tag before SOB as requested
- Added Tested-by tag from Suraj Gupta

Changes in v3:
- Fixed 'ndev' undeclared error → replaced with 'lp->ndev'
- Added rx_dropped++ for statistics
- Added Fixes: tag

Changes in v2:
- This patch addresses style issues pointed out in v1.
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 47 +++++++++++--------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1b7a653c1f4e..7a12132e2b7c 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1223,28 +1223,37 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
 			dma_unmap_single(lp->dev, phys, lp->max_frm_size,
 					 DMA_FROM_DEVICE);
 
-			skb_put(skb, length);
-			skb->protocol = eth_type_trans(skb, lp->ndev);
-			/*skb_checksum_none_assert(skb);*/
-			skb->ip_summed = CHECKSUM_NONE;
-
-			/* if we're doing Rx csum offload, set it up */
-			if (lp->features & XAE_FEATURE_FULL_RX_CSUM) {
-				csumstatus = (cur_p->app2 &
-					      XAE_FULL_CSUM_STATUS_MASK) >> 3;
-				if (csumstatus == XAE_IP_TCP_CSUM_VALIDATED ||
-				    csumstatus == XAE_IP_UDP_CSUM_VALIDATED) {
-					skb->ip_summed = CHECKSUM_UNNECESSARY;
+			if (unlikely(length > skb_tailroom(skb))) {
+				netdev_warn(lp->ndev,
+					    "Dropping oversized RX frame (len=%u, tailroom=%u)\n",
+					    length, skb_tailroom(skb));
+				dev_kfree_skb(skb);
+				lp->ndev->stats.rx_dropped++;
+				skb = NULL;
+			} else {
+				skb_put(skb, length);
+				skb->protocol = eth_type_trans(skb, lp->ndev);
+				/*skb_checksum_none_assert(skb);*/
+				skb->ip_summed = CHECKSUM_NONE;
+
+				/* if we're doing Rx csum offload, set it up */
+				if (lp->features & XAE_FEATURE_FULL_RX_CSUM) {
+					csumstatus = (cur_p->app2 &
+							XAE_FULL_CSUM_STATUS_MASK) >> 3;
+					if (csumstatus == XAE_IP_TCP_CSUM_VALIDATED ||
+					    csumstatus == XAE_IP_UDP_CSUM_VALIDATED) {
+						skb->ip_summed = CHECKSUM_UNNECESSARY;
+					}
+				} else if (lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) {
+					skb->csum = be32_to_cpu(cur_p->app3 & 0xFFFF);
+					skb->ip_summed = CHECKSUM_COMPLETE;
 				}
-			} else if (lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) {
-				skb->csum = be32_to_cpu(cur_p->app3 & 0xFFFF);
-				skb->ip_summed = CHECKSUM_COMPLETE;
-			}
 
-			napi_gro_receive(napi, skb);
+				napi_gro_receive(napi, skb);
 
-			size += length;
-			packets++;
+				size += length;
+				packets++;
+			}
 		}
 
 		new_skb = napi_alloc_skb(napi, lp->max_frm_size);
-- 
2.39.5 (Apple Git-154)


