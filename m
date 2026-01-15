Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF10BD44C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTVF6JzvrMmVirS5IvqK1B086oNYhsYDQqMiO8SDgo0=; b=xmOd//DPRDJ0c4Xcrvw3NuZBLd
	pyOgWafDaWRJGTDXBKtmHBwNHsuaVF7hvYykAjJFnObKJN2LIddNyqygRU6BvzsqQMg0AP0X9U8oT
	RQKkt5SW2VGw+mmWl/roOOYewh4/4SLkuThESxrfOi98M+qOiTm/e+MYSTTUJlTz+lYe/uy+y/eD5
	c57C7Dk9pXKreeQoiZ1Q8oZba10DhPR0OfDoQvw/Q/xhX+ynJrV0GNy2i+Q7UZ/txQ39MLX/YmGF2
	XbmQJQdJapQEF/BQ5xZnh2Y+X/EpZtk7uUeVmymcdOxwWAXSY/Fp0jv2hqnyeQyXeRoIl+WQJzRJN
	3syPrK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUX-0000000CVBm-47vE;
	Thu, 15 Jan 2026 14:38:30 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUO-0000000CV0C-2umf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:22 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4043bcd09f2so352414fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487899; x=1769092699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTVF6JzvrMmVirS5IvqK1B086oNYhsYDQqMiO8SDgo0=;
        b=c+eCPjhCCy3vK5bIJqTj1Sfrv58n8DXjbPAWSFEuQf0YM6tkozYKojtmh/U2iN58pk
         D7DG2BafpBgCV31Yx7XnmMH6l9C9u98hkJx3m9BpW/FNpEaza65CzmzRtF8gGT3mKv88
         mzMQsnFtql+m6LGjDl4XAm79KoW4ZnO5uZDfbUmVSR7cbfiEUrl3LrZsj2Kf1f1nYFHv
         HUDq1uoopltQAVpumWny1QDEYd7JkUotbrJf1SKP9/sW3VjsfeU11qASfRKvVgZX3miK
         j+gJrOk51EkFkMGqLwrrhUhrRD/iDWzGAgIafXSrEspCpKkAJxdHcFtaQY5xwDil+vWG
         EtXw==
X-Forwarded-Encrypted: i=1; AJvYcCXEg0ebeW3yC0QvXrkJUm/Dq54NGKn0GVWDVyQSAUkw6aioiihA7n+0yOtCv/wrbLhvAv2Fs6jqJRQcRQDrnhMW@lists.infradead.org
X-Gm-Message-State: AOJu0YyVU+whiWK2w+DXn/HUBsM/a8sxToJHkvgICFpbQWa4f5/LB6Zx
	7Q15mcQMmXebxH6P3MtAoEDuBVR8zSEOZJE9TtqlPiPX1OsDZTfox8Ut
X-Gm-Gg: AY/fxX5KY/rFX9J+MUnRAsM+4Ue1DfZW4miH9ouf6QJcBDgHyKzdK3v9WEbdUN7VOjL
	KGUl/wC4Sgp+jnlAfchg3vS2saFWny1qjHh2rNuJQx+pBN46H7dyTmTcq97s+8xCX2+jvdh2sGg
	EJvqgmJ4oL/A0lAwjlU9u9yWgBEzx3dP2fV2lG3EC+SRDg0Q3J9qFUz9rWWkMHq85wIGeJVxO8c
	aw5hKsHegx5w3zXKXksZMhXrMa2TjOX4LEWYDSWiTgv3gpeejmGHHSkAP+tsAcbbCQbG7W8EdhT
	XgXjUCZ6pE4/c2Xsyoa40Fd1UeeG3CY2X9zoh+uLE00nhbZ9AQiOlnvQAJzGGYBTGopph08ubHs
	yPZUQA52W2/0nHIVYx31zL39B2iR03cdLsZkE3QvPuRVZKScIul/oBJzvfbo1mqEWF0V+QxaoRF
	TH
X-Received: by 2002:a05:6870:b0e7:b0:3ec:60f1:c7ff with SMTP id 586e51a60fabf-40406f4cfbdmr4508780fac.11.1768487898129;
        Thu, 15 Jan 2026 06:38:18 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4040997ffacsm3714996fac.6.2026.01.15.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:17 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:52 -0800
