Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4660D44C5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoyxLPjnBq1qhMQoPjoZ2qS39Mdd35mOR6xZOmQK8KY=; b=P3WAI01vhBG64kBY9Tdy3HkSY2
	IENbPitHl2VPmzeBUSXlaQD8ZH0qFTUleCJecitFkkoS0AsoFeF7HzGl/fm6Bfa+Nl0hDdZDaUJWe
	yFdH3UzbEXX9cpDpJkoISxbQCM1X6e/15ZmNPvWwpM/mONUKkDzxKMzR5l7tvpfem/uo5uJPyslC5
	3QPg8Pzm+kHYgdjw2C9KIPwvspS8lEeXC/DzIPxutTmhRUv3dJjaVbsjLgHgYNDGi71nHKaM4yJ/V
	kxegvCJABz49AVBNv+qiVIpRMSkqflcbE+oQQZo0oIlo+WKZhSOPBq4/rL9HnuekGUGayrY7NXL6X
	2GT21lOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUW-0000000CV8u-1los;
	Thu, 15 Jan 2026 14:38:28 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUM-0000000CUwR-1936
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:19 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7cfdcae466eso104627a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487897; x=1769092697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoyxLPjnBq1qhMQoPjoZ2qS39Mdd35mOR6xZOmQK8KY=;
        b=saVREc13VJrUM2CCX255n6QFcrpJEB0AGx2UfziTm0Inaao0yRjxmxJkrXkH8AR0F1
         sVKTaAvfKAZ7NY7pcx9FUiM0i9hlo1zdowdMYlmLzBBnZYKd++bTNUXTSn6usDOqu0KA
         0JkFml0wETcFxLT7R8F9pdrDdDI2Z9xBlP7zmySLNIMpdC56Ud0dZ9GPL3PaiBGXasD9
         9SUaS0hog+gUOJ+Yrs/0WFc/XPJze3SWdcGjnQyL0FaH830hhE0/SoPZ5FBRj2GA97H+
         g8zfS4DxpHImAS+Wy37/SRsOq8dle6buNfWu9Tk4s8ZQgz9Dj0W0sb8vzlrgdSr8zAb1
         GArw==
X-Forwarded-Encrypted: i=1; AJvYcCXwRtjwNywAmDjX21FqI3nGgbl9MhmVBklqIO6Hah0UTJhKoutguPGcAJx3/jBYweCThwFC254X8tbEU+B6AVEE@lists.infradead.org
X-Gm-Message-State: AOJu0YzfglSGDpgxHtAyijTVNGv0ppH3/tyZj0z2++3jpxH+MnWyhEsK
	Sk9/Bq6JdJ8uEt/HmjYWw6YhlSIk/RLv3lsC6mjhS0D1b4fRYNp1GLfe
X-Gm-Gg: AY/fxX7tjUJ3fgOm/reoOczNTW/3lqdhS8BFHOdB/nnzp88tuMst2Gft32wK2jm76Ia
	IRPlVS3EdBoIStEiGBTi5LbyPRS2QKkAsB/K/0LB5hy72gj5sUvuOEeT+i5NAdUHGsscYz8CbpW
	XgY3rdWv05lHoqzTTjgcyYIV3RV5LwmMr3vlUtSJu/rYq3OwZGee6YhlqvfwmKE8Fsh70BzjTAN
	A8SPb9q5GZk0IbtZaQ9glO9K0RB+Rqmb/o6d9lUCeFGYsWFdWUfjF3IrU4QtBRJej9cxD+4OG0c
	+1LLw7xhfbYAWHltmA+KD5MSbmZhIbiSygemztGQ8oarYPloXc6i9Uz4zbv8jWJbstSS+UTf/R5
	rHVeTf3ZhvJXBISGpzCwk8uZXKHprF/rk5wX9UGhRMFLC+3dUwhdloRNDOezYJDL6Ymchq0TuzT
	CeOA==
X-Received: by 2002:a05:6808:179d:b0:44d:aa8b:58f2 with SMTP id 5614622812f47-45c71463914mr4281989b6e.9.1768487896997;
        Thu, 15 Jan 2026 06:38:16 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:70::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e17cd0esm12818955b6e.3.2026.01.15.06.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:16 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:51 -0800
