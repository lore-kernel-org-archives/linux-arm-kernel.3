Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F8EC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FpvcT+h5EwgFmmmOYWFbj4igRatQjVb1OnlSMKQiQvU=; b=n9hPYQ5VNMS/O5iZ6Cx487cteg
	qCr6mVMN4CBYmd+OA+HV4hFtNiauI2PnE2E0yoBe6eDI2TxJ2kuJCYNw71G7Yt47jdFyGBxy9eiEZ
	3ZgjQL5FZjcfSYGxoHcMxFtYBTOAv/2/GgoAHM/cMjoHlmnALnaEibXGhy27bzaUAVnjYOjzcq+pz
	d4A8rAduf37elz/WMVDryq1GH7E1XbuC6osqbnioH1bMf6LKIxHCQlYa5TqKjboEZaNdsmMtEpsib
	IB0hr7YSMk3cV4myfvhZd2cnjlVSB38/BYh10c2EqBpJzrl7sb7CvTvc1KS1q9JxDJMK5t9gHA4Yq
	1XKqLG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3k3-00000001EMa-2Zn3;
	Thu, 08 May 2025 16:04:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2np-000000012hA-04AF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:04:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so1016875f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746716687; x=1747321487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpvcT+h5EwgFmmmOYWFbj4igRatQjVb1OnlSMKQiQvU=;
        b=PmAdXHJseI+8Rmib9/zHO/2iq6XATzob4AjORf32kqTIxbhaNqfiZujlU/9VmDQZHZ
         ZukspGu1iVyGGLIoYzUrl/4YaFVpfr5LRY5aM+G4oa2pe1ZjDAPU0A37oGCPt31zKn4t
         8KR0UhksdSeRsZl9R1CfbrnGxp2uGBjolktSu5cq534q8Yohb84Npg6Hs7BGlbRWelyM
         pWJQXUFP9Vv8VkFBOshrpjC47yKDvc/m7dWhQRdVUJQbZtah2Y8rorQwP4abnQJv1leC
         raTm2NN9UMXdhYEWVrHwsQX9JoczkIzg73i0oybUPatyBmdoTXCDjdPskU7D0S+aNmRQ
         wHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716687; x=1747321487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpvcT+h5EwgFmmmOYWFbj4igRatQjVb1OnlSMKQiQvU=;
        b=DHSBPR2OlQxfga2w0RGu7ZSe8IIyoIRaEn04NDZoOJhJbLb2XOCFgy5RKaZVUm5xGx
         5/fr+Ax3EdbT/pJ7LDT61yUZvj0MVUSOpyR/Pl36hTDFX0HAQ0pgquthB5eQu2WBz+/H
         kVyHR0JDUla5gqT3i9FGZl35+w8qgiAVlFTN9jnZsMTESQq6wXhltwnABQnJgF8PEOfC
         U3nlFRkgZXCYDwueAGEC9jaK2LBS0XgtnOQGc8jlOXen4nLmLzbLZjKFvO8HIDYaBOsh
         FfDUv+7mEJ2EHNSyJ4yjSxJAbq9CrwDV/Rpw12a/XEbMqa4vdoSVYY/VVOba/u6XOU9Q
         Q3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUyGH47F5iBVDbowDi4acie4FgtAfR1gJWeDbyZciUYyOnKy8kLh1SbuGiFSt7QGSt8D/P+8VlxaqKBC1Fiqer4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/gLgD39SUGdE306d5Sg5PFFz6vkEpUAprP4epennR1zMrtXdc
	okM2jWMoAApKKXAoCM4J9YrR91f/oSsUIkHssKVyQUMN+OvnfcFdpLNkKC67
X-Gm-Gg: ASbGncvO4jy6QrXCmtr01kUPDePjhVtgpuUXfSqPD8WfKbWU6x5heutU8u5kZXeCjUQ
	h4jMYKFiFs+NkLjZ/JaU2KUgz6uPTE40fQmvjYt5aqbcXD5Ewm59QqxwRlSCNVHQ5BsBMNm+Zkl
	ndX9c8IqnuWAltPybCLhSd61/RA9uKvMX1rthH3qhd5JWty3UbVnSLZd0qM1VrajKot84xrWER3
	JQksjxffh0GcC89mvgbeGQaPx3Oz+S1AbYSHBy/1Pi8ZBuVir1BER5elWkNOFqu9hkby0oagP1S
	u3JGjNFcgVoytmshmhxMg3Thps2cnpIEtaMYe4x7jkHLhPUlnukOO06nH09rynIO5A==
X-Google-Smtp-Source: AGHT+IEHPtrPOJK+eqjwUZlcxZzsXijqzqCZn5IRrwfimc0LTvg8y1VHds9nI52eOIsgIthyfm8/8A==
X-Received: by 2002:a05:6000:1447:b0:3a0:836e:4a26 with SMTP id ffacd0b85a97d-3a0ba0eedfbmr2521969f8f.37.1746716667591;
        Thu, 08 May 2025 08:04:27 -0700 (PDT)
Received: from localhost.localdomain ([213.74.214.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de087sm232671f8f.16.2025.05.08.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:04:27 -0700 (PDT)
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
Subject: [PATCH] drivers: net: axienet: safely drop oversized RX frames
Date: Thu,  8 May 2025 18:04:21 +0300
Message-Id: <20250508150421.26059-1-ayberkdemir@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_080449_074528_F3C2DAA6 
X-CRM114-Status: GOOD (  13.91  )
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

Signed-off-by: Can Ayberk DEMIR <ayberkdemir@gmail.com>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 46 +++++++++++--------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1b7a653c1f4e..a74ac8fe8ea8 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1223,28 +1223,36 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
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
+				netdev_warn(ndev,
+						"Dropping oversized RX frame (len=%u, tailroom=%u)\n",
+						length, skb_tailroom(skb));
+				dev_kfree_skb(skb);
+				skb = NULL;
+			}else{
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
+						csumstatus == XAE_IP_UDP_CSUM_VALIDATED) {
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