Subject: [PATCH net-next 5/9] net: lan743x: convert to use
 .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-5-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=leitao@debian.org;
 h=from:subject:message-id; bh=ZmkU1zoakMVbweOFvSLi3xSqjtnIUISr6NFIqxyt0qw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvSiriTlKIUDSeJf3lyJx9g6J6MwyhEctVFY
 ba4DAlbwuKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 bYGCEACmHWrdtJTxtxtEmPPsX2CeZeEu2PQnQ02h7u0Ib3t+jiBGMhQ+DE00fb6SaZ/NvhGaoVx
 JuAR4M1YkjB+Tk0v4vwjG6Oy2wV5kKYKEQYeyfQ/83Z/3IUdh7ZQZwxthVp2CXkXjyHrphQBMYL
 GG8JrctzvRlB+2D9g0j+zyj/GMqO9VJZTNH96L10ou/rLQ4+9T/BEPmRcb2qGqpEx60l5Ktx247
 ETGowL7+DQaU8c3gDAlxynxQjMnbUSekFRULTh18op7QHoYiNQRtobXYZ1KtkldyJ7De90NKkMn
 yWURpk8doDCRoFPxQjMdnlkRdaneJUYsxm04loj3GsZ0eImOy8rCPn4cgGGNNWa0RuXSk5X6dSL
 a+VQ2/vVYkEpT9AGUZtRZ4q+lockReA8gyKfK6sFn3vrq7nG3iXLfssxZZBbl20XzFqYcl3PQW4
 NblPb965fHv3x28BoERrvWIHuTWiVEgu+UBH1HxS8Rba4VjCDRq5oHPVpntdEtHFoAmL+BcvQsf
 pzwwKNVkx5oXzjVs8kQFZwYqf6Up7r9X813J4StIvuBTJ824A6Uua93RU7bGZbR22GWJOY92OIQ
 UeEkI8QYoBKvYD1472AUPavTrJvrRX9iye7NceceDRk6067lh3ReIEDlfgeFThiSz/Q6W+oFkFf
 9hMtYgoMGDE86pw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063820_748183_BC713394 
X-CRM114-Status: GOOD (  12.85  )
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

Use the newly introduced .get_rx_ring_count ethtool ops callback instead
of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().

Since ETHTOOL_GRXRINGS was the only command handled by
lan743x_ethtool_get_rxnfc(), remove the function entirely.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/microchip/lan743x_ethtool.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_ethtool.c b/drivers/net/ethernet/microchip/lan743x_ethtool.c
index 40002d9fe274..8a3c1ecc7866 100644
--- a/drivers/net/ethernet/microchip/lan743x_ethtool.c
+++ b/drivers/net/ethernet/microchip/lan743x_ethtool.c
@@ -931,16 +931,9 @@ static int lan743x_ethtool_get_rxfh_fields(struct net_device *netdev,
 	return 0;
 }
 
-static int lan743x_ethtool_get_rxnfc(struct net_device *netdev,
-				     struct ethtool_rxnfc *rxnfc,
-				     u32 *rule_locs)
+static u32 lan743x_ethtool_get_rx_ring_count(struct net_device *netdev)
 {
-	switch (rxnfc->cmd) {
-	case ETHTOOL_GRXRINGS:
-		rxnfc->data = LAN743X_USED_RX_CHANNELS;
-		return 0;
-	}
-	return -EOPNOTSUPP;
+	return LAN743X_USED_RX_CHANNELS;
 }
 
 static u32 lan743x_ethtool_get_rxfh_key_size(struct net_device *netdev)
@@ -1369,7 +1362,7 @@ const struct ethtool_ops lan743x_ethtool_ops = {
 	.get_priv_flags = lan743x_ethtool_get_priv_flags,
 	.set_priv_flags = lan743x_ethtool_set_priv_flags,
 	.get_sset_count = lan743x_ethtool_get_sset_count,
-	.get_rxnfc = lan743x_ethtool_get_rxnfc,
+	.get_rx_ring_count = lan743x_ethtool_get_rx_ring_count,
 	.get_rxfh_key_size = lan743x_ethtool_get_rxfh_key_size,
 	.get_rxfh_indir_size = lan743x_ethtool_get_rxfh_indir_size,
 	.get_rxfh = lan743x_ethtool_get_rxfh,

-- 
2.47.3