Subject: [PATCH net-next 4/9] net: ena: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-4-b3e1b58bced5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1976; i=leitao@debian.org;
 h=from:subject:message-id; bh=OhOSJKzo23oetHtU1SAjOSl7/D+75LUpKZ4+ls31geY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvRzU90PVMm7MPekl/O3zK7Y+8MrR9aM6Y7x
 4TXeGAZZvqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bZVWD/9LbkqPQzVHwsSImpym9sTbJKoCskNG24AAU/IMLX779t9vMoqcv3HUHYI9fPsDoClHSFW
 ZYig157cl0LxDp8/sQMiNzWfVOqbu9DgkWg+IWhOcuyqGzB1F7aA0bAr3JS+reJxTm315r7l59y
 /vq+dBalf5swD1/jXnIjx6Ch8j0syo6aKxPV+8cCh62nQCdY9Zl9lowhAwhx/ofqUfIUM5v8Zsu
 xQ/TFsQV1f3VIFsZQnJaYHLj8B3CBjTxiO7D6QrvfcoBtpiDLTjV2z5qTD9I/vT76nuCRxsYMY9
 2VzsdpmKATfHo/26UJapwSiyM78vm3MBq9fd/vYEFWVGibmQ32ItSkThxx1MvUsK6pVFSbzuhg9
 JRuwcONTNvUzjDgI/uRe+0xDwSsvoDbmbQxkHlMDCcdSKDjpLLUyCM3CvpOXHB2jBORMqqS68Ap
 rIVwinqC+xedm/nDu7gX+ZmRf02xHlkUP0QDd/VhoLO4CL0gTp86/yl7cOIFz2z3DK6DcOwrb0I
 VYLloSJE6c/w4df5F5Kn1UAafUylUoCr0bhzXu9+xDC4YhUQwKL/G2p2a5zG738+SW8X8Mkkn6t
 ocFT0jZUdz2/fYxEXl+Cf+Z4xwPv+/JMPOHJaUjuJqNEDfiRCBoQGOnuxMiOaN1MLP8ekZ51eBs
 WW48ZocfUwPrT6A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063818_367198_29FF7305 
X-CRM114-Status: GOOD (  12.77  )
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

Since ETHTOOL_GRXRINGS was the only useful command handled by
ena_get_rxnfc(), remove the function entirely.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/amazon/ena/ena_ethtool.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_ethtool.c b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
index fe3479b84a1f..2455d6dddc26 100644
--- a/drivers/net/ethernet/amazon/ena/ena_ethtool.c
+++ b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
@@ -835,27 +835,11 @@ static int ena_set_rxfh_fields(struct net_device *netdev,
 	return ena_com_fill_hash_ctrl(ena_dev, proto, hash_fields);
 }
 
-static int ena_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *info,
-			 u32 *rules)
+static u32 ena_get_rx_ring_count(struct net_device *netdev)
 {
 	struct ena_adapter *adapter = netdev_priv(netdev);
-	int rc = 0;
 
-	switch (info->cmd) {
-	case ETHTOOL_GRXRINGS:
-		info->data = adapter->num_io_queues;
-		rc = 0;
-		break;
-	case ETHTOOL_GRXCLSRLCNT:
-	case ETHTOOL_GRXCLSRULE:
-	case ETHTOOL_GRXCLSRLALL:
-	default:
-		netif_err(adapter, drv, netdev,
-			  "Command parameter %d is not supported\n", info->cmd);
-		rc = -EOPNOTSUPP;
-	}
-
-	return rc;
+	return adapter->num_io_queues;
 }
 
 static u32 ena_get_rxfh_indir_size(struct net_device *netdev)
@@ -1096,7 +1080,7 @@ static const struct ethtool_ops ena_ethtool_ops = {
 	.get_sset_count         = ena_get_sset_count,
 	.get_strings		= ena_get_ethtool_strings,
 	.get_ethtool_stats      = ena_get_ethtool_stats,
-	.get_rxnfc		= ena_get_rxnfc,
+	.get_rx_ring_count	= ena_get_rx_ring_count,
 	.get_rxfh_indir_size    = ena_get_rxfh_indir_size,
 	.get_rxfh_key_size	= ena_get_rxfh_key_size,
 	.get_rxfh		= ena_get_rxfh,

-- 
2.47.3


