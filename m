Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CDC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqmG3BJjsmTUqEq8AZgWfba3ERYP+7PeG6T0Jf+wIRU=; b=OT94g36FeXwdg+QG1dHNVoRrEA
	kiaRnzekW/BJfPrC94R2aTkdYIT87VCwhhYkPb+8HEpIOKb02j4llNrIrU2Yyy1/avxSEMtir7VWj
	WmpaEXRouidJ38jqvSJpV4xrlnnMYIMoT+iAN0eeu8W4xjRYclywC02cvc56MlotMUh4PbcVlkR8F
	KRh0uUhiax0HhxgTIoeSFY1y/ddOchdbChG8oDXF6N7gssxJaqxp4L7Pkb3J3KRc94MZ6g7w8D0pb
	WOJQoHkxwZg0X4kSDnx+2RfuOKhOl//J4fnB1M9wcLmBgvy59BVzjFUTPls6ZgKwxTGRGw4i/83S9
	wfMLeOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHOn-00000002cwu-25Qd;
	Fri, 09 May 2025 06:39:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHMm-00000002ccC-0Dyv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:37:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0b9303998so824317f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746772670; x=1747377470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqmG3BJjsmTUqEq8AZgWfba3ERYP+7PeG6T0Jf+wIRU=;
        b=ZBidQSP49CC5a51otokvGTKSZ0aXuyIEgDp4ZwDQsEA2P9U+Cto0klZepF95QC4314
         xNoXdkHQ7ydxC3xzgtk+XNn6wTSrT9jGGN7y80urKrduBnnkEF5unPwQ4lbHHX3fP5uT
         Pn3GoESnHSfD/Y5LJLyZaS32D1VWTzw+no5FEFD/D0bAPDQ3z6pXnDMkqUPRwkH+zI84
         flVyKuSHZ13o8TqMiip1/zWHuXmAypV3LgYWbGuw+iPA/x9YhzPPyvYxHSKFsJt4T81Q
         briIGaQ51Zo3OiIIfq7gwIZM+3NXzLwqsFSpmqlvy3eoHO8mFaXNRCYOMwnaY2xSFmKt
         MimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746772670; x=1747377470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqmG3BJjsmTUqEq8AZgWfba3ERYP+7PeG6T0Jf+wIRU=;
        b=LihvWggxjcMCnQ/+WTzgMx0jJqvlGR7n6uDbqfc8UXYhd6aP7rRKz5A0lY0x4f6Fjr
         UZZhVuFU1Pdska7etawYyMuZqVlRuRR9KyOsL4L18Re/N1SO6gYSuhpMYTmokKmFhUiP
         Y94kc7vM/bBjefy3YncQTKlFlOwRMDqU54PMhBYwhUTOBVtEqhRZDUExpQlnurtZMyly
         1UqwueBQey9o79XEGCBSlodQDAcZtIWa5zUb3SuHvFkW2mJtQbgmvFwCmWL1CrnbQb7Z
         ev6+sHmgtY4EM6fmMS9e1bJgiIbjbXNZp2BfGQ95MQF+fTdtLiSOZlvr2dCB2Pqxde67
         xIqw==
X-Forwarded-Encrypted: i=1; AJvYcCXYl+Ib9Zxae8FCjJjXxl4dNU0btG5dd7wMZFSW2LWzKIxkhsxKNIUEuwhfwCLzQNYJw3OaAJ55uNYV7ZKPIcvC@lists.infradead.org
X-Gm-Message-State: AOJu0YxLP4BzzAFOS4DI0W3rlTlIS45CxCS9y5IM83RgEGGMTg7OBJEj
	XIvZN+oT7pAY82V9xW1aKOkhMB27wGvYDMnhZjFs2OLfx0OU3ppRmDg6dV2k
X-Gm-Gg: ASbGncuNZNJsaM1GMzCoEmNZW5kDGutv4MaooyxDkgD3S57eCrsNldy8h8Xnj/anbV7
	czpzaHLqphm60XLiXxqWoTyVU8X5adN6Ey7F36mYuxWT7OodKNInM+CUckepZyiOVjxqSMH0dEQ
	lYJe6D/cDQapXhn7BDOvtFSdDcUvWMwTeRDA/v0hENlenqkbEJXOqX2XlS1EeY6jGP6iclrVTV0
	RLU7qSkBlcu51wdNA9qDRtS1rR2TJ0T6fCfzOp+s38pOHyhCW1qrbJ3KmqgYBU+hwsuwB4p+W6D
	Go83HalSURZZAouBgX3J8YQ0AHMvheQkWppVR3K020GRA8Exo4MUcwffMa+F6WxY7g==
X-Google-Smtp-Source: AGHT+IHw06gGDN3zr31JLWJ1Q/qbSH1hi3YVW8+/TRJJ4XJQ/05RFm9FjdAFuvESuwnntbNjmEV+Mg==
X-Received: by 2002:a05:6000:2011:b0:3a1:f653:26a with SMTP id ffacd0b85a97d-3a1f6530370mr1712267f8f.16.1746772670183;
        Thu, 08 May 2025 23:37:50 -0700 (PDT)
Received: from localhost.localdomain ([213.74.214.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm18325745e9.36.2025.05.08.23.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:37:49 -0700 (PDT)
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
Subject: [PATCH v2] drivers: net: axienet: safely drop oversized RX frames
Date: Fri,  9 May 2025 09:37:27 +0300
Message-Id: <20250509063727.35560-1-ayberkdemir@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250508150421.26059-1-ayberkdemir@gmail.com>
References: <20250508150421.26059-1-ayberkdemir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_233752_092381_FFD5A226 
X-CRM114-Status: GOOD (  14.81  )
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

This patch addresses style issues pointed out in v1.

In AXI Ethernet (axienet) driver, receiving an Ethernet frame larger
than the allocated skb buffer may cause memory corruption or kernel panic,
especially when the interface MTU is small and a jumbo frame is received.

Signed-off-by: Can Ayberk DEMIR <ayberkdemir@gmail.com>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 46 +++++++++++--------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1b7a653c1f4e..2b375dd06def 100644
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
+					    "Dropping oversized RX frame (len=%u, tailroom=%u)\n",
+					    length, skb_tailroom(skb));
+				dev_kfree_skb(skb);
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


