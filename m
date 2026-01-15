Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22F7D44C5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=obRPckYhjEiJNPLv4O3955QSZYUHJdHSvxM4hv9Cxmk=; b=r7ZiZv4/e1Z6H9
	grNWA5+z51g3q0V5QertaeHoGDx50+GLvR05X57PUy8FmbP8RF1xufgCT/6hfGq4bN6BoNc63Es/c
	KUbNYc9L93iPISa3GDUSQlCg66qpwHLUSpwB9l38/zfrxoheVJ/RUUZ9wNEYtCkNlA3v5RB7Xq3GJ
	nae/1ylURF5RbbgcqKLIsqLLla1y9EThoeJTaax/l96PJtzDxfGp1O8ZbE8Mo6vNwJ2iw8PPlCOGl
	9X8kD+Nb6TwcQdblfw2Ni2yPp/w70dhG0yrYZbLwJKTj1/rALyvlyJC95grDoal4OjZGIipc5cXZJ
	8/Z5LM9EEqi38G5PBwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUW-0000000CV9o-48NC;
	Thu, 15 Jan 2026 14:38:28 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUM-0000000CUwa-1Jl3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:19 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45c715116dbso631910b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487897; x=1769092697;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obRPckYhjEiJNPLv4O3955QSZYUHJdHSvxM4hv9Cxmk=;
        b=OX0BccdejYGOidksVET8TZshfkkisnRWArxxd5d5y9a4+j6eYcgkUDMZeQ+3lTodlV
         HDJtipE06qM3rgegmEycoSldeTq+BE7uWeSquPfpyp6Pc+dRAPf3Q1MymFwGfdY4fWYE
         86AwCowLlXDXaFzhdlLJi8Sq3ZkbZYecaPggaSjNTCIgRsrKwrXjMd6g4LV4cdxDoH5+
         3zj7oJVjZtIKYNeddKQ6Lhm/FxgMqoxK7VzKsQ5+Ck7FkQqLco4owprym8AidVxHycAx
         h6vMhe4lO+8dc2TGkDHMjV0RAa4MLFEdpb1syGH+qnDqPE+tMQ4zgcQS+CojpIZ2Xn7J
         uKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOs5W3irK8cdQLeoHvNRz2hDRMpiGxqg1VglQX8THHhTySG/uBoC3crFHEe1ljnxmh9QtcUycGExbmwwElJ4U2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy14Yxr4IdJ7J84ZddRs4pda617uDpt5qqPqWy5jTj20D4Orf/A
	ZRNI4WnUQ51U3z1WI4izl5jKV9nxtrt9kb9N9Th+RO6TiXzWHr7KuOgz
X-Gm-Gg: AY/fxX4gKsKqm3/pOSgDytCLCdI8VbiCtAyMd+M6gH6UZ+SJCbq+4OHQ8udWXFUjWWa
	DoKxZhcgADmLNrmT9veilzpblk1fN5Endo7S+9dwX+h4YikEQB0Gq7PMa276yblvp5iwJvw0DJR
	M8csaVxCGIgqJa5VDgdP/iEAN3Rz2uB0W4PYXqtgb4Un304ZwsceukG9J2R1rhzXx5C8Rn4rl/6
	Xvlvh7JTh9tvSBaKelpPbqbP2+43J2eOzqbb1lP8r7vhgOw9WxTtFybw/KuLbAhpSV7Kcket6qn
	wl+DdLjYgBtCrsZKoV5c+NW9jhRcop2Y0MjmvYOiKqOKgNQxrl/5rdibSpFA7kweP01wm/dLWro
	bbKwHtgyg99lAvdsWZRfAGMYtuvLuTzm+t5zgztOA8xSOO4ZGgIxmnWmvr/ZizO5rHSAzN2cEm6
	Pr6LS3G+FFqbjG
X-Received: by 2002:a05:6808:83cd:b0:45c:73b0:893c with SMTP id 5614622812f47-45c73b0aae1mr3347077b6e.11.1768487892230;
        Thu, 15 Jan 2026 06:38:12 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5dfb6256sm12849514b6e.0.2026.01.15.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:11 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next 0/9] net: convert drivers to .get_rx_ring_count
 (part 2)
Date: Thu, 15 Jan 2026 06:37:47 -0800
Message-Id: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL37aGkC/yXMTQrCMBAG0KuEb91AklrRXEWk9GeM42KUSSyB0
 ruL7frBW5FJmTKiWaG0cOa3IBrfGEzPQRJZnhENggtn531nk1ZlSf3IqV+CJZqvQ3dx7an1aAw
 +Sg+ue3iDULFCteB+SP6OL5rK/8O2/QCuTJhFfAAAAA==
