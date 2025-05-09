Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A29C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9T8T/ReTxgwbEq7ya1SQEkDgr2GKZ+FCDb4DaJFUwk=; b=MU9mjWncCx0Bfmw6ujgdjmrofh
	PIq1sGOdytasoPSr4AEgvT/bG+FlBZKb2jyy2H7z4DmcBPtZJbJ8gr30chxadqhcViUYgvVO/MPo2
	YxEM3GtfTRjPX4jhFqdojwS66snI2YBuJPyhXzj6/gvyq38GZ+Z6/yoLUz9NC3Rk4bDbg8hS6MiKz
	id1akai6IDos34KmSrYUJXe7J9UpdXdQYBMhXjZ11vwBYMuZAINZ1EDQpJtNPJ6nAFw/+609hM6Gk
	gcRQXXWm2TUYap64zbkB/Rnc5fTKWafBBoiD/kfg7B0umYuaOMQwYXBY73mR1EjmDJBgJAhX9g394
	f9aUH2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM9s-00000003T3I-3qyU;
	Fri, 09 May 2025 11:44:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLGy-00000003L4F-3aMk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:48:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso170278f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746787687; x=1747392487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9T8T/ReTxgwbEq7ya1SQEkDgr2GKZ+FCDb4DaJFUwk=;
        b=Vua53vD6TeVf332kX9HHmeNeRNd9X2FdYuBLq5v12EfuufW4bvoAd0vH5i4VCmY6Qy
         jTiowQ48GaaCnonkjKzin7myoGV0wcWt8amx1uf0zjk9AJKwsCfe4MJ1PssuuNOkTsbG
         ugvteCxego/pM3QgXuNJ40uAO+ZuSQrTbPyvkpbtGHWy4Nd80AOLtbMy+HupKrxYmv8i
         r9VwAukKZGnlNhHHwxw2qaksVUMsa4PRJLih+0pLC30hcLDgGE5sfXl4BdzFqoCXaRhQ
         TSf/rQDpLU1NQq9UvGwnsBSve9E0yenZFGVlpVnHraT1yua/Nktgwm/NNN/lJdMH7jVY
         IKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787687; x=1747392487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9T8T/ReTxgwbEq7ya1SQEkDgr2GKZ+FCDb4DaJFUwk=;
        b=fkaJ1GLrNRhyPvaT5EG7LXfOTPtBQBpznPQA0iCTLzzH5wCXV6lFxqGtp3OVqWzccd
         jPRkCGkhXcZ3HowA1saD/vCfMZyFaAPQGv3JA7H4cLzqoR40yuNXexKhZe0Fz9f5Mjr1
         Rl5WVt2Ee6t1ISydZh/Ch44V2w6gaTUaqKL8Y35GUXGBj6h1t0dxF9ECm0VnbhnlPvr6
         PufpvRCEMssQCyMJuYLuo3BXxTrWQbmGDbNDDeYvyLHdnT8zp/w6xM2GuEEeh0KeuGMc
         CxYaYKcvOc8CHgiBPdrr50qMEB4idi5x4nHC4iNyOLr/KM/MWWALG/4nY5kzT5MKb/+s
         n/6A==
X-Forwarded-Encrypted: i=1; AJvYcCXCzTVG5CM6nqO27zGYOhm37QXRBUUuwEHax2GADIi7Q+GWF1f6lJcvYCyRuvaTQAfdx6TU8fVCNDY2ApapnHpu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4qW62Tr2/HtbPD6AwugmdcyULX52HqRiuEuMfO9xxrM+aACiE
	lT9trvvyr2p0CAAaVqAMVBiY2jPzAxHOGwYHNOheWuVQBN8pLlMY
X-Gm-Gg: ASbGnct2zi8pI17egDP8MtalEKzDIZcBSRpjItDjs/GHzlgSgqiqUg5/gT0y/0AZEKC
	UicPflOG6KEUeNl0aIEWzfko4+I4Haj//7SFj0e4wtWzkKclJuhsVuLo2hdiNVBdvQCtP1Ed3pG
	V10s15x+lojoIXwSOf+tO5Yec6MaK0sUSkYaMaAw4tidcCHZieRjtkdizAMYx8ErAzO5l/cROqJ
	6f6S7Ym0Jmv9GyKlZD2IrfUSDgtLW3CpAoHU6P5+VE0xIWCN549mK6E7Hns0eN0tp7YqUlQntkY
	Qfh8UqYuJjAcVUnozFUDYkOSKu1Yls6FSk6BCMDJ5MvPlwyjlHxiqt/DjHAw8lyXnQ==
X-Google-Smtp-Source: AGHT+IFtAH91VP8QSNCEvYfohxbRfIAX3co/acDz06MBIE/Bypsf/wab4pdtNVbPUS+FToPQSe8O6Q==
X-Received: by 2002:a05:6000:250e:b0:3a0:8295:9e0f with SMTP id ffacd0b85a97d-3a1f64a42bdmr2186936f8f.54.1746787686982;
        Fri, 09 May 2025 03:48:06 -0700 (PDT)
Received: from localhost.localdomain ([213.74.214.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd5esm2843779f8f.6.2025.05.09.03.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:48:06 -0700 (PDT)
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
	Can Ayberk DEMIR <ayberkdemir@gmail.com>
Subject: [PATCH net v3] net: axienet: safely drop oversized RX frames
Date: Fri,  9 May 2025 13:47:55 +0300
Message-Id: <20250509104755.46464-1-ayberkdemir@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250509063727.35560-1-ayberkdemir@gmail.com>
References: <20250509063727.35560-1-ayberkdemir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_034808_893964_18DF01D2 
X-CRM114-Status: GOOD (  16.82  )
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

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")

This bug was discovered during testing on a Kria K26 platform. When an
oversized frame is received and `skb_put()` is called without checking
the tailroom, the following kernel panic occurs:

  skb_panic+0x58/0x5c
  skb_put+0x90/0xb0
  axienet_rx_poll+0x130/0x4ec
  ...
  Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt

Signed-off-by: Can Ayberk DEMIR <ayberkdemir@gmail.com>
---
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


