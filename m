Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8005FD29C23
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNHrn/XFzhadasziTUy6F7RftXtkLpDR8wFnHICqw0k=; b=BGOc67Z5EMazBXWuTtADQEmPFh
	6y5lOcn/XALTC8qITEthtQtYpirjeJkg/vpMqi4ajnr6JD+EDTiAjsf+9JPLv21PRyk7YRrSQBXDC
	du2FkazG+dqmvNJydJTD6Qokj/rWZsiO9LVzBgd1pHpy0thk+GHQcsRD5QCTtQ/3//bkxnmA/yPoF
	CVPYNCbn6IIZOgcowIz1jbyGDMZzDFYm7vqeyEamuKLtqSSJvFEm/skXGklRMENmoNqBkEIvE2WzI
	7QjirnoObmyrtgOtQSA1FsaF7t1vbhioWKO42z/Iyz7Z8U669yvc0eDTKIamP/B7KidwbTdIEZFKw
	bmaF3wZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhooS-000000026fL-28WO;
	Mon, 19 Jan 2026 12:56:56 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhooP-000000026dt-42cH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:56:55 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7cfdf7e7d19so2325055a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827413; x=1769432213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNHrn/XFzhadasziTUy6F7RftXtkLpDR8wFnHICqw0k=;
        b=g5wz4f1ni3tPxNhKop5Aceba3cqST2YOaoui7EH3ecrpA+hFhWi7zM//pEn1nABDoq
         v7SroeAozD3UApAp8n+2fEJS/3ur/t+yXRErxH2yo3O/GDWJw7nZ9cWafjgnWlhVS/tX
         7QohvISJrxMvrj8AXzYaQ1C9wkM360XMTqxTQivCmFAh7ksf4BQVj7RJHTJNE1v/ejvb
         3zKyi78rkMclJfs+/r0WelNYwGIYgPJT0V2QO1QTRCiPklHyBgA+oPmNDFXAvB2StD0n
         2odMqHAzSmVha0Runb43yPa6eb02OJ3+GUjNLdT14+DxIeGtR4W4bKvfniFn5k3wRlHi
         K8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfPi/nMoeT7nL7UnigWq1k9rja+n9M7lR+u+Cah23uqeet+3bo399EvH1VBmNzpIxm9TONvvDGIuxLkjisnw/m@lists.infradead.org
X-Gm-Message-State: AOJu0YyuCxFBXzt9SQFPLKAAQBTXPCTDegvdV9KZEx3TvYWdTVRAhRKS
	oUtR6NnX5vn55DFZiHTlXIfN2uOjGLHITWlLF9/Xjgerpdj6KU0icjSf
X-Gm-Gg: AY/fxX66l6rTsK9gSFJ3unAm0uchG50ixPDuEJRF32U8053xGGYj1koK10cB+TPoTJf
	PRuWgA2shumWpgyslCB8RRZbHIEmAetsVq5j2Xg8pGeJFxy7TfiPNDAiQh/Fr5CkPYT7mrK9MqD
	8H8dWw1Un4i/msUnxV83vkbKtpFGRnaGtCzF+1LHtRhdXUuIi/V2lrJhpCzH9F+CIk/m7i6FHQt
	1rf9zprTaRTfU0QOHLLHGbdYJHf2bf/SpjaHnKGNwAPDXiPKz51/nGdedqkWJgk5Hk2njaC20Uh
	hbtrF+v8QwY4bOn+EBvFLKkkpnzw45ZcIqD+FrcuQrL0UU7FHKNf82kjWXN+B8ZTiy8Hkon6PZW
	+GgSzRLXFX44R/FT1sRFpODzEEEyzAxZKqzwhFF4CtzqHgPeTvhje3wAa6hQzD9tZ4KFL+wkdS2
	9H
X-Received: by 2002:a05:6830:82ea:b0:7cf:f7c1:d9ac with SMTP id 46e09a7af769-7cff7c1da6dmr4841137a34.9.1768827412551;
        Mon, 19 Jan 2026 04:56:52 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:4::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf2a5f02sm6632883a34.25.2026.01.19.04.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:56:52 -0800 (PST)
Date: Mon, 19 Jan 2026 04:56:49 -0800
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
	Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, 
	UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Raju Rangoju <Raju.Rangoju@amd.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/9] net: benet: convert to use
 .get_rx_ring_count
Message-ID: <l66l2ijd45fkwniaesgau5jdzoxrdyt4t7tnsd6dpo4dlefytf@tugyhkn2th36>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
 <20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
 <20260117181551.0b139ca1@kernel.org>
 <ziyd3327jr7miqgv2e252w4wpizphomkvxxge6nbjwtg4pyvf4@gvwwi2r7rykl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ziyd3327jr7miqgv2e252w4wpizphomkvxxge6nbjwtg4pyvf4@gvwwi2r7rykl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_045654_003913_2E160587 
X-CRM114-Status: GOOD (  21.61  )
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

On Mon, Jan 19, 2026 at 03:07:12AM -0800, Breno Leitao wrote:
> Hello Jakub,
> 
> On Sat, Jan 17, 2026 at 06:15:51PM -0800, Jakub Kicinski wrote:
> > On Thu, 15 Jan 2026 06:37:48 -0800 Breno Leitao wrote:
> > > -static int be_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
> > > -			u32 *rule_locs)
> > > -{
> > > -	struct be_adapter *adapter = netdev_priv(netdev);
> > > -
> > > -	if (!be_multi_rxq(adapter)) {
> > > -		dev_info(&adapter->pdev->dev,
> > > -			 "ethtool::get_rxnfc: RX flow hashing is disabled\n");
> > > -		return -EINVAL;
> > > -	}
> > 
> > I think we need to add this check to set_rxfh now. The error coming
> > from get_rxnfc/GRXRINGS effectively shielded the driver from set_rxfh
> > calls ever happening when there's only 1 ring. Now they will happen.
> 
> You are absolutely correct. The ethtool core calls
> get_rxnfc(ETHTOOL_GRXRINGS) _before_ allowing RSS configuration via
> set_rxfh, and if it fails, ethtool_set_rxfh() will fail as well. And
> with the current change, ethtool_set_rxfh() will not fail if the adapter
> is not multi-queue.

Upon further consideration, should we implement this limitation directly within
the ethtool infrastructure?

Something as:

Author: Breno Leitao <leitao@debian.org>
Date:   Mon Jan 19 03:25:05 2026 -0800

   ethtool: reject RSS configuration on single-queue devices

    Configuring RSS (Receive Side Scaling) makes no sense when the device
    only has a single RX queue - there is nothing to distribute traffic
    across. The indirection table would just map everything to queue 0.

    Add explicit checks in ethtool_set_rxfh_indir() and ethtool_set_rxfh()
    to reject RSS configuration when the device reports fewer than 2 RX rings.

    This protects all drivers uniformly at the core level.

    Signed-off-by: Breno Leitao <leitao@debian.org>


diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 9431e305b233..899864e96aab 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -1380,6 +1380,10 @@ static noinline_for_stack int ethtool_set_rxfh_indir(struct net_device *dev,
                ret = num_rx_rings;
                goto out;
        }
+       if (num_rx_rings < 2) {
+               ret = -EOPNOTSUPP;
+               goto out;
+       }

        if (user_size == 0) {
                u32 *indir = rxfh_dev.indir;
@@ -1599,6 +1603,10 @@ static noinline_for_stack int ethtool_set_rxfh(struct net_device *dev,
                ret = num_rx_rings;
                goto out_free;
        }
+       if (num_rx_rings < 2) {
+               ret = -EOPNOTSUPP;
+               goto out_free;
+       }