X-Change-ID: 20260115-grxring_big_v2-eed9a5803431
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=leitao@debian.org;
 h=from:subject:message-id; bh=Jym+hB7alQQy54wZeliTw3/vUjoLAwmzKirUqnTIOwM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvR64rLYjr2/iNqLeLLq4WUcZf2UrXiopTlb
 njcXO6FZImJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bZroD/0RDCaNjdoDbu0mv1OiLrdFYjfSMbkXoNZQmy/Ib1BSBZcMkshG7AJyuWcGBafcCmjj03x
 VKqJbxcSyWQ+tpj8TL1dqoqagPpMLEixz4HugR9MHu39GxRHg67sAwg+bPc4+wBaKuZLdJrov+i
 k4fLF83CLgthdt8vpKY08wNYHyNdWcaH9Gf1xQ1hbACXK2Knoyo3vVPYYVqwqG4Mrjc1N6tnItO
 ShNU2XPOjTekErc+spOHazhTgbPOS2cL1cBA5An3oEfBvoryhf7jy/IljJdNYk3YOJxER/wCgWH
 DktqZGJ03Tmty7FkBdzUv01Q7oMMOdia7Xa9xf7HBkWx1OmpOATfQhLnUwSusKwm6zxbDTy6jqL
 5h0No4RHrYc/ivjDAoBCmrG8u8LrAxElbmUm48x6nm7hIF8rSY/U0/FT87qYDJJuFycgyP2cQnR
 mUzjeKJYEDqQw+vGd4Pg9Gjl+EenugTNENvN4aV8R3+z7BaR4NIsrT7N39bXBBxKSIOK9I26bGc
 IkQovYC7ZbWc5SU7+e4ShGDEeeEjC9S8qIdwuLLXtglOSDGpEPrWbZDLSSURHuVTjjIzuEnFupK
 C4GynyaMc4wqYJmfPgo5TVI7Bu+0yzeda7t8AfkbLDXnzDtVS07r4lJVG/ZyrVOJVsUKD89MXcG
 47Q/f6pZkmqcEEg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063818_376194_B2D21F5B 
X-CRM114-Status: UNSURE (   8.05  )
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

Commit 84eaf4359c36 ("net: ethtool: add get_rx_ring_count callback to
optimize RX ring queries") added specific support for GRXRINGS callback,
simplifying .get_rxnfc.

Remove the handling of GRXRINGS in .get_rxnfc() by moving it to the new
.get_rx_ring_count().

This simplifies the RX ring count retrieval and aligns the following
drivers with the new ethtool API for querying RX ring parameters.
  * emulex/benet
  * engleder/tsnep
  * mediatek
  * amazon/ena
  * microchip/lan743x
  * amd/xgbe
  * chelsio/cxgb4
  * wangxun/txgbe
  * cadence/macb

Part 1 is already merged in net-next and can be seen in
https://lore.kernel.org/all/20260109-grxring_big_v1-v1-0-a0f77f732006@debian.org/

PS: all of these change were compile-tested only.
---
Breno Leitao (9):
      net: benet: convert to use .get_rx_ring_count
      net: tsnep: convert to use .get_rx_ring_count
      net: mediatek: convert to use .get_rx_ring_count
      net: ena: convert to use .get_rx_ring_count
      net: lan743x: convert to use .get_rx_ring_count
      net: xgbe: convert to use .get_rx_ring_count
      net: cxgb4: convert to use .get_rx_ring_count
      net: macb: convert to use .get_rx_ring_count
      net: txgbe: convert to use .get_rx_ring_count

 drivers/net/ethernet/amazon/ena/ena_ethtool.c      | 22 +++------------
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c       | 15 +++--------
 drivers/net/ethernet/cadence/macb_main.c           | 11 +++++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c | 11 +++++---
 drivers/net/ethernet/emulex/benet/be_ethtool.c     | 31 ++++++----------------
 drivers/net/ethernet/engleder/tsnep_ethtool.c      | 11 +++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        | 15 ++++++-----
 drivers/net/ethernet/microchip/lan743x_ethtool.c   | 13 +++------
 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c | 12 ++++++---
 9 files changed, 58 insertions(+), 83 deletions(-)
---
base-commit: cc75d43783f74fe0a1c288aba9e6ac55f1444977
change-id: 20260115-grxring_big_v2-eed9a5803431

Best regards,
--  
Breno Leitao <leitao@debian.org>


